Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441D495045
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758207; cv=none; b=TbUbr+hHfKVsOafo2mDim5qBzR8V58dDw8TXZ3Rl5VxL/W7iLS2Mw+XRyYyc3rF7B79CneEZUwHfZrXySSmETwwVxjvlP76HqsN4tOxsVerTj8NjUWJpGcSwGZOxWzVUq26V3aPn67y32FpfP45OC35SgX9mQtMjqxGpl/BxCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758207; c=relaxed/simple;
	bh=2yh34JyO7F1l3VRkjBaEHbs3iohvjpmWVU1sG3Gs/5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1S9KKUe+vNQWOqaXNNnWuIXrHG1MbKbRVBK0uXEIorLBBNiwzfbqaRf3IWmmdPvqnQk/O0wskCe6Ns3Al+m/NjdUVvfUTnzolk+sq+kcwIfTyRQFEGzYH8bdC5sYtcwQvWd+Qd7e4ua2qXL7uYPOmLF8x9qdLH+sgU70yDEgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RShEOW7M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RShEOW7M"
Received: by smtp.kernel.org (Postfix)
	id 799501F0089C; Fri, 18 Sep 2026 19:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1421D1F00899;
	Fri, 18 Sep 2026 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758191;
	bh=sPYMwJzM6gjLZrtVevUHoimin1GE9YKzQhSLX0pWMm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RShEOW7MsBBGX3Kv83gwePmKISADiqh5SY1i5iqh0jGrx4N9VCTFtv+rKoxyGa103
	 946iYiBQ3sE8mP02T3+Hb42rmN6L5LBxI+so5VXt7PHtDQt7fPm1TW02zuEFtd4kRw
	 MI51WtAqOYX/t76A4Y5oSK2BTjR0e9uur6n58KCHAsMOYBA4g8q2WFFItFHJ/BQdtv
	 VLADtOKLtTYhjLbOnBpoMbW51OQfo95aBfbhsEybwmY6Qex2d5QWLi6J6BqN9vfJNQ
	 qrr0I0+4tLZYCK58Zo4K4tl/kwDsuF4/5vldW0X7rpJujsQSftB9iVQlevLxS2MIJa
	 Xx8aqJvtRLmoQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 18 Sep 2026 15:02:54 -0400
Subject: [PATCH patatt v2 3/4] Reduce dictionary lookups
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stronger-type-checking-v2-3-37de1d8a6c86@kernel.org>
References: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=tamird@kernel.org;
 h=from:subject:message-id; bh=2yh34JyO7F1l3VRkjBaEHbs3iohvjpmWVU1sG3Gs/5Y=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlru15u7+uZZ9/7/PLD8N035ibUbq/8M9OT6dhMPgYWp
 q09JRJ5HRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKa6xYqR4ZFA5YLIffobLiSw/N33geOx0keF3YYxdaKf2lwaeA1DTjAybN4Z9ed
 mmXfj4uVPMwX9lGQsRdLrJsuF71cMq2t9scSCDwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Use dict.get instead of separate membership checks and lookups when
reading XDG_DATA_HOME and cached identity keys.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
 src/patatt/__init__.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index d33ff68..7254fcc 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -1037,8 +1037,8 @@ def get_data_dir() -> Path:
     Returns:
         Path to $XDG_DATA_HOME/patatt or ~/.local/share/patatt.
     """
-    if 'XDG_DATA_HOME' in os.environ:
-        datahome = Path(os.environ['XDG_DATA_HOME'])
+    if (xdg_data_home := os.environ.get('XDG_DATA_HOME')) is not None:
+        datahome = Path(xdg_data_home)
     else:
         datahome = Path.home() / '.local' / 'share'
     datadir = datahome / 'patatt'
@@ -1454,8 +1454,7 @@ def get_algo_keydata(config: GitConfigType) -> tuple[str, str]:
             f'Identity must be a string, got {type(identity).__name__}'
         )
 
-    if identity in KEYCACHE:
-        cached = KEYCACHE[identity]
+    if (cached := KEYCACHE.get(identity)) is not None:
         assert isinstance(cached, tuple)
         algo, keydata = cached
         assert isinstance(algo, str)

-- 
2.56.0.rc0.682.g1951b10616.frankengit


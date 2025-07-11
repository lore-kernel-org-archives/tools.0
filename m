Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670452C1594
	for <tools@linux.kernel.org>; Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238103; cv=none; b=JmIsudjJLvErXN8uzLBAtRdRbDdPYyTRtgKkFE1EHJ0jorAEiSN46ePsmYRGb6RB9r/R6DmcpwAhfnElyVydX32z6gkFmFo5a6yseOX78xR+VWPC/J3iASwsx/xDByT2ig+btRmIBJe1Agd0jKtJDxvHdfFCJjWORVyTigpwhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238103; c=relaxed/simple;
	bh=mNtmASfQn5Qd6LgUzKEINiHI9wiuD+PQyjhk3fbOy/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kwv3T+HJvjyLx6S2wIji5VcIZWDlULoWzp9vGu67JIPVFPw9JIrHG6IZYZrGjF6DAqITZmQh/J4IDSlW3QLT+7MjPq0CQNU5ySqzsflRXSiPBIbounxKnlxeRLkB7h8NC45zOsNBE4sYFCLKFZVs5wRfOOOsETr0T02/p42+EMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vN4rjUty; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vN4rjUty"
Received: by smtp.kernel.org (Postfix)
	id 33F6CC4CEED; Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DDB6C4CEF5;
	Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752238103;
	bh=mNtmASfQn5Qd6LgUzKEINiHI9wiuD+PQyjhk3fbOy/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vN4rjUtyCPITGMd1CEfXNaKJbLQPQQbFQbPMnq7uuLgL9aEufJQ0JqjLf+CAXLZHV
	 3++tYX2JxP/ZK6KMJNYhlM2p2uJXXLD0ejhDtAR5+3U6dW/qW44n289+G7z+7mJsjX
	 L0ti41VhvNUKQVcpC5H/kuyAln4DEIhFSeQurdMnYVr0B6uWNIPRW6N8Kb0ORpq7zT
	 Oiz1Xu+h1Msuj5GQMQc9ibQIACFZiw3sYmN4Pr6gm08g1TV+ObQ3lQig2pM/rW3ds3
	 DQKiCqikbzbt46QY1PkFnSklpPKqXXIQB8YBmqDMeQy2YlWFZyU4kHeRB+l9uyByTF
	 2olJyjuBFpZ3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CC9C83F21;
	Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Fri, 11 Jul 2025 14:48:17 +0200
Subject: [PATCH RFC 1/2] Fix usage of PATCH in prefixes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-prefixes-v1-1-c8d5715cc521@non.se.com>
References: <20250711-prefixes-v1-0-c8d5715cc521@non.se.com>
In-Reply-To: <20250711-prefixes-v1-0-c8d5715cc521@non.se.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752238101; l=1639;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=CfLpz8qB6gnvrEky8wC9S3UK+CoOrRvn6rKhhoHGcko=;
 b=3l2BSZQ6tdticVdHEH43zJpdiUd2q4g+BqF7XzxTl0ZGAw5lkv0I8xJHxakpejbqLn3uLXQdy
 xFtq6HdlkdpDE7nYdEdL0DtWKWdSG3OPMTZI071ICJE7cLKAGOZ7hi9
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com

From: Louis Rannou <louis.rannou@non.se.com>

Several projects have a '[prefix]' before '[PATCH]'. While git-send-email
supports having prefixes before 'PATCH' using a 'prefix][PATCH' syntax, b4 still
prepends prefixes with '[PATCH '.

Including 'PATCH' in prefixes is not sufficient as it will keep an extra space
before the 'PATCH' keyword.

Before:
b4 prep --set-prefix 'prefix][PATCH' gave [PATCH prefix][PATCH]
b4 prep --set-prefixes prefix PATCH  gave [prefix][ PATCH]

After:
b4 prep --set-prefix 'prefix][PATCH' gives [prefix][PATCH]

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 src/b4/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e..72ef79b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2568,14 +2568,16 @@ class LoreSubject:
 
     def get_rebuilt_subject(self, eprefixes: Optional[List[str]] = None) -> str:
         exclude = None
-        if eprefixes and 'PATCH' in eprefixes:
+        rpatch = re.compile(r'.*\[PATCH', re.IGNORECASE)
+
+        if eprefixes and list(filter(rpatch.match, eprefixes)):
             exclude = ['patch']
         _pfx = self.get_extra_prefixes(exclude=exclude)
         if eprefixes:
             for _epfx in eprefixes:
                 if _epfx.lower() not in [x.lower() for x in _pfx]:
                     _pfx.append(_epfx)
-        if 'patch' not in [x.lower() for x in _pfx]:
+        if not list(filter(rpatch.match, [x for x in _pfx])):
             _pfx.insert(0, 'PATCH')
         if self.revision > 1:
             _pfx.append(f'v{self.revision}')

-- 
2.43.0



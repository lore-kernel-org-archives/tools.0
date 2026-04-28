Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E6389DE0
	for <tools@linux.kernel.org>; Tue, 28 Apr 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368571; cv=none; b=s630gdjNmAYs6QtbSVW2eEAkfg15qrcE93a78Ckjmj6bCJTmu+Ou+XZZ8wNjhBpInSXR0v5wGxp1BrpQ+IB7QTm+NAQQ8wmyGT5Kiexa7yIWRZXoWL4e/C+uKqakkfGFO9DfjjFuPhceWn3OIitKqiH251VRDBJFc7we7/tdGJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368571; c=relaxed/simple;
	bh=cu6S6ES2lC1Xz0xLlS8Fk0sBUI+nNR+w4Oiu82bxLHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0rcVIE5EF4Gzfr3g3rVjEfr1tvRtKgdGk6EvFTsV8/pZfzYcLMD5cHBdAlXSM/QT4ziKAlskB8iw3a66JFyz0iQkH4IolwoEYC4cGfk+G2IV9PKQDAmqgbJlzViGYpZDv1U88BxVM6iznXeyzm7hTnLisuMkm1053h1KuBORnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzFAnmFc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzFAnmFc"
Received: by smtp.kernel.org (Postfix)
	id CF5A3C2BCC6; Tue, 28 Apr 2026 09:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333B8C2BCB5;
	Tue, 28 Apr 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368571;
	bh=cu6S6ES2lC1Xz0xLlS8Fk0sBUI+nNR+w4Oiu82bxLHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XzFAnmFcW7hf20asq6H8i3dDOTF+48IQ+4KCVEDyxnwN0kNMTlpXhIX4hHOI6GfP8
	 zqSIM2UU8SxiCkIaVNHQNi5Qd22XbWKK5lgR+6YWfBygd0GZYqqN1QYoeGtoO8HX2S
	 aDiVDQIuyJSPKYkDS9aBE9j/atU/3Emo6mYdpLNZ8yU9WprR9jm2gOMN2YbMAJ2ir8
	 46TeD+54okPgtZOaIzePi+lDmDNj8cxcoxOt2FXBDAozF4P85+ES6np8DGede59Co9
	 j6ngRq3alVGxanIO1FTBDukdr0ZswyzMVa0sq36nJkCR5e9w9Ks0I69CnqUjZpYoQy
	 2NqLLb6o9snlA==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Tue, 28 Apr 2026 11:29:16 +0200
Subject: [PATCH b4 3/3] review: patchwork: use the target URL
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-sashiko-patchset-api-v1-3-24d4ac34b4ae@kernel.org>
References: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
In-Reply-To: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=cu6S6ES2lC1Xz0xLlS8Fk0sBUI+nNR+w4Oiu82bxLHs=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGDI/1H7XnWKyN4Hj1uaSS2fUU/ZwzJy5/ayrwO+enX7/F
 2WUXrNi7ihlYRDjYpAVU2SRbovMn/m8irfEy88CZg4rE8gQBi5OAZjIfB1GhpdSrItOfFa/L3JY
 8Gq09sv5O1jyV9o/57jPZssqvXYqgwkjw6KT8WumO1ZMO13qoF49R/pGo5DqBNMD0nN4PG8tv3e
 7hhkA
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

The 'url' field from the 'checks' endpoint is pointing to the Patchwork
API, not very interesting to display, e.g.

  https://patchwork.kernel.org/api/patches/14521024/checks/9433123/

Instead, use the 'target_url' which typically points to something useful
linked to the results: more details, logs, etc. e.g.

  https://github.com/multipath-tcp/mptcp_net-next/actions/runs/24274365064

Assisted-by: Not-my-dog
Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 src/b4/review/checks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index 942935e..96c769e 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -333,7 +333,7 @@ def _run_builtin_patchwork(
                 'status': status,
                 'state': state,
                 'description': check.get('description', ''),
-                'url': check.get('url', ''),
+                'url': check.get('target_url', ''),
             }
         )
 

-- 
2.53.0


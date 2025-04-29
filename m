Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1FD2135A4
	for <tools@linux.kernel.org>; Tue, 29 Apr 2025 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934022; cv=none; b=FNbHa+LKJbo9aJMqIy0CBZJRI9ZnHuMgkYkIk1E42KyDW/46RBwv7TREoAyvL9VnFInNwWBym1T8qbbTaAotJZEPEmy/J2C31r3qnWSiCue8n9Zjv1ZB59PnyeUYGFBs2MYhrIwdQ/fieR9zerkyJ0kLAsGX2N+ORa3JybDIe9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934022; c=relaxed/simple;
	bh=G3SV61hETKtGxZAWIf1j3hhZgK8rbK/Amu0VFJL3iAo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tqIximzfdKRGAAQHCl/u9MIgw1W7Wd4mH2FJMKkHtQwBjlK9Kc3Tbmhjsx5iRbmE9v/ZrBY8swhswj31oPLa5MEnpUGEB7oCuYPPw/4+8/bQiXPEleEaysKX64nICY1NuXKvx3567SbngF5WZmU27qYQWLUuGM4l/2OXYpYHEQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4V2jU3a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4V2jU3a"
Received: by smtp.kernel.org (Postfix)
	id CBA08C4CEED; Tue, 29 Apr 2025 13:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908CFC4CEEB;
	Tue, 29 Apr 2025 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745934018;
	bh=G3SV61hETKtGxZAWIf1j3hhZgK8rbK/Amu0VFJL3iAo=;
	h=From:To:Subject:Date:From;
	b=u4V2jU3aJQUDBR3zKhn3+xAdijiTfZ5CeZqj3oIc2vQ4TVKdRb90UKDO26XRJzzew
	 CL0mgEre/ji4GfpPzCC58WsSopsMgjTDYqt9kZOxr0NL+tvB9S+iQQRZZR5TusliTb
	 VnbakVMx+o8Au9TtX3cvDF/WUbQ9zZur/zbBV43IhU1GGA1kf6w4mt1hMmM/i41VKB
	 3DVCMCfakmOF9yzvY2RR1xcqmJJStwZWcl2AzNpV3z3k3PSKN1DiwHyDgbxHsVGLpQ
	 7TlpSpXFN5MZ263faLRUpCii+81RDuPC+khlbbkWWD5lAg9fqFkq6TYun6Lwvl6kjP
	 rlJhEI7J9261A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: tools@kernel.org
Subject: [PATCH] Fix misleading error message on cherry-picked patches
Date: Tue, 29 Apr 2025 08:40:17 -0500
Message-ID: <20250429134017.3796512-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When passing '-P1,2,3' to cherry-pick specific patches, b4 erroneously
logs error messages:

Unknown range value specified: 1
Unknown range value specified: 2
Unknown range value specified: 3

The actual cherry-picking works correctly.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index de324d0f714b..ee0196cae118 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3666,7 +3666,7 @@ def parse_int_range(intrange: str, upper: int) -> Iterator[int]:
                 yield i
             else:
                 logger.critical('Unknown range value specified: %s', n)
-                continue
+            continue
         except ValueError:
             pass
 
-- 
2.47.2


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2C14EC47
	for <tools@linux.kernel.org>; Wed, 16 Oct 2024 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729116027; cv=none; b=AL+6DE/p420h5nmt11YZ5OtrztxcH1hAIpCHWHY5ZAibzqEUamfs7uvqi4PzhFcz7ZDRG1pv/BkxDSJDK9LQnrloLUlye6d+BOacMdjQuLXYtL/8U/C5Hd1dJIScexitl0Jsakn5fM45RO65ed7qgJW5ZSTXVfiBSIgrvg53vxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729116027; c=relaxed/simple;
	bh=/OBmjZ4rqVkQ5YRMYwf5lTF0dnvU0nv9xqI4rsXo8Pw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=L3vyNz4SkrchvUbQnVHjt72nAYk98HlhvnIiiGkxtzgD2QfDE1OhC4XZ/uMcFnJ7TT1ZGshu+gdraOy21nyHCw2EHGFmrjuRmfCm396rZF3aiQxrnhL4QGhkDcHbr1lUx58tr4dKwWD73y6FwtCfboXkW16ycibFHsjhOBIfn+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkdO0V/P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkdO0V/P"
Received: by smtp.kernel.org (Postfix)
	id 54951C4CEC7; Wed, 16 Oct 2024 22:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C2AC4CEC5
	for <tools@kernel.org>; Wed, 16 Oct 2024 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729116027;
	bh=/OBmjZ4rqVkQ5YRMYwf5lTF0dnvU0nv9xqI4rsXo8Pw=;
	h=From:To:Subject:Date:From;
	b=HkdO0V/PXgeowHy5RKoLs2xK7snWj3eqEBWbht2QFYWVxA8ogCfiNqbK5ihCH8qrI
	 CQ3DcUHzVntIS1ctrtoI4XSVGKlA37ipCQStqFyzXFDe6q3VIMQov7sCWFGxQYYgGi
	 KpCxqOatfU9w1xhmsj7OY1A+AyoVqUFbn6pIVNoYvz0QiGrz1LH5Hj7xRTgZNSXTru
	 lNNY9HY0EuymDG0++czvIQMqagYgXXE2uOrXod85LFf9Mt+hpUYBgDu2LX40xJCszw
	 P9Kg6BeozqQ1phNRkj4gxOGn12K925TvVcP/Oj8IMRJyYfmycupZbryeOfV7gTrTyc
	 mmpihQwNAKBSg==
From: Namhyung Kim <namhyung@kernel.org>
To: tools@kernel.org
Subject: [PATCH] b4: Ignore trailers only for CC
Date: Wed, 16 Oct 2024 15:00:24 -0700
Message-ID: <20241016220024.2377718-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm not sure what's the intention of the trailers-ignore-from but I
only want to ignore them from Cc: lines.  Otherwise it cannot get
Acked-by or Reviewed-by from those people.

Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 5115a9c..12a7087 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2269,7 +2269,7 @@ MAILMAP_INFO = dict()
             if ltr in fixtrailers or ltr in ignored:
                 continue
 
-            if (ltr.addr and ltr.addr[1].lower() in ignores) or (ltr.lmsg and ltr.lmsg.fromemail.lower() in ignores):
+            if ((ltr.addr and ltr.addr[1].lower() in ignores) or (ltr.lmsg and ltr.lmsg.fromemail.lower() in ignores)) and ltr.lname == 'cc':
                 logger.info('    x %s', ltr.as_string(omit_extinfo=True))
                 ignored.add(ltr)
                 continue
-- 
2.47.0.rc1.288.g06298d1525-goog


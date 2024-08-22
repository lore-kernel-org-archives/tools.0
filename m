Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869B055885
	for <tools@linux.kernel.org>; Thu, 22 Aug 2024 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349747; cv=none; b=eHR4BovHuuCfBynVD5VMcaJpIKbjkQHiB34IGXGMuOamjVFTfxdX3ZE+ya9k8EXCr18tT9i9BPrhP0WuxQrA5B2iNun0gC3ycVyGENjGY3q2An/RtzK4SUaIoUBTwt/ebgbPVWi3/uDOuPC4ezO1fAvuVCL1HXNv+kMgAl501s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349747; c=relaxed/simple;
	bh=ZV8W8xYjPHFY/QTZB5X+b6ZymdRouNNxj0rzAQ9+G8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nRZkSdYM2jh30cdisEjiBScmuwOLbtFUrvZD0QKEepPpbeEFqrhekn4QBwZ0Rd3m2FX80IvWvOWbF4qd2qKMdOJhh0OgqwCsFS7nsGCWG3tJ42SPGAmNtmRNya62dxKXlRfQ8YQqMLfjybj81e32kfQT5nMPuDpw2d9lFN7iwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=misggsJA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="misggsJA"
Received: by smtp.kernel.org (Postfix)
	id 477D4C4AF0C; Thu, 22 Aug 2024 18:02:27 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C47BC32782
	for <tools@kernel.org>; Thu, 22 Aug 2024 18:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C47BC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-20227ba378eso10209145ad.0
        for <tools@kernel.org>; Thu, 22 Aug 2024 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724349744; x=1724954544; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eonpXoFe62oWDdtfwe6CG6lJlecWGIa6cRKtMIl5eNo=;
        b=misggsJAm9RNc+96PC1qWy5B2FYJM3SKsKBR0Ei8J+lQdoJzvH8a4qipx9U5AnCor7
         GQq31R+2SSGNHzl/1pIiWemk9qe4EF5e2tCRGBd1fGxq4s7Faf3b039k4ClxnWh6UHzG
         ECofCSAMHs+BNO+/lReuUGE5/ONRYsIN1tL3r0JdQUnuL4OmIh2JWtPLsSGirbAqARwD
         /sxusZVHUBNlqTWm/Di2ftgaSprZ79gzkSytE3K2N6OBJTLSp2/C7yDr6KusdMTygiid
         9OIiuPDAFDLj8qGOMDQIAb3S+wMLrdDcvmTfcYKHto2bQF+o9Uv8qve6sUcVOGzZdTUN
         v8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724349744; x=1724954544;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eonpXoFe62oWDdtfwe6CG6lJlecWGIa6cRKtMIl5eNo=;
        b=e/q6nZFUAzhj0OfafSIF5jCkrOsAf629E7VtCuYnBUoSx8jCjBhSeFH+IlqOoD5PIx
         lDPsl3oUer/KsJX/Tcao7pLewddUoIqn23hzScIY7FVHEnn7jP5C36BzrOp3is4BdVJI
         G9l4bbg8iwPqPsPc5092k8VHoOvwyfoR54NArLZ9+PNWKqzFLDG0z8czxZK8JPEmwa8j
         bRl/2dUgndFU/HJFdwT7dH59jDGgxjPs5v9WrNKrUmDS6EhW2Vlvr7GIQgLy10feCnDN
         TkxdlzwYzZd8QjsB2wCKHEwwILeEP3Ad9Ur/hQOI36zd9tUABRMJr8INr4MTKwjtf+oH
         79Jw==
X-Gm-Message-State: AOJu0YwPdxf40JdxeffNKmM1f01/Vkmh6sTA5wpYO35T7UgLj0FbS4hO
	Uhc72WP2DXaWFvYwRjETdZHgKYj9bBG+rgqVW4RinmZKSuFXsmDgxhNCk6TK4sc=
X-Google-Smtp-Source: AGHT+IE5mk+3eZvioCuUmvOmHW122qlBqPX10iGI62gD5u/rEJiEdFzgD1v3BX/8gs58JyRXw4X1pQ==
X-Received: by 2002:a17:902:e884:b0:202:359:9f66 with SMTP id d9443c01a7336-20388d04a84mr31327065ad.54.1724349744056;
        Thu, 22 Aug 2024 11:02:24 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038558137csm15462885ad.99.2024.08.22.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 11:02:23 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 02:02:15 +0800
Subject: [PATCH b4] sendemail.smtpServerOption can be specified multiple
 times
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-multiple-smtpserveroption-v1-1-0c4879fcb133@gmail.com>
X-B4-Tracking: v=1; b=H4sIACZ9x2YC/x3MywqDMBBG4VeRWXdAk4ChryIuGvtrB7yEJA0F8
 d0dujyL852UkQSZns1JCVWyHLtG92ho+rz2BSxvbTKtca03lmf58fZdi8QVnLcSFahIRyx6sre
 97RB8cOhJjZigw98fKDgar+sG9d96bXMAAAA=
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Joel Granados <j.granados@samsung.com>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=ZV8W8xYjPHFY/QTZB5X+b6ZymdRouNNxj0rzAQ9+G8E=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMacdrtRoqFQ1muhQ7nFk/x3qR6avtb9u8+sVYTjUbb
 Rf8+vSkrXNHKQuDGBeDrJgii9jOp6+XlT76sIzXZAbMHFYmkCEMXJwCMBGjUkaGeXV3Vp+ZKbtv
 u2LAud9xPE9NTy86vnimtZDrNraHVkKpBQz/a2boVW4PzWJ0Zb78/quHVef2HvMAu8+Fny1X6Rc
 ary1nBgDctEsA
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

In git-send-email(1):

    The --smtp-server-option option must be repeated for each option you
    want to pass to the server. Likewise, different lines in
    the configuration files must be used for each option.

So this config option must be specified in multivars parameter of
get_config_from_git() and be treated as a list.

Fixes: 37811c93f5 ("Forward the smtpserveroption to the local command")
Cc: Joel Granados <j.granados@samsung.com>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 src/b4/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2b1a058..1d0f520 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3728,10 +3728,10 @@ def _setup_sendemail_config(cmdargs: argparse.Namespace) -> None:
     # Get the default settings first
     config = get_main_config()
     identity = config.get('sendemail-identity')
-    _basecfg = get_config_from_git(r'sendemail\.[^.]+$')
+    _basecfg = get_config_from_git(r'sendemail\.[^.]+$', multivals=['smtpserveroption'])
     if identity:
         # Use this identity to override what we got from the default one
-        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', defaults=_basecfg)
+        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', multivals=['smtpserveroption'], defaults=_basecfg)
         sectname = f'sendemail.{identity}'
         if not len(sconfig):
             raise smtplib.SMTPException('Unable to find %s settings in any applicable git config' % sectname)
@@ -3785,7 +3785,7 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
                 smtp += ['-f', envpair[1]]
         server_option = sconfig.get('smtpserveroption', '')
         if server_option:
-            smtp += [server_option]
+            smtp += server_option
         logger.debug('sendmail command: %s', ' '.join(smtp))
         return smtp, fromaddr
 

---
base-commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc
change-id: 20240823-fix-multiple-smtpserveroption-83731eb8b4e7

Best regards,
-- 
Celeste Liu <CoelacanthusHex@gmail.com>


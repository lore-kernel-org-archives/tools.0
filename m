Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FDDEC5
	for <tools@linux.kernel.org>; Thu, 22 Aug 2024 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724351578; cv=none; b=Nx54aXUEaFjmL/yJzunyb8vf6Lscbsb0++IZYU3qSlU6SfQdxsiQvKNkRSzwPqo//vN8WD1/UQTbn8ICQD0KOmoUiqtCVuzUL2Y70FDQXnH5w0QWFaZS0hMqcDMTAsEruDGaeOKrVNlyMd6Gft7MgXKRYMw9+es4X81G9YWZzvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724351578; c=relaxed/simple;
	bh=xCAjvcGPYp2Ve7KuhPj8I4RGZdT6Ln+b9GAs9TZQx/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n8dm4ph+owQA25UicEV8+RdOrEqbVmS25e7aZOA51v8ZAlD/cF2ZGAoiNRjCOSwpSUFVDlgnSGt9VxWiUrqDBfl1NEVGxatDS9SCdACptmJSMQ4SUzzsv6xI73b7b1IU/FsIKoZ2TyZTKlG7BBKhXNR30UJEUgCNV6ttyS+9pAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW+cbeW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW+cbeW6"
Received: by smtp.kernel.org (Postfix)
	id 64627C4AF0B; Thu, 22 Aug 2024 18:32:58 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72FF5C32782
	for <tools@kernel.org>; Thu, 22 Aug 2024 18:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72FF5C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-7cd9e4f550dso392890a12.0
        for <tools@kernel.org>; Thu, 22 Aug 2024 11:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724351576; x=1724956376; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VlIncjNMRDLliYS26FJQ4oTI8cToEAtvjwCfKCeFnBE=;
        b=kW+cbeW6Yv2Hi+r90RjX4KKMWkEA+w9fyu1V9M27WPfbmoKcaFiaOJaP5pJT38BLJa
         dJZXgsOuCefRGvmAYyUPTwp46qBax2Mqn+6sJAnS0lg4Gef1/dvZRTMizXnJ/Xr1eVLj
         O8xl0W1f0yY0W+VbUjrY8YQq802366LgWwsBFmHxitTXghXAwQdRF7ZgBlxZvfrxtX4s
         d+TgSBEOifKavMuuPcmIu0ndBWw62D7pbqQSS2JtI7fs/1DqfltGlUHiR6Y7aB3N2AlJ
         +vVlRyZsmG6Ao0gvZVzRECj5Hz6nRhRIHIZzYQRXZPkXupPsgZRpDOcct2C1OUw3KGNc
         olJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724351576; x=1724956376;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlIncjNMRDLliYS26FJQ4oTI8cToEAtvjwCfKCeFnBE=;
        b=eVIGNLGZWPz3eP2hluZiDVmCBttSjD4SW/G7XSAKddRbTPc8TXYBM8q/NvIhDcFPMN
         qBlMu5Zc4qE7XYf7pRiMpTf3G4YxDUBR21G5MYv2K13kbD1F4xVI5k9ae6T38z4AokpL
         OZVW8v/kiZ4g/oWMO760KwNuHAc2wMHUuaMvWLQEkQvepVi6fbmNwEj6WCoARdj9HieI
         SJYEGGykvxkK3K60o8vTABAZAw7vngmaKodvQihgsE0kKXzuSahAK+oEJecz3Y48nYUB
         ZbBVXJN6XgTaC3mQBREMzY1Hj2VRMi+swoqSD66nT4LAuCcRmm7b+KXctee68P+qxGpt
         siRw==
X-Gm-Message-State: AOJu0YykLGTQK00nGxodwgz3+NXPNltiTh1LCd+QS2s/4ahWq9WRsw/z
	fce5zMmMd3qNSqDYn3JFiTeCuOA1HD77vH/zfZlAVFmJIfCU8pjgKfjUq/yYOwM=
X-Google-Smtp-Source: AGHT+IH1GvuOdPAZR+nynx0vzlY+eQKUURQT+abUsme1WNo/fKaB7gfyqYFJh/BAGjUcZCkMpMEOoA==
X-Received: by 2002:a17:90b:517:b0:2c9:6aa9:1d76 with SMTP id 98e67ed59e1d1-2d5e9a4175cmr7444309a91.18.1724351576247;
        Thu, 22 Aug 2024 11:32:56 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb913460sm4518841a91.21.2024.08.22.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 11:32:55 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 02:32:52 +0800
Subject: [PATCH b4 v2] sendemail.smtpServerOption can be specified multiple
 times
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-multiple-smtpserveroption-v2-1-e9df83f7b3f1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFOEx2YC/42NTQrDIBSErxLeupb4A7Fd9R4li2hfkgcxilppC
 d69khN0OTN83xyQMBImuHcHRCyUyO8tiEsHdp32BRm9WgbRC9VrIdlMH+beW6awIUsuhyYoGH3
 IjWRaDpKj0UbhAM0RIjbg9D/BKBhbt1LKPn7Py8LP5U974Yyz3io93GZruJSPxU20Xa13MNZaf
 2cF2p/OAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Joel Granados <j.granados@samsung.com>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2574;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=xCAjvcGPYp2Ve7KuhPj8I4RGZdT6Ln+b9GAs9TZQx/g=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMacdbQnIcbki9uyj5XjtSdouyr7Rk6svICJGZ57WWZ
 90+e1LhWnVHKQuDGBeDrJgii9jOp6+XlT76sIzXZAbMHFYmkCEMXJwCMJFFtgx/uK8F7Hr/dZPT
 sUfqs963Ln/3U2JSQSRPWIkIj7iveHuZI8P/QHarG/cUNvzu3qW/Kf9j2PVn/TGPdvlIBHYK3y1
 tmnWGDwAiqk2j
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

In git-send-email(1):

    The --smtp-server-option option must be repeated for each option you
    want to pass to the server. Likewise, different lines in
    the configuration files must be used for each option.

So this config option must be specified in multivars parameter of
get_config_from_git() and be treated as a list.

The default value in get() will be unreachable, remove it.

Fixes: 37811c93f5 ("Forward the smtpserveroption to the local command")
Cc: Joel Granados <j.granados@samsung.com>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
Changes in v2:
- Remove unreachable default value.
- Link to v1: https://patch.msgid.link/20240823-fix-multiple-smtpserveroption-v1-1-0c4879fcb133@gmail.com
---
 src/b4/__init__.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2b1a058..7c5c237 100644
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
@@ -3783,9 +3783,9 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
                 envpair = email.utils.parseaddr(env_sender)
             if envpair[1]:
                 smtp += ['-f', envpair[1]]
-        server_option = sconfig.get('smtpserveroption', '')
+        server_option = sconfig.get('smtpserveroption')
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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D8F329C7F
	for <tools@linux.kernel.org>; Fri, 13 Feb 2026 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000715; cv=none; b=B7UeFMaJSaOwRdPC8R62ZOupdgerKAN1HE3XuREKFUtFb+Kbqp1lpEO74s+YJi6fsh8bl3MGS6KaxHesPBR44CxHzsZGQt0fxIEEZzzLw3RyeNa4YLcelBc6ja+id38s5dt3jkfMfF4HcusvdaaPABDl/At3NnRux/yW0P5mGcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000715; c=relaxed/simple;
	bh=nfyu8ifiJ0lVhEOhLOtHM6tzO8sn8y3CJS/gcryL6aM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F7IJ6LgM8/9lL9t/jiGxO8Iia9CmD4naFIoFZk7y64/VZIrTg6pl2w4vU3ZJIMjua00J8nOnWwI8hsbG4A7XNnjtyC4Oc2jpLRBHomsN8PIOGxIT/kdlPnd4OYijeHPPlkFjcg/C/tYcBQF78QEun7vUFkJlC55MqEsxHUbZC5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CKSaB+Xi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CKSaB+Xi"
Received: by smtp.kernel.org (Postfix)
	id A4006C19424; Fri, 13 Feb 2026 16:38:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3179CC116C6
	for <tools@kernel.org>; Fri, 13 Feb 2026 16:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3179CC116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so4474005e9.0
        for <tools@kernel.org>; Fri, 13 Feb 2026 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771000710; x=1771605510; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNh2cMpYWeGgCiDPjAI1H6fzECk7c8c9TgHlVWKn87o=;
        b=CKSaB+XiD04Er2wMIPYpoOsRny2WBPbl/F+fI72orLIGJ4YftDSPJAbnPIQ4KYI9oI
         IBbnT0kkFwmyhBVDgYYtN0P85iO3qTnyQfsl/3O/OtNycKmsd3phLBtdoDasOBgFJjgF
         hzEjt/ahn0cKcbxSpHCimjUljOnZg3K+VBwIxzkkX5ac6z0s8mMkshLKcs1a4kMfdPeh
         7bDJtewkebiJ6EOXZEnokzZg6G2wD/nh2jJ4gfmXhTudse+vpod5OiVbZXKGoEpwE6Gn
         eqya3IDFCXQnfYm8u7QcgBGaZ8ZHmhrgnzUM7WoJqE9WpAq02WbHsXP8Zy8T9FKn9mu/
         VFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000710; x=1771605510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNh2cMpYWeGgCiDPjAI1H6fzECk7c8c9TgHlVWKn87o=;
        b=tsOX0o+bdtW5HpxX+8fvFpO7txm7BtAD2DOEbsfh2xPwY5GaB5nn2PdsZm8xTpgp5k
         U+JTNU2X/h4lTpzpZ8Xs4Cse+zln5WaD9yaRHUkQ/a7+aj9ik6VJ5HUOtWk/OZsVvM/s
         2mHMT8zX8KT9TzBbgX2vYLTKF8AGiC1QVNGK5dEZ9FzqPIIaEW54oM+LWGk7ke1fQHMa
         GbeaHZLdRWMe/2GSmK47r63itMcbgXhhkNxCxTC+kIhiQNET4zVo5yAJmHkZPKdQgag6
         FyZW3Z5hS38bQwGmeUDOQuPCk9EJtHlEeF0vU8wO+ZWmwlgDR1imWo1srxi11tR656Wo
         DMgA==
X-Gm-Message-State: AOJu0YxJNSBH/nUF/Ked1tcD2aTpwRcC0NjMpiSPjKzz2pq3GJ/Xt99o
	TX2eSoKS8jUIvqElLRXR1/Ji+d4x9rMo1Plfid8sZ2W9BMnz8l0SycE4Nb+56nygfEMO9L137GR
	7OIY/
X-Gm-Gg: AZuq6aI+3DH4tv6VlvNqvbFYT3ALaptBwCekwlv8lUABFYCAZ8vWoeLeJQ3SlABthbp
	G2rkku+cPAkLFriDpCQ/Ps5RSGx27rRgPQuTaZAo3iFdTnu/P66kP2ojiPq6uWliy5MCMdpxMmj
	oIWQ/OQFoJySYfCGbeFQ+uOAl5+/rE9RKyCoYNgOH5HpzD7X4X051WnIaby7W0cvUIrhvBe4jY8
	9RVJoY8OX1z2BcXdkaWjo+wuQR0OQyn66K7G6lSOjIm1Ft6fvR6LQKPAJY7lkqksiAcS/4djz/g
	mw7MVkk9HcTg3xDJdmicUxGwVODMnIxdZclbRUUEuNk1QSP0B2IWS0CjmoDoETb9LOv8w2IKFU4
	LyLR7zj0jl1951kH1gt/E5R4AVzqYS8RvvMto18HKceiQoYBjn+A2YOD+7/WzK/o1anyImH/Eun
	DnhhqwrwUAial7rVHR4r+4IvPe05GIZUD8k/mb95PMBaBfz409pBAxrkW53Raq+G4jDgS5JqNcP
	/8HnpfLhxz+Uw==
X-Received: by 2002:a05:600c:450d:b0:471:1765:839c with SMTP id 5b1f17b1804b1-48373a4ced8mr38531665e9.20.1771000710359;
        Fri, 13 Feb 2026 08:38:30 -0800 (PST)
Received: from localhost (p200300f65f20eb040f063ace48d98e4a.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:f06:3ace:48d9:8e4a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4835dcfafcdsm350997155e9.9.2026.02.13.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 08:38:30 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: [PATCH patatt] Make install-hook work on submodules
Date: Fri, 13 Feb 2026 17:38:21 +0100
Message-ID: <20260213163821.4098648-1-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The gitdir for submodules isn't '.git' below the toplevel directory. So
use

	git rev-parse --git-dir

to find the directory that holds the hook script.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 src/patatt/__init__.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 45201dae6f8b..ae8f21ea104f 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -1053,6 +1053,14 @@ def get_git_toplevel(gitdir: Optional[str] = None) -> str:
     return ''
 
 
+def get_git_dir() -> str:
+    cmdargs = ['git', 'rev-parse', '--git-dir']
+    ecode, out, err = _run_command(cmdargs)
+    if ecode == 0:
+        return out.decode().strip()
+    return ''
+
+
 def make_pkey_path(keytype: str, identity: str, selector: str) -> Path:
     """Construct the standard keyring path for a public key.
 
@@ -1670,10 +1678,10 @@ def cmd_genkey(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
 
 
 def cmd_install_hook(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
-    if not (gitrepo := get_git_toplevel()):
+    if not (gitdir := get_git_dir()):
         logger.critical('Not in a git tree, cannot install hook')
         sys.exit(1)
-    hookfile = Path(gitrepo) / '.git' / 'hooks' / 'sendemail-validate'
+    hookfile = Path(gitdir) / 'hooks' / 'sendemail-validate'
     if hookfile.exists():
         logger.critical('Hook already exists: %s', hookfile)
         sys.exit(1)

base-commit: 3b9f6ecec8e17225b66483ffd0aecb8ba1c328f5
-- 
2.47.3


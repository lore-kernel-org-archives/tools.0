Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610AB1607AC
	for <tools@linux.kernel.org>; Thu, 26 Sep 2024 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727371793; cv=none; b=rRZC25cpdXIJQ0NFx4ZIuFPrD+QDIG6BcjO+hiP9nuOMW1AhgSLp01HLMB5eidaEHYDItB6b+4qwDdM8saV1SQjDg5jkva5dqi+bUSRqA4unogqmqgAhZaeLbIw+2pxyFfqRrm1uld5UDrzsjB5nU3cXm1d8IQrRBYvR34fK1vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727371793; c=relaxed/simple;
	bh=lkrzZFQsJryyepe9cl5TeveCqr68wQZnBvW7tPBgUEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vo/UaQnoI0OqHsIiyiUOOMsoLPjeD7bXszu1m+Z4y30yxSV9EtSEDBGPdc5qxvKgvKnMW1bcSJu/SOu4UtJWRJKU014E1E6g4VRKrw4Y+04YxEXmvFs227+QHJJ58ZYgL6n4oAqUXi1h311S4hOV0trxOG8Wxlu0U1LA/M3dgs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUDaLbA9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUDaLbA9"
Received: by smtp.kernel.org (Postfix)
	id F323CC4CECD; Thu, 26 Sep 2024 17:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29783C4CEC6;
	Thu, 26 Sep 2024 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727371792;
	bh=lkrzZFQsJryyepe9cl5TeveCqr68wQZnBvW7tPBgUEw=;
	h=From:Date:Subject:To:Cc:From;
	b=cUDaLbA9m7lUIP17C+vzl1t7MISUlhR+o9SU8jIk20dHykhyxumHOWBpOgDu3ONIc
	 UeC2x0g9avJq9ayNKh2EiVfu3qo8HK9/a8gE0WD97j3vZalRz6BXkuq4adqkpc/xXs
	 9PR2bj0wiIxDCHDguLMHZ4UqGZ6pDYvIy4TzDqHYch1jXSs3qpBCej4+8h5m3IGX8z
	 Idd4T8LeSKnRcIR7Po6yQTfr8u6P+R3M/BJrGmvg/4PiDfpgW0A6vI4Wmsx5R1uy99
	 YfMdWol2CzptGUF1ULg4Rxl2sIJp79TrJ58wncMEc6web873jTJ9ljNfQE+RcCwx7X
	 CiQ99JoF9avPQ==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Thu, 26 Sep 2024 19:29:32 +0200
Subject: [PATCH b4] config: fix multivals config from cmdline
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-cmdline-config-override-multivals-v1-1-80ec93afc5a1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPuZ9WYC/x3NQQrDIBBA0auEWXcgSpDaq5Quoo7pgNEyNhIIu
 Xsky7f5/4BKwlThNRwg1LhyyR3qMYD/znkh5NANetTTaLVBv4bEmdCXHHnB0kiEA+G6pT+3OVU
 kY51X9mliUNA7P6HI+/14g5vgc54X6XgQIHcAAAA=
X-Change-ID: 20240926-cmdline-config-override-multivals-e69bc1986fd1
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.15-dev-f2b2e
X-Developer-Signature: v=1; a=openpgp-sha256; l=4302; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=lkrzZFQsJryyepe9cl5TeveCqr68wQZnBvW7tPBgUEw=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBm9ZoPLl8UydMEULleH3W/b1x5og3fA39iuGiKT
 Q4d6wocb46JAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZvWaDwAKCRD2t4JPQmmg
 c5ZPEADu552xfUjWonwmCF9lAJrLgyQiHW0fTayFC7nlbUIizGGdgD3zAcaKsIceVu3J1ub5NAo
 7MUykbZylULkhbRxrs8rL/UK708p/0N0pz8fXHku8OFczuPBJidn6wuTHvukIP8LRieQQg9DDOf
 ZWrj+8TgcHK1EUrMCO0s2pGZRNB5Slsn9sG7sF9KNcTJjulY+1eqHN85ClOF7x+xgYsKAS24Xhc
 uT0D5xgFZMNvQBrlXomQL2r9u0HWfhY8GGDbLpD1imX8sz1T5YHBDJbRYEO04LIQWTUd4blzmjQ
 dbC4J0PWl0IVJ8MAccUtkAwjOQuICvRbLqVsrT3K7d4KxROQnYDnREN1mgKZk0MrCfQYDcwDpOj
 0bk31Thlu6V3MZQPjqGU939mGfZmEUsz1rs2f2kr6H4uideMvEaa+ees/0JmY5uyRnsIPPGm2p0
 jwqO934MuxIVcwXtSzgF6sQoVU/Ky0vV9I3FqpgOoIegJdMI/OQH1rauvvjqKI7kyorf7TD2Knh
 4oAuffBCQr9V5us8quQyEim/uON7kTIsodaoQ4sB1XWK1M/wc0JY6/CN6i4wTL809Nxi5LqtYY+
 aGgjDrepOgQX81LBRlmF0GOP/xQNEMh5nZnZBhnm+JXPMfd2FNkkkTORl/51o2ZCptkNtFh4tQz
 gTBZdAx6xwS8Yzw==
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

Specifying prep-perpatch-check-cmd from the command line didn't work:

  $ b4 -c "b4.prep-perpatch-check-cmd=true" prep --check
  config prep-perpatch-check-cmd true ['keyringsrc', 'am-perpatch-check-cmd', 'prep-perpatch-check-cmd']
  Checking patches using:
    t
    r
    u
    e
  ---
  Traceback (most recent call last):
  (...)
  FileNotFoundError: [Errno 2] No such file or directory: 't'

The fix is similar to the one from commit d5f3956 ("Fix
prep-perpatch-check-cmd in .b4-config"): 'prep-perpatch-check-cmd' is a
special type, and the given string should not be considered as a list of
characters.

Note that here, the arguments set via 'b4 -c' are overridden, existing
lists are not appended.

This commit treats all "multivals" types the same way, including
"smtpserveroption" from the "sendemail" section.

Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 src/b4/__init__.py | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 811bbcaf028d78224242433eac9fdbeb03a306b3..b9b4ea2fa1c0baa6a3def7935597da7dc72df8d7 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2809,18 +2809,27 @@ def setup_config(cmdargs: argparse.Namespace):
     _setup_sendemail_config(cmdargs)
 
 
-def _cmdline_config_override(cmdargs: argparse.Namespace, config: dict, section: str):
+def _cmdline_config_override(cmdargs: argparse.Namespace, config: dict, section: str,
+                             multivals: Optional[list] = None):
     """Use cmdline.config to set and override config values for section."""
     if not cmdargs.config:
         return
 
-    section += '.'
+    if multivals is None:
+        multivals = list()
 
-    config_override = {
-        key[len(section):]: val
-        for key, val in cmdargs.config.items()
-        if key.startswith(section)
-    }
+    section += '.'
+    config_override = {}
+
+    for key, val in cmdargs.config.items():
+        if key.startswith(section):
+            key = key[len(section):]
+            if key in multivals:
+                if key not in config_override:
+                    config_override[key] = list()
+                config_override[key].append(val)
+            else:
+                config_override[key] = val
 
     config.update(config_override)
 
@@ -2923,7 +2932,7 @@ def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
             pass
 
     if cmdargs:
-        _cmdline_config_override(cmdargs, config, 'b4')
+        _cmdline_config_override(cmdargs, config, 'b4', multivals=multivals)
 
     MAIN_CONFIG = config
 
@@ -3782,11 +3791,12 @@ def _setup_sendemail_config(cmdargs: argparse.Namespace) -> None:
 
     # Get the default settings first
     config = get_main_config()
-    _basecfg = get_config_from_git(r'sendemail\.[^.]+$', multivals=['smtpserveroption'])
+    multivals = ['smtpserveroption']
+    _basecfg = get_config_from_git(r'sendemail\.[^.]+$', multivals=multivals)
     identity = config.get('sendemail-identity') or _basecfg.get('identity')
     if identity:
         # Use this identity to override what we got from the default one
-        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', multivals=['smtpserveroption'], defaults=_basecfg)
+        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', multivals=multivals, defaults=_basecfg)
         sectname = f'sendemail.{identity}'
         if not len(sconfig):
             raise smtplib.SMTPException('Unable to find %s settings in any applicable git config' % sectname)
@@ -3796,7 +3806,7 @@ def _setup_sendemail_config(cmdargs: argparse.Namespace) -> None:
     logger.debug('Using values from %s', sectname)
 
     # Note: This can't handle identity, need to use sendemail.key directly
-    _cmdline_config_override(cmdargs, sconfig, 'sendemail')
+    _cmdline_config_override(cmdargs, sconfig, 'sendemail', multivals=multivals)
 
     SENDEMAIL_CONFIG = sconfig
 

---
base-commit: dedf88cb947bab87c418b49d975df11f83621692
change-id: 20240926-cmdline-config-override-multivals-e69bc1986fd1

Best regards,
-- 
Matthieu Baerts (NGI0) <matttbe@kernel.org>


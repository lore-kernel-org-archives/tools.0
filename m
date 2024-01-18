Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917D2DF73
	for <tools@linux.kernel.org>; Thu, 18 Jan 2024 20:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609564; cv=none; b=pH9e2GwOhW9BSdUvu2dtF6ORhaol5vLjXZZKFaugf1vif+gpHJdz5u+9V7//0X7ICoYT3V5xOLhtPMibyHsQtnUO6urnvLl549+2A/HfD2y+jmTI7wFpCe2Z6IDzxsGgyrduLZgL4rgJclvZcITGDrjik1Qz1szl6V6n0lKtjIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609564; c=relaxed/simple;
	bh=44TEVHHlhBDaPHtR+8sPchyv/gNMZg2zZTto3N//D1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fa2G13UM9QQb+bcxCuHtuJBZFWrkkEPI4bl5vxz0F0wPcwz0ODoRJcMRYNO4BO/CtroOoXDXeuV3gw0vmVVEhrKxgN0JvwIt9dgMh9oUiA/lzfaVEBYMHX60GgPJAjbPFCLXKnMg7uYgz4V9IM8sfsakY1Tx1WcfpdZX1goiXrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hy63XvFJ; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hy63XvFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705609563; x=1737145563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=44TEVHHlhBDaPHtR+8sPchyv/gNMZg2zZTto3N//D1k=;
  b=Hy63XvFJUzhFGVys+VirIieHJ77RCBHqz4y1ekvrbs38iD68P3CIyEi2
   IVdPUGKQCz0QS+/5PssQM+Wtj6sJfrNIxuBPAxU/MAii3VliU/rleWIwN
   cRk+Q+GvcXkxaLl22J9463+IJaHNjc2mocAzJLBavEIrScUfASdlD6h1Z
   s4PFPeqaGlflsktYY4W2RRnalNnc8BIWsCuhjn+23ACIuMXtMhMG8tgWu
   nHhllcEZISF5NsWqKtDWK52MPR0TDaBaCWVCOPGNbuY81iVyrTTx61WpD
   PkdnUKG3mY3eW4JrasHy0z9t1Xbo1R/TLx1TVFTPP6PiVGbGgywN923MQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431732133"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="431732133"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928226816"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="928226816"
Received: from amilburn-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.18])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:25:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	jani.nikula@intel.com
Subject: [PATCH 1/2] init: separate config setup from access
Date: Thu, 18 Jan 2024 22:25:43 +0200
Message-Id: <20240118202544.2019009-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240118202544.2019009-1-jani.nikula@intel.com>
References: <20240118202544.2019009-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

In preparation for adding support for setting config options on the
command-line, separate the config setup from regular access.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Note: 'git show -w' helps review the indentation changes.
---
 b4/__init__.py | 129 ++++++++++++++++++++++++++++---------------------
 b4/command.py  |   2 +
 2 files changed, 75 insertions(+), 56 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 5b692a1e0ef7..f62ec11f965b 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2719,6 +2719,16 @@ def in_directory(dirname):
         os.chdir(cdir)
 
 
+def setup_config(cmdargs: argparse.Namespace):
+    """Setup configuration options. Needs to be called before accessing any of
+    the config options."""
+    _setup_main_config(cmdargs)
+    _setup_user_config(cmdargs)
+
+    # Depends on main config!
+    _setup_sendemail_config(cmdargs)
+
+
 def git_set_config(fullpath: Optional[str], param: str, value: str, operation: str = '--replace-all'):
     args = ['config', operation, param, value]
     ecode, out = git_run_command(fullpath, args)
@@ -2759,39 +2769,41 @@ def get_config_from_git(regexp: str, defaults: Optional[dict] = None,
     return gitconfig
 
 
-def get_main_config() -> dict:
+def _setup_main_config(cmdargs: argparse.Namespace):
     global MAIN_CONFIG
-    if MAIN_CONFIG is None:
-        defcfg = copy.deepcopy(DEFAULT_CONFIG)
-        # some options can be provided via the toplevel .b4-config file,
-        # so load them up and use as defaults
-        topdir = git_get_toplevel()
-        wtglobs = ['send-*', '*mask', '*template*', 'trailer*', 'pw-*']
-        if topdir:
-            wtcfg = os.path.join(topdir, '.b4-config')
-            if os.access(wtcfg, os.R_OK):
-                logger.debug('Loading worktree configs from %s', wtcfg)
-                wtconfig = get_config_from_git(r'b4\..*', source=wtcfg)
-                logger.debug('wtcfg=%s', wtconfig)
-                for key, val in wtconfig.items():
-                    if val.startswith('./'):
-                        # replace it with full topdir path
-                        val = os.path.abspath(os.path.join(topdir, val))
-                    for wtglob in wtglobs:
-                        if fnmatch.fnmatch(key, wtglob):
-                            logger.debug('wtcfg: %s=%s', key, val)
-                            defcfg[key] = val
-                            break
-        config = get_config_from_git(r'b4\..*', defaults=defcfg, multivals=['keyringsrc'])
-        config['listid-preference'] = config['listid-preference'].split(',')
-        config['listid-preference'].remove('*')
-        config['listid-preference'].append('*')
-        if config['gpgbin'] is None:
-            gpgcfg = get_config_from_git(r'gpg\..*', {'program': 'gpg'})
-            config['gpgbin'] = gpgcfg['program']
 
-        MAIN_CONFIG = config
+    defcfg = copy.deepcopy(DEFAULT_CONFIG)
+    # some options can be provided via the toplevel .b4-config file,
+    # so load them up and use as defaults
+    topdir = git_get_toplevel()
+    wtglobs = ['send-*', '*mask', '*template*', 'trailer*', 'pw-*']
+    if topdir:
+        wtcfg = os.path.join(topdir, '.b4-config')
+        if os.access(wtcfg, os.R_OK):
+            logger.debug('Loading worktree configs from %s', wtcfg)
+            wtconfig = get_config_from_git(r'b4\..*', source=wtcfg)
+            logger.debug('wtcfg=%s', wtconfig)
+            for key, val in wtconfig.items():
+                if val.startswith('./'):
+                    # replace it with full topdir path
+                    val = os.path.abspath(os.path.join(topdir, val))
+                for wtglob in wtglobs:
+                    if fnmatch.fnmatch(key, wtglob):
+                        logger.debug('wtcfg: %s=%s', key, val)
+                        defcfg[key] = val
+                        break
+    config = get_config_from_git(r'b4\..*', defaults=defcfg, multivals=['keyringsrc'])
+    config['listid-preference'] = config['listid-preference'].split(',')
+    config['listid-preference'].remove('*')
+    config['listid-preference'].append('*')
+    if config['gpgbin'] is None:
+        gpgcfg = get_config_from_git(r'gpg\..*', {'program': 'gpg'})
+        config['gpgbin'] = gpgcfg['program']
+
+    MAIN_CONFIG = config
+
 
+def get_main_config() -> dict:
     return MAIN_CONFIG
 
 
@@ -2874,16 +2886,18 @@ def save_cache(contents: str, identifier: str, suffix: Optional[str] = None, mod
     except FileNotFoundError:
         logger.debug('Could not write cache %s for %s', fullpath, identifier)
 
-
-def get_user_config():
+def _setup_user_config(cmdargs: argparse.Namespace):
     global USER_CONFIG
-    if USER_CONFIG is None:
-        USER_CONFIG = get_config_from_git(r'user\..*')
-        if 'name' not in USER_CONFIG:
-            udata = pwd.getpwuid(os.getuid())
-            USER_CONFIG['name'] = udata.pw_gecos
-        if 'email' not in USER_CONFIG:
-            USER_CONFIG['email'] = os.environ['EMAIL']
+
+    USER_CONFIG = get_config_from_git(r'user\..*')
+    if 'name' not in USER_CONFIG:
+        udata = pwd.getpwuid(os.getuid())
+        USER_CONFIG['name'] = udata.pw_gecos
+    if 'email' not in USER_CONFIG:
+        USER_CONFIG['email'] = os.environ['EMAIL']
+
+
+def get_user_config() -> dict:
     return USER_CONFIG
 
 
@@ -3500,25 +3514,28 @@ def read_template(tptfile):
     return tpt
 
 
-def get_sendemail_config() -> dict:
+def _setup_sendemail_config(cmdargs: argparse.Namespace):
     global SENDEMAIL_CONFIG
-    if SENDEMAIL_CONFIG is None:
-        # Get the default settings first
-        config = get_main_config()
-        identity = config.get('sendemail-identity')
-        _basecfg = get_config_from_git(r'sendemail\.[^.]+$')
-        if identity:
-            # Use this identity to override what we got from the default one
-            sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', defaults=_basecfg)
-            sectname = f'sendemail.{identity}'
-            if not len(sconfig):
-                raise smtplib.SMTPException('Unable to find %s settings in any applicable git config' % sectname)
-        else:
-            sconfig = _basecfg
-            sectname = 'sendemail'
-        logger.debug('Using values from %s', sectname)
-        SENDEMAIL_CONFIG = sconfig
 
+    # Get the default settings first
+    config = get_main_config()
+    identity = config.get('sendemail-identity')
+    _basecfg = get_config_from_git(r'sendemail\.[^.]+$')
+    if identity:
+        # Use this identity to override what we got from the default one
+        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', defaults=_basecfg)
+        sectname = f'sendemail.{identity}'
+        if not len(sconfig):
+            raise smtplib.SMTPException('Unable to find %s settings in any applicable git config' % sectname)
+    else:
+        sconfig = _basecfg
+        sectname = 'sendemail'
+    logger.debug('Using values from %s', sectname)
+
+    SENDEMAIL_CONFIG = sconfig
+
+
+def get_sendemail_config() -> dict:
     return SENDEMAIL_CONFIG
 
 
diff --git a/b4/command.py b/b4/command.py
index d1046375c97c..07b6d67735dc 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -362,6 +362,8 @@ def cmd():
         parser.print_help()
         sys.exit(1)
 
+    b4.setup_config(cmdargs)
+
     if cmdargs.offline_mode:
         logger.info('Running in OFFLINE mode')
         b4.can_network = False
-- 
2.39.2


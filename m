Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE4B2E63A
	for <tools@linux.kernel.org>; Thu, 18 Jan 2024 20:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609565; cv=none; b=YBQecoVrr+oAfBCT0AbMB38C+lYfPTO1yvVLryC7NAhZza4gmwCqdrqSlj4b4DKxcEDXtqLh4XQQxkcUqO19cJSQk7zQHEyWceZReCiPpGY7K/N4e1NH4xBAwjpkIP/MmceFrCejj+1I1jW5EXS9uXyPBPAKuz+o3nfpxBLB990=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609565; c=relaxed/simple;
	bh=2Tz388nXK6eZ/PgQ/7kCiEMvyOI7hQ3y8LfTbOnWTEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YkZDtGLNr+7pkg7lyJhXReiIAsvC8vZuxPclk+zDoDiZQAHUIgY6OiaXHtMP1/mJm1q3xylIyWBBO5IOIfqzvaj5CLzASW3Wje52b0OPA81x40v9hYAGAWLiTPumskDZGC9vk9WK+CEe2rH6cW0RdiwE6xdYtBTRkrVmIwLrh1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiWt86+I; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiWt86+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705609563; x=1737145563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Tz388nXK6eZ/PgQ/7kCiEMvyOI7hQ3y8LfTbOnWTEY=;
  b=GiWt86+I6fWHNNFSmKVZoACsi0Jd2KmLBC9ZJNDdCQ0RMWlYm+OAT3Y7
   LR2LzJ2WlzNvrgC1Hb1eKeHiTz9DBF3Zt+vfpR6P0rwg8ra+Cy0P5vw8h
   YJ3DQJSQdMUw453FyzndJaoY9MvO04k15VT4uvKRa9mJRML1DHXLF+VcG
   EZ3BPQiEz9fTkC72WO44WwQW7qe82+E2rHzP4svq3RpYvFM5KoeB2jMqJ
   NwT/GFF58UvLS7MS+KnRcGpWPtOu2aS1fFaE8P3voZziJW+SvOv0iw8IT
   ATUUpsUQzRGc1yUn2bAbdtKxnEUtn9cPsvnoNnj6z2CsGK23387bGRRai
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13925419"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="13925419"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1116061531"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="1116061531"
Received: from amilburn-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.18])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:26:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	jani.nikula@intel.com
Subject: [PATCH 2/2] b4: add --config option to set config options on the command-line
Date: Thu, 18 Jan 2024 22:25:44 +0200
Message-Id: <20240118202544.2019009-3-jani.nikula@intel.com>
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

It's useful to be able to set and override configuration options on the
command-line. Add the --config and -c options to do this. This is
similar to the git -c option.

The basic form is 'b4 -c name=value'. Mimic git -c option for the 'b4 -c
name' and 'b4 -c name=' forms to set the value to 'true' and the empty
string, respectively. The name is also the same section.key dotted
format as in git -c. For example, 'b4 -c
b4.midmask=https://some.host/%s'.

The argparse action class is handy for special parsing. For details, see
[1] and [2]. This stores a dict of the config options set on the command
line to cmdargs.config, mapping the full dotted keys to values. Relevant
parts for main, user and sendemail configs will be set using
_cmdline_config_override().

[1] https://docs.python.org/3/library/argparse.html#action
[2] https://docs.python.org/3/library/argparse.html#action-classes

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 b4/__init__.py  | 23 +++++++++++++++++++++++
 b4/command.py   | 24 ++++++++++++++++++++++++
 docs/config.rst |  5 +++++
 3 files changed, 52 insertions(+)

diff --git a/b4/__init__.py b/b4/__init__.py
index f62ec11f965b..38a248aa8ca4 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2729,6 +2729,22 @@ def setup_config(cmdargs: argparse.Namespace):
     _setup_sendemail_config(cmdargs)
 
 
+def _cmdline_config_override(cmdargs: argparse.Namespace, config: dict, section: str):
+    """Use cmdline.config to set and override config values for section."""
+    if not cmdargs.config:
+        return
+
+    section += '.'
+
+    config_override = {
+        key[len(section):]: val
+        for key, val in cmdargs.config.items()
+        if key.startswith(section)
+    }
+
+    config.update(config_override)
+
+
 def git_set_config(fullpath: Optional[str], param: str, value: str, operation: str = '--replace-all'):
     args = ['config', operation, param, value]
     ecode, out = git_run_command(fullpath, args)
@@ -2800,6 +2816,8 @@ def _setup_main_config(cmdargs: argparse.Namespace):
         gpgcfg = get_config_from_git(r'gpg\..*', {'program': 'gpg'})
         config['gpgbin'] = gpgcfg['program']
 
+    _cmdline_config_override(cmdargs, config, 'b4')
+
     MAIN_CONFIG = config
 
 
@@ -2896,6 +2914,8 @@ def _setup_user_config(cmdargs: argparse.Namespace):
     if 'email' not in USER_CONFIG:
         USER_CONFIG['email'] = os.environ['EMAIL']
 
+    _cmdline_config_override(cmdargs, USER_CONFIG, 'user')
+
 
 def get_user_config() -> dict:
     return USER_CONFIG
@@ -3532,6 +3552,9 @@ def _setup_sendemail_config(cmdargs: argparse.Namespace):
         sectname = 'sendemail'
     logger.debug('Using values from %s', sectname)
 
+    # Note: This can't handle identity, need to use sendemail.key directly
+    _cmdline_config_override(cmdargs, sconfig, 'sendemail')
+
     SENDEMAIL_CONFIG = sconfig
 
 
diff --git a/b4/command.py b/b4/command.py
index 07b6d67735dc..96d585f6983e 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -111,6 +111,24 @@ def cmd_diff(cmdargs):
     b4.diff.main(cmdargs)
 
 
+class ConfigOption(argparse.Action):
+    """Action class for storing key=value arguments in a dict."""
+    def __call__(self, parser, namespace, keyval, option_string=None):
+        config = getattr(namespace, self.dest, None)
+
+        if config is None:
+            config = dict()
+            setattr(namespace, self.dest, config)
+
+        if '=' in keyval:
+            key, value = keyval.split('=', maxsplit=1)
+        else:
+            # mimic git -c option
+            key, value = keyval, 'true'
+
+        config[key] = value
+
+
 def setup_parser() -> argparse.ArgumentParser:
     # noinspection PyTypeChecker
     parser = argparse.ArgumentParser(
@@ -132,6 +150,12 @@ def setup_parser() -> argparse.ArgumentParser:
                         help='Disable TTY detection for stdin')
     parser.add_argument('--use-web-endpoint', dest='send_web', action='store_true', default=False,
                         help="Force going through the web endpoint")
+    parser.add_argument('-c', '--config', metavar='NAME=VALUE', action=ConfigOption,
+                        help='''Set config option NAME to VALUE. Override value
+                        from config files. NAME is in dotted section.key
+                        format. Using NAME= and omitting VALUE will set the
+                        value to the empty string. Using NAME and omitting
+                        =VALUE will set the value to "true".''')
 
     subparsers = parser.add_subparsers(help='sub-command help', dest='subcmd')
 
diff --git a/docs/config.rst b/docs/config.rst
index 8936d2274734..c46d43a16ac0 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -12,6 +12,11 @@ Since the purpose of b4 is to work with git repositories, this allows
 the usual fall-through configuration that can be overridden by more
 local settings on the repository level.
 
+Additionally, you can set and override configuration options on the command-line
+using the ``--config`` (or ``-c``) option, for example::
+
+    b4 --config b4.midmask=https://some.host/%s
+
 Per-project defaults
 ~~~~~~~~~~~~~~~~~~~~
 .. note::
-- 
2.39.2


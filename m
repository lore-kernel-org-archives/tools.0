Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89EE2D739C
	for <tools@linux.kernel.org>; Wed, 22 Oct 2025 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761171923; cv=none; b=DCxGmttqkVoeEb3Ao33S+QR+RoL7mfPG2VJfXMXSKdtiXa3NGCZsQLUiSuM4qqmo0PA5FFOo8QkMFoaeB7x6V/oChJgC2DViUlt2fttlUbcfgY2BVk6DniJv1mY+5qSi1UkxSGmsPsKvGK/dKHfc3HbQUTU2C9/VUlOYStEJdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761171923; c=relaxed/simple;
	bh=5Y/KvnAoosdq3AEZCr8EFQdKQ0sC7avNbUpxZj65scA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z/fiKXU5iOvl5WtEuCeRL+YxbwA05VeEIjes7wSHADCqOqFhXoz9JTXr4GoZqWLov9Cks03uASD7681L5Jo5piwewDaND7dZXQQJ8/n5On5eltVAZDeFSPOKc8AWB4YS1W9Pt/vnclAH0MdyWB7uxphGs9eFkVumjfCwrjeyXyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRvmAbuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRvmAbuB"
Received: by smtp.kernel.org (Postfix)
	id D7FE9C4CEF5; Wed, 22 Oct 2025 22:25:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2F4EC4CEFF
	for <tools@kernel.org>; Wed, 22 Oct 2025 22:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2F4EC4CEFF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761171922; x=1792707922;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=5Y/KvnAoosdq3AEZCr8EFQdKQ0sC7avNbUpxZj65scA=;
  b=hRvmAbuBQEL/gW5eqaAhqsxnsditeX12+94SFpW3o5WQ37KMAzM+Pm1r
   kQtD6RBJmN/eSPspVPGKkbeLKaj0C9GKVmISgDmt5DcbjVrIP7T85Ewc6
   08vBPxXUjUF/M1XXodymqAYaWcsHilwB0WfJlfncs1T+XUB7du/5Pwr4j
   LxCk2VGKIgTm9eF5GdJP2kWyUV6WnHDJNJp97Y6y360UOiuYdx3PhbRHY
   dDDy2Mxl44vbny7+++nMq7KNAEcPP0nzPjri2B6fEns7VugJXWhPIM4Or
   0JcYyN8lqVUkHD0D+upjBY4to/FPvVjlSIlSMp5l+jcJbT+8HaDUuPKU+
   g==;
X-CSE-ConnectionGUID: ZxW6Td/MR1KzxSty/RYCXQ==
X-CSE-MsgGUID: E4/zuoo9SOSiMOtNYIo0LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63035432"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63035432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 15:25:21 -0700
X-CSE-ConnectionGUID: A7jBGZDwRviNhyVkP9QwFw==
X-CSE-MsgGUID: jpbnxuNKQ1SZ/DqTbnpKQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214644566"
Received: from orcnseosdtjek.jf.intel.com (HELO [10.166.28.70]) ([10.166.28.70])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 15:25:22 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 22 Oct 2025 15:24:56 -0700
Subject: [PATCH b4] b4: allow multiple b4.email-exclude config entries
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>
X-B4-Tracking: v=1; b=H4sIALhZ+WgC/x3NwQ5EMBCA4VeROZukGrXhVcSharo7q0paRCLeX
 Tl+l/8/IVJgitBkJwTaOfLsE4o8A/PT/kvIQzJIIVUhpMT/iNPmVl4cIU2aHdJh3DYk+fVJ4cd
 W2ijV10ZYSJ0lkOXjfbTQl9Bd1w2ZhAd7dwAAAA==
X-Change-ID: 20251022-jk-multiple-email-exclude-entries-7f6ac55b9c0f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.15-dev-48339
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=5Y/KvnAoosdq3AEZCr8EFQdKQ0sC7avNbUpxZj65scA=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhoyfkWeP//oZwGRya/qPR376Egdu3ZsSPbfob/bs/UvMv
 07XLJSf1lHKwiDGxSArpsii4BCy8rrxhDCtN85yMHNYmUCGMHBxCsBEbrYxMly3i+bO5Dg2jfH/
 jVtsvU2Fcr/8ldaxOguq9PXqrhOouszIMO0Cs8Ttp29TTz8rrt7cZ5/J2btm0lKn114eovP/Gu/
 YzwgA
X-Developer-Key: i=jacob.e.keller@intel.com; a=openpgp;
 fpr=204054A9D73390562AEC431E6A965D3E6F0F28E8

The b4.email-exclude configuration option allows users to provide a list of
globs that define email addresses to never send to. The configuration
option is interpreted as a comma separated list of exclusions. If the
number of excluded entries gets long, this can get somewhat annoying to
manage in a configuration file.

Allow user to specify email-exclude multiple times. Combine all
configuration entries into a single list during _setup_main_config(). This
allows users to list excluded addresses or patterns over multiple lines in
a configuration file rather than by creating a single long line.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
I maintain my configuration files as a git tree to help track changes.
b4.email-exclude requiring a single line is somewhat annoying as it makes
the difference between versions when adding a new entry difficult to read.

In addition, users may want multiple b4.email-exclude entries using
includeif or in per-repository configuration. Allow this by converting
email-exclude to a multi-value configuration.

This may need to be done as a breaking change if there is risk that users
currently override the setting in separate configs. I'm not sure how that
would best be handled.
---
 docs/config.rst    |  5 +++++
 src/b4/__init__.py | 16 +++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 0f30d4e7e98f..8936161b86c8 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -283,6 +283,11 @@ Attestation settings
 
       email-exclude = *@codeaurora.org, *@obsolete.example.com
 
+  Multiple entries in the configuration will be combined. E.g.::
+
+      email-exclude = someone-gone@example.com
+      email-exclude = *@obselete.example.com
+
   Default: ``None``
 
 ``b4.sendemail-identity``
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index e5f551e4d623..18251c477346 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3063,7 +3063,7 @@ def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
     # so load them up and use as defaults
     topdir = git_get_toplevel()
     wtglobs = ['prep-*-check-cmd', 'send-*', '*mask', '*template*', 'trailer*', 'pw-*']
-    multivals = ['keyringsrc', 'am-perpatch-check-cmd', 'prep-perpatch-check-cmd']
+    multivals = ['keyringsrc', 'am-perpatch-check-cmd', 'prep-perpatch-check-cmd', 'email-exclude']
     if topdir:
         wtcfg = os.path.join(topdir, '.b4-config')
         if os.access(wtcfg, os.R_OK):
@@ -3088,6 +3088,11 @@ def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
         gpgcfg = get_config_from_git(r'gpg\..*', {'program': 'gpg'})
         config['gpgbin'] = gpgcfg['program']
 
+    excludes: List[str] = []
+    for item in config['email-exclude']:
+        excludes.extend(item.split(','))
+    config['email.exclude'] = excludes
+
     # If we specify DNS resolvers, configure them now
     if config['attestation-dns-resolvers'] is not None:
         try:
@@ -4323,14 +4328,7 @@ def git_get_current_branch(gitdir: Optional[str] = None, short: bool = True) ->
 
 def get_excluded_addrs() -> Set[str]:
     config = get_main_config()
-    excludes = set()
-    c_excludes = str(config.get('email-exclude', ''))
-    if c_excludes:
-        for entry in c_excludes.split(','):
-            excludes.add(entry.strip())
-
-    return excludes
-
+    return set(config.get('email-exclude', ''))
 
 def cleanup_email_addrs(addresses: List[Tuple[str, str]], excludes: Set[str],
                         gitdir: Optional[str]) -> List[Tuple[str, str]]:

---
base-commit: 52d380965c71ce955c0a534dd4a35dea562fcaee
change-id: 20251022-jk-multiple-email-exclude-entries-7f6ac55b9c0f

Best regards,
--  
Jacob Keller <jacob.e.keller@intel.com>


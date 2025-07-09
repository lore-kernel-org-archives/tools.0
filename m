Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28123B63F
	for <tools@linux.kernel.org>; Wed,  9 Jul 2025 22:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752099765; cv=none; b=A3g/OlKQUT6j4z8gyGsiJ0rdWxu8ZCx5ro+Yv18ucx3rT2hF4UULznCw+3xtvkAFMWxR03ZKtB6gtuSZQr0D4T3ZQ5OgZ6S6V0LbHXe+nKLi89xOBvxXJCEDscmgXfLnMJLQKMD8WN1a3qYNKUAx6PiyCwPqDp6T8yCxCtvpJjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752099765; c=relaxed/simple;
	bh=UyjL7EbL6Jsia/FfaU9QV6bW8mX7heocdO0yDPM3S5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cgG466ok/o0sut0PCO1T/vNmIgApqkOCmySqoF7ganugQei7E5He+e6E+XbgzzX4Js/8PYZbkvGKqavg4ZoLb4FQr/k91j9tDXpf4kxDeDYFLBlW9nfjF46FhDyYGoG9v9d+ew8IwfDeePTENi+sdepjUOaihl+bSSOhMqxIk58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/jdlLiY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/jdlLiY"
Received: by smtp.kernel.org (Postfix)
	id B0EFAC4CEF6; Wed,  9 Jul 2025 22:22:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFE0CC4CEF1
	for <tools@kernel.org>; Wed,  9 Jul 2025 22:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFE0CC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752099764; x=1783635764;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=UyjL7EbL6Jsia/FfaU9QV6bW8mX7heocdO0yDPM3S5w=;
  b=R/jdlLiYcUG5g3Hv4I2JCLiOAcPuT+5jPGW1fE3kGBprxknu7xCLeCIg
   kQVpGW6lHcMoukAT35lTohGNxtKpkiGHNyMCCSpVrnoV/IlvWcBiJKLTv
   OPu/LUHbVwl4zWDcbhTSvZJSupeGzwOobgt2jEUzSV2Q4KBHZA8kQLwQu
   EA5veYjq6Q5CdF0ViW4J/nIIbpvl5J2/obHMEeDBU8LPV8Jk96fjxHrXw
   OrvKiB9ZpcFDRG8Xr26oJl73jI22kVOkDvhFQ/2eI1imtvZBI0XnNR+tR
   ZQW8xgHHpvIlSifnToQjXpPlm8bfykVmTKU0JP1VBHP6S2C+VoFVwZMOO
   w==;
X-CSE-ConnectionGUID: 3AE9argZQriv7N8IYnMY7w==
X-CSE-MsgGUID: LsUQRuhpSd2brktn1CAEgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54518633"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="54518633"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 15:22:42 -0700
X-CSE-ConnectionGUID: cM6k2hFKSROZ2bmLGH5e+A==
X-CSE-MsgGUID: 1KGPZOD+QIGGUyk9SrACkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="179595916"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 15:22:42 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 09 Jul 2025 15:22:29 -0700
Subject: [PATCH v2] b4: support send-email aliases
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-jk-email-alias-support-v2-1-b0339905964e@intel.com>
X-B4-Tracking: v=1; b=H4sIAKXrbmgC/4WNQQ6CMBBFr0Jm7RjahDa48h6GRWlHGS20aYFoC
 He3cgGX7+f/9zfIlJgyXKoNEq2cOUwF5KkCO5jpQciuMMhaNrWSGp8vpNGwR+PZZMxLjCHN6JT
 qpRK2b1wLZRwT3fl9iG9d4YHzHNLn+FnFL/2rXAUK7HVrTClZp8WVp5n82YYRun3fvxMkn9y8A
 AAA
X-Change-ID: 20250627-jk-email-alias-support-d66b261cb5d9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.15-dev-bd4f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4351;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=UyjL7EbL6Jsia/FfaU9QV6bW8mX7heocdO0yDPM3S5w=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhoy815sclru6+MRxsHdM/3hkR6BxbsAdpX/3t7JoMx0Ii
 NhzeUNhRykLgxgXg6yYIouCQ8jK68YTwrTeOMvBzGFlAhnCwMUpABMxfcbwk9HQqu5OaZLyBqNH
 8lU6sXsbgz7s6V4nkcIgd/pTRUotK8P/qs8ux68EzX9qtl7BNPXBTKaQIjOVd4eFBZYlPH80PVC
 IAQA=
X-Developer-Key: i=jacob.e.keller@intel.com; a=openpgp;
 fpr=204054A9D73390562AEC431E6A965D3E6F0F28E8

git send-email has supported the --translate-aliases option since v2.47, as
commit c038a6f1d748 ("send-email: teach git send-email option to translate
aliases", 2024-08-17)

The --translate-aliases option allows asking git send-email to convert an
alias into its real address according to an alias file in varying formats.
One complexity is that the mode returns the original input for each line
which is not an alias.

Use this in cleanup_email_addrs to convert provided aliases into their real
addresses. For simplicity this just iterates over addresses and passes them
to git send-email one at a time. I tried to integrate this into the
existing loop, but that was difficult to get correct behavior. In theory, a
single git send-email process could be used with each email being sent as
its own line, ideally without needing to iterate the address list twice.
Getting that to work properly and integrate with the loop logic seems to
require a significant amount of refactoring.

To avoid breaking any users running older versions of git, the translation
is enabled via a new b4.send-translate-aliases config option. This requires
opt-in, so users must set this configuration. This does require users to
opt-in even if they run a newer version of git. This may reduce awareness,
but also minimizes surprise and behavioral change. Alternatively, we could
instead try to check if git supports the feature either via its help output
or its version number.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
This version adds a configuration option, b4.send-translate-aliases to only
enable the translation as an opt-in. This will avoid breaking existing
users who are still running an old version of git or who simply do not want
translation.
---
Changes in v2:
- Add b4.send-translate-aliases config option
- Link to v1: https://patch.msgid.link/20250627-jk-email-alias-support-v1-1-b79aa627cd71@intel.com
---
 docs/config.rst    | 14 ++++++++++++++
 src/b4/__init__.py | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/docs/config.rst b/docs/config.rst
index 0f30d4e7e98f..e34aa79eceef 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -137,6 +137,20 @@ These options control many of the core features of b4.
 
   Default: ``10``
 
+.. _send_settings:
+
+``send`` settings
+~~~~~~~~~~~~~~~~~
+
+These settings control ``b4 send`` behavior.
+
+``b4.send-translate-aliases``
+  Translate shorthand aliases passed to ``--to``, ``--cc``, etc. into real
+  addresses according to your ``sendemail.aliasesFile`` configuration.
+  Requires git v2.47 or later.
+
+  Default: ``no``
+
 .. _shazam_settings:
 
 ``am`` and ``shazam`` settings
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e3a95e..76ccfe3051eb 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4244,6 +4244,24 @@ def get_excluded_addrs() -> Set[str]:
 def cleanup_email_addrs(addresses: List[Tuple[str, str]], excludes: Set[str],
                         gitdir: Optional[str]) -> List[Tuple[str, str]]:
     global MAILMAP_INFO
+
+    config = get_main_config()
+
+    # Translate aliases first
+    if get_git_bool(str(config.get('send-translate-aliases', 'no'))):
+        for entry in list(addresses):
+            logger.debug('entry: %s', entry)
+            args = ['send-email', '--translate-aliases']
+            ecode, out = git_run_command(gitdir, args, stdin=entry[1].encode('utf-8'))
+            logger.debug('translate-aliases-out: %s', out.strip())
+            if ecode == 0:
+                se_data: List[Tuple[str, str]] = email.utils.getaddresses([out.strip()])
+                if len(se_data) == 1 and entry[1] != se_data[0][1]:
+                    replacement = se_data[0]
+                    logger.debug('Replaced email alias %s with translated address %s', entry[1], se_data[0][1])
+                    addresses.remove(entry)
+                    addresses.append(replacement)
+
     for entry in list(addresses):
         # Only qualified addresses, please
         if not len(entry[1].strip()) or '@' not in entry[1]:

---
base-commit: a9b2aba54be85ea2933c43b8a6d71c1611230b59
change-id: 20250627-jk-email-alias-support-d66b261cb5d9

Best regards,
--  
Jacob Keller <jacob.e.keller@intel.com>


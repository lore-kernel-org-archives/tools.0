Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221A26F471
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041170; cv=none; b=tbELz5LYwb/MJsS/2K9czqLyx4TMAJLEisS3k6/0lDe2l/Axh92StaWv5Y0jUlytoKvWGBbFImesONENapWwkRi/HeEqTaVhbUNAJjoETm9G914y1ZOm90NwxZpQzBEJPxv8mBcT9iZl1qYnjKsm83qna4fu0Y3g8oINH5dCXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041170; c=relaxed/simple;
	bh=VIxmr5UmQDO2dRGeDg4BVk/1yc58QyLKaFTt9wfSU1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y6kKUe7aL5FIFhT0aKZ3nauo+taoE7SF3fYqud1D7i6HxRDp+P6yDQT+r1DXbKFaIeZ9b98fQBGnMsXGGF/vpNXr3rhlRs6WYZoowz26xkXOXBAIP6e89zMTfUYgoiyPOURDeE4n70VEQZFND9M0VtynOfPSalHDhEHn9FmGiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDUg5s4w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDUg5s4w"
Received: by smtp.kernel.org (Postfix)
	id 2C549C116C6; Thu,  9 Oct 2025 20:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB485C4CEF8
	for <tools@kernel.org>; Thu,  9 Oct 2025 20:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB485C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760041167; x=1791577167;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=VIxmr5UmQDO2dRGeDg4BVk/1yc58QyLKaFTt9wfSU1Q=;
  b=mDUg5s4wSYEZhql4I/ZIPrqIJfmNh71Udhp/qA+2CzJq6I6U2U9NlWZK
   nefq6NWYeQ3tFGzIrRJhin1YSVu7ulu9VuZfdBFZZFy8lUjCl02Xr70Wg
   5E7zHKD4rethJFjgAGTEVZgFlo5JJGCTcaNG9PRDJMlhBsLMI+BIGNKTl
   C4oJqqNmsd8zSMg7hs0uih0IRO69MF8rCvX65CVu61pl18yrAnyBngfo+
   aWCrMYfdGAhfxLlLjLyimame+y4Mxx2ZGUltDdHT2ngWICIHQ09O9tWP2
   MwhLcXQX/zND01cu8PRqbr+sLN1k9XrQGsxk1RCX4/4k5VrxDHlnPRh5U
   w==;
X-CSE-ConnectionGUID: vx6N8OVmRzuKqZu3Qb/qeA==
X-CSE-MsgGUID: yz6WTo5bS2yPK40xRJjLCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72942877"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="72942877"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:19:27 -0700
X-CSE-ConnectionGUID: znbNwyLeSY2SNNBf2BKZcg==
X-CSE-MsgGUID: 0KmziOESQWmnD0V36W7UNw==
X-ExtLoop1: 1
Received: from sdubal-mobl1.amr.corp.intel.com (HELO orcnseosdtnuc.amr.corp.intel.com) ([10.166.241.11])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:19:27 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Thu, 09 Oct 2025 13:19:13 -0700
Subject: [PATCH v4] b4: support send-email aliases
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-jk-email-alias-support-v4-1-16f458de996e@intel.com>
X-B4-Tracking: v=1; b=H4sIAMAY6GgC/4XNSw6CMBCA4auQrq1pC5TUlfcwLvoYZRSBtEg0h
 LvbslBjoi7/ycw3EwngEQLZZBPxMGLAro1RrDJia90egaKLTQQTJZOioqczhYvGhuoGdaDh2ve
 dH6iT0gjJrSmdIvG493DA2wLv9rFrDEPn78ufkafpX3LklFNTKa3jknUV32I7QLO23YUkchQvp
 mLqKyMSw/JcKVYqWcAnkz8Zzn4weWIUA1MYZYWw78w8zw+16zJISgEAAA==
X-Change-ID: 20250627-jk-email-alias-support-d66b261cb5d9
To: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.15-dev-b874e
X-Developer-Signature: v=1; a=openpgp-sha256; l=6282;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=VIxmr5UmQDO2dRGeDg4BVk/1yc58QyLKaFTt9wfSU1Q=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhowXEqcKXRn758R+X1pUnSOQYcppKXh945myIIf59U/49
 Tf75+d0lLIwiHExyIopsig4hKy8bjwhTOuNsxzMHFYmkCEMXJwCMBHXYEaGo5Ur8zYfWzSleUNd
 jMtc3l0XLt18eHwna2nukquHG5qV2Bn+WXwTeyvmuJEtuS13opExq4rYj62+k/atXjnFhlHs06e
 lLAA=
X-Developer-Key: i=jacob.e.keller@intel.com; a=openpgp;
 fpr=204054A9D73390562AEC431E6A965D3E6F0F28E8

git send-email has supported the --translate-aliases option since v2.47, as
commit c038a6f1d748 ("send-email: teach git send-email option to translate
aliases", 2024-08-17)

The --translate-aliases option allows asking git send-email to convert an
alias into its real address according to an alias file in varying formats.
This enables using the same aliasing behavior as git, without needing to
implement separate parsing logic within b4.

To avoid breaking any users running older versions of git, the translation
is enabled only if the git version is new enough to contain the
translate-aliases option. The support was added by git commit c038a6f1d748
("send-email: teach git send-email option to translate aliases"). A quick
git describe shows this was released in git v2.47.

Make use of this functionality in cleanup_email_addrs(). To minimize
overhead, introduce an ALIAS_INFO dictionary. This is similar to the
MAILMAP_INFO but for aliases. Find the set of unqualified addresses which
are not yet in the ALIAS_INFO dictionary. Feed these into the git
send-email sub process. For each result, check if its a proper translation.
If so, insert it into the ALIAS_INFO. Otherwise, insert a blank entry into
ALIAS_INFO indicating we don't need to attempt translating it again.

Note that we don't simply re-use MAILMAP_INFO, as this would prevent
addresses from being passed to git check-mailmap.

This implementation minimizes overhead by only requiring a single git
send-email process, and by only translating each address once.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
Git added support for exposing email address translation via git send-email
--translate-aliases in version 2.47. Add support to b4 to enable this
functionality.

Addresses are translated automatically if the git version is detected as
v2.47 or later. This is simple and avoids burdening uses with needing to
configure both git and b4.

This version minimizes overhead compared to previous versions by only using
a single git subprocess, and by only translating addresses once. An
ALIAS_INFO dictionary cache is used to avoid duplicate work.

I am also considering if we can find a clean way to handle mailmap in a
similar way to how I handled aliases, using only a single process for git
check-mailmap instead of one per address. That might require some other
considerations though.
---
Changes in v4:
- Use ALIAS_INFO instead of inline replacing, to cache replacements over
  multiple patches.
- Use a dictionary for unqual_addrs to handle duplicates while preserving
  order.
- Link to v3: https://patch.msgid.link/20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com

Changes in v3:
- Drop b4.send-translate-aliases config option
- Check git version before enabling
- Rewrite conversion algorithm to use a single git subprocess
- Only translate non-qualified addresses
- Link to v2: https://patch.msgid.link/20250709-jk-email-alias-support-v2-1-b0339905964e@intel.com

Changes in v2:
- Add b4.send-translate-aliases config option
- Link to v1: https://patch.msgid.link/20250627-jk-email-alias-support-v1-1-b79aa627cd71@intel.com
---
 src/b4/__init__.py | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 20bce70ce41d..e3f59bfd4e65 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -166,6 +166,8 @@ SENDEMAIL_CONFIG: ConfigDictT = dict()
 REQSESSION: Optional[requests.Session] = None
 # Indicates that we've cleaned cache already
 _CACHE_CLEANED = False
+# Used to track send-email alias replacements
+ALIAS_INFO: Dict[str, Optional[Tuple[str, str]]] = dict()
 # Used to track mailmap replacements
 MAILMAP_INFO: Dict[str, Optional[Tuple[str, str]]] = dict()
 
@@ -4262,9 +4264,53 @@ def get_excluded_addrs() -> Set[str]:
     return excludes
 
 
+def replace_aliases(entry: Tuple[str, str]) -> Tuple[str, str]:
+    global ALIAS_INFO
+
+    if entry[1] in ALIAS_INFO:
+        replacement = ALIAS_INFO[entry[1]]
+        if replacement is not None:
+            return replacement
+
+    return entry
+
 def cleanup_email_addrs(addresses: List[Tuple[str, str]], excludes: Set[str],
                         gitdir: Optional[str]) -> List[Tuple[str, str]]:
+    global ALIAS_INFO
     global MAILMAP_INFO
+
+    # Translate aliases if support is available
+    if git_check_minimal_version("2.47"):
+        logger.debug('translating aliases via git send-email')
+
+        unqual_addrs: Dict[str, None] = {}
+
+        # Assume aliases won't have '@' and are always unqualified
+        unqual_addrs = dict.fromkeys(e[1] for e in addresses if e[1] not in ALIAS_INFO and '@' not in e[1])
+
+        if unqual_addrs:
+            data = '\n'.join(unqual_addrs.keys()).encode('utf-8')
+            args = ['send-email', '--translate-aliases']
+            ecode, out = git_run_command(gitdir,
+                                        ['send-email', '--translate-aliases'],
+                                        stdin=data)
+            if ecode == 0:
+                translated_addrs = email.utils.getaddresses(out.strip().splitlines())
+
+                for alias, entry in zip(unqual_addrs.keys(), translated_addrs):
+                    if alias != entry[1]:
+                        logger.debug('Translated alias %s to qualified address %s',
+                                    alias, entry[1])
+                        ALIAS_INFO[alias] = entry
+                    else:
+                        logger.debug('"%s" is not a known alias', alias)
+                        ALIAS_INFO[alias] = None
+            else:
+                logger.debug('git send-email --translate-aliases failed with exit code %s',
+                             ecode)
+
+    addresses = list(map(replace_aliases, addresses))
+
     for entry in list(addresses):
         # Only qualified addresses, please
         if not len(entry[1].strip()) or '@' not in entry[1]:

---
base-commit: b87af2e0dc6228c52ebd1c9df7b4c13aa4093f05
change-id: 20250627-jk-email-alias-support-d66b261cb5d9

Best regards,
--  
Jacob Keller <jacob.e.keller@intel.com>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B114A0B5
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 23:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760050931; cv=none; b=hCbqeGk6YkEr8ulK4Vu10Td0JKAUMsRzfWD45GylIwgv481aLkBLyTzvLPhO/uxREBtuhH5/a0OiYRapF4G2gkNJ/ADSv/zvv+uDBCjazHgPqC7u80mChksoY8fQ3qAPrCIL1fsbGoSEEfRDvVviGd1bjOtBWU7iJWRi/l7Sqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760050931; c=relaxed/simple;
	bh=6wlrIhV4xUjEL8j0/MnPpjBIhwOdOF1drC2SB2isl1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nad+JiJ1bLFrTOQTtAKJTt/cFd8UipG3IOnP9tS06uRH4zTEBLsL1joO26iIROA2HhNiztqnj9V82KCiA7a0XIbsQmk34Vj1kfxnU2vozoRjz5129WEHvvS75TATDs4TptHHA1KrjvhUtii0c9y3HLStez5ie9mpZh7zpXpEeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0NUschQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0NUschQ"
Received: by smtp.kernel.org (Postfix)
	id E6BF3C4CEF8; Thu,  9 Oct 2025 23:02:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABF33C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 23:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABF33C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760050930; x=1791586930;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=6wlrIhV4xUjEL8j0/MnPpjBIhwOdOF1drC2SB2isl1o=;
  b=J0NUschQjRo5BUtVIxRdkKIPPJ1t99dR1Oh3g/CURRRlRHwPC6LoNaX4
   JfcBuA0FS/rKpH9glnlKbLrATg2hfWF+n+cYxL5rwA7kjlBl2hD94mUGu
   sGPtY0L4x5YrA/YwPtJxI9BrsTJpWbWSY4Vnd7d1iojzstw1T7rLWD0H+
   ETPSjcKdj7v4DUHBcBQo8GMSwn0aEC1/hC7+LiM0ZBc3RdzNc9cTNTOso
   b8SwPsi+gIFjKWX+OC8lwBNXlo5XmlgEeahg7qUxXnQ7Y9F7WI9lovx07
   3npf1/LXL5c7JxevVe+I4dofaB9ddLzBzgb87Aw+rt3rbVk/fXS7ui0e0
   A==;
X-CSE-ConnectionGUID: L6+dylqTT/KSCIVeDPjzXQ==
X-CSE-MsgGUID: TMIAOO3wRt6OzJnq0XFu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73616574"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73616574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 16:02:08 -0700
X-CSE-ConnectionGUID: S9dyub/+Qnq4P7YL/t1Nlg==
X-CSE-MsgGUID: XlwrJigrSHqio6TCgP4FKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="185087067"
Received: from sdubal-mobl1.amr.corp.intel.com (HELO orcnseosdtnuc.amr.corp.intel.com) ([10.166.241.11])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 16:02:08 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Thu, 09 Oct 2025 16:01:54 -0700
Subject: [PATCH v5] b4: support send-email aliases
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-jk-email-alias-support-v5-1-f37072c22034@intel.com>
X-B4-Tracking: v=1; b=H4sIAOE+6GgC/43OTW7CMBAF4KsgrzGyHdvpsOIeiIV/BpgSksgOU
 SuUu+OwaFWkAss3mvfNXFnGRJjZenFlCUfK1LUlmOWChaNrD8gplsyUUEZYVfPPE8ezo4a7hlz
 m+dL3XRp4tNYrK4M3EVgp9wn39HWHt7uSj5SHLn3f74xynr4kR8kl9zU4V5ZCrOWG2gGbVejOb
 CZH9cvUAv5l1MyIqgIQBqzGR6b6YaR4wlQzAwK99hCUCo+Mfo/RhZF2r81HRAD755tpmm6j/hZ
 BkQEAAA==
X-Change-ID: 20250627-jk-email-alias-support-d66b261cb5d9
To: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.15-dev-347d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6420;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=6wlrIhV4xUjEL8j0/MnPpjBIhwOdOF1drC2SB2isl1o=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhowXdq+XWVr5V1yeKHDE58jBp7IX37p6r5NVDHj9MGOC+
 hVO3re2HaUsDGJcDLJiiiwKDiErrxtPCNN64ywHM4eVCWQIAxenAEzEp5nhf7l+woUGtZgEDRXp
 JQxGp4UZj9rHteVfDJH18OWZ9Ln5JcNfeZnfX7d93Mf9W1nsrUhp2lHez4c2vs6rPcrAX2r0QS6
 dCwA=
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
---
Changes in v5:
- Use a set and list() instead of a dictionary.
- Make replace_aliases a definition within cleanup_email_addrs instead of a
  global function.
- Only map addresses if we actually tried to translate aliases.
- Link to v4: https://patch.msgid.link/20251009-jk-email-alias-support-v4-1-16f458de996e@intel.com

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
 src/b4/__init__.py | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 20bce70ce41d..ffa7a5d5c7d9 100644
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
 
@@ -4264,7 +4266,52 @@ def get_excluded_addrs() -> Set[str]:
 
 def cleanup_email_addrs(addresses: List[Tuple[str, str]], excludes: Set[str],
                         gitdir: Optional[str]) -> List[Tuple[str, str]]:
+    global ALIAS_INFO
     global MAILMAP_INFO
+
+    # Translate aliases if support is available
+    if git_check_minimal_version("2.47"):
+        logger.debug('Translating aliases via git send-email')
+
+        unqual_addrs: Set[str] = set()
+
+        # Assume aliases won't have '@' and are always unqualified
+        for entry in addresses:
+            if entry[1] not in ALIAS_INFO and '@' not in entry[1]:
+                unqual_addrs.add(entry[1])
+
+        if unqual_addrs:
+            tocheck = list(unqual_addrs)
+            data = '\n'.join(tocheck).encode('utf-8')
+            args = ['send-email', '--translate-aliases']
+            ecode, out = git_run_command(gitdir,
+                                        ['send-email', '--translate-aliases'],
+                                        stdin=data)
+            if ecode == 0:
+                translated_addrs = email.utils.getaddresses(out.strip().splitlines())
+
+                for alias, entry in zip(tocheck, translated_addrs):
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
+        def _replace_aliases(entry: Tuple[str, str]) -> Tuple[str, str]:
+            if entry[1] in ALIAS_INFO:
+                replacement = ALIAS_INFO[entry[1]]
+                if replacement is not None:
+                    return replacement
+
+            return entry
+
+        addresses = list(map(_replace_aliases, addresses))
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


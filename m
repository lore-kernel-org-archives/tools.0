Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB2670830
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029285; cv=none; b=eB3lG7A83UC39ei1NKmkSOv2OryK4eMaBKn4OT2o901DBzF3yk5lmae284XyUFJX6E/ZUQHepCQAkEy+r2N6AgGSe1mvbHC4gZ9nKwDFQu/xbwWb1gV/JJPeHkayPW3xreHoPswi/AMjqDJwSTyu/b247XcfbcqwjeLnD3UNfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029285; c=relaxed/simple;
	bh=ll4NEkwNQ3B8IEfSO8c10ua0gbVzDLcqIGHFCHbAsBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iUH8VJCvrb3US6nAwIGwZsoIMNMz3GmwBrwtEE1p3GV2sfMa+VrcIkT/lVJ8vqm6YA4vtBAybljXIjJMK1FDQEwsFQHAZMLYQ5uWFDRvZB5OvIks7uMaZjtQUxrqtw6mExfG0vNeneyplel17Qa69glB1oL3oppLF17UE8RuOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CptdH1mw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CptdH1mw"
Received: by smtp.kernel.org (Postfix)
	id 508EEC4CEF7; Thu,  9 Oct 2025 17:01:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9195C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 17:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9195C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760029284; x=1791565284;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=ll4NEkwNQ3B8IEfSO8c10ua0gbVzDLcqIGHFCHbAsBg=;
  b=CptdH1mwx3Jvf9TNeuiqDg/gzjjoxXRuR9MBYa2xf8lLGTcU7802ulMX
   VHSlHpgq03zxxUK5wcOE0XYGq1efAZtAGbgb4KTia7itPM6DQiglcZ6t2
   d9JxXymiHMFkTobr99SJ2iOq/RPJ235+KKgPcWSESlyQPIz5zFLFbdx+v
   kc3L5H6tSUjxPGKynN8PFdu6F6ISLgum2Ql4ghwc3CSE5CfMIOMMCihQ2
   2OozNZw7a1N5/xP9epLIVT7iUqJbEo5nsE35iD5ZJBSLSUq8xcjrQg03n
   VDLkHkbe4ua80qUZ3/y9JBH/Mk12Ad5PaHNNSFOFa2TchfNzhF/34q1uU
   Q==;
X-CSE-ConnectionGUID: mlirxWFSQJOhI0XliFTP8Q==
X-CSE-MsgGUID: Czh0j9FAS4u9ND4iuWpu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66101875"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="66101875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 10:01:23 -0700
X-CSE-ConnectionGUID: Q+cOG4kmSb+s7fh6WZomtw==
X-CSE-MsgGUID: HQiBVXw5QwuxAn+gPJHlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="181189905"
Received: from sdubal-mobl1.amr.corp.intel.com (HELO orcnseosdtnuc.amr.corp.intel.com) ([10.166.241.11])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 10:01:23 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Thu, 09 Oct 2025 10:01:09 -0700
Subject: [PATCH v3] b4: support send-email aliases
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
X-B4-Tracking: v=1; b=H4sIAFTq52gC/4XNwQ7CIAyA4VdZOFsDzEHw5HsYD2xUV51jgUk0y
 95dtotejMe/ab9OLGIgjGxfTCxgoki+z1FuCta0tr8gkMvNJJcVV1LD9QZ4t9SB7chGiI9h8GE
 Ep1QtlWjqyhmWj4eAZ3qu8PGUu6U4+vBa/ySxTP+SSYCAWhtr81LjtDhQP2K3bfydLWSSH0Zz8
 5ORC8PL0hheGbXDb2ae5zdkaEg3AwEAAA==
X-Change-ID: 20250627-jk-email-alias-support-d66b261cb5d9
To: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.15-dev-40ed6
X-Developer-Signature: v=1; a=openpgp-sha256; l=5608;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=ll4NEkwNQ3B8IEfSO8c10ua0gbVzDLcqIGHFCHbAsBg=;
 b=kA0DAAoWapZdPm8PKOgByyZiAGjn6l6gkRn+Lz22o0+oie9JQZ3P8QxF6I6ozj+XBwY7G6mKi
 Ih1BAAWCgAdFiEEIEBUqdczkFYq7EMeapZdPm8PKOgFAmjn6l4ACgkQapZdPm8PKOgy3wEAyHjq
 vMTVqdDNWc1cHFej99Cb2FnX2/r69y1ALiD9hikA/30nza9f3DJ62ZIb6pquK4B6irpAxQaz93c
 WDBV7YkwN
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
overhead, we first split the addresses into qualified and unqualified
addresses by the presence of the '@' symbol. Aliases won't be proper email
addresses.

The --translate-aliases mode of git send-email takes each alias on a
separate line and translates it in the output. Conveniently, if an input
can't be translated, it is returned unchanged.

Pass the unqualified addresses in as a string joined by newlines. Split the
standard output into translated addresses using email.utils.getaddresses().
Log what we translate each alias into, then recreate the new list of
addresses by combining the original set of qualified addresses with the
newly translated addresses.

This implementation minimizes overhead by only requiring a single git
send-email process, and by only translating addresses which are not yet
fully qualified.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
Git added support for exposing email address translation via git send-email
--translate-aliases in version 2.47. Add support to b4 to enable this
functionality.

Addresses are translated automatically if the git version is detected as
v2.47 or later. This is simple and avoids burdening uses with needing to
configure both git and b4.

This version minimizes overhead compared to previous versions by only using
a single git subprocess, and by only translating addresses once. Addresses
are split based on whether they are "qualified" with an '@' already or not.
It is assumed that no alias will contain the '@' character. This way, after
translating once, the address won't be passed in to git send-email again.
Further, non-qualified addresses are discarded by cleanup_email_addrs after
a translation attempt.

In my limited testing, this version has significantly less overhead than
the previous version, and additionally requires no configuration. Since we
check the git version, and since we don't attempt to translate any
qualified addresses, it should not break any existing users.
---
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
 src/b4/__init__.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 20bce70ce41d..e8d614978090 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4265,6 +4265,38 @@ def get_excluded_addrs() -> Set[str]:
 def cleanup_email_addrs(addresses: List[Tuple[str, str]], excludes: Set[str],
                         gitdir: Optional[str]) -> List[Tuple[str, str]]:
     global MAILMAP_INFO
+
+    # Translate aliases if support is available
+    if git_check_minimal_version("2.47"):
+        logger.debug('translating aliases via git send-email')
+
+        qual_addrs = []
+        unqual_addrs = []
+
+        # Assume aliases won't have '@' and are always unqualified
+        for e in list(addresses):
+            qual_addrs.append(e) if '@' in e[1] else unqual_addrs.append(e[1])
+
+        # Pass unqualified addresses to git send-email
+        if len(unqual_addrs) > 0:
+            data = '\n'.join(unqual_addrs).encode('utf-8')
+            args = ['send-email', '--translate-aliases']
+            ecode, out = git_run_command(gitdir,
+                                        ['send-email', '--translate-aliases'],
+                                        stdin=data)
+            if ecode == 0:
+                translated_addrs = email.utils.getaddresses(out.strip().splitlines())
+
+                for alias, entry in zip(unqual_addrs, translated_addrs):
+                    if alias != entry[1]:
+                        logger.debug('translated alias %s to qualified address "%s"',
+                                    alias, email.utils.formataddr(entry))
+
+                addresses = qual_addrs + translated_addrs
+            else:
+                logger.debug('git send-email --translate-aliases failed with exit code %s',
+                             ecode)
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


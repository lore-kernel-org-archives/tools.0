Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991941E0B91
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048400; cv=none; b=VA4FwaWxPs0UKm5z1/mHYu6vttnwMkEMzogMMyEWkKECWT3NwaQ9mwj1zOrR4ay0R9cAYD2fO/o+gcxqxbYf9c3GtylrVYARlE1pPU2jCy8LYvvsUB4MA/VGZxdmBhmw6t+gp05CIdOl8OgLQvDwxwJ7THmhYpFW9tEcJPGSbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048400; c=relaxed/simple;
	bh=VRidjT4UGgLOFfxMmBKgXzwycXJOId3rCop5JU+4770=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FW8rY8YhfquQxBZljHpueZTCOyb4MbKW8eXfFGdhr2uom0UZU/l3LPkHagK8LxoOAR2EZy9T9vUl0vx+zNJrVaaUZygSmhgbsUOes10U9f2F06z99JW2Ir3ZmmYrMcTjdW9VVNS61ha3L7Y0H6gWPbBsggAKooRdrr3sDYjQbsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gskOI32u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gskOI32u"
Received: by smtp.kernel.org (Postfix)
	id 4431AC4CEED; Fri, 27 Jun 2025 18:20:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 387A0C4CEE3
	for <tools@kernel.org>; Fri, 27 Jun 2025 18:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 387A0C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751048399; x=1782584399;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=VRidjT4UGgLOFfxMmBKgXzwycXJOId3rCop5JU+4770=;
  b=gskOI32uCAgkaBYiuu4+GegjRlSJlyP2vgtgbqoJgrzC+0nM/Upiuu8b
   pS1ebdqfUiywaBnaxb2HUz/YKODmlZPVvLyij1mtqhKzlldpfANe4UUgr
   s+R3o06NEh3BSW6p6h2nT/quSPda69KGNb2S6F+Q8mbCPJ9oirogmkaZ9
   mjTj4BL8iqeZ+DMm+mSC6SpqqtlydNxS4K3WUswSLoW4cPWs9+v9X4ane
   e+pAqScCsO8FyIe54ADC0ItUSUDsPmY0pjwq60N73HvefSYYuXS7Cqh1p
   Vsu+6/EpEdLePh2szEYgywg6YF7ncOCEH/xpEo7h1vae5jekAGYzro1kB
   A==;
X-CSE-ConnectionGUID: Rkqn38XhRAujkUB+Lx5Eew==
X-CSE-MsgGUID: Y5SC8zxzTdq1Ff5U0GZqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64811674"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="64811674"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:18:13 -0700
X-CSE-ConnectionGUID: SCQPf+SBS5SYRtpbxwoBWA==
X-CSE-MsgGUID: lhwMp6mLSsOfPE43qmOPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153358685"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:18:13 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Fri, 27 Jun 2025 11:17:56 -0700
Subject: [PATCH RFC] b4: support send-email aliases
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-jk-email-alias-support-v1-1-b79aa627cd71@intel.com>
X-B4-Tracking: v=1; b=H4sIAFTgXmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNz3axs3dTcxMwc3cSczMRi3eLSgoL8ohLdFDOzJCMzw+Qk0xRLJaD
 mgqLUtMwKsMHRSkFuzkqxtbUAtRHhL20AAAA=
X-Change-ID: 20250627-jk-email-alias-support-d66b261cb5d9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2925;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=VRidjT4UGgLOFfxMmBKgXzwycXJOId3rCop5JU+4770=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhoy4Bwn7651y3c/97v9XXhIXsqW7Y+ZEj7zCwxMreVWbv
 ffazFDsKGVhEONikBVTZFFwCFl53XhCmNYbZzmYOaxMIEMYuDgFYCKH9zEy/Ijb1/xkctQf45rO
 ujBNBcV33oyL5yyMypQJzfDJX/HgLCPDs95Uf5cAibfq+de33f75krW2u/Ok6rEjoal+X2X+SMs
 yAQA=
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

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
I'm sending this as an RFC because it likely still needs additional work.
For one thing, this depends on the --translate-aliases option which has
been available for some time but not forever. We could add a config option
to enable this only as an opt-in maybe?
---
 src/b4/__init__.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 80858d41df7e08e47e28d6bdd116024fd0c3f2e7..d2e0e92fd0aa2fc4a3ef42516607bdc375a945e4 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4240,6 +4240,21 @@ def get_excluded_addrs() -> Set[str]:
 def cleanup_email_addrs(addresses: List[Tuple[str, str]], excludes: Set[str],
                         gitdir: Optional[str]) -> List[Tuple[str, str]]:
     global MAILMAP_INFO
+
+    # Translate aliases first
+    for entry in list(addresses):
+        logger.debug('entry: %s', entry)
+        args = ['send-email', '--translate-aliases']
+        ecode, out = git_run_command(gitdir, args, stdin=entry[1].encode('utf-8'))
+        logger.debug('translate-aliases-out: %s', out.strip())
+        if ecode == 0:
+            se_data: List[Tuple[str, str]] = email.utils.getaddresses([out.strip()])
+            if len(se_data) == 1 and entry[1] != se_data[0][1]:
+                replacement = se_data[0]
+                logger.debug('Replaced email alias %s with translated address %s', entry[1], se_data[0][1])
+                addresses.remove(entry)
+                addresses.append(replacement)
+
     for entry in list(addresses):
         # Only qualified addresses, please
         if not len(entry[1].strip()) or '@' not in entry[1]:

---
base-commit: 07fe9d1ae9d43a48587c103e2c1db8ca35b84bcb
change-id: 20250627-jk-email-alias-support-d66b261cb5d9

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>


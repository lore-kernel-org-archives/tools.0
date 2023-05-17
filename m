Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AA2111AD
	for <tools@linux.kernel.org>; Wed, 17 May 2023 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684349828; x=1715885828;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=6CL4Ha0agnpJHVdNHmQeD6/BGvkZ0nYQoaxorhSTYU0=;
  b=lrshBkLdXOUubuzXktFpz97Ntvz3H2/gTvWqRnceqyko6M4hFrpCFEC+
   1RuOT7Wer77480OWl4USJDYhZ7vRHU8WY+LyGvuwt04tWj8Misw7Rpsin
   Z2xZCNsr6/yqa+LQijc0+ADjteBFwhwZ1R1oMDj/tDHq6EVKrHwb8Ui5K
   Lum2vk+kF2imDeKWPhxIMAGbMfHsjQ8qMceOLj2W6J9oPNX5MNG6gQgVy
   Fxwk6zkeXjQCCsT2oA21iFVNiUq9cZpkPx/iNM9v8NvmpZ7oNvxN1zHDk
   nUVetxJ6rs7YSkaF2dEEEDlLuG2dQiPYoivDoqEADwDg9ckP3oOr5rBT/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="341242254"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="341242254"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 11:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="948375931"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="948375931"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost) ([10.209.143.168])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 11:57:07 -0700
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 17 May 2023 11:56:38 -0700
Subject: [PATCH b4] b4: Allow prep new branch while on a b4 managed branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-allow-new-w-fork-point-v1-1-22d2cb938e16@intel.com>
X-B4-Tracking: v=1; b=H4sIAGUjZWQC/x2NQQqDMBAAvyJ77kK0Ji39SukhiZu61CaykaYg/
 t3ocRiGWSGTMGV4NCsI/ThzihXaSwN+tPFNyENl6FR3Vbq9oZ2mVDBSwYIhyQfnxHHBYPpBG6+
 9uhuosbOZ0ImNfjzyr80LySFmocD/8/gE18Nr23bVC+2phQAAAA==
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Ira Weiny <ira.weiny@intel.com>
X-Mailer: b4 0.13-dev-bb1f4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684349811; l=2037;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=6CL4Ha0agnpJHVdNHmQeD6/BGvkZ0nYQoaxorhSTYU0=;
 b=/wsTvLHlj7STOFtM+O9TOfQwS0xWgLGdB4cX93k9xFU8TlwUdyBIo3yWlP4rGNwkMEOV+R2px
 2KSwB6vhB8oBG3sbC9U/u+NNMo6nRFHuy4Jle5TdzTjmKUf3LAyL6tc
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=

Creating a new branch from a specified fork point should be allowed when
sitting on a b4 managed branch.  For example this fails:

	$ b4 prep -n foo -f master
	Created new branch b4/foo
	Created the default cover letter, you can edit with --edit-cover.

	$ b4 prep -n bar -f master
	CRITICAL: This appears to already be a b4-prep managed branch.

Allow a specified fork point to be used regardless of the b4 state of
the current branch.

Make -n and -e options mutually exclusive early on to clarify the
difference between them in practical usage.

With this change the following works as expected.

	$ git co b4/allow-new-w-fork-point
	Switched to branch 'b4/allow-new-w-fork-point'

	$ b4 prep -n bar -f master
	Created new branch b4/bar
	Created the default cover letter, you can edit with --edit-cover.

	$ b4 prep -n foobar -e master -f master
	CRITICAL: -n NEW_SERIES_NAME and -e [ENROLL_BASE] can not be used together.

Cc: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 b4/ez.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index 47fafc1325f0..d0c06679c143 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -2186,8 +2186,12 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.compare_to:
         return compare(cmdargs.compare_to)
 
+    if cmdargs.enroll_base and cmdargs.new_series_name:
+        logger.critical('CRITICAL: -n NEW_SERIES_NAME and -e [ENROLL_BASE] can not be used together.')
+        sys.exit(1)
+
     if cmdargs.enroll_base or cmdargs.new_series_name:
-        if is_prep_branch():
+        if is_prep_branch() and not cmdargs.fork_point:
             logger.critical('CRITICAL: This appears to already be a b4-prep managed branch.')
             sys.exit(1)
 

---
base-commit: bfdf5b3b0835c8c351abbcd9b3b5268acf6545fa
change-id: 20230517-allow-new-w-fork-point-f64d56c5c086

Best regards,
-- 
Ira Weiny <ira.weiny@intel.com>


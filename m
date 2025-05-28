Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B920E011
	for <tools@linux.kernel.org>; Wed, 28 May 2025 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446342; cv=none; b=pXZxaISqzu62bKj4k+mpvjrBZvwq/x8fpEM/EsWt45zkXlBiAv5H9JTdBm2ykPEWYm9P+/695BmpGfGzcLKOueujGqn/Rom4N7UoIDUOAX6hO/6so2YM+Q1QfhL3Bu6tQXa+TJ7Qtb/4oMElYRzIYGcbtJ/1dR0aVtbcfT5CwMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446342; c=relaxed/simple;
	bh=USVXBIAOQ4ABf0+R4IFygk9HaV1dsdhtpHQxl6XuuSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hmg7iMzGAlfQeegw42abIXgsdfqzEpAuU1slKFxFNWnKBW5c5BQBQRYbMRw4BrKzRR/dZeMKob7Tx6eTC+Jo1uTA1Jb2nvTylBQL7mCk5U4CBWElkVlDSITRDQ521XSa6U2Z7XzpCn/FSKPXZQ73iW05Wzu/Wgk4WgRe8msJYz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F492wCg7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F492wCg7"
Received: by smtp.kernel.org (Postfix)
	id 0136EC4CEF6; Wed, 28 May 2025 15:32:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDD1FC4CEEE
	for <tools@kernel.org>; Wed, 28 May 2025 15:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDD1FC4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748446341; x=1779982341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=USVXBIAOQ4ABf0+R4IFygk9HaV1dsdhtpHQxl6XuuSg=;
  b=F492wCg7zNVjc0eQikteWbJRbfJFu3z51NTi0VGA/0lhJr+7cVXo+DFf
   D3+d6uQqBE3OZLlcO0mYZG8M/2ikEO+ha4kQVTMyfz4UKA8sdqi3zCUBv
   ow+IPetKkhddislB+xdXatImwO87vVlLP2lmrPeGegBeoA0Ol0FKJ/5e1
   /W5HAk4JtA2dEl0rkc5sAyd5KO9XPZ1QPqaTu81EJcwPOZUo4eEXFCoI6
   Nj+bki4QX8cSwNSXRtotr06bVEQHYUwSNgkrwi+grGfhzicMcuCt0Zd30
   OX2txKk6/xYsTpGNHaeS/r6NcrgA3nI+YfH7YBbdH/MIxjdPWOyOSvGBS
   g==;
X-CSE-ConnectionGUID: /O9YdXZSS/SE7sX8PEuKbw==
X-CSE-MsgGUID: OSZRlG3PTum/XN2w9AsoRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50405016"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50405016"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:32:11 -0700
X-CSE-ConnectionGUID: EEti9deJRjeBEIacFxzoOQ==
X-CSE-MsgGUID: cLwKVsEjQZWclFMznknCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148570733"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:32:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: tools@kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4 1/2] ez: Allow to override dir before sending
Date: Wed, 28 May 2025 08:31:07 -0700
Message-ID: <20250528-override-output-v1-1-8e348ba28081@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-override-output-v1-0-8e348ba28081@intel.com>
References: <20250528-override-output-v1-0-8e348ba28081@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
Content-Transfer-Encoding: 8bit

A common mistake that I make is to share the same temporary directory,
with the end result being that I send patches to the mailing list that
are either another version or part of another series.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 src/b4/command.py | 2 ++
 src/b4/ez.py      | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/src/b4/command.py b/src/b4/command.py
index 476fc13..3e6cd0a 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -369,6 +369,8 @@ def setup_parser() -> argparse.ArgumentParser:
                            help='Do not send, just dump out raw smtp messages to the stdout')
     sp_send_g.add_argument('-o', '--output-dir',
                            help='Do not send, write raw messages to this directory (forces --dry-run)')
+    sp_send_g.add_argument('-O', '--output-dir-override',
+                           help='Do not send, write raw messages to this directory (forces --dry-run and --output-dir), removing it first if it exists')
     sp_send_g.add_argument('--preview-to', nargs='+', metavar='ADDR',
                            help='Send everything for a pre-review to specified addresses instead of actual recipients')
     sp_send_g.add_argument('--reflect', action='store_true', default=False,
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 76f0044..0f75e7e 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -16,6 +16,7 @@ import time
 import datetime
 import json
 import shlex
+import shutil
 import email
 import email.policy
 import email.utils
@@ -1888,6 +1889,12 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         allto = list(allcc)
         allcc = list()
 
+    if cmdargs.output_dir_override:
+        if os.path.exists(cmdargs.output_dir_override):
+            logger.info(f'Removing pre-existent directory {cmdargs.output_dir_override}')
+            shutil.rmtree(cmdargs.output_dir_override)
+        cmdargs.output_dir = cmdargs.output_dir_override
+
     if cmdargs.output_dir:
         cmdargs.dryrun = True
         logger.info('Will write out messages into %s', cmdargs.output_dir)

-- 
2.49.0


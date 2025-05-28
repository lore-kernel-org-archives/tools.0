Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CD920E011
	for <tools@linux.kernel.org>; Wed, 28 May 2025 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446343; cv=none; b=dhAWW8+pl/UcpSkoA5KwbkLXxLEB9FeUtwg0j78mm/AAQMuHm1QQM/thMVn7m3niYIhYrCt5zkASgQpH3L+Gqm4tBnk7EovVdvEALkhiOZI0LngE/zvTJ9NHu5r32orG57R39LJcTGL3gY0IDpru9YhGUKdxBP5Sn4Y4u7hurnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446343; c=relaxed/simple;
	bh=O5fjme+zhU0oUf7Sgz0ubTkbvfwxQm8gO7N+ivFvUUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScZUSQ9uk6amVGpuN62LJmphmibOZfoRFWdE6j6qMudOOBjZbgH6VcgjfivIt99VNUH8hSNp2v296LhwmL8ZC17dJwjbvzZSedmxB9Hz5Kx8JJ0yUyrEacQII6dCjBGA1BoKdrDh0RkKIQAkIIZ9BDT29rwx4ZDfkHkWW9WHkfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuaxcwWe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuaxcwWe"
Received: by smtp.kernel.org (Postfix)
	id 6EE31C4CEF0; Wed, 28 May 2025 15:32:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BD23C4CEED
	for <tools@kernel.org>; Wed, 28 May 2025 15:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BD23C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748446341; x=1779982341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O5fjme+zhU0oUf7Sgz0ubTkbvfwxQm8gO7N+ivFvUUU=;
  b=JuaxcwWekVyFdX7vgWpDCyKJP+N+lk2+ptJ52UnuxhsvUdwoEybkzw5V
   kXPxBcZToud53pdab1cOs9uQe/sAa5LdzJ57lp46Uhef2cixox+dZkJLe
   RL+ibovNJCq1eW3uh1rJhn7jabx8GJTlQuVWpFNFoMyx/6Y4pyohlrRGG
   SzxdR0MFpJEjxc4r2VJLCpYAF95UlQQx7yaSMjtE4TKWaOcvxQw+0Q2nz
   0XvxXURmRHr4i7WmtthOd5UtRXHz9p/RE8bfDzTjZTxspUEX8btBC0L0f
   tqE1A4FmGmGKXpnD7HkHMLQ8SOOTODc1ZGO5xiFf2ydSY01rhgScEwX9S
   g==;
X-CSE-ConnectionGUID: eXnE79Q4QACgz1rkOONfDQ==
X-CSE-MsgGUID: Bj8PvVwXSkO7mtifVbA78Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50405018"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50405018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:32:11 -0700
X-CSE-ConnectionGUID: YzHYZrhnTmWh9O9Cc5aTCQ==
X-CSE-MsgGUID: Eo6tncsYQoy1k7UMpiBZkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148570734"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:32:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: tools@kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4 2/2] ez: Do not output to non-empty dir
Date: Wed, 28 May 2025 08:31:08 -0700
Message-ID: <20250528-override-output-v1-2-8e348ba28081@intel.com>
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

Recommend --output-dir-override if user is trying to output to non-empty
directory.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 src/b4/ez.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 0f75e7e..2ec075d 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1897,8 +1897,12 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     if cmdargs.output_dir:
         cmdargs.dryrun = True
+        d = pathlib.Path(cmdargs.output_dir)
+        d.mkdir(parents=True, exist_ok=True)
+        if any(d.iterdir()):
+            logger.critical(f'CRITICAL: directory {cmdargs.output_dir} is not empty. Consider using --output-dir-override to override content')
+            sys.exit(1)
         logger.info('Will write out messages into %s', cmdargs.output_dir)
-        pathlib.Path(cmdargs.output_dir).mkdir(parents=True, exist_ok=True)
 
     sconfig = b4.get_sendemail_config()
     endpoint = None

-- 
2.49.0


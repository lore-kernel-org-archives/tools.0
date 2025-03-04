Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B07F205ADE
	for <tools@linux.kernel.org>; Tue,  4 Mar 2025 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098107; cv=none; b=FBk5IPXjUXqRyE9UE1l4SeBu1HCwao3OL43xQUBQta2M7baq8579Gwpvcb218eJBA9RypyAn/tpCgGYmFaRMSaPbc5siudEKm36yUd4R8SoWBbnluT4cNwpo50p6PhGDLHyp9BUhgCzDrqxDYKebIxIalYF4frozKJhwocPwd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098107; c=relaxed/simple;
	bh=6iDMgBh6y8fovL34p5/i+DUMrcLDkj64cTyfQ59CROc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnsVNMI39huM0WSxwLENObn9KZFIXq9dfZWHQXwdhuvKutUfy5++I6Q8fhOHJbC3DCRjifrLtEVTAs3AiQO7k9GVkkQM326uuExQf8Dp1sYL+mAyNTVoRBz6+Tn38lq/R4FRCVojPFq/OQwzY9y4BNHXzB8XSOeYHtPgHAU9I0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxKarXcT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxKarXcT"
Received: by smtp.kernel.org (Postfix)
	id B0043C4CEE9; Tue,  4 Mar 2025 14:21:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96213C4CEE5
	for <tools@kernel.org>; Tue,  4 Mar 2025 14:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96213C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741098106; x=1772634106;
  h=date:from:to:subject:message-id:mime-version;
  bh=6iDMgBh6y8fovL34p5/i+DUMrcLDkj64cTyfQ59CROc=;
  b=AxKarXcTriQc0jFJPbji41n4PCwgPNPyeSL/mLjh95Xg8aY+BHLxqvnv
   VbbZ4Gu3CBy8SrItYvatJ6caP3Bou4yDCVVMcF5+l9Tjjmc1ZMPLWW90/
   FIHD7Dsm41DG+uQunCAS+lQ7ghK50N+xG2QhPGaFUvxfnzGtpcRpahowK
   AXK3eSPK79xmTjOZFi+mx8SrP0cW5momcHXy3+C/WA2F55mbSvYfsJcgY
   E1Y/bKDRisWVIpyBbfRBPnAsapDWd2PvTtVPaSYkDBcL0/ySZsZ/VwZ6Z
   BSQN9Ny6sgF/zwgtHE08+qJgs2T+O2yKMv/pAiy/sxbZOQqESIgl2zG7w
   A==;
X-CSE-ConnectionGUID: h3v0tYwUSxOIrKjjNkeUwA==
X-CSE-MsgGUID: MNyP1ng/TsKk9oHvWBwUEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52655477"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="52655477"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:21:45 -0800
X-CSE-ConnectionGUID: exU66Dv2QY2vuez05zWTOw==
X-CSE-MsgGUID: x+3siQujRKm7qL2tnHHQcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="141611917"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:21:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tpT9S-0000000H9BR-0vcV
	for tools@kernel.org;
	Tue, 04 Mar 2025 16:21:42 +0200
Date: Tue, 4 Mar 2025 16:21:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: tools@kernel.org
Subject: b4 to accept https://patch.msgid.link/
Message-ID: <Z8cMdUMZQhGtVTWx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo


Hi!

Some of the maintainers are using https://patch.msgid.link/ format of URLs
in the Link tags of the applied patches in their tree (and then it becomes in
upstream in most cases). It would be nice if `b4` can recognize this URLs
in the command line for `b4 mbox https://patch.msgid.link/...`

Current behaviour:

$ b4 mbox https://patch.msgid.link/20250303-veal-snooper-712c1dfad336@wendy
Grabbing thread from lore.kernel.org/all/https%3A%2F%2Fpatch.msgid.link%2F20250303-veal-snooper-712c1dfad336@wendy/t.mbox.gz
That message-id is not known.

Expected behaviour:

$ b4 mbox https://patch.msgid.link/20250303-veal-snooper-712c1dfad336@wendy
Grabbing thread from lore.kernel.org/all/20250303-veal-snooper-712c1dfad336@wendy/t.mbox.gz
2 messages in the thread
Saved ./20250303-veal-snooper-712c1dfad336@wendy.mbx

P.S> A bit of offtopic here: one thing which would be extremely helpful in web
interface to Git on kernel.org is the automatic links (<a href=...> tags) to
the Fixes tag. Ideally also to any "commit reference" in the commit message
text.

-- 
With Best Regards,
Andy Shevchenko



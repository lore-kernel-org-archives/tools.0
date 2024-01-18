Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E592DF73
	for <tools@linux.kernel.org>; Thu, 18 Jan 2024 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609555; cv=none; b=GxWIagEOUCwrB23syA4kPYANY+JeGNI5fYb+ZbnjDXvBJTqhONKRWh+xEsmqQPRVJmL7Ut36yjm77URgrZpQp8vlgM/d7Sqj9/68qzWtqJ3aZ3Kr52IHQhoaAYGcf9lNwQ49VoYil8qitzhW5mQ8fRs8x+Nx7j/h7e3VvFn/QwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609555; c=relaxed/simple;
	bh=+JD7mN8/9ruqZtkfrcUgiA//9xrzoh5yd9m2yGu8vTU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=opR9MTWjXp9a9o0VSQY3PwXfH4tWsz2lvL2uebWG5lYXJ6wadLkMh4K7TOLlMRzJtgCqadwp3HYqBq44F2Vh3pwbgHxGgu/Ubum221oqKZTGIs6L4o/p/SmKDZdBH3Wg52lfm9lvY9TtCNcZ6OenYgmtuA+ot512iKc1JpAybUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpDxzW+p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpDxzW+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705609553; x=1737145553;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+JD7mN8/9ruqZtkfrcUgiA//9xrzoh5yd9m2yGu8vTU=;
  b=dpDxzW+pvOcwgMsYsvhQReQ97E4Lhvz4zpyJMi4NFlWZnJHMXteiU1Dz
   45eY+D3e4o+srYuqLZAObEA/k8uK0FpTPQ/vZPAOhiFdBJRfnAvcJ6Fhx
   4hN3L91dHBhgAaBpEGf7GZnlMrzgtFlw0Er16utsC8xxG0Xy3B7A+xDeF
   ET6ZDWfvppxa0HZybexPtSuhCcXlF3Jmiz3Sh3Pj8N2PBqzmct7yAuOj/
   1kPAZyhP9drj/CdzFen+UjLF4IY+scv8unxf90+RFe7faYd+1fu57J5ns
   k9RIJuf+AxqA1j9XMPbJxiziBOBpW3sdUqltA8ZGeStrIkJIPhH2Q0D2d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13925407"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="13925407"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:25:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1116061508"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="1116061508"
Received: from amilburn-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.18])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:25:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	jani.nikula@intel.com
Subject: [PATCH 0/2] b4: Add support for setting config on the command-line
Date: Thu, 18 Jan 2024 22:25:42 +0200
Message-Id: <20240118202544.2019009-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Add -c/--config name=value option to set and override config options on
the command-line.

Only very lightly tested.


BR,
Jani.

Jani Nikula (2):
  init: separate config setup from access
  b4: add --config option to set config options on the command-line

 b4/__init__.py  | 152 ++++++++++++++++++++++++++++++------------------
 b4/command.py   |  26 +++++++++
 docs/config.rst |   5 ++
 3 files changed, 127 insertions(+), 56 deletions(-)

-- 
2.39.2


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B320E011
	for <tools@linux.kernel.org>; Wed, 28 May 2025 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446341; cv=none; b=CPBem+YFL5EFMtnguzeIwl6EmCyRJRAww985T3F+7RMvTXqYcq2RVCA1J/SqtQQvYP0Am0Pg3ZCVB1Bzrib5Gz68PIHqA/BQC6Gp11d+Z1lX+hkJ8l+KWXnBYbm5EpcxAjbT0VgWGfZmeLtK4QLxcGEbiQkZ9N/467gww5i8UVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446341; c=relaxed/simple;
	bh=hx5o/w/Z8SUib+dmFPV6jNL2y2XCRUSONx0/DT2XjUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n0IfWRhyfp4oM+0MQua7ARo5LTOOQFU16fJgKOmmiCuYmf1oTC6nqWPAp/6wWWK4akGzJ++eK19ntuZhMmlGQLpl0D7og+4TIf4Ifh4U23yP8E62CKn60343ZWyJadEYL18+TirZT1R/+lRkkJzNwhlutRvQAjQZ/WlntWJC7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vlrb6zO9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vlrb6zO9"
Received: by smtp.kernel.org (Postfix)
	id EFF0BC4CEF0; Wed, 28 May 2025 15:32:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F37BBC4CEED
	for <tools@kernel.org>; Wed, 28 May 2025 15:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F37BBC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748446340; x=1779982340;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hx5o/w/Z8SUib+dmFPV6jNL2y2XCRUSONx0/DT2XjUY=;
  b=Vlrb6zO9LHs+sgSnb1OMExgIVB5x0UvEoVipTIrCx8PtEjdW+VHCrM23
   1ypm+xmswAqf/pV2+UWgsHelGR+cw7dwYie1C9nfC/TFdL/dgInyg5lVR
   zlYsIB2RQVmFdirfo11TkNDeqNDAhdnEuYGGwhDlDeLALd2g7GMLGhmhF
   P5VfqG6YetbIec+whnPEVEXaP0610p8u9OG7Qcggh6C2AaZAlBXxP27x8
   MR/Mge7sgy223WsF0jm2/7eEQiDo9PDo7rNbl6uQ8t5HAF97m40aEHNYe
   hHk61wXPIMkgvDjgnH6gRTFCfkFSgVQolJwK8bZJKA/f3QVd80DT9jQKL
   Q==;
X-CSE-ConnectionGUID: ryfbnjZnROKonWe4qfQb6w==
X-CSE-MsgGUID: SiTwrTi+TImKJ4Nv1MwRYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50405014"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50405014"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:32:11 -0700
X-CSE-ConnectionGUID: SqiExiSyRRSofzLmONw9Sg==
X-CSE-MsgGUID: lGACIQVcQfKtsZ8a8SkzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148570728"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:32:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: tools@kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4 0/2] Allow to override output directory
Date: Wed, 28 May 2025 08:31:06 -0700
Message-ID: <20250528-override-output-v1-0-8e348ba28081@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250528-override-output-df3138bbe6c2
X-Mailer: b4 0.15-dev-d9694
Content-Transfer-Encoding: 8bit

One mistake I sometimes do is to share an output directory. I've found
that for me it works better if `b4 send -o /tmp/out` would refuse to
send patches if the output directory is not empty. That's because if I
forget that and later do a `git send-email /tmp/p` it will send things
that were not intended to be sent.

On the other hand, it's useful to just have an option to always drop
whatever was in the output directory and fill it with a new set of
patches. It works for me, but I realize it's dangerous if people don't
use a "dedicated staging area for patches". So here I'm adding it as a
separate option.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      ez: Allow to override dir before sending
      ez: Do not output to non-empty dir

 src/b4/command.py |  2 ++
 src/b4/ez.py      | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

base-commit: 6f78e874e96b0b3bac1767a1743b20af20cb0e2f
change-id: 20250528-override-output-df3138bbe6c2

Lucas De Marchi


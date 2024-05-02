Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7678259B56
	for <tools@linux.kernel.org>; Thu,  2 May 2024 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714677079; cv=none; b=RdCt+BLSLYcZOr+RiUwO4/wqReyvaDo5FbQ/zohh7Xg8pyYMx/IWZRMZ1jmHmV0nLhw09SkQSrmlGDQPqOR75mUlAuZkpRyhythy5EmF4X9NJch4KxLHNSzDaXxuwSXJVq4dHZx6Y4xJKm50nBNmvme6rBt8fBwRDbPjRWeNJWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714677079; c=relaxed/simple;
	bh=o2mPeY6/0vZWzBTSZjqPwIpiQ+AW69t/EsGOBVh2fmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mgd99AJTmlgPQEpge4gOkg4ax+4liOp1f3DzLg29Q4xymCKN4WLU3FDRwKz8OrphlLrlSP7giinek1Ng6u6bK69jLlWr2rid143It510ACAKEg57OuIkYkId43tQ55ky+GgAYk+KqBwa4H0RALU+RUho78++mAuLBAACde3iEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8rwM84K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8rwM84K"
Received: by smtp.kernel.org (Postfix)
	id 03823C4AF14; Thu,  2 May 2024 19:11:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04C7DC113CC
	for <tools@kernel.org>; Thu,  2 May 2024 19:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04C7DC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714677078; x=1746213078;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o2mPeY6/0vZWzBTSZjqPwIpiQ+AW69t/EsGOBVh2fmo=;
  b=X8rwM84KuCIyEpu/Fj4cTvtH1jGUZW7qHLXeFYKn4T8p5HI8a+k+5P8m
   MMX6oxisyGldZ85Mdiipc64MxXo9+SHOg3PZOrO8IUpcSL0QxjKQWyraz
   25tzhGjkZD/XB2AOUZeGvcuhH0+QP6pEi2dgIo9e0HZKCfoXmdKBQdENl
   QgM+FyGljAbA98eWugUup90KizlzUe0KmLKumPPPSE/uVSutMwtpw2TCo
   r3rlYhMFA4uvcpH2Wx5kGxORJewwahqkKTY/MOyQJBXFVn1VLj3Yz7znq
   Q31Ix4EbH3YjAfJqcGzhHtxf/Fn74epPLyn/bW5lajIpNM7yKUwzNQrQp
   w==;
X-CSE-ConnectionGUID: AxcXbEelRkeOksG0I7A7uA==
X-CSE-MsgGUID: KbNjqxNuQwq5IOFPpYL3ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10342021"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10342021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 12:11:17 -0700
X-CSE-ConnectionGUID: 0GiJpebLSZeO+N7dGAXk1w==
X-CSE-MsgGUID: kcPIS4YSRbOsqz8Za3pbkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="32010454"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 12:11:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: tools@kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] Make upper non-optional in parse_int_range()
Date: Thu,  2 May 2024 12:12:04 -0700
Message-ID: <20240502191205.3964106-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All calls to parse_int_range() already pass the maximum value. This will
be required if ranges are accepted to be negative, so prepare for that.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index aa65c43..b3f1c90 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3541,7 +3541,7 @@ def make_quote(body: str, maxlines: int = 5) -> str:
     return '\n'.join(quotelines)
 
 
-def parse_int_range(intrange: str, upper: Optional[int] = None) -> Iterator[int]:
+def parse_int_range(intrange: str, upper: int) -> Iterator[int]:
     # Remove all whitespace
     intrange = re.sub(r'\s', '', intrange)
     for n in intrange.split(','):
-- 
2.43.0


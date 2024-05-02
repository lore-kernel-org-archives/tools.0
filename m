Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570B59B56
	for <tools@linux.kernel.org>; Thu,  2 May 2024 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714677081; cv=none; b=lYn/afCrrtimmerFbuFpqjdz/ICInocdVlpYOtRxLwLPkd9LYeVCv5aJgiKg2kwEhUZgHtBba7mxKTTnZSY+6pQKDP+kA0XQORZDnSDdHYkttrypdZ7xIUz/5lzxBI3SxVMolgpUXLuPvBQkolyOSo19h+uuLaxY8dmlH+Pjd6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714677081; c=relaxed/simple;
	bh=BvGR/N+5kmFebz4ry6zOnMmSYN8qq0emWT3dSm/sVlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVaG5SeqPMApz80Dww80DUg7I/JOM0keV49Qzf6Q4vJYjll5SOsKqcnvl9GIVS5HHWWaQLda92vJj3/vEpcPTz3YTZbi1vWlTeGfWrEPdHRYE6bBkdaoVftBwezhDTqPu9e6J96kbUzyeb7+0O3GThEr9fbu8l9/E6lkYcDjmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIRHc6Vl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIRHc6Vl"
Received: by smtp.kernel.org (Postfix)
	id 7D50DC4AF18; Thu,  2 May 2024 19:11:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B602C116B1
	for <tools@kernel.org>; Thu,  2 May 2024 19:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B602C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714677079; x=1746213079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BvGR/N+5kmFebz4ry6zOnMmSYN8qq0emWT3dSm/sVlU=;
  b=aIRHc6Vl1ZWBeAoFEIum69nx4DaUECgHAzp21ofhNjMxj94flMXKsxS6
   ojnRmgTBpch77ErVg5ZJrbxrVIZX5FK4qU0Qfc9nIx9OMk3olyQOcwtLq
   /ijZjRCbtpFy0o2wBV/QM3shoYmKD/ISRaLEsEqhMfkBvpLCiTrIQ5bAt
   /xOWWXQZ708PO3mX/2WkrOlF4ZUn8xuh8P5EzW4E1ufXRE8j8pYNSOG9n
   tFJ5uF8bYVA7FzntQzK4X3P26qtPAXhvb1wcYjhtMYQbCuGFiPifB/X04
   QFllUlEo3Vd46IJ3CmfxKXaGCycLiz+vZFvOW3tupitJ4gWBidNPtCj4D
   w==;
X-CSE-ConnectionGUID: V+6oItsmRs+Y3Sy6u1DFbw==
X-CSE-MsgGUID: J0pjK2xDR0WI+MQrD5clcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10342024"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10342024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 12:11:17 -0700
X-CSE-ConnectionGUID: tziOdVcJQfelopoxSp1hVQ==
X-CSE-MsgGUID: w0wJNun3QzKjKyc4S+V/NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="32010457"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 12:11:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: tools@kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] Allow negative number in parse_int_range()
Date: Thu,  2 May 2024 12:12:05 -0700
Message-ID: <20240502191205.3964106-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502191205.3964106-1-lucas.demarchi@intel.com>
References: <20240502191205.3964106-1-lucas.demarchi@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is useful when applying patches and sending a thank you note
following that, which can now be done with `b4 ty -t -1`.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 docs/maintainer/am-shazam.rst |  4 ++++
 docs/maintainer/ty.rst        |  6 ++++--
 src/b4/__init__.py            | 12 +++++++++---
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index 2d672c3..416a941 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -128,6 +128,10 @@ The following flags are common to both commands:
 
       b4 am -P _ <msgid>
 
+  This picks just the last patch from a series::
+
+      b4 am -P -1 <msgid>
+
   This picks all patches where the subject matches "iscsi"::
 
       b4 am -P *iscsi*
diff --git a/docs/maintainer/ty.rst b/docs/maintainer/ty.rst
index 3b205c2..3945b08 100644
--- a/docs/maintainer/ty.rst
+++ b/docs/maintainer/ty.rst
@@ -92,8 +92,10 @@ Optional flags
 ``-t THANKFOR, --thank-for THANKFOR``
   From the listing generated by ``--list``, specify which thank-you
   notes should be sent. This command accepts comma-separated values and
-  ranges, including open-ended ranges, e.g.: ``-t 1,3,5-7,9-``. It also
-  accepts ``all``.
+  ranges, including open-ended ranges, e.g.: ``-t 1,3,5-7,9-``. When using
+  a sing number, it's possible to use negative values to refer to the
+  latest patch series, e.g.: ``-t -1`` refers to the last patch series.
+  It also accepts ``all``.
 
 ``-d DISCARD, --discard DISCARD``
   From the listing generated by ``--list``, specify which thank-you
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index b3f1c90..fc0a759 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3545,9 +3545,15 @@ def parse_int_range(intrange: str, upper: int) -> Iterator[int]:
     # Remove all whitespace
     intrange = re.sub(r'\s', '', intrange)
     for n in intrange.split(','):
-        if n.isdigit():
-            yield int(n)
-        elif n.find('<') == 0 and len(n) > 1 and n[1:].isdigit():
+        # Allow single numbers to be negative
+        try:
+            i = int(n)
+            if i < 0 and abs(i) <= upper:
+                yield upper + i + 1
+        except ValueError:
+            pass
+
+        if n.find('<') == 0 and len(n) > 1 and n[1:].isdigit():
             yield from range(1, int(n[1:]))
         elif n.find('-') > 0:
             nr = n.split('-')
-- 
2.43.0


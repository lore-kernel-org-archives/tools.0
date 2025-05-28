Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52831C683
	for <tools@linux.kernel.org>; Wed, 28 May 2025 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445577; cv=none; b=KTVap/jQuCCGi+ddkXX8xuyr3jJHHhSZrQYdsmyAVj9jiPPd/PVRms3rFYyD1/QvRaHcmBK7EZRvSjX/4Jo9hZ3ZmMqp/8vcQgE+OB+GdcWNp5oX//QRHMMpr5M7q9yEjqZ58xCH6+QRur1zqdAMi07fcJrVQ1OzLLUJ0cjuOAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445577; c=relaxed/simple;
	bh=sB18gQo7ozkmuMlWhJ+qsOh0LriAAxiaRB/jtuqfqE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QihtcJ5xlejq5DfRqG3iGpQcMAIu2NAHTZ86YloUvOCCW6r+i0BplT/gj6rHgeS3AprnFgkkgLsh5kDOa6cHZvYgnwOyCvyZpM1RxfZvR/niEDPnmWZtEbToNCFkgUibjYFSOs9fb6IfIUS6vmTPWtqp7wtEB53v2HsKXZtL3wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYoGmGDa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYoGmGDa"
Received: by smtp.kernel.org (Postfix)
	id 773F2C4CEED; Wed, 28 May 2025 15:19:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78EF1C4CEE3
	for <tools@kernel.org>; Wed, 28 May 2025 15:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78EF1C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748445575; x=1779981575;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sB18gQo7ozkmuMlWhJ+qsOh0LriAAxiaRB/jtuqfqE0=;
  b=NYoGmGDalb/XzlLnO+B++6gEvosbmmv0HEL7nTT+/Ycv3iJ8tCeXw61D
   n/qVbcTlM61a8dN993pFPF9xqu1/w7wezFea5WV0h2tSdQsBg0y4pgI5g
   vyI0JNSv//5OXTpWet+sz0lmhjoaRx/O4+qHZcVI6oGOGWnJngZKAnM5M
   Q0qXQ8N1Oy9mcTOHNLlF0Y0ZPsDiNtlf+PuifpLpBLZ+Etk0iFu6xZckH
   sU9/9PGDN2vIxXrJFfk8vrReFZPgwi8YVM0e90c6VsG6fZXXKMQOv60+B
   yNCKnAvpt/2wRyIUvjd4DGtJO4QmIr7Xl17rLO9w48V/KbeNzq58lCrN/
   w==;
X-CSE-ConnectionGUID: g5mWPrIjQPmGm5AK2Q2SRA==
X-CSE-MsgGUID: v8/4r8nLQ+u7eZIpr/aJQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61108702"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61108702"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:19:34 -0700
X-CSE-ConnectionGUID: v/etaKKuRJKIejvIrbYLwA==
X-CSE-MsgGUID: 7BZTF4mGTuqSmMeOHeIHxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143251187"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:19:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: tools@kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4] Output entire path in dry-run send_mail
Date: Wed, 28 May 2025 08:19:09 -0700
Message-ID: <20250528-full-path-v1-1-ab454229d394@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250528-full-path-3a2e026b2837
X-Mailer: b4 0.15-dev-6fd62
Content-Transfer-Encoding: 8bit

This makes it copy-and-paste-friendly. Even if the directory is output
before the patches, allowing to double click the terminal do select the
file helps when we are going to inspect/edit the patch.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a9d5906..3980bc6 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4084,8 +4084,8 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, None], msgs: Sequence[
         if dryrun:
             if output_dir:
                 filen = '%s.eml' % ls.get_slug(sep='-')
-                logger.info('  %s', filen)
                 write_to = os.path.join(output_dir, filen)
+                logger.info(f'  %s', write_to)
                 with open(write_to, 'wb') as fh:
                     fh.write(bdata)
                 continue




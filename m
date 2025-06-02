Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739342C3270
	for <tools@linux.kernel.org>; Mon,  2 Jun 2025 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881983; cv=none; b=lNDqEpl0IvDPVzzsAxtXOSNLGv7KF2rxfMzAvCcJtHwgwPxQqE18B1ZlZrmeWOI3PVJQYJCeCMPwcDA7ZOcU/J8hReuui2BHP4TyIwyXTVvJxO4VLAQ0VZeixjBtDahFo6PHJUZvpnlllcclipY7RVyDcdEwVL1QIUECYKbIaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881983; c=relaxed/simple;
	bh=e0eBPF7AwQZxcBXdHeHsXFPfyc4lmywgmyoWW554F6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RCJ5rG1F0lijUXEp07IRQBY/JjxInNb2vWyHaJepXbmFTWwnkoveMwNP9V7CGMwAzpJIi/hFDriTKUXy7pmasdGl8q6CNr7N8XCS/veZ3/PdytwYqU1lq/9XZyRhWi7Znts2i+tx7AmVbhK9NMWaLlMt0RgBERpc71FxK7lcHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fC+C1ON9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fC+C1ON9"
Received: by smtp.kernel.org (Postfix)
	id EFE90C4CEEE; Mon,  2 Jun 2025 16:33:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE14EC4CEEB
	for <tools@kernel.org>; Mon,  2 Jun 2025 16:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE14EC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748881982; x=1780417982;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e0eBPF7AwQZxcBXdHeHsXFPfyc4lmywgmyoWW554F6c=;
  b=fC+C1ON9ooui8UfnzLluXW6wQZ36V5Ymi48zAx03dyLd8m/hbdWZ0Uw6
   Iiq7uY2ducfH0H1GYoG6dsKfWmDMm3NQcQRcsTgftYkdrX01qbiuveziE
   FTZs2Hz4JvrEhYUwDeLZctxmR8HQQz/tejYBwci0el48uB5nNecaqj0VE
   JZDpc2JrXSozb7bFmJZeMsQCpf9M4buaculoiJuCl8x18Ws2gn6TQTE68
   VFWQgOf0dc3z5aXgBN5GjMJ2gJaFN5ILR6eRQb/1XpGkiktDtA8adOk0P
   NowFExFFUd8mHudMr0u47k3OsS2x+ut+owAbIkbOrYns+8DXi9/GaZMO6
   A==;
X-CSE-ConnectionGUID: MwCQd496Q6+v6Nn8bifcaA==
X-CSE-MsgGUID: hlwqDwjWQ9K4uGytSzyfQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54562909"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="54562909"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 09:33:02 -0700
X-CSE-ConnectionGUID: 3eNpegkYTpaWvWaO1aybww==
X-CSE-MsgGUID: 0vPXRy+UQd2qK9qEuXfdFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="175437948"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 09:33:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4] ez: Remove wrong "f" from msgid
Date: Mon,  2 Jun 2025 09:32:39 -0700
Message-ID: <20250602-fix-import-typo-v1-1-686d23571741@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250602-fix-import-typo-98781a65db37
X-Mailer: b4 0.15-dev-79e96
Content-Transfer-Encoding: 8bit

That leading f shouldn't probably be there and makes it harder to
copy-paste the msgid when editing the cover letter.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 src/b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 76f0044..e719e03 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -331,7 +331,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
             cover = re.sub(r'^(#.*)$', r'>\1', cover, flags=re.M)
 
             cover = (f'{cmsg.subject}\n\n'
-                     f'EDITME: Imported from f{msgid}\n'
+                     f'EDITME: Imported from {msgid}\n'
                      f'        Please review before sending.\n\n') + cover
 
             change_id = lser.change_id




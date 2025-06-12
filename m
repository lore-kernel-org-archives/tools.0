Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B851C4609
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752254; cv=none; b=ZN6RZ7IEzusdq0MSoruItYm+XGPHn9Sv1lusKxnaYthkWpccIGJsGmqfK8hXoUptp9BUOy743/aYrqHW5rrhrPGOVRt2Jk7zb3l+h0BrBORVbFujkhf8CHxSwbcQNe9pu3Uk6ik9/4JKycKjIXupB/aaFEjZfHfhC+KtlvzsAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752254; c=relaxed/simple;
	bh=dkYHOaaVZOsEpQFonRmxih+nQd1ZJ11+a64Dkq6B4Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BNE18+kXwuHh3bCm1QyxrPgrSyeT4D5c260MqmehgcGEGiePQCmevVStJuu3m74YOVMowTkGJEUUqqcszLSXt3xrgHN0ySa3y7/jFChs/VNhYM7MTa01Co1JFSoXTNuMuZSkPQSMKRKL146PPAqYU+8eqQ+yxy8I9OPLcig5qSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAe1HAlW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAe1HAlW"
Received: by smtp.kernel.org (Postfix)
	id 3AB0AC4CEEE; Thu, 12 Jun 2025 18:17:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26ED7C4CEEA
	for <tools@kernel.org>; Thu, 12 Jun 2025 18:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26ED7C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749752253; x=1781288253;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dkYHOaaVZOsEpQFonRmxih+nQd1ZJ11+a64Dkq6B4Fo=;
  b=OAe1HAlWUzHLSXVSSnZ2zTRXpeYhJ7KavRWzpbqgGwzswzgulPc1HXpn
   tm2OSOABNr8mvPLNO7KIJSS8PJl0Jc0sJBKw+AKuT+HRJy6my+ypcKZ/7
   YQLj7+6F7l0NyCbfi41M2uVvATV7uLtIjnbO0c0u70WXnYNLrGTFEKKlk
   kgvsPspKuQDxOMLV7Lbufu7kKKolj8BzmMkhv9NhOJX+V/Emjl5skCxCx
   itYLj4QrXI5UcWdtStabhiVxPJyJOh5QJTqlGb5nsDkEsrHl394rwDyCz
   Dm5LLVF6zszaE7Zp72/k71FXwyseGtNwyGp7l/32T6gITM+noncykkZ28
   Q==;
X-CSE-ConnectionGUID: TlEZVDaEQKaucbQ/BZ2dNA==
X-CSE-MsgGUID: y5Y5hUcKSbm2msyIOHcDGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62561655"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="62561655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:17:32 -0700
X-CSE-ConnectionGUID: /PWBR1ViTY25XudOz6zqvQ==
X-CSE-MsgGUID: NlmoQY4cQcOua4VVh0b7nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="148146510"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:17:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4] prep: Rework --no-cache help message
Date: Thu, 12 Jun 2025 11:17:05 -0700
Message-ID: <20250612-prep-cache-v1-1-f80c50989c69@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250612-prep-cache-56735e1c4ed8
X-Mailer: b4 0.15-dev-9a2a9
Content-Transfer-Encoding: 8bit

Reword it to be similar to the other commands: the cache is not used
only for remote queries, but also when running local checks.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 src/b4/command.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index bad221e..3b71e56 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -312,7 +312,7 @@ def setup_parser() -> argparse.ArgumentParser:
     sp_prep.add_argument('--add-prefixes', metavar='PREFIX', nargs='+',
                          help='Additional prefixes to add to those already defined')
     sp_prep.add_argument('-C', '--no-cache', dest='nocache', action='store_true', default=False,
-                         help='Do not use local cache when performing remote queries')
+                         help='Do not use local cache')
     sp_prep.add_argument('--range-diff-opts', default=None, type=str,
                          help='Arguments passed to git range-diff when comparing series')
 




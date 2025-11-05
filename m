Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFE723D7DA
	for <tools@linux.kernel.org>; Wed,  5 Nov 2025 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762385008; cv=none; b=WcHXKxapwearMt0DFutE8BDWocV71AZR3uBcr3X63QZQcdS+Liwzm1QxCQsQPUdMo3y5iircyoz95p5pHLEeavU3sGtmWsiLcZ/znKD8prHXRWjvZxrtpAuEya7efPurWLgKbYiWO/rd2zGbtjTwUQmSfcBJ0k8z5g92nLNK2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762385008; c=relaxed/simple;
	bh=Y9YhJpJHAMelcdDKoaIHxQ5nA0fFMiBCcwvl2Pk4LfI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=skuHB1aq4WjaYwLd1OpPycmJWXrfdVILbmyOoPolPM1xg3uqdcKEbkU50ARLD3oBifZKp2Pt2pwwUbyL6j/m8lvDblBMg+wBoH8h+b9sR5z/JUIfFRvgK3lBy91amnp4GWvPmGxW7ITWNafac+mdBPnE/qn0/WeUvXr/u0UIMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esB/+two; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esB/+two"
Received: by smtp.kernel.org (Postfix)
	id 03373C4CEFB; Wed,  5 Nov 2025 23:23:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D10EC116D0
	for <tools@kernel.org>; Wed,  5 Nov 2025 23:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D10EC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762385007; x=1793921007;
  h=from:to:subject:date:message-id:mime-version;
  bh=Y9YhJpJHAMelcdDKoaIHxQ5nA0fFMiBCcwvl2Pk4LfI=;
  b=esB/+twomWOByOGgEDrtTeeHedD+XAasA9Y3ADYRY4wPFeIp5jDPmmW/
   d4wfbdd6KizejnQ1DuFqkCfZ41hJjKLzVd/o1XpUqeZzEdz+9d2W5yX76
   Km5uxG+pgOXZlzDORYs3Yabafrt9EhsQNiAukEPLqS2U2eG/QG5lwB7Tk
   xlshuQyK+PI75Ma2x5dab/AWd5fRxaSxJPsCRuRGHm6LUazORS6XD/Lqr
   EW3npzbgbxRq3seyY8bETvOXXZrrak6dGfVK7ekh+wLbpARERccl22rux
   MP9tKCs2XwJzJdQD89Qi3NcrnIQoU//R7T3T+ANSBETFOr6iBhhcHq7ws
   w==;
X-CSE-ConnectionGUID: Yshf48f4QKqmYJmYvJXfHA==
X-CSE-MsgGUID: wsuDhFyoSeWHrvIsF5JyqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87141868"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="87141868"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 15:23:26 -0800
X-CSE-ConnectionGUID: A5iABfxqT+aOKo9cUSQYhg==
X-CSE-MsgGUID: iJnGKUsmQtiksOt4T5zmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="218360637"
Received: from c02x38vbjhd2mac.jf.intel.com ([10.88.27.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 15:23:25 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
To: tools@kernel.org
Subject: Single patch and cover letter: inconsistent Subject line behavior
Date: Wed, 05 Nov 2025 15:23:20 -0800
Message-ID: <m21pmcvzbr.fsf@C02X38VBJHD2mac.jf.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


The current documentation and cover-letter template state this:

> When you only have a single patch, b4 should "mix-in" the contents of
> the cover letter into the "under-the-cut" portion of the patch itself,
> where it serves as a source of additional information for the reviewers,
> but never makes it into the actual commit.

I noticed that the "under-the-cut" portion omits the _subject line_ of
the cover letter. That does not seem documented. So I wrote a
documentation patch and I was about to send it. But after testing a bit
more I noticed that the first and second lines of the cover letter _are_
included in the "under-the-cut" portion when the second line of the
cover letter file is not empty. Is that the intended behavior? Or maybe
more "accidental" and caused by whatever library parses the cover letter
file? Either way there is at least some documentation gap.


Correct subject line followed by empty line: OMITTED
   < empty line >
Body or not, included if any
Body or not, included if any


"Malformed subject" 1st line NOT followed by empty line: INCLUDED
   NOT empty 2nd line, INCLUDED
Body or not, included if any
Body or not, included if any

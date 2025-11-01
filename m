Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA3A1D618E
	for <tools@linux.kernel.org>; Sat,  1 Nov 2025 03:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761967734; cv=none; b=hWX5H5QoLpoZKDqQfY+gGwbPJCD6uN2Wrr4yUyE1tlPxTxaWR3SKOxpNomCnSssYbKvYyYNakg/IHmYszvXhRfHLCUVwIGvXKD3tTzuEhpl04Nv8g/8zJfaqUj1SnE4Zw/QwPNub6wq4CvqsCasX5PR9GleW3odIGsCSl4zg9zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761967734; c=relaxed/simple;
	bh=Ktx3Ja/EM3cubQssjSSpMnkJ1+8GyRWXAcjIcTTJdSs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FV2GQEnbp9cdj177JEQ+0y0bJONWx+RLIT5lqqjk3WC/rdlPAiqgajJUSISZX8Eh/jyzZDy3qbU4TLebpFpb8mOMz5tszVCxssFfvMYTZA/PzptjwK2mC/vutemdjh69xnmZv5VGroKVUlXhidT97aRkUo2n/B0PnU/0WmIJTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POcDwgUo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POcDwgUo"
Received: by smtp.kernel.org (Postfix)
	id D199CC113D0; Sat,  1 Nov 2025 03:28:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CD3FC4CEFB
	for <tools@kernel.org>; Sat,  1 Nov 2025 03:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7CD3FC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761967732; x=1793503732;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Ktx3Ja/EM3cubQssjSSpMnkJ1+8GyRWXAcjIcTTJdSs=;
  b=POcDwgUoQRgMV12XUuCTdzN4RtxdsB8RhKD+0qqt+PWgffzXo2im8w/Y
   SsZYFwc9HvLyCyyjbQJJ1s3haSkHW7fnZWxyjlHAvEryGTyDwPSVtthoc
   LSz4s7Ztw0fvd4Wrzj40c/j42PrcispJieWvxMz4sEbQxn05M+l5hErYQ
   78LLDaLbrTam/kvlGwN+2Y2DUR9VapDcGDYTaTT8bh14nZiAMnzS2m3dr
   hJDqgxn/oEiz57Zfs+caBfGemAKEtDKppAdj6leVmguKi6meEubAxU0y5
   8RhZTGuqQ5kbaYUL0YnR6nYa7tJ2jqKUkc8kcmIDla85qxI/2LmpxKADW
   A==;
X-CSE-ConnectionGUID: QRkdrW/wR7OquHtezgZP8w==
X-CSE-MsgGUID: jDVfEKShSkmJlTcsoSx4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74424539"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="74424539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 20:28:51 -0700
X-CSE-ConnectionGUID: d0VUQbKeQIefTFjPu5Bmog==
X-CSE-MsgGUID: lmfKS/x/RsmZxfmRW5bADg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="191533319"
Received: from c02x38vbjhd2mac.jf.intel.com ([10.88.27.157])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 20:28:51 -0700
From: Marc Herbert <marc.herbert@linux.intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: Unreleased, multi-lines git_filter_repo fix required to run b4
 tests?
In-Reply-To: <20251031-flashy-bouncy-macaw-2d5afa@lemur> (Konstantin
	Ryabitsev's message of "Fri, 31 Oct 2025 10:00:31 -0400")
References: <m2zf97ybma.fsf@C02X38VBJHD2mac.jf.intel.com>
	<20251031-flashy-bouncy-macaw-2d5afa@lemur>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 31 Oct 2025 20:28:45 -0700
Message-ID: <m2fray5t3m.fsf@C02X38VBJHD2mac.jf.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Thu, Oct 30, 2025 at 08:49:01PM -0700, Marc Herbert wrote:
>> So what really baffles me is: how come no one else noticed this before?
>
> They have -- it's a recurring problem for packagers. 

Ha, then I was searching in the wrong place: here.

But wait... only packagers run tests? Not the people submitting b4
changes on this list!?

The "xfail" patch I just submitted should be enough to please packagers.

> I've been prodding git-filter-repo to release a fixed version -- if
> more people tell them about it, maybe this will actually happen?

Not sure what is a good stick there but for sure my xfail patch and the
corresponding effort should provide strong, additional evidence of how
painful this has been - whether you merge it or not. So... I've done my
share? :-)

> This bug doesn't really affect real usage of b4, because this only manifests
> itself when someone sets the cover letter strategy to use git branch
> descriptions (which is what tests do).

Good to know, thx.

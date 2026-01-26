Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F683EBF21
	for <tools@linux.kernel.org>; Mon, 26 Jan 2026 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440599; cv=none; b=LF1Ovv8/eH89Wy+JKL55S30mRTlVU3rGLmhmUd+D+HKtzAlo4Tfahie4t+DGuXxGX+xjpyYfgrTU+Qm1/jzuA+syHbZFcP8axxB0Ka4J9afN9ffh3+XYjT70lfqnJx1ZITZFWmp3FX4QxvXAd0N9clOiTn4QoXRzUe+h479AJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440599; c=relaxed/simple;
	bh=BzyBTTWzDS/LvKfK/oAaNe8zloOjdFBS1gIFOM8H+ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnw5n6/oXQWkTYPVZhvXnbICZypSdhRThhErh75qYGh2HUpo7bL4jn2z4K+Hv0xZ07/uZX6qX80Ptm2blOiP/HHLy9EfMH6rFKKI2Jzj/h9/zcxFjj5cZ64h7bCBfLdUK2+qO/TPdVF+VRM+My3YaDbmYrh5mLzL0qNIQ3Spza8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOnJdr0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOnJdr0v"
Received: by smtp.kernel.org (Postfix)
	id 97B5BC2BC86; Mon, 26 Jan 2026 15:16:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4587C116C6;
	Mon, 26 Jan 2026 15:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4587C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769440598; x=1800976598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BzyBTTWzDS/LvKfK/oAaNe8zloOjdFBS1gIFOM8H+ck=;
  b=FOnJdr0v3Fv3BRRDB/InkyUaDFiCWacCd25YCinU6Qb94+uaWSD57oL9
   GeX67X7HFCOBllMhImk50wxrukoQqKCm2WDEfcS+uNWsjNGbto4dRDPs6
   3Omk7Ius5qAaNsU+eTYFiXxEzkPpmJFD6sR5DQocXq7ppeeN7FspChjUM
   BrGmNFKrt1Ff9rFaiAtBuMS9jZC/gzWABAipI6xc6LG1Jo1JdG5yqeGv+
   aKLzz/7n61XGB5UtJgm8u/JpPmlj9NpvCpGdcsrZg2apFzt8bBNreV+sS
   hGRS+vKXnQKlgMiZvAx+ww4NAax52ciStEkeqG1pKKXTLAF3q9c7+f1Tx
   w==;
X-CSE-ConnectionGUID: QsUVAP0WRAurvc+wQbDHxA==
X-CSE-MsgGUID: 5zplkdUYQzWoWcWzYUhK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82049497"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="82049497"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 07:16:37 -0800
X-CSE-ConnectionGUID: xT2sEwaHSH+35d6f9mTkuA==
X-CSE-MsgGUID: gcktVcgbR9uyCwKEMxsRnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207503568"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 07:16:32 -0800
Date: Mon, 26 Jan 2026 17:16:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, tools@kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Kent Gustavsson <kent@minoris.se>,
	Gustavo Silva <gustavograzs@gmail.com>,
	Nishant Malpani <nish.malpani25@gmail.com>,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH 18/21] iio: Replace IRQF_ONESHOT with IRQF_NO_THREAD
Message-ID: <aXeFTY6Qx-fLl4-s@smile.fi.intel.com>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-19-bigeasy@linutronix.de>
 <aXOKVqxyhQ10l9V4@smile.fi.intel.com>
 <20260126081510.jr8Rp6R7@linutronix.de>
 <aXc5Efu-PlLNCxkk@smile.fi.intel.com>
 <20260126101034.lnGGQmUD@linutronix.de>
 <aXdJbidb3DPyRaxB@smile.fi.intel.com>
 <20260126-cocky-sawfish-of-variation-c0cedd@lemur>
 <aXeA1AIcOx7yUNaz@smile.fi.intel.com>
 <20260126-delectable-utopian-oriole-5418c6@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-delectable-utopian-oriole-5418c6@lemur>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 26, 2026 at 10:09:25AM -0500, Konstantin Ryabitsev wrote:
> On Mon, Jan 26, 2026 at 04:57:24PM +0200, Andy Shevchenko wrote:
> > What I have i mind is rather the scenario when I see already sent (by somebody
> > else) patch in the mailing list and I want develop a followup with the same
> > To/Cc list. So I want `b4 ... --use/restore-to-cc-from-the-mailing-list / lore`
> > type of functionality.

> To understand it better -- you want to send a new revision to a patch sent by
> someone else?

Like this or when I want to send another patch on top of what has been sent to
the same people.

> If so, you should be able to "b4 prep --from-thread <msgid>",
> but it's actually a good question if that will do the right thing with content
> under "---" or not, as I'm not sure this part was ever properly tested.

But that's not needed, as it's assumed to be in the *email* Cc and To already,
so that's it then. I will try the suggested command, thanks!

More complex case is to preserve that locally, but it might be not needed after
all.

Thanks for the suggestions and nice tool!


-- 
With Best Regards,
Andy Shevchenko



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C535D2DC798
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595333; cv=none; b=U79m10VFMACKg339JtsoJL0PVKiJL4nixZVsvON4XgE8Iq3buJxQv2MsnMasacRScL6dbByo+10NF6mGW3UBz8OIHBRpKRQW5J3Xl/P40PP9TP8pjvwpHn29VbRJnsgjXvXn0F9AV4EzWw/dK3F4eB7XVAcNQIbIcam6gPJuHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595333; c=relaxed/simple;
	bh=CQu+gWjG9H0q+ubY0IqqfYrAMx5v8VdqmY1BQGWYOg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4GrQUtFff1ovi2qMgKoH6IVTcxQjn6BdMD+/di24JLhrYQsfoMNJtzA0+ZPWcE8hpQ0J8zAao+epzxaaPOdjjkhkhOlbYp5DonWr63YaDLNrJsdcYYIMxIg/r0sUtA0C/8RrnD9VJS1me4Wg2xc6TYJ+y54BLJd/Me1CcyAr3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efEptpTq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efEptpTq"
Received: by smtp.kernel.org (Postfix)
	id BE6FDC16AAE; Wed, 28 Jan 2026 10:15:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FE46C4CEF1;
	Wed, 28 Jan 2026 10:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FE46C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769595331; x=1801131331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CQu+gWjG9H0q+ubY0IqqfYrAMx5v8VdqmY1BQGWYOg0=;
  b=efEptpTq3tT/zqBVonOcrUIutfJ9N24gHFQKj/l5UtAyp3N7r6GYQM8S
   fJiSw+bTkUvItfOE2YjrNUic14tK3AjQo0L5hDLgK0r6A1tfb/8AXsFvY
   JFhx479k5FrPHYOZ1F5Uk0yNS9pUZtftDgMHh5VpbzsL/Ceo+mXU2wIsV
   F5cOSTl/OLR339vDwkeqEVrSxPCD+d1ikUPknU1FztWl0UVet2GNZwMYB
   yCUyQafNIwzGaSO6kROXeUflQQJ4A6xa48NGqmAe/zLoPf6sy7wfdU3Mj
   2NJeJmmn2VYZ2qNyHhfhiQuNkAtTTvIBgI07y4tDWgUFaDpB8LEc0uOxf
   A==;
X-CSE-ConnectionGUID: ocwAnOFvTqSK+La3akX1xQ==
X-CSE-MsgGUID: mU7QV2p/SYaQVCjAyHSyhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81527072"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81527072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 02:15:30 -0800
X-CSE-ConnectionGUID: uMyGPEIuRgaS+uvnGuwg5w==
X-CSE-MsgGUID: Dp3mkX/4RcaQUGMwWnuu9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208676452"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 02:15:27 -0800
Date: Wed, 28 Jan 2026 12:15:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
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
Message-ID: <aXnhvJ9NxmforpTe@smile.fi.intel.com>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-19-bigeasy@linutronix.de>
 <aXOKVqxyhQ10l9V4@smile.fi.intel.com>
 <20260126081510.jr8Rp6R7@linutronix.de>
 <aXc5Efu-PlLNCxkk@smile.fi.intel.com>
 <20260126101034.lnGGQmUD@linutronix.de>
 <aXdJbidb3DPyRaxB@smile.fi.intel.com>
 <20260128100736.Fdw5Oknz@linutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128100736.Fdw5Oknz@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 11:07:36AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-01-26 13:01:02 [+0200], Andy Shevchenko wrote:
> >   ---
> >   Cc: person 1
> >   Cc: person 2
> > 
> > Just don't reimport them via `git am`.
> > 
> > > I lose it on the next if I update patches in tree and re-export them. 
> > 
> > I don't understand this, sorry. Can you provide a step-by-step example?
> > Do you mean that you are taking previous version from the list and reapplying
> > it via `git am`? But shouldn't `b4` take care of that as long as it knows the
> > Change-ID and it matches?
> 
> So doing this and switching to b4 trailers to grab the tags actually
> help. Then I have been playing with prep. So thank you.

You're welcome!

> Then I stumbled upon --auto-to-cc which picked up all addresses and
> added it to the cover letter which was fine. But then `send' used those
> for every patch in the series which I did not want. So for that part I
> probably stick with git-send-mail since this not in everyone's workflow
> (sending a series across multiple subsystems and avoiding flooding
> everyone).

I'm not an (advanced) user of `b4` yet. I have my own script to send based on
some heuristics [1].

> Anyway. This seems to have turned out nice.

Good!

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



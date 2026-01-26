Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1943314B6
	for <tools@linux.kernel.org>; Mon, 26 Jan 2026 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425273; cv=none; b=QDKVMQ6jdQRCVphwgidnKU09pZXXI1EnKrZ3d5ZQ+LvgUOSQ2UBfY5uEEok1/vvlkkgZu19qox4D8u84Qyi5zY5HyF92kT6kSz6efRQLT+F95q+3DyGiy2dLmDwfIRoyOdC8IqKFxVUx1OuNcG2Xz+2COeWtkf1jSh5GH4mjfBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425273; c=relaxed/simple;
	bh=iQHm0G3MvLIv+Sa8rtsaBwOV4TDuTrxVd0iemlyNd0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y37N1Cf1j4QfTeagGGNIvQVK5+a5zZXaj6Yu24BbiwJ9euBG4vv978rZ1njTP34QRZI8dZt8yndV6BHNczV0iWzbxL8WnLiBOdbnVo7PZp7qk37VlSXuxgSHcNGKwNK3HeW5AwVKJZ3SwoH1+AWSZbTvuj+TJsdLxfSB/Ck8Kqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbXGARy/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbXGARy/"
Received: by smtp.kernel.org (Postfix)
	id EB232C2BC86; Mon, 26 Jan 2026 11:01:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3DC9C19421;
	Mon, 26 Jan 2026 11:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3DC9C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769425270; x=1800961270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iQHm0G3MvLIv+Sa8rtsaBwOV4TDuTrxVd0iemlyNd0Y=;
  b=PbXGARy/goRfjlgwIxlbHn1NX8jUpCEcLQ2kkGIwhuNjJ+qHuBl8yiBO
   UKOhjhtnuIDo6BbU1rEU9DhykeNg5ApoLVpNsDGLuYTgRUZNX7AcTBj+X
   90qXbjgAbGWtuIQ/km68js/wQhFMNLtDkdyNzvgItVqixSpViIp/mPe5b
   gsMgNO1P6swOj/KyZP3BVsgXLKeW2ysv2PSOTdyV/jMgQ08spAIa4WhN9
   BLFnxt3d9shIO0Wp+sPNR9VCWEhqWJXE31rL7ymOf5rQ7j/EpuZz2Nqrk
   3wq24Jy87t3Ctv3SOFlr0EoGAtN+McPH4NcW1kKxVABepPM0yqOKqegLw
   Q==;
X-CSE-ConnectionGUID: leiswm9lR8OsmB/s6KsZWQ==
X-CSE-MsgGUID: UCDWipmDQwyzy0Iigxku1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="82032456"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="82032456"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:01:09 -0800
X-CSE-ConnectionGUID: Wpyf4aTAS0mQ4M78pvcVXg==
X-CSE-MsgGUID: CzDgbaF6Rs6W95ROV7/AIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="245260966"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:01:04 -0800
Date: Mon, 26 Jan 2026 13:01:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, tools@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
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
Message-ID: <aXdJbidb3DPyRaxB@smile.fi.intel.com>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-19-bigeasy@linutronix.de>
 <aXOKVqxyhQ10l9V4@smile.fi.intel.com>
 <20260126081510.jr8Rp6R7@linutronix.de>
 <aXc5Efu-PlLNCxkk@smile.fi.intel.com>
 <20260126101034.lnGGQmUD@linutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126101034.lnGGQmUD@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 26, 2026 at 11:10:34AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-01-26 11:51:13 [+0200], Andy Shevchenko wrote:
> > > > > Cc: Lars-Peter Clausen <lars@metafoo.de>
> > > > > Cc: Michael Hennerich <Michael.Hennerich@analog.com>
> > > > > Cc: Puranjay Mohan <puranjay@kernel.org>
> > > > > Cc: Jonathan Cameron <jic23@kernel.org>
> > > > > Cc: David Lechner <dlechner@baylibre.com>
> > > > > Cc: "Nuno Sá" <nuno.sa@analog.com>
> > > > > Cc: Andy Shevchenko <andy@kernel.org>
> > > > > Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > > > Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> > > > > Cc: Kent Gustavsson <kent@minoris.se>
> > > > > Cc: Gustavo Silva <gustavograzs@gmail.com>
> > > > > Cc: Nishant Malpani <nish.malpani25@gmail.com>
> > > > > Cc: linux-iio@vger.kernel.org
> > > > 
> …
> > I didn't follow. How? What tools do you use?
> 
> b4/ git.

> > > So I have to move them for each submission. Or is there something I am not
> > > aware of?
> > 
> > Make them in the tail of commit messages locally with a delimiter, they will
> > always be present as long as they are in your tree.
> > 
> > I dunno if `b4` manages the Cc lists separately. At least I see no-one using
> > `b4` *and* putting the Cc noise into the commit messages, so I assume it
> > behaves nicely.
> 
> I point is if I move them for one submission,

It will be in your Git tree as a part of the commit message.

What I mean is that your commit message will be like

  $PREFIX: $SUMMARY
  ...blank line...
  $COMMIT_MESSAGE
  ...blank line...
  $TAG
  Signed-off-by: ...
  ---
  Cc: person 1
  Cc: person 2

Just don't reimport them via `git am`.

> I lose it on the next if I update patches in tree and re-export them. 

I don't understand this, sorry. Can you provide a step-by-step example?
Do you mean that you are taking previous version from the list and reapplying
it via `git am`? But shouldn't `b4` take care of that as long as it knows the
Change-ID and it matches?

...

Hmm... The https://b4.docs.kernel.org/en/latest/contributor/prep.html
doesn't clearly tell me if there is a carry-on procedure for the Cc
list between versions.

...

> > > > > +		ret = devm_request_irq(dev, st->irq,
> > > > > +				       iio_trigger_generic_data_rdy_poll,
> > > > > +				       IRQF_TRIGGER_RISING | IRQF_NO_THREAD,
> > > > > +				       indio_dev->name, st->dready_trig);
> > > > >  		if (ret < 0)
> > > > >  			return ret;
> > > > 
> > > > Interestingly that this driver ignores the flags from firmware... Seems to me
> > > > like a bug (not in your patch, obviously). Ditto for other drivers doing similar
> > > > things.
> > > 
> > > If the irq-chip is level or unknown mode on boot up/ default and the
> > > device can only operate as an edge-rising then I don't see why this
> > > should be a bug.
> > 
> > But if FW says use "level", wouldn't this setting override it?
> 
> Yes, it will. It was common to use it pre-device-tree time where this
> information was not configured automatically before ->probe. Now it
> might be missing/wrong in the dt for some of the old devices.
> It might be a left-over which continued to grow and spread.

It may be considered as a bug, especially in the cases when the driver works
only on DT/ACPI platforms.

-- 
With Best Regards,
Andy Shevchenko



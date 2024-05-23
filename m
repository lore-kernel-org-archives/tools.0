Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5A87E583
	for <tools@linux.kernel.org>; Thu, 23 May 2024 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716483898; cv=none; b=tk0e3SXySeEmYSVFI7O1mJinjo8NSgfGoamFcXETjSDgmbHsXqgH7bJ/dslbPyf301vXGyJkBaoaLcs9sZGHy5vWCy/qGIikPDCf9lUtpVb45t9DWGZY31Wqzo9+GROPqJfafX1W9x4/93vYqMcH3ZWcL9iTcIG9xAR+AVqpiOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716483898; c=relaxed/simple;
	bh=uwSXRJRu9uJHeQhzeTNjkDanlZS4NJI9Gd15pd647So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqqerzQ37cB+CiLuYMS0j2Z+1y/Y0d1wXiAGQBT9Uzht/Chuyh8+iocRIommFy387oTAT1gZbh1ZVcAgms2XCdzSoHuIOC91PxSI20qulcWj2z6ZLFNnUcjeCufJlLjLD2XEpLrT1YDw+EfbreT9heQMP2Bm1ZO2rDVs05rgdgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tt41ReRu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tt41ReRu"
Received: by smtp.kernel.org (Postfix)
	id 58BF4C32781; Thu, 23 May 2024 17:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2068CC3277B;
	Thu, 23 May 2024 17:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716483898;
	bh=uwSXRJRu9uJHeQhzeTNjkDanlZS4NJI9Gd15pd647So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tt41ReRupHPdE2BVtTglsuzKOWH4lrSgZFld9JX/OHre/w56im+o04Ybz4HbioDkp
	 IbDY7zW5Y6jletWfyeFc0UQBI+knuMQB5cfgjWhB+PnC0MNnLPYOVeGofiFROS1/J9
	 p9bFHHBiAZj6afr1rt+9+l+5IgUAvelIlK2dfKJU=
Date: Thu, 23 May 2024 13:04:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: tools@kernel.org
Subject: Re: /all/ vs /r/ URL for messages in lore
Message-ID: <20240523-industrious-sloppy-heron-f61ac1@lemur>
References: <e45742c0-45ae-4f6f-82ac-c59bea4c9304@notapiano>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e45742c0-45ae-4f6f-82ac-c59bea4c9304@notapiano>

On Tue, May 21, 2024 at 04:11:45PM GMT, Nícolas F. R. A. Prado wrote:
> I've noticed that in addition to the 'all' inbox in lore,
> https://lore.kernel.org/all/, there's also a hidden 'r' inbox,
> https://lore.kernel.org/r/, that seems to redirect to 'all'. I've seen mixed
> usage of both in the kernel documentation and am wondering if one should be
> prefered over the other.

This is largely due to historical legacy. Prior to lore, links were of 
the format lkml.kernel.org/r/[message-id] and redirected to gmane, but 
could also be /g/ for mail-archive.com and /m/ for marc.info.

These days, the only important part is the message-id itself, and /r/ is 
unnecessary (it can be omitted entirely).
 
> Is the 'r' inbox even meant to be used? I'm worried it might not be "officially
> supported" and stop working in the future.

It won't stop working, because that would break decades of old links.

> In any case I think it would be good to choose one and use it consistently
> throughout the documentation.

The documentation should be recommending lore.kernel.org/r/, but it's 
really not critical. It's easier for a lot of people to just copy-paste 
a link with /all/ in it, and we shouldn't nitpick at this -- as long as 
the message-id is there, that's all that is really required for this to 
be valid.

-K

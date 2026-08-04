Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95B3B8930
	for <tools@linux.kernel.org>; Tue,  4 Aug 2026 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871563; cv=none; b=HX4E9x5mk8/CA0BE352y13GWzX60iYt+Tn0WfyRjlBMaIcV//2VHA/TLOme6tCJ5PUQgBl+gzwviUIisy6JqRozLNEoMifKJSLnFm2n8uESG+osmlQDKnY0ZC8xAp8Xw90rdtfh2IvCroPmMUQPbgYj40ZjbGgiMvVk6WJ5RWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871563; c=relaxed/simple;
	bh=pi4Aj64KhTNIr3KzTfcIar4zvZTjcwjIypeCaVPFC2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ttv6ps+lNb3MpiDz5CbqWO45asVRnkac+RVB5iBMrzNo6PmDvyIeLcAn3Jhe08aYzIBikrNCKZYGhRIzdx0UJo44S5lkKJLttjja5xsHUQrb27Jj7FN2PMF8sJxJAFFuKjmqV+yJ1I6EPh8gTNcFamR1h3ptM4hmQbxjZiLFYi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4svM1GS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4svM1GS"
Received: by smtp.kernel.org (Postfix)
	id 35A361F00A3A; Tue,  4 Aug 2026 19:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC95D1F000E9;
	Tue,  4 Aug 2026 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871561;
	bh=gkAruPXw/6bW4XbY9hFDTyXPgYGUQpwiHKVheUfVh0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O4svM1GSM/prQWJ7n8973zQyO7O1idZ60e64nRtWkD9sdmPRFtxEd3HpMQyT1kgx5
	 5282ZH5HoVg7Vzy048zfDPmaqB+n16agjub1sPnsmMaqENnnb6Ycq1Z6Ld9pGGFD5u
	 zVm0gNGx+iBeJcIbrnagnacCXn4mHWDNkVpAuU4PeKUTgNkyljVT1zKNM6vrHZDqIP
	 MhZzipTFVjAXjum9Xr+sA5CfAdjYi6Sj7eufDlelXq3cMe++EySI5B64WJtvx0gkWX
	 UWCcm9uedBNxn82MqxYKX8dNOV5nNhX5igrWPkkUm+yrDZ3LQXFzXyFkZLGUuRas/4
	 eBPQL94cJGMew==
Date: Tue, 4 Aug 2026 15:25:59 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Rito Rhymes <rito@ritovision.com>
Cc: tools@kernel.org
Subject: Re: [PATCH v1 1/2] add mobile drawer navigation with a compact
 sticky top bar
Message-ID: <20260804-generous-godlike-muskox-c3df49@meerkat>
References: <20260803153502.32096-1-rito@ritovision.com>
 <20260803-curly-sly-guan-18e09a@meerkat>
 <DKFH8OBQKN6F.1SOFYEYNCJC5H@ritovision.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DKFH8OBQKN6F.1SOFYEYNCJC5H@ritovision.com>

On Mon, Aug 03, 2026 at 01:15:56PM -0400, Rito Rhymes wrote:
> Really? It tested well for me on Chrome Desktop on Windows before
> I submitted it, across both desktop and mobile viewport sizes.
> 
> What problems did you see?

Okay, I actually chased this down to stale cache on Fastly, so I reapplied it
again and it seems to be working well now. Sorry for the false alert.

Thanks for your help and your patience, again!

-K

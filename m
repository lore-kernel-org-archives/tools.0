Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BB35E521
	for <tools@linux.kernel.org>; Fri,  6 Feb 2026 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770388329; cv=none; b=M3rDJfI0kqDKdIBw8qo3he1Ez3cu13uzsHKPFlgq0+k63GuzUF7j8MWGC7EGE7TsYv2YGyWNdfDA5suEczhtwMGhuLmLfNMcwwiKuxm2mYmNNABbPCXv0/7vRmGkCyxmMy6hDJBhjrj6rVDNVyg9LF4vNhsuylXhmPZ0u5LNqQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770388329; c=relaxed/simple;
	bh=SFQPpduOBJv6L3mLglr7SQeIb9xt3zDihaNWKfjqGmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IreIkWXkhL7bGbLHS8m66HjuQsVpcEwbN5TZVxpouUG+gZs7Af4skbuqZXNr27TTX11wVkns28h3tmTANX3UsA54XGU5yKO3A8ruZ1dVQobKGMiBHdkzl5zEcVo0w4BRAScCkFXVRAydNpufxlzQAoEFrHTVmHUfErQeeV34mMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZtLAANq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZtLAANq"
Received: by smtp.kernel.org (Postfix)
	id 2FD10C19423; Fri,  6 Feb 2026 14:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB27BC16AAE;
	Fri,  6 Feb 2026 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770388329;
	bh=SFQPpduOBJv6L3mLglr7SQeIb9xt3zDihaNWKfjqGmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZtLAANqCbTseEdJXsAR/IZcSGoidkJ2EJ/2oAByf6XnW4Sf+8ExMPRtksbL6plap
	 OHjRZMHUm7oN8EJOD8rnjL958/jc2WoDcFvEbQW5VnxSFzBUtE1GBlooi9BQusHd9t
	 ksb8GldurMs+zSu8gAFYBa6caWg1KPMuuA4pH2UOc9D1GoEkNA236phfq+dGuZg/CN
	 zI2T9+vlHbYWPiyi71lBIneyg29lh4p01n40lZ35jANeuDGbhrPxpkp6FrxIful668
	 2z2svUys0THrbQ+/WE/1SzH9I+7sLC4dEpPuycqvyfO1aG7/hoy6vB6A+xXj7jcJh/
	 y5VJ0AsV7WY6A==
Date: Fri, 6 Feb 2026 09:32:05 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: odd b4 "Mail:" trailer added for USB patch
Message-ID: <20260206-mighty-blond-ferret-e7bdb9@lemur>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
 <2026020637-cleft-viscosity-c984@gregkh>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026020637-cleft-viscosity-c984@gregkh>

On Fri, Feb 06, 2026 at 11:21:43AM +0100, Greg KH wrote:
> When running the following command that I normally do to apply patches:
> 	b4 am -S -t -o - | git am -s
> from my email client, for the patch with:
> 	Message-ID: <20260206-wip-jremmet-hd3ss3220_vbus_split-v4-1-ee5b4e402187@phytec.de>
> 
> I get:
> 
> Looking up https://lore.kernel.org/all/20260206-wip-jremmet-hd3ss3220_vbus_split-v4-1-ee5b4e402187@phytec.de/
> Analyzing 1 messages in the thread
> Analyzing 11 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v4] usb: typec: hd3ss3220: Check if regulator needs to be switched
>  be switched") (✓ DKIM/phytec.de)typec: hd3ss3220: Check if regulator needs to
>     + Mail: j.remmet@pyhtec.de (✓ DKIM/phytec.de)

Sigh. This happens occasionally, because we can't have a strict list of
trailers we recognize for follow-ups (because of people's proclivity to use
things like Suggested-and-co-developed-by: or whatnot). We have a junklist of
things we know are bogus, but every now and again there's something we haven't
thought of (like people using "Mail" instead of "Email").

I'll add this to the junklist as well.

-K

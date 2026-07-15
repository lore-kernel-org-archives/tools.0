Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA2E34B1B0
	for <tools@linux.kernel.org>; Wed, 15 Jul 2026 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124339; cv=none; b=nexsBJfzvDPQOIO3zYvSPnQwCOqcBuI5uzmoRzivIVZFkNWO3XyO/GWYL8kwljndvv/fFiaO3EQ56cduX+oUpp2RNcjt7mYUVxbLLB9CCImMmEOOjCC5D2JGcB20o/jqWUhWFppTS/9LHyxAzyspgb/gtmlFtPCszuXD2fwjGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124339; c=relaxed/simple;
	bh=6bxzGMO44nR6WUJhskYkW/xgIm2UOzJnsmXsJ8WIxe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgPq9kB6KXwfA6/iV1Y5QRI7WgRYNuXbyU98OTHkTXSVGV4M5CNMvLZlRveJX+yil44Py9YySgazpTF3miX3XEffFKKZJ3I06h0SqpsnRBepaVUvDlcSItj1M3LMlG5RB02ufQ+B2oFkze2KcmJFQ+SH+BVCnvWdcGuIiU/ZlFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eow5aZUv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eow5aZUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3432D1F000E9;
	Wed, 15 Jul 2026 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784124338;
	bh=6bxzGMO44nR6WUJhskYkW/xgIm2UOzJnsmXsJ8WIxe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eow5aZUv75K7qnPZr0C+VDi7sHGQiIpnoNfT+q/eI/lghUcfJcEkbhPFhG8XlvCoO
	 6GGlKDpu4oMur0oBYrt9cF0dfrFV1pyoDG33RS8G9TVQ6zIO+S1RpWRf9CgUHYCHAl
	 g3u5DBOi4LEVoVq0Y1Z3u6yHP3fhKo14vg2VWfuM6rdSnjaRvruBXXqyksQlG7SsNo
	 xMPVeePSGK/AslpO3WjUkDWJ6cCAhNsUqCRRzi+pCOEcTZAo6ue/ws+o5kIDOC4PuT
	 amxGKOAVvao73u8o0H3eSdrRGPmAezM8fYqYJblKrUBxxemTCJ5iRyWBrkPiTMohou
	 ADs3jCgJwrD/g==
Date: Wed, 15 Jul 2026 15:05:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 review not picking up v2 with prefix?
Message-ID: <aleTasCAYAvzz6cU@lucifer>
References: <alNzLxOk2V04cNgo@lucifer>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alNzLxOk2V04cNgo@lucifer>

On Sun, Jul 12, 2026 at 12:06:49PM +0100, Lorenzo Stoakes wrote:
> Hi Konstantin,
>
> Thanks for b4 review is a great tool that I'm now integrating into my workflow
> (alongside b4 for sending series which I previously... resisted :)
>
> So maybe an edge case here, and sorry for lazy report vs. patching (just so much
> to do elsewhere) but for series [0] I set a mm-hotfixes prefix via:
>
> $ b4 prep --set-prefixes 'mm-hotfixes'
>
> Which is a convention in mm used sometimes to highlight that a series/patch
> is a hotfix.
>
> I have the v1 tracked ([1]), but when doing an update via 'u' or 'U' in the
> review tui it doesn't seem to find the v2.
>
> To make things more complicated, I sent patches separately previously ([2]
> and [3]) which I decided to combine into the series sent in [0].

Ohhh this may be on purpose. I noticed with v3 that it picked it up, but kept it
at v2, and prompted me to do 'a' (action) then 'U' (upgrade) so possibly PEBKAC
here :>)

>
> $ b4 --version
> 0.15.2
>
> Thanks, Lorenzo
>
> (And yes I am using b4 review to track my own series as well as reviews :P
> makes it easier for me to keep track of what I've sent also :)
>
> [0]:https://lore.kernel.org/linux-mm/20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org/
> [1]:https://lore.kernel.org/all/20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org/
> [2]:https://lore.kernel.org/all/20260710-fix-cpa-ptdump-race-v1-1-d898699a7417@kernel.org/
> [3]:https://lore.kernel.org/all/20260710-b4-fix-non-init_mm-ptdump-v1-1-2d40982c98ec@kernel.org/

Cheers, Lorenzo

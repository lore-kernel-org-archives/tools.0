Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC66E3BA245
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025333; cv=none; b=uDXrpYsWuh+/ZvDbPUu4DOb9xCSV2z1BfSVdCJwjp/Hc3Vdx6oMJAnAJ1BcQjuJSXVAnpxZv2GnAIAzNPubpNryiGmvXTNYVMXRZfK3U4Ju4o0HG+VFEnoPYzNTiSv+gFNtpSXujNdnULETUQLwC0GuUQSS8p/OWYo3mtGWzyEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025333; c=relaxed/simple;
	bh=4bhXhCUMNOQP+By2xUqTU4RbkwxZ1+k7eSspeU0lNZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mkz49dkPjrEVedUx8emrrkmiOXTQ1qJVYWegWlwyvV/I7ndfsK9NBXRy8XHa6UO6CJ1O/gYrUMA4x3eSRFAJACJHJLMk+tKra3dtzXyD1t2SkM4MiP9GM3a/+tKj7/aI9KwEkSgd8BZnkabpitgdBiEHH322OGWRIZW/gxfLtZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQqqAGeL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQqqAGeL"
Received: by smtp.kernel.org (Postfix)
	id 90056C2BCAF; Fri, 20 Mar 2026 16:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D080C4CEF7;
	Fri, 20 Mar 2026 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025333;
	bh=4bhXhCUMNOQP+By2xUqTU4RbkwxZ1+k7eSspeU0lNZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQqqAGeLfv1OVhtU8GZzXe00cosQ2+D/BQVqFXTXCY/8THDy42HK7ePqkRgk1MgYh
	 vHDImWu3xx6psEG08YdXJrEqDPoYQLrvRjyMaO0KBpS6NNFfrTDrvtl+4CcZyojqz5
	 O3hdUhG3CGdbu+BizKr2SitWbAWq2apAgBWJvVk2FEM2smpWBtZXAfI2SPaZw9PBvn
	 4gamE/Y5RXUJKP2/hScJljUf5aKioJ0sdMH0qwmow8e9gxuSO84++2fqMc5vPsPaZz
	 Xe7NRUe+tyiixWkKVALlpVuAXSAmMDxHvhC7qPPqGBVrsk4xmLJJfd+A1FxehsugUh
	 Hacq3IJSJJ8ZQ==
Date: Fri, 20 Mar 2026 12:48:52 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Series revision identification issue
Message-ID: <20260320-nifty-awesome-llama-be809d@lemur>
References: <88549a4a-cc82-4200-b73b-e335cbb2b024@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88549a4a-cc82-4200-b73b-e335cbb2b024@sirena.org.uk>

On Fri, Mar 20, 2026 at 03:12:52PM +0000, Mark Brown wrote:
> The series:
> 
>     https://patch.msgid.link/20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com
> 
> has a new version:
> 
>     https://lore.kernel.org/linux-sound/20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com/
> 
> but b4 does not seem to notice this (there's no metadata in the series
> that'd track it, but there is the subject...).
> 
> Since this sort of stuff is never going to be 100% accurate it might be
> handy to have a way of explicitly linking a new version in the UI.

I'll think of a good way to do it. Maybe we can do something like:

    b4 review track <msgid> --upgrades <change-id>

bugspray tag b4/review

-- 
KR

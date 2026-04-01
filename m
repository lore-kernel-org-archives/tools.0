Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28B1A5B84
	for <tools@linux.kernel.org>; Wed,  1 Apr 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775077093; cv=none; b=QDx2FQ+kIK5DidzlUMN5CDcKz4aKETc98RjjRWpmY/BGap0CbTi0GaKAZkFXiSudooGa5FQtkUKbhcmHhQeZcgLSknOyPXaKCVisbkTsLV1MUnnZAGHb3lLfSx/R1SEQ7CUE5/QVjn1LQs+XueLvLeXr+RqIs/XOAUos7KzSnzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775077093; c=relaxed/simple;
	bh=0aPBX8HNOnS5QwvLSYzTtTtcyjZ57MuDunnq8xrdgTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke7pn6G7lXVA+nvZ+1v+x78uiHemjr5U+WoXzeUT0wvv7uGjeuEy52b7TxRXyHVT1PXnmznT4LQlsDW4fpTB9U3rB+Fd5YXSuRZdkGPbTBliYNP5Zsx+gOinhjGexBXPvkAcbDXh0iJcb1PPiZ5EbGwPH/wk87gH68CuyFquNzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njj8TZBk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njj8TZBk"
Received: by smtp.kernel.org (Postfix)
	id 7EC5EC116C6; Wed,  1 Apr 2026 20:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1E7C4CEF7;
	Wed,  1 Apr 2026 20:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775077093;
	bh=0aPBX8HNOnS5QwvLSYzTtTtcyjZ57MuDunnq8xrdgTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njj8TZBklWNEuFDLMEgDZZz2BnuLGYj8yuhjpH6tgRHglKlExIzbl/ZwSG28gKyYt
	 OYzzMOK+OKghzMQSNdHl+l8sykRETxmsafsw+4IkSSwW3KdEYCwUrvu7Z4roniKIqE
	 VnxBPANTuTxUqduePXgs5ZzzSw9M1J0n393muz1De8/xPDcObkzHbHHajvAyvGU6E4
	 baOfcjMDLIq6++gfsDojJFUEDLDLSYFUjQq4OSGaxPIP9/cQb9Am2Efg2x7bUfP9sx
	 F6Z+cRYx2xvRQosCJfnXyQgNN54yKou9L1CVQS56WRQy9zg049SOFhryldk/jJF6/0
	 35kCg5ZPhwZ/Q==
Date: Wed, 1 Apr 2026 16:58:12 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: tools@kernel.org
Subject: Re: another korgalore issue with linux-crypto
Message-ID: <20260401-cunning-lyrical-foxhound-5f5d6e@lemur>
References: <c4de9f25-0c60-49e4-925f-7749eba57264@app.fastmail.com>
 <20260330-uptight-leopard-of-awe-ee7afe@lemur>
 <25a3c713-4fee-4a37-b535-58d9da34e008@app.fastmail.com>
 <e77298ce-1e3e-449f-9864-b4fcf77a00b4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e77298ce-1e3e-449f-9864-b4fcf77a00b4@app.fastmail.com>

On Wed, Apr 01, 2026 at 09:13:05AM +0200, Ard Biesheuvel wrote:
> > Thanks for the fix. I've upgraded to this version now, but the 
> > underlying failure condition is no longer there, so I can't really say 
> > for sure whether things are any better now.
> 
> Actually, I still think something fishy is going on. In my log below, it seems that linuxcrypto is still in a funny state, as the number of messages keeps going up. The last message that was actually newly delivered was
> 
> Date: Tue, 31 Mar 2026 13:22:14 +0100
> Message-ID: <20260331122214.103145-1-julianbraha@gmail.com>
> 
> When I run kgl on the command line I get
> 
> $ korgalore/kgl.sh pull linuxcrypto
> Reattempting delivery  [####################################]  1/1
> Updating feeds  [####################################]  1/1                                      
> Pull complete with no updates.

This helped. Please try another update of stable-0.6.y -- hopefully that
actually fixes this condition.

Thanks for the report!

-- 
KR

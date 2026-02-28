Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF493212B0A
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772299289; cv=none; b=Tc66wHR/3XlJAR14gbctzEme8u+CA88urh81D/3cIgOcSYMnRl2jnXw3BeZ6YIIoRWQeVCQQRlpv6SO18md5k5+a/opBzTErvw/QR9e9wyDkaREbY2W80yZdDmdsolDo/yun1C0Eeclxbf/CRCMopeq6JwhjfeM3qPnzw7eKqxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772299289; c=relaxed/simple;
	bh=Y9Va2xqYac61eZN/HjZY+WEFoWhKwBjYHh6yav6Jrr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4m/GaRRajXup73ojA5YRx0poEPdtUTxBlWZ/CN9HTYK67Etw7SqsZpwDwH9LoT2yrmnOULwFjEbof0d7xGFH8O7pNlJ/46+ZEVU85TWBFveEGHRIFN/YUVJzc0FLPsGZg9Fj5n5CE55m9F397gGxnYx7l/BsLLM5Qnhj6TRvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeDa3JwV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeDa3JwV"
Received: by smtp.kernel.org (Postfix)
	id BDCEAC2BC87; Sat, 28 Feb 2026 17:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2BFC116D0;
	Sat, 28 Feb 2026 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772299289;
	bh=Y9Va2xqYac61eZN/HjZY+WEFoWhKwBjYHh6yav6Jrr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeDa3JwVgl09l28ek1N2tr8Eohrb9fWLNAYpxaB1rmJf3IXkmCPSkfmsttIujSfjV
	 lQgK4wQmNEmR19eIABzcC6dwsTmhBogzWc5JRLOQ8EY9IWGKVcwgWyizj6rPRexHoK
	 cJNK1sTYYl1xKAcQKNadlqFcvc4H0pbE7xUaxpjkxJteNb7L8IBk0pOjnjVSKiLH2B
	 V2VMD9lm4hmpr0wqvaXNIXG2cWEDY6X+hOycI6DWgrp+/+JpQABkG9/AsM90FUoK/2
	 5aCPljBh0ajxvVA3SptQF48luz2lsvIb+N+7eAFrkixNflCSWzD8ang9ACH7ZX6WG7
	 0LJF3PmwsSncA==
Date: Sat, 28 Feb 2026 12:21:27 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-arcane-mamba-of-refinement-6dba82@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-aqueduct-nuzzle-c03be63e03af@spud>

On Sat, Feb 28, 2026 at 05:12:51PM +0000, Conor Dooley wrote:
> > Did you remember to completely exit the running app and restart it? I swear,
> > this should be fixed.
> 
> 
> Yeah, not running according to ps anyway.

Argh, escape_markup will, unhelpfully, only escape actual markup. So, it will
escape [bold] into \[bold\] but leave [PATCH] as [PATCH]. WTF, who decided
this was a good idea?

I'll commit a more wholesome fix shortly, sorry about that.

-- 
KR

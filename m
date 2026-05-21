Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC3357D13
	for <tools@linux.kernel.org>; Thu, 21 May 2026 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330127; cv=none; b=gjUeKFVpyEMbyUJ9EnhfdSXnaksTf7npPcqjzzKarfYuChHOISKg9cwd+d0DW1tDy5tu00QSZZX5PGj9+XCpFPLzWhLa+pLVVmIFDtMGVgGJw6dGP48IBwaia/z8xVEOaEEfWBOxZf2fjez+q1NDSSbbcxB6vgNW1f1ANPn1QPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330127; c=relaxed/simple;
	bh=I9nt3TD3iNeKtYp+XuwLnkv3Ld5REFl4K8zrz9dD2c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czN9bNCxawZjciftCKwaTLq8nnkMDELynk88ny0MZN3LDOIRKn3g1djX/Gj55U3tu2BOQpzrky4KbRkcPnWfhWe9LXRLMqFIdGv9OPjQIJeQlO9ZEtFVWDXx7LvTUxJ3qvhhL/L4ZODPyqYVjK1arYv0gTw0Nvw8jhNmH8eUjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkGVLG0v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkGVLG0v"
Received: by smtp.kernel.org (Postfix)
	id EC9FB1F00A3B; Thu, 21 May 2026 02:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882B21F000E9;
	Thu, 21 May 2026 02:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779330118;
	bh=HYnKOOfNthqkXB8aC6h6sTLFhUajZdBzJbZXoZYbeto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IkGVLG0v7XBn4GflAwN/OAX/8sODj4yDVsAyWqCk9yCgPW2Ra4DYDgohngJCTyNVm
	 +YjGqRLG0eINIuUmaDdbfMPhm4q1UbiFf6PQ9Rce9xTNowFDnb+MmrO3wfRlXKGdnO
	 bc4HWd+4cevuxzBjxqTrZHGXkwXe0v0Ds0f5VhzNOGxPn9KU89r4ipf5MckIIpLgh8
	 khPHRE/l/2jOflC+NToo5vHzlyE4jtDLZ8VWNl0l61dLNZceCOVa1zOqs7fBl0jeYa
	 4MpaBfIPYgjlo2KBgXfpn+cLYZcMmAkpv/uEi55KBL8qOMemCfkmR+RBpxM5XO4E/2
	 v8GVSfg268Qaw==
Date: Wed, 20 May 2026 22:21:57 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260520-determined-emotional-porpoise-1cf7ae@meerkat>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
 <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
 <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>

On Wed, May 20, 2026 at 07:09:58PM -0700, Borislav Petkov wrote:
> On Wed, May 20, 2026 at 09:30:26PM -0400, Konstantin Ryabitsev wrote:
> > D'oh. Try now.
> 
> Now it says:
> 
> $ kgl pull
> Updating feeds  [####################################]  1/1                              
> Delivering to local  [------------------------------------]  5/34277  lkmlerror: Aborting deliveries to target "local" due to repeated failures.

This is something else entirely unrelated. It looks like the pull succeeded
(look at those 34277 new messages), but it got 5 failures trying to deliver to
whatever is your "local" target, after which it gave up.

> Pull complete with no updates.
> 
> ---
> 
> Lemme know if you wanna still debug this or I should simply refetch things?

Yes, I'd like to troubleshoot this further, assuming you want each and every
one of those 34277 new messages. :)

-K

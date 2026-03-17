Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5AF389DF3
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779412; cv=none; b=LleXtwqmenT5+5Dk9k9guxLCztCEj41KnwFMtEr3aEMYHz/ELozA6izvhzGu9XPid98urp5Dz/48cxWK8O3GuvAWozXeE5KH53i0J4Lvvoow67vQBXJmcv6fuybDzFkuLep19TO5nkHWn5M5SDJRAaKdrap8c2uomBhWQhKxzOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779412; c=relaxed/simple;
	bh=GLF958bNK5XB7Looum/C2QcTCxErMs4eqqciGGA1mTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWsRE0hOUbeB4Kcs91+MCe9bf3iBJYEcbZb4pMtcwKKcBXEzrtfD7LxA0DRSyhPI/SfJwYN4JpaVjrO8EVCiS8hvn0EIgR+tSSKH5ibeznjyHEcuOY/ZT2pQgcV8Jj2sVq3JRcQSuErgPRnjpgwpobGccyy5hSH+12fKcHdwmbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulrRgrL6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulrRgrL6"
Received: by smtp.kernel.org (Postfix)
	id 9EC53C2BCB1; Tue, 17 Mar 2026 20:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DA7C4CEF7;
	Tue, 17 Mar 2026 20:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773779412;
	bh=GLF958bNK5XB7Looum/C2QcTCxErMs4eqqciGGA1mTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulrRgrL6ACis3fjskW2AGBAlCF6PfcRBIhUz5vF1a5ClNrIFDUtj/R5md9JRl4Tke
	 /rzFmKqaJG6nD3EuFuGfwsnQoJNQM6hVcUvTHGO6nlH1HGSneq0UY1uZjXxOqacixI
	 DL0CV7JLltgyrly9/SfFFwU2I9MXOpqcmNhX8L5LqoqCoM9wHEfTfR3iPqxGAfhYeB
	 mb3b5hHCZQ0PGOOyHFEunCUHBDfEKBiGG3MF5SDLltUXaJzdXNnvn6ZHw6ZJbOdfDc
	 PAvD4MKM5Y1Oqryv1HJ0ySgYU69v7bvY5yUSJDXd8gBk1W54JgEwqyskw+mVwP/8KC
	 doQXuKofcMi2Q==
Date: Tue, 17 Mar 2026 16:30:11 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260317-optimistic-impartial-kudu-deefac@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-starling-of-delightful-exercise-3472ce@lemur>

On Tue, Mar 17, 2026 at 10:23:33AM -0400, Konstantin Ryabitsev wrote:
> > If I've done everything right, you'll find what you're looking for at
> > 
> >   git://git.lwn.net/linux.git b4/review/20260312-kernel-doc-use-a-c-lexical-tokenizer-for-transforms-0e0e9e143327
> 
> Yep, found it. *sigh*
> 
> Unfortunately, it's not an easy fix. I think I'll have to
> abandon how we currently do inline comments -- the diff format is just too
> fragile to try to intersperse it with comments. I think I'm just going to load
> the diff using standard "> " quoting instead of trying to be creative with >>>
> <<< markers. Maintainers are more used to seeing that anyway.
> 
> I'll let you know when the new code is ready for testing.

Okay, a fairly big change landed in master that completely does away with "C"
and inline comments. You now just hit "r" to reply and add your comments just
like you would to any other message -- benefiting from your existing mastery
of your preferred editor.

We also ship vim and emacs syntax files in misc/ -- they make it easier to
reply to diffs than regular email syntax styling.

Please try it out again. Your old bugs should be gone and replaced by whole
new bugs!

Best regards,
-- 
KR

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694A1A9FAE
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 22:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047765; cv=none; b=ic2GWtc3LXO5a9mHVaddf0PrIkNS0TLn+iMC1olAXQw7CbrD98RjLUDzT6i2MpX/fPrfVr8b6ZvGQ+X2bxnsnerdU7pROvSYhg2iG9sZHvNzcmI+kcTti29EDvtlRZGHhGdTxoR85VvrqEP9JWFjqc6YmyntEfb7P1TNTmY+w54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047765; c=relaxed/simple;
	bh=Ao9ySNVQ24sjHTo5tmHnRR/eu67JauOsF+9a8ED1kwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aabrI3SaqzF7BRg5pNPVS6VffLCGxyPv0F78OvC6ayLllIBSRlfgiG3/xLdgYXaMlu4+mv/JDbEMpPunG7D4hfW+Dgdazz99URUuLmK9okQT7dez3bawXjFRoIHKcszFeJDQkDbmFfeD1g4Q2G8mf4qtwFLg2LDIfEatrL9kBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S1rWtYR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S1rWtYR1"
Received: by smtp.kernel.org (Postfix)
	id 56652C4CEF5; Thu,  9 Oct 2025 22:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272E4C4CEE7;
	Thu,  9 Oct 2025 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760047765;
	bh=Ao9ySNVQ24sjHTo5tmHnRR/eu67JauOsF+9a8ED1kwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1rWtYR1nVOxP9vA8BFhYekYVpp7lz6hVmJjDkeeQFXZmCaohRD72RkHUpUEvGOIO
	 afnvDt1kOfnVeIlbIaa6NZUL+eVvA4/yqqcTqvfhBQQTqL8X0sxkiD37i0hQfCr+1I
	 kaEG/MzJwrczxZjec6BtvCt2Ofke3s3nneZebWZw=
Date: Thu, 9 Oct 2025 18:09:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251009-remarkable-charming-pogona-fd7a8f@lemur>
References: <20251009151349.GB2890766@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251009151349.GB2890766@google.com>

On Thu, Oct 09, 2025 at 04:13:49PM +0100, Lee Jones wrote:
> The that I'm highlighting occurs when changes have to be made to the
> commit message.  My assumption is that the hash no longer matches and we
> get:
> 
>  Auto-thankanating commits in for-mfd-next
>  Found 5 of your commits since 1.day
>  Calculating patch hashes, may take a moment...
>  Nothing to do
> 
> Doh!  There should be something to do.

Curious, have you set your diff.algorithm anywhere in your git config to
something like "patience" or "histogram"?

-K

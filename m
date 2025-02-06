Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6656F192D9A
	for <tools@linux.kernel.org>; Thu,  6 Feb 2025 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864431; cv=none; b=qSsFhvmvvhoRKazFZJZNFMYar2RIxahlTMiY88sPtxqzmtWEvGFwwe/NEVvIsy8TCWgLRXk6T80qJzHsJ8+yhrVOAvptr7ZgVNMtEIifAzTaltHr74R4U5WjtjBOSMkxrKgQpmoX5bM2/tlLOZ2D4Xd8vSD7dwBIXmpnZ+HUeJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864431; c=relaxed/simple;
	bh=yHBqoELAJrxj8Z1+fNvLdj3Vh9EoFOvaWIDbBmpNUhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl8uFwd1k65D92fSCY3ItdY415uJx4nczdXFRMY9Ac/TqeR01rqT+caUJgUCQ8Kqo3zkOpWZ/zZFd8bXEOYltT4d/NMqCfhSDjyy1VHNtqvyYzeDK4/ahRffLhP7CwI8N1KBvxj6mIj6QhPvkYpkvf2lSZQUFjk2ioX5iiIxj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wc+KUtj9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wc+KUtj9"
Received: by smtp.kernel.org (Postfix)
	id E9749C4CEE3; Thu,  6 Feb 2025 17:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A613FC4CEDF;
	Thu,  6 Feb 2025 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738864430;
	bh=yHBqoELAJrxj8Z1+fNvLdj3Vh9EoFOvaWIDbBmpNUhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wc+KUtj9r8c5qK0U1XSuuBzQbgyrNwEm6nSc4rQ22/GpIKyKQGx3P9G7uhAwhZzDQ
	 T/5ThlmVQFFd7ARH0Uqj0irJ2Hm/d5ZOmHBEUhwG7GFeHXT08kKHiwDQUfEENjArcr
	 s/JBeDER9DFus1C5vHjxR95qatXOuUtvm7VE3j6w=
Date: Thu, 6 Feb 2025 12:53:49 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 0/5] Resolve some static typing errors
Message-ID: <20250206-flat-dark-rat-3a44fb@meerkat>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
 <173755972553.457666.16721877756658243086.b4-ty@linuxfoundation.org>
 <20250122-flawless-logical-badger-d760cb@lemur>
 <CAJ-ks9=D7vv=xq2hDeENGqzvujw+oye2=AUBBQtcu148szDoGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=D7vv=xq2hDeENGqzvujw+oye2=AUBBQtcu148szDoGA@mail.gmail.com>

On Thu, Jan 23, 2025 at 10:28:21PM +0200, Tamir Duberstein wrote:
> > Note, that I had to do a follow-up fix for the missing Generator type import.
> > I should have caught that during review, but missed it.
> >
> > -K
> 
> Cheers, thanks for that.
> 
> Would you be interested in a Github Actions config that runs the
> static analyzer? As I mentioned in the cover letter I think we'll want
> a regression to stop so we can make steady progress. If you're open to
> it, I'll work it up.

I'm pretty reluctant to introduce a hard dependency on Github, because I'm
frankly pessimistic about Microsoft's dedication to free software in the
current political climate that is settling in the US. I would love to be
proven wrong, but at this point I'd prefer not to introduce any further
integrations with large US-hosted platforms.

-K

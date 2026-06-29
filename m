Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311652D838E
	for <tools@linux.kernel.org>; Mon, 29 Jun 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782759683; cv=none; b=sVC/puXCCqBa28pCJpg2CambWcRn+Ktjk0M7blEbRO/ve59wEZ0yHGq4/qaOQybihB/JvMMDQa01/iGswe0kTHo0C9rVPCy3Fm4z2mY3EqxrsAB+MWAOfYVitFUFKCXSq6pTirI6rtnAEeQMs3tLz8jZw9iy7zGR+Z45QH32qUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782759683; c=relaxed/simple;
	bh=hbxFRNmJhzjjb9evgJO3n7QrUv1285ukP4faPv4L01Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1ISf6mF6eyxAa57+wI2IRuz4YIqtuIV/wQFMG8kGOJlJ0PMYEpkhVVn2kyPPqvQ5tnBXUhsvRc/40Jj0a+LeCTF9WGouJnOCwuOPj/7C/I8c8FWnSiKFPZdX4sFlfJ2q8Pc+RsRk6s8pIgK6gRR1IIRxCgwobi3whotGGGfCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VCbVSN3p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VCbVSN3p"
Received: by smtp.kernel.org (Postfix)
	id C85B31F00A3A; Mon, 29 Jun 2026 19:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BF31F000E9;
	Mon, 29 Jun 2026 19:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782759681;
	bh=hbxFRNmJhzjjb9evgJO3n7QrUv1285ukP4faPv4L01Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VCbVSN3p1QghtqiL/EGYuKrl1DeHFa6iwMkecKrCf+qXoy7Zk7I6mVGBhOa28iHzG
	 xbrNvRDmqdUARGL40EyfEihV/5z8ik5i6DLtPcNc1PM6UojIuDgy/mV7MOwcmtMNRi
	 W8iJ47IIQPibkdYf05hbpfK5/Z7onGbUsJ8yyTNk=
Date: Mon, 29 Jun 2026 15:01:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review batching operations
Message-ID: <20260629-pristine-hospitable-spoonbill-c79a3a@meerkat>
References: <55e2fdf0-f825-4c10-ac82-90d73790cb3a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55e2fdf0-f825-4c10-ac82-90d73790cb3a@sirena.org.uk>

On Mon, Jun 29, 2026 at 07:01:22PM +0100, Mark Brown wrote:
> Going through my post -rc1 stack of patches to apply using b4 review it
> occurs to me that it would really benefit from being able to batch up
> operations - the interface is fairly laggy, partly but not entirely due
> to doing checkouts per patch, and requires quite a few interactions per
> series (take, confirmation dialog, thank, confirmation dialog, edit
> message to fix up tree, queue with more if it's a series) so the whole
> procedure is very much slower than it would have been with my custom
> scripting.

Yes, I should definitely think about features that would aim at high-rate
reviewers like yourself. The current TUI model works well for a R: reviewer,
but for an M: maintainer of a busy subsystem (or several), a lot of design
choices would be actively slowing them down.

What I'm thinking:

- tag multiple series at once
- create a playbook for the order in which to apply them
- run the playbook as a single take+thank+archive routine

There will be caveats and corner-cases to deal with, such as backing out if
a series in the middle of the playbook causes too much grief, but nothing
seems insurmountable.

I'm away for a couple of weeks, but I'll refocus on that after I return.

Thanks for the feedback!

-K

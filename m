Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51249299920
	for <tools@linux.kernel.org>; Mon, 10 Aug 2026 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376845; cv=none; b=S/5iDNUihxQVDcskQmiX+o4BUUHq8l7QtKqqGs3uYTW4Ep4kfeEH6SwoKxyMfCybnDs8BbYQZB4OIFMV0oU86oNVeAzyQO5GTu0UuAlnJUZIPQtx4wpUUwDby/N8uz2B+wS8r3wqEQ4mRovICWm58Qv93nDNyGmn3N83Zel1lmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376845; c=relaxed/simple;
	bh=F+LHI5a6nGnD3CSoHYzM0V0lU1zYsvjnUDiWgww5fgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MO8c9dszCIDhpny1cOSZDBXWwlKIgHcPsLdHf18KyYfOpiqttutUMRqGwbYrnKXO0sw1b2Bg3GV1X5UwAS3Y12g0AtWeCM2bDw6bCsxmcEV1QNggR4yw1ABT85R/OFXrqMbSvXjokbUt0UbO6FgrMAwUL+1fC07a62wgRHAkaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNFFXetY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNFFXetY"
Received: by smtp.kernel.org (Postfix)
	id 163511F00A3A; Mon, 10 Aug 2026 15:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BC71F000E9;
	Mon, 10 Aug 2026 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376844;
	bh=0BA8tm+ft+A9XlZwxxn4/mDj2U3dTch8ezh28UIt9k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SNFFXetYcGSZYUz8LcvaQ/gGlxRUEz5K7E5e8UvzwOu1E6xEwp6n6aDOXL6wcDnvB
	 BS7cu6oo8sTzpkzseO+FkvO0N4+lA8Hqn2SuOTPxwEEyTGf62+1D9JzC0H5lpJAV6A
	 /hmVsrilTuyZP1pM2WONizhy9TtYuBSCjdWtGxSSBx+Ks6skZfwlqaitKc+y/pj8ZZ
	 31mg7FWrc5AnB1W809z/3n0hZKclq0gd3mqdt8Ob91mB1XeF3+f9RI0CiyCawj9UDr
	 XUwCzDXHtcEhIB6yExScyb45EUtJOIfhKqWarxB4Ptlq/7bIYMypiDYKVzowNcLvH4
	 9mjJyerIEn9xw==
Date: Mon, 10 Aug 2026 11:47:21 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4 0.16.0 released
Message-ID: <20260810-amazing-woodoo-mink-af1cdf@meerkat>
References: <20260805-alluring-arrogant-grouse-ece17a@meerkat>
 <20260810-urban-hamster-of-brotherhood-0b9bb2@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-urban-hamster-of-brotherhood-0b9bb2@houat>

On Mon, Aug 10, 2026 at 01:51:42PM +0200, Maxime Ripard wrote:
> > B4 v0.16.0 is now available! Install or upgrade using your usual mechanism,
> > or start from scratch with:
> > 
> >     pipx install b4
> >     # or, if you want the review and bugs tui stuff
> >     pipx install b4[tui]
> > 
> > Full release notes:
> > - https://b4.docs.kernel.org/en/latest/releases.html
> > 
> > Getting started guide for reviewers:
> > - https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
> > 
> > Full release notes available here:
> > https://b4.docs.kernel.org/en/latest/releases.html
> 
> It looks like the tarball hasn't been published? Is it on purpose?

Oh, sorry, I forgot about that step! I needed to first make sure that the two
new libraries have tarballs, too, and then got busy with bot wars.

I'll set it up today, thanks for the reminder.

-K

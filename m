Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4D42A7BE
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300354; cv=none; b=oG3qfV8c42rznuKXNfbpT8EubLy7STE5JxMnzmTklqXBOiFfQt5CnOCr7VlNS7KQInyThsQyd6+XrU3sl1WCz7GU/PrfMjG6c0cwKxfxicfGOBOWoqIWWDf7w3sbcc5Jx/ZCOo0IozwJ3wCWy6YXa4nsmUeMl6s6US7O8JaY/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300354; c=relaxed/simple;
	bh=sqjqobOVGzmc0wtjTANLAk+2/6vAenP508KYCMhoFcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA/xPQ6hdjexp5Pgtkaq8z/ozW+kfZ3Nxlvfa2waLdGSV+xHV8MJh1wuUJnsrHF4DLOvpW/tkHcWmrgfgHAgm3/WM5iJAKNybCXPwrbKeiIPVv9fTafLqtXm479j+YFouwPp2K5I4fSW49/l/NpPbnUkHQRT/wOhqjywhNCeJ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLDt4g37; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLDt4g37"
Received: by smtp.kernel.org (Postfix)
	id E44241F00A3D; Fri, 17 Jul 2026 14:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFB71F000E9;
	Fri, 17 Jul 2026 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784300345;
	bh=jqO8twgIc7mmyjJB065GcY7tYDP3tgrQHgzc6cozfOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NLDt4g37og+2ZkKSx3qeGES5WJ+EGwP+vkB+1/hDrJ/qAF8XEkKqWmuTJGkwfdIkY
	 KFQPE0r+Zr7lXsifz3XYGDCgZTmMvkh8Hwiiz70yYYDCwNaa9J3QnSfIPI6hs9Flne
	 ALQkPN4XJZE6rqheDSv0XoDyNlUsPFBq4Oov4jugxqujpz1t/WMjhfxVB+tnNZh98n
	 Cu/8F89JmK9WRAQrWURhWSvHkgOXvSGfwP8muBznQ3gCMCY9kRfJS/4SeVJ+aXfGpk
	 3mUVUF9Bz7xy4HdHU3pDw7FGduH54FSguqYKrXFFDoW7mEBjJohqig9PHCc/7YFVS8
	 E8WUHtKLakddg==
Date: Fri, 17 Jul 2026 15:59:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review animates scrolling slowly
Message-ID: <40154af2-c28c-4903-a9fd-bd7f4f986096@sirena.org.uk>
References: <985fb687-8990-4112-9e65-3701d35c71b9@sirena.org.uk>
 <20260717-smooth-petrel-of-champagne-2039cd@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BgsTPrMmaBa9UuK1"
Content-Disposition: inline
In-Reply-To: <20260717-smooth-petrel-of-champagne-2039cd@lemur>
X-Cookie: Enjoy yourself while you're still old.


--BgsTPrMmaBa9UuK1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2026 at 10:14:51AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jul 13, 2026 at 02:39:34PM +0100, Mark Brown wrote:
> > When moving to the next review comment with , and . b4 animates the
> > scroll at a fairly slow rate.  When the patch is large and the review
> > comments spaced widely apart this can become rather tedious to watch,
> > taking at least tens of seconds at times.

> This is managed with TEXTUAL_ env vars:
> https://b4.docs.kernel.org/en/latest/maintainer/review.html#disabling-scroll-animations

> I suggest you set this in your .bash_profile:

>     TEXTUAL_SMOOTH_SCROLL=0

I'd push back on that and say that I can't imagine that anyone wants to
spend a literal minute watching code scroll past.  I think the scrolling
is fine when it's for smaller moves but it should have some sort of time
bound on it that adjusts the rate of scroll or turns it off entirely
when the move gets too big.

--BgsTPrMmaBa9UuK1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaQzUACgkQJNaLcl1U
h9Cfzgf/XemR8hXvv/fG9/fJxOfsrGKvhNbJcmkKIHhWupWXu0TvEryMqvy/Jq6E
ghz3X2VDrx8B0xBlTX1+0pyQ26iJLAflhFo13ITnkrXkBi1+MCND4EXv4ZcQQDZt
pb1iocZH44iWiajFjHfzE6ftL39rJ1P8Jr47hZGqT8rVfwWGskGCAw84EtXP4yzd
UOF8bbYlW0LbELAMpHuTd8IjBFMkQYI3ctVeaQ1U3ZR0G4SOqMQHwMN1pfq6f9wf
QMbZS/VSxn/qalcnDvZoE7CCf7sB37NToUglIv7dWIVA6/+W4sPv9RjkkxLGxjVF
Ag+IlrFrusbdMLb7lpWb01uYDR/NWA==
=f2RW
-----END PGP SIGNATURE-----

--BgsTPrMmaBa9UuK1--

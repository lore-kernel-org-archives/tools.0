Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3539EF2A
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786102; cv=none; b=aO1bfQZ5ndNXo77u0eAoNmJY6aJO8gg+3WzktdEQqNUKBEAJC7oW7mQt+hLqHjDVmyk/T3TI2aCCucxgW98sQVMuVoDxSEdgA3DgffzHSV8DsJgERbkwt2/94DsNH6oYNohef7lRVCGfoBckXN/qqVVkDGbnE/6MN4ISxxEGT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786102; c=relaxed/simple;
	bh=6uslkrKVrxFrbwvVSnQnUTPfDPdzkslB+eZ6CupzWRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwvyAjWqqGdUQjqcMQEisPDYyfU7PDda64B51cyiF2SOzAQI4WRqtftYN03Zd0Hw5o0B2afcIN2LLMSfBlYYNBrSF1qTGmy8GWiip5iHsrqh6tlmf8bQEUSDN3oa2rcNsRYvyE0Qu9BhHlMdPp/kX3jvcW0oguMFBvg2SgMpNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/6bHNWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/6bHNWj"
Received: by smtp.kernel.org (Postfix)
	id 22E1AC19425; Tue, 17 Mar 2026 22:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E51FC4CEF7;
	Tue, 17 Mar 2026 22:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773786102;
	bh=6uslkrKVrxFrbwvVSnQnUTPfDPdzkslB+eZ6CupzWRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/6bHNWjDEMIhr6GDAJ5oO0THFG1KCnxJFYMQG5TdWTezeY7qjBI3Y+gwmqwMg8Xk
	 ZRDVt80U1WTL4rllm1Ml4zdeTUaI2ea85Lr4OSVNXSFXQVQavxbzTYEbuH6oKLNUUL
	 5aE6FS0GzLHDwrPgZmC9Bj3qEDvf7+grUVHHMzKgg/dhfb1YvTUDPJQLVsDjTIuTrA
	 KNRTgTIdRxbdUnTOl/VITWPoBkwmYuObCt6X+aKG8OgTyAk0wUngyWtYbJfou7LRep
	 XUp8Q7SyTqfPbEz1LGwsk07TyBlduHGndXa2T3xg1nKxTq/wcx75vbWVpUq/5740VJ
	 A2BVvuM1WX7pA==
Date: Tue, 17 Mar 2026 22:21:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: Sorting for applied and thanked reviews
Message-ID: <f1fed64e-bee8-469f-8a83-da8e76f9e958@sirena.org.uk>
References: <4547f513-9e28-4f5c-93d1-823e70b110fc@sirena.org.uk>
 <20260317-enigmatic-acrid-corgi-e9bee9@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfQ65Uz0tbqUIAK1"
Content-Disposition: inline
In-Reply-To: <20260317-enigmatic-acrid-corgi-e9bee9@lemur>
X-Cookie: Must be over 18.


--wfQ65Uz0tbqUIAK1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 05:03:51PM -0400, Konstantin Ryabitsev wrote:

> We currently split all your tracked series into "action required" ones at=
 the
> top and "action not required" ones at the bottom, which is why all your
> snoozed and waiting series are below everything else. Within these two
> sections, the series are sorted by when they were last added to your trac=
king,
> not by most recent activity. I used to sort them by latest activity but I
> hated that they jump around -- if you have 5 series that you're working on
> throughout the day, you benefit from visual memory if they all sit in one
> spot.

Is "last added" last update to the series?  I did notice the order
seemed to move at times.

> I was expecting that "thanked" series would be prime candidates for archi=
ving,
> which is why they are kept in "action required". However, it's an easy ch=
ange
> to add them into "no action required".

Given that I'm using the queued thanks feature things sit in applied for
a bit before they actually get pushed out and thanked, the sorting of
thanked mostly followed from expecting applied to get moved out of the
active list while I go through other things that might get applied. =20

I'm not actually currently archiving anything because I need to sort out
how I sync that between machines (which is one of the things I've jumped
on b4 review to solve) but that's a separate thing.  I think I know what
I'm doing there but I didn't actually do it yet.

> We can instead differentiate this into:

> active:

>     - new
>     - reviewing

> action required:

>     - replied

As a side note b4 is picking up replies I send with other mail clients
but doesn't track them as changing series state AFAICT.  I'm not sure if
this shouldn't sort into inactive (as waiting for reply) but it's going
to be more a case by case thing I think ("Thanks for doing this, let me
test!" vs "Could you clarify these things?").

>     - accepted
>     - thanked

> inactive:
>=20
>     - snoozed
>     - waiting

> Does that work, and how would you sort these?

That would work for me I think.

--wfQ65Uz0tbqUIAK1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm50/EACgkQJNaLcl1U
h9CnZQf4hpepK4HaEaRNtAGgp4WxicUj2OO2630RyeyXt5yuvQmPsuf9CEDNmlB4
sdpapAsW4SqiFw7oxhIoxb27gDXcdSjFQ2tF1+T5A+hG7Ke14r+j/LXakLc85OeL
Ms6yeDfSx+jc10brINXLxd/yhsoduoqs8oyKq4rRonGHoQUSgxHCTpjogpCRbr+a
SBguFL1tk9CBrQBhSp1ctsU6iSbja+frsM5MfT2xtGyCpUEQgj1YEkYZf/DVYOEb
Hx4yR7t6RcDSAPrZekq7N/lpOMtUqGxjfso4MCWpfK7JU0izw3CwqkdG1yHaEvfz
dx1iNw6nF9HrZny2tx3yaakGVOL8
=kJin
-----END PGP SIGNATURE-----

--wfQ65Uz0tbqUIAK1--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0676344044
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302946; cv=none; b=Yszxqy83PnT6sIVq1h1A4XEyH7b/+QRKoGVDl07ll8oBfBagftBaXAhvuTRmUyS3td4U3zPiFbYb4n2aXPbxhCU+4RXOpFBgk6ouTQPoWOM/BGJRzhMimh5QNDzuPg4ygwrF15mSdLyUyFwPmQ5ZlMHRZeS5yP4MQt3xmQHN9Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302946; c=relaxed/simple;
	bh=YY+Je27CQ6Ncccm5N87O9fFdpsPVN2KTirw/ZjDsWmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAFi0K14MZmgCwRoUBTZ+9kKeft4mhXwH7G2FboF6OF5yA4trzbCZXWZCN5FP5BvYOfvTKVI+pDwqBG5nrNq5KlKgkIJEr+KPHsslZ2v5kzIqYeOhjurckElVEObHk5EsOGzXTChW0DrIadJC4vfOcwwd5u8VSQhm6zV/892usE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw24jZyJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw24jZyJ"
Received: by smtp.kernel.org (Postfix)
	id 70A721F00A3A; Fri, 17 Jul 2026 15:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB5A1F000E9;
	Fri, 17 Jul 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784302944;
	bh=z0cPT2V1XVkGpgpNIHx2sdnOb9DZHe2rAkrgr91C/ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jw24jZyJ0Lo/tnAHYoazc8QIGKk0dG/ktA2g28q4+4JaOcdwyz9cemaYlHVZvDvgH
	 DEmGZ0N1nSwvvJBJurjZ9ukVY49sk+5OuRHG+wKZFlbKClnr2ofk+ZSdBob+cKbcuJ
	 IjtZGmPJNv+jhygd59C9gTaEh/IaiKn5L2zZtqewkYCjpKQv4k+RstxO7vIIkCBzFl
	 FsU+BS/ZqZrckImkAAGSc5RLPOZjaAfz8lDuS5YXNs22jLUdTo6fup+YL3yQalblYf
	 e8xp2qX7URlF51/I9UJOmMXj18bmwppk2itOxdMOGSMV7OeA7r8QAEC5pcNQinufDl
	 50axSQI74J0qg==
Date: Fri, 17 Jul 2026 16:42:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review animates scrolling slowly
Message-ID: <ae49b85f-148e-40cc-be27-bfbc72ac0886@sirena.org.uk>
References: <985fb687-8990-4112-9e65-3701d35c71b9@sirena.org.uk>
 <20260717-smooth-petrel-of-champagne-2039cd@lemur>
 <40154af2-c28c-4903-a9fd-bd7f4f986096@sirena.org.uk>
 <20260717-fervent-barnacle-of-painting-9a5f74@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V73EKUSUn+jKtrqe"
Content-Disposition: inline
In-Reply-To: <20260717-fervent-barnacle-of-painting-9a5f74@lemur>
X-Cookie: Enjoy yourself while you're still old.


--V73EKUSUn+jKtrqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2026 at 11:17:45AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jul 17, 2026 at 03:59:02PM +0100, Mark Brown wrote:

> > I'd push back on that and say that I can't imagine that anyone wants to
> > spend a literal minute watching code scroll past.  I think the scrolling
> > is fine when it's for smaller moves but it should have some sort of time
> > bound on it that adjusts the rate of scroll or turns it off entirely
> > when the move gets too big.

> Can you let me know if setting the following helps at all:

>     TEXTUAL_ANIMATIONS=basic

> We can switch to this being the default mode if that's an acceptable
> middle-ground. If not, I can look at turning off all animations in the absence
> of a defined TEXTUAL_ env var, but this would be fighting with the framework a
> bit.

I'll try that next time I've got an affected patch.

--V73EKUSUn+jKtrqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaTVwACgkQJNaLcl1U
h9Czfgf9FpFvYwo/VmlN5NOqgR1uNqjjFieoTJhkKC6j+prVuQnCsUFCXUrAy7wk
MqAKgjP6QsHiwJXZwrOZfTXXh6Ml9uaMHEGnN+u3eLm7wBWmWryYKontlbECwueN
Z89xRpBB/NahIl/5haVKVQvt0fepMoa//xpXhykau6juBlPy3FFXi1EygWRRSHQd
ZDZ626b/aH09ppDtKv1Ff8AfyTfQeY8nEguNOaZaDCiJpHyZtFXQ6vuDcp40xaR7
m4ooaPhgoUguitFCFxeXiANUa0dQVySKTPW7i8/dG7AA4tGiC6SmodBLUVpkHPvs
yJtDgiluzIdrih/+FIxBAuqJXhM+ZA==
=23Sn
-----END PGP SIGNATURE-----

--V73EKUSUn+jKtrqe--

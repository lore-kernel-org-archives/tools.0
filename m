Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736F3659EF
	for <tools@linux.kernel.org>; Fri, 13 Feb 2026 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771005201; cv=none; b=bD+SxS3RQAT8ICJF+a4xFTSS1UwaRn4D5hJTgyCQKUeGGCjFcZimuDW5oRq5rcRrXmTU+rt4Qfo2JN/WeZFs+OnP30+6jDpQZCHj2JYb9BCzROU6IyI858qmjqGiHd3SYrqDwHRbku1mGz7h5Bwgecyz7WSqEh49OV//vpi/npw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771005201; c=relaxed/simple;
	bh=n5l6/lwzzS998qJ88JU2MHPWaVXFwph2WCL/4hPvJ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CxWdNhL2i02ibIClqFIoXyHJIHSSlReodkBQprPDY8s3zc/bIj/hPrOiRcgxs2/tekpQxjgCxDtGOTzgvo5DrFHib5W0OzGpysflNeXYg6IxTVT0Zxj+JntOsqeIMEljMVwfmHcN3OAZaeqkiA5VGjpU0H60UTfu1ziYPfih/OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pha2sKIX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pha2sKIX"
Received: by smtp.kernel.org (Postfix)
	id 0C2A6C19421; Fri, 13 Feb 2026 17:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC71C116C6;
	Fri, 13 Feb 2026 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771005201;
	bh=n5l6/lwzzS998qJ88JU2MHPWaVXFwph2WCL/4hPvJ1o=;
	h=Date:From:To:Cc:Subject:From;
	b=pha2sKIXoDTQObx/mJQIUCKJ5hFk/Xm8dsuGCHF8zyYQBsn5qyW5lEnTIZEFeWuUZ
	 g7C253ZtgxFi7uqz0MUxuI+H/abDxaCFg9/mVeokaCJMumnucEJxpt8c4Tenh8ZMyO
	 7bTmMlnrz+40axblTtkLFBQBAxPIONsBsRn+lMb/Ny+5oDtvcLyx4xIoaiES4qkCHt
	 5VrofmZZxufvsyRvabZTREHAABZThT9wjsjA1f/ItfQLxZ8PXkZ7QKEtigwRzc/xT3
	 KpFM0SdAnd5HzKMbp9Rz1WHYAXT13PpAKkZctWGAyftJ1W0i0/8BIJbMpF//wR5IU1
	 5Pv4fRSxZS8/g==
Date: Fri, 13 Feb 2026 17:53:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 dig not finding commits due to alternate sender emails
Message-ID: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CzheEfTyW77jk1l8"
Content-Disposition: inline
X-Cookie: I have become me without my consent.


--CzheEfTyW77jk1l8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I'm seeing a bunch of commits that b4 dig is unable to locate on lore
due to the sender using a different email address to send the patch to
that used for the commit.  For example with:

  e48e16f3e37fac76e2f0c14c58df2b0398a323b0 f2fs: support non-4KB block size without packed_ssa feature

the posting looks to git like a non-author send from daeho43@gmail.com
of a patch from daehojeong@google.com but since b4 constrains based on
the commit author email address:

  q=(s:"f2fs: support non-4KB block size without packed_ssa feature" AND f:"daehojeong@google.com" AND d:..20260118)

we don't match once we get beyond the patch ID searches.  I'd expect
this to also hit for actual non-author sends but the examples I'm seeing
pop up are all one person with multiple e-mail addresses.  Not sure what
the best approach is here...

Thanks,
Mark

--CzheEfTyW77jk1l8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmPZQwACgkQJNaLcl1U
h9Bcwgf8DTeyyL2VUwUGVVmhOf0jYiNaEl1gxIQqWFjg9mzsWAyDLZfJTQWr6MGe
1fBiffJuOz6J5jBy8bVLTzNFqjh/En3LBvvkWQpyckFMGPdepn36ucpg2Jyd1Knh
goKlLhuaDqiMvY1u+1lGwwZg+VuL6gL8ZIO7kpI9r/h9fj8azL6yi9UsvyUOrmsp
gmR7nhR3/TIw/2ioNJp6SUg2eU/6thiMQnAf4xpHrT0kjSBKjlg21VAD/oer+3Pn
HCifGfwvZfwLYPhdiapazg5ROUPbgHerA4QarQlxIWsjl/WjiQvKjq9loe/TWdgf
Rmk7nJxAIphCbgwe2vGxXdVzxttJ8w==
=eYoF
-----END PGP SIGNATURE-----

--CzheEfTyW77jk1l8--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE570145B3F
	for <tools@linux.kernel.org>; Thu, 16 May 2024 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863512; cv=none; b=oG4ZgQYotKN4DCZTJ/hrAOLD0ZW7XeVusjZG56Pomz4ZcTuBduCu6yaCT45YMv73viheB+e6sqvn8jPgGFj2T7Cc9V4MyyJ6/S85cGQ+Y9fl2X3zyHbtd4FC1JooU0DR+9+/+8Zr1QxyeyDRaPHuh4Uc35nuwG4i/I5FTXKvXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863512; c=relaxed/simple;
	bh=zJ4t5KEEe2df+I72/EBB9u4wYvrIAxgeJgL9vFAwug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsBhHuv7jA+xEtLeEgNnICvh7CZnsqiUngOxJHuRfoIL7NDB0nWmJtM4C6Z1DAaHRIfufxr1k1xQ4aeLWnB/6PE83tUs1CAltAeGLMrdnEq0r0Gdq5Kb2XSIsRGTJtES6LAE5XclBs6llyrVGpLJg6FHns1mXTKoyDpjdIhN17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWNYJcWZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWNYJcWZ"
Received: by smtp.kernel.org (Postfix)
	id 7B273C32789; Thu, 16 May 2024 12:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29298C32786;
	Thu, 16 May 2024 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715863512;
	bh=zJ4t5KEEe2df+I72/EBB9u4wYvrIAxgeJgL9vFAwug4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWNYJcWZf7J0LgdwF+G9nGI8B5RBk1YJXKcearvp7Wja4Yr7cYi5Rx47wLyI5CQWU
	 AboES3aCSeW6V5238HuSwJT7ZQuDo4nZU+FFTIZ2GCxAr+gONTh2u3aGcijp6EZQ+X
	 shT6YI4pAQz9TjWVR84XNgtE2g6dm87cnl8zNXC3BNmyGN3uVRr9PLkt4uOeE+qZU6
	 hdsfPIVlbVtwEsY8XAYMnG8XEAltCeyu0bJbxUynIfSl+5MFmXUA/jX8Yzctschmbv
	 D2UsSr/chKVzkbRf8XJ59mYgVxQ2/9x+z/JbpVf83kvBqkhumyhFzMc7JGTXG0Tf3E
	 LbsiXTqTrLi+A==
Date: Thu, 16 May 2024 13:45:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, tools@kernel.org
Subject: Re: b4 one key git rebase -i
Message-ID: <e1d383a0-2b01-4635-be51-6707587422af@sirena.org.uk>
References: <b483c569-66b1-4a4c-913f-3b60ebcd1743@app.fastmail.com>
 <b89ad184-f920-4f6f-af9c-59ff9ef52b8f@sirena.org.uk>
 <20240516-glorious-crocodile-of-adventure-4d5784@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4wwrmXx+Na2AsoH"
Content-Disposition: inline
In-Reply-To: <20240516-glorious-crocodile-of-adventure-4d5784@lemur>
X-Cookie: I'm having a MID-WEEK CRISIS!


--v4wwrmXx+Na2AsoH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 08:26:14AM -0400, Konstantin Ryabitsev wrote:
> On Thu, May 16, 2024 at 12:53:06PM GMT, Mark Brown wrote:

> >   b4 prep --show-info | grep base-commit

> You don't need to pipe this to grep, this will work, too:

>     b4 prep --show-info base-commit

Ah, most of my scripted use of properties is checking for specific
values so the examples that turn up include a value in the grep.

--v4wwrmXx+Na2AsoH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF/9MACgkQJNaLcl1U
h9BMwAgAg4ICE8EFqE3apLI+ETtFHVerRZQzHWM1Es5jvliLbFgMKXqFuyEn3O9B
szAOA4XUw12eVrEDx38bcAT/vBhdBg5QmrcJu4HuvHX0B/YAVXqoo+IYHvLfSqQK
5L+93inu+009i+jZWqn1f8URtUTh8OFZtxbngMzhrDF0IxW4ZQyiaX7Bq7BDJYzl
F3vmX4UjfzTv3hjwkTTFPNCx8bt8ZASWj++Lz1zYVciF7XoiTxW0D/GWbyZ6unyR
rOLWEglUz8Wl/xwREZ4hY+XbLL7sgiChSC4YpTdX96E186qpNZHouWz60+IEcqOg
gXL3aivzac5hGBHi/S6j8Vn7MG9UiA==
=dfbn
-----END PGP SIGNATURE-----

--v4wwrmXx+Na2AsoH--

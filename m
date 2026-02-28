Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272663290C9
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772298775; cv=none; b=lCIvpMi0K4yNQGOu53h+Dd9YQ5/F9MLz02m6OLaQIlqVLXHFlptXT2aFHdbcBX6i6PMc0vx8+Sr1eGtW+LIaF+TbjhP8BJy81IIAWJhGaUHdudahKtXzuEvzB965XYELoLRyZDCuKtryJN7cWnKTVx7Iq+GsSO6m3n8sinRThac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772298775; c=relaxed/simple;
	bh=361NBSgnf5XbBGcsEXfCH7+2L8mNeLdGGsuCDS3Q2Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4egYcwMzZEpellNnq45MikEcXfzu6pXZiV1E9zWlmhVLvqeQZaM4LTe6BVGrxBbkBeAVBwDS3IhvTcnZ5KEotSWhScZdvimsFVQf88nNs0/2jqDmBYO4A8Wlfi26z9RkB1UTM7A4/RWVL1r7fnX7rLH06FDAZChHGFZmkzKtpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQWqV8Qo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQWqV8Qo"
Received: by smtp.kernel.org (Postfix)
	id 81B4FC19425; Sat, 28 Feb 2026 17:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B121C116D0;
	Sat, 28 Feb 2026 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772298774;
	bh=361NBSgnf5XbBGcsEXfCH7+2L8mNeLdGGsuCDS3Q2Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rQWqV8QoGAewfpUsEHzM5XWJEGZzv3kCJ/u8HA3oY+lnklc4qwF9IFSW+qqT4gCEA
	 yohuezsgLzTzepJmueKke8kMJAQA9uWRxlVz9jYEJLVWp/WfnfF1cjyfUyfLuwUqJu
	 bEwgyKWesnhuCEiaStoeGkpeRQipGbCTmkZyLWv6QI1kPYRQciXu02Zy7reSiG07W7
	 fW7K5EQ43S5KC7I9li4wz3kiYWSCDJoe+ZzzqilaYoaqk5xTZPHqvL0pvs+A6/N91+
	 Yh+EiZaC3bhIAv0tORALhqGts1psPfI6DMXyUTA1WwuvrRBYkg4KJomb+JDrixxX+Y
	 UsiagRIuaEZsQ==
Date: Sat, 28 Feb 2026 17:12:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-aqueduct-nuzzle-c03be63e03af@spud>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hwLHH2jaG2Q3f/Vq"
Content-Disposition: inline
In-Reply-To: <20260228-ruby-hawk-of-valor-41f0b0@lemur>


--hwLHH2jaG2Q3f/Vq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 12:05:57PM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 05:00:10PM +0000, Conor Dooley wrote:
> > Am I just cursed? This is on 9ca5b4f review: escape remaining user stri=
ngs passed to markup-enabled widgets
>=20
> Did you remember to completely exit the running app and restart it? I swe=
ar,
> this should be fixed.


Yeah, not running according to ps anyway.

--hwLHH2jaG2Q3f/Vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaMiEwAKCRB4tDGHoIJi
0txwAQCUZhLbV073C0zE/2x+5iJ7I5XSRNo1EAW0q5QoEqulzAD/ULagptrnaz/l
tlC/yKMzVwsUZjzd2vq3duR/PwLAAQM=
=SNFB
-----END PGP SIGNATURE-----

--hwLHH2jaG2Q3f/Vq--

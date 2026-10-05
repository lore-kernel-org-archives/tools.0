Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11CE443E3B
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202795; cv=none; b=a1tK1xiOI8FpmLYjHAV0LB/B3CHY9xAgykn0nZb1qdZVIaCJsf9txNXjhAx0pqvZ4/4d/ev5STZrhp8QNr757YsTBiYCa9ub91eLlk9R8aJP9JT0yuOXWGCKj7HN4ITvKLcNDzx0oZxRiOK0CI18lCrewoerg5DswO5l9FoTiP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202795; c=relaxed/simple;
	bh=s9G808y0YJ5KJHux2Rr8g0WAc7Tgi03RNvMyXZdk6+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FupYn9cp8pNiWgWIch4HGcY6oKPidmvKj3XJTk57VQ1+ZIvCUWGTQ8MGEWKg1Dvj0JvOdNurHuO9pEX45ItQWbiuZC6Ry50QuArI/SZu7eN0OpHQOMiOs/Igz6CAW0lrCL1EQt04gejgYcXNB1oEGW8au/eA2hUc+TjB/3c4H90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/151lgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/151lgv"
Received: by smtp.kernel.org (Postfix)
	id 8D4D31F00893; Mon,  5 Oct 2026 12:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E960A1F000FF;
	Mon,  5 Oct 2026 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791202794;
	bh=FWYIKY7ajuZ0hnhTn+7mRfNY86zaTP9a8BaKE0DrtDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b/151lgvQIv4Xr78TlYnC8d/UEdw87djcn2wdlkrllzbsRKCGqV6/pqHEebm/3aOu
	 3TeVmEyHUwFRXYXbYjO3Ec/T+5aXUGmzjelE000129JFZX/eeJ+5btrqmizF/nreMh
	 YdDilpKsLT5Qs2y523tSYNBNu2JY0w9E86o216a2bJI5RHGkIYaSuUg0iqyXPHK/El
	 ir6PZovVPX7MzbS/MPSSw9Vwo+Up2FhemPS9KcCG4eos43/2aZ78N8rS++8+ENU8DQ
	 cXmOxrQsDTO+0Km56NZxFTOc451tJwf8YUnHVEjdD00qbd7bmL0Frr/vhSWgFjKxbs
	 oOmnvf3+8tkFw==
Date: Mon, 5 Oct 2026 14:19:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [PATCH] COPYING: Update to current FSF address and boilerplate
Message-ID: <asOVyMd-gNIqFWF7@penduick>
References: <20260916070306.2361370-1-mripard@kernel.org>
 <179119181264.1730306.3029163794938630210.b4-ty@b4>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="o5gva6arzqmajvqf"
Content-Disposition: inline
In-Reply-To: <179119181264.1730306.3029163794938630210.b4-ty@b4>


--o5gva6arzqmajvqf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] COPYING: Update to current FSF address and boilerplate
MIME-Version: 1.0

Hi

On Mon, Oct 05, 2026 at 09:16:52AM +0000, Konstantin Ryabitsev wrote:
>=20
> On Wed, 16 Sep 2026 09:03:06 +0200, Maxime Ripard wrote:
> > COPYING: Update to current FSF address and boilerplate
>=20
> Applied, thanks!
>=20
> [1/1] COPYING: Update to current FSF address and boilerplate
>       commit: b3f89f0bdeb7854a1c3fde1c57edff20e1fb83d8

I saw you also fixed it for liblore, it also affects ezgb

Thanks!
Maxime

--o5gva6arzqmajvqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCasOV5QAKCRAnX84Zoj2+
dlTvAYCv9WRJ33uHxNpEy1B/gUjHXbJFlQHlVnjZzmhOgVBRbKw7l8+O9GCd6hkh
iTcTEt8BgIsrBYVU0j8YOAthGqACS00LFufoHWaz2qGXCDn1iZUuRGvBAZpYLb+1
0KfeYZfpfg==
=eRip
-----END PGP SIGNATURE-----

--o5gva6arzqmajvqf--

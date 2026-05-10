Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B781A9FA4
	for <tools@linux.kernel.org>; Sun, 10 May 2026 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778419374; cv=none; b=LNtsEx5jThieuJVS0EgBMn34VlRpLleIAMl6XSxmZTT92/VGbI4KP22FZOGR2/JW6rv6S6Hoil+n+SS4UV3bkemY3tA617cyiwHB/URzXIGHhAqGiQOOH/utKr/10oowVWAF5RbbuxUZHmC86SGjzZ5o4HTGy0CUXrG3VJxs+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778419374; c=relaxed/simple;
	bh=NXne//7tzwu9YAJcHO6Sbb59nLAZRFMhF190tfLDAr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWlc0h1ka3bd+ii659mResbHsty/hWvrcn5Reub0fbwSBsVTKmFp58u4x1MYI/lwCGfbd8sYodYk1OL3gacN7ZJwUz8C/4bNFitFq+LoSyNQYYOmq3eFBNlOU0Qz1UFsDPZYpGYSVTBDPHS38bi6mEZgo8TeVrzw0l4sbJjrPPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzsnOBJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzsnOBJn"
Received: by smtp.kernel.org (Postfix)
	id DF805C2BCF7; Sun, 10 May 2026 13:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F73C2BCB8;
	Sun, 10 May 2026 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778419373;
	bh=NXne//7tzwu9YAJcHO6Sbb59nLAZRFMhF190tfLDAr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzsnOBJnMNcRptX1Fi4dQJ8fq6WPNSL6iGXVSyR3fyIVjMGafPAA8vHWN5FD7uno2
	 i1qUrctvxebsPNZC/UeOzb3Tx7Pgs1MJ5hKktxkNWH+KizZXuIYmo8DubTXqk53Slt
	 Z4mVIbanD9EDfSStY1t+jXSMF9yr6mgHgjimuGfIghxSMfDJgdfEHWYPk5kYnxbYZa
	 HSDQDmvZ79LS9fB8EIl/ou7o+VtfLmih58TyZ/4qc9BtzvH+HvBOSSwY29vMNgygP1
	 f5nmAd02dsEKHuKa2cVO6W9luU7nVBDp8E5RC7wQ2EGAt4Tx7SJFPWz3i5zyzFTJo0
	 0hWr4sleWMSKQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 361E61AC5898; Sun, 10 May 2026 14:22:51 +0100 (BST)
Date: Sun, 10 May 2026 22:22:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: b4/lore patch ID deduplication confusion
Message-ID: <agCGq3pRQdFbjz4E@sirena.co.uk>
References: <e2416f79-9bfb-4f72-8751-f300e9922223@sirena.org.uk>
 <20260128-successful-pegasus-of-innovation-4cd273@lemur>
 <agCGGdZ9laXFu73L@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+HaLqRVRJhOabHY9"
Content-Disposition: inline
In-Reply-To: <agCGGdZ9laXFu73L@sirena.co.uk>
X-Cookie: Absence makes the heart go wander.


--+HaLqRVRJhOabHY9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 10:20:25PM +0900, Mark Brown wrote:
> Hi Konstantin,
>=20
> When I say
>=20
>   b4 review track 20260510053939.564314-3-enelsonmoore@gmail.com
>=20
> things get very confused and b4 tracks a different patch with no way to
> override what it's doing, I think some combination of b4 and lore's
> patch ID stuff is ignoring filenames and therefore faceplanting rather
> badly:

The same thing is happening with b4 am so I'm guessing this is on the
lore side (also fixed the subject line, sorry).

>=20
> Retrieving series: 20260510053939.564314-3-enelsonmoore@gmail.com
> Looking up 20260510053939.564314-3-enelsonmoore@gmail.com
> WARNING: duplicate messages found at index 1
>    Subject 1: ARM: orion5x: update board check in mss2_pci_init() to use =
the DT
>    Subject 2: ASoC: ti: omap3pandora: update board check to use DT compat=
ible
>   2 is not a reply... assume additional patch
> Assuming new revision: v2 ([PATCH v2] mfd: twl4030-power: update checks f=
or specific boards to use the DT)
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> Server returned an error.
> WARNING: duplicate messages found at index 1
>    Subject 1: ARM: orion5x: update board check in mss2_pci_init() to use =
the DT
>    Subject 2: ASoC: ti: omap3pandora: update board check to use DT compat=
ible
>   2 is not a reply... assume additional patch
> Assuming new revision: v2 ([PATCH v2] mfd: twl4030-power: update checks f=
or specific boards to use the DT)
> No change-id found, generated: 20260509-mfd-twl4030-power-update-checks-f=
or-specific-boards-to-use-t-d88ef2ad7c39
> Tracked series: mfd: twl4030-power: update checks for specific boards to =
use the DT v2 (1 patches)
>   From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
>   Change-ID: 20260509-mfd-twl4030-power-update-checks-for-specific-boards=
-to-use-t-d88ef2ad7c39
>   Message-ID: 20260510053939.564314-2-enelsonmoore@gmail.com
>=20
> Thanks,
> Mark



--+HaLqRVRJhOabHY9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoAhqoACgkQJNaLcl1U
h9DBWQf+O7vuo7qAuGdRS8oXThwCSCN3MBCfQvQVuzAszVLRX5X/nlkYAvdUk1gj
mGDCZKOqQhI56HFdieB1Du/nD0Oefq37NRVswIXzy0Tnam/c3i2Ieogq2LNu8m3a
CrXeSJF0J1/r+hHfaP/7WgdKeQZpXARzRnj8JZuMjlhptIRkcKbq9Liobv5vIpbp
rBZsHaMvia4f+C9UdqVC9h0kbUO1devnTm+oXsGc5Y8Ej38oxkW57ClzxvSp+mlw
GY1TsQFniYNquYRLaLVVRKo2Diu8he2hKXhOFIXQKizLf9pUo6aWe9lqKwLlL+Hk
orXFiPe9b8uy3hWHXLFE4KzWYavPKg==
=mz3g
-----END PGP SIGNATURE-----

--+HaLqRVRJhOabHY9--

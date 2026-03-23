Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17617DE36
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274985; cv=none; b=BEGzv2YE5AXteU3ay0hxMlOyGkM8v3uIuz1J5WzL73An8kRsKhrodARgClCpfPDojsMKLp/sBiW/meYGmsUE/xibc1lOTurDbWBMY1s/ZzZ4L6zAUNFLArmFwiN7yYroGjY6oJrrBPtTBfwHCwkrzaleYNQ7F8gpVSJNMyyG0qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274985; c=relaxed/simple;
	bh=eCuzLQhzLjZeb7dttgpom+hLDmD4pwAETshZGPc01hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJgKAB0sTwXAZSqA5MzDDNECmVfyfqVXwOvnWYLJR+Nv5OvmNDcxEVFHHsBTsbLZ+YArxS9JFYfvP3ebMtbmZy3dZnQeHSvXnMOUfO1TMBsExt5ITazY4eTQatbxAwKb6v/i01EbiqQJLYCccZy3ZIQLd7R/e//9tbmcJlsoGrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlVm74Xf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlVm74Xf"
Received: by smtp.kernel.org (Postfix)
	id 89741C2BCB1; Mon, 23 Mar 2026 14:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D007FC4CEF7;
	Mon, 23 Mar 2026 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274985;
	bh=eCuzLQhzLjZeb7dttgpom+hLDmD4pwAETshZGPc01hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlVm74XfKi34mR7J+UjPz6i2qn1jHSOd3kbRv1a699YnK0uE7NE6tBx0SN6olRsUv
	 uHZDeMqb0o0F/6pijbg6nyvsfug24aeVgHNbg4dBhdnU8un5TwOI7HQzopE5cib2UB
	 i8rkhKS1QegPCcTjBTKYcuKzA20Dt3G3HyBnETbazf+gJXNcEusVfkPuqIWvfIfZiH
	 ftrU+8cZepFHUKuu1R+P+nnVa6L0Bfs5AQVYnjnteSABJqKZHXzxeI3s13EMdLhAan
	 6U4hqrBroPQie33VBczhoSgd1TirOBeNXKXolbYGkQzICcjK6n56r7cFsILW+5bNEy
	 pINPzTNQGtC1w==
Date: Mon, 23 Mar 2026 14:09:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: Stitching together serieses
Message-ID: <d4e0d4cb-73e6-4458-8418-872dde585ddf@sirena.org.uk>
References: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C+IB/GO7OVpC9c/F"
Content-Disposition: inline
In-Reply-To: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
X-Cookie: Avoid gunfire in the bathroom tonight.


--C+IB/GO7OVpC9c/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 02:07:13PM +0000, Mark Brown wrote:
> Hi,
>=20
> When users send a patch series in a way that doesn't thread such as:
>=20
>   https://lore.kernel.org/r/20260323041505.2088-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041545.2101-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041624.2120-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041641.2133-1-niranjan.hy@ti.com
>=20
> it would be useful if b4 review had a way for users to tell it that
> actually this is a series and please treat it as such.

Not just useful actually - at the minute I get:

  Retrieving series: 20260323041545.2101-1-niranjan.hy@ti.com
  Looking up https://lore.kernel.org/all/20260323041545.2101-1-niranjan.hy@=
ti.com/
  Grabbing thread from lore.kernel.org/all/20260323041545.2101-1-niranjan.h=
y@ti.com/t.mbox.gz
  Could not find cover letter or first patch

trying to track the second patch.


--C+IB/GO7OVpC9c/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBSaUACgkQJNaLcl1U
h9DxQQf/WKTEWUEJXLnpHP0pcJA1fNrmUHB1OZ+2Jg7JZ3IcT4oNPvu/GT+pgQ8d
HddJ71e/EjhDTd1lRjkRz6zf6PqiSTjOMGCtdwJmUTwOieM4686wHqbYBOKG71mW
3pEtdZfBcRgERCntsLZ329QKFk/jt+V6epZ+ke9nikEayO2S98FXzplTKoyy6sMu
oiDqhS5xpvFoyu8sbIGFR1Xkx0qxgK+iaJUU7vuav4ptSjS5H6kCV1voY9foLGZk
smwHOn4LtubwhLDrEsUxOJS1qu9YKDTX9dFVUUPjlTpDgdRULFtkmewh5ZZ3Hf8q
19EdcEcEzmfiwsmdeqrvCbSNIpU2sw==
=WcOa
-----END PGP SIGNATURE-----

--C+IB/GO7OVpC9c/F--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E87D320E
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638040; cv=none; b=M/0of/Lr+bzsoLOlLv4AouHjBcbqCQZkknYXm1FI2aGn9QQ3xiqdCsWEuoNW2TrdGJd4Tq21SQviQUBPrLa1OqZx1vC+NvbT6asduThhyb6N+nBxn7tcOqoM+D2/EMhTEVOSlo+r6kjwGtlCN9XN7V3mlfMTVvSAPIndzz1ceIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638040; c=relaxed/simple;
	bh=YHzyCmbjRgRGgo07OUHWsfCX3a0lL3HsVvGzr0AfBV8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJEeWfEOtpyuWPgNHKH0x/NWoWd8+AFNNAwJYzjFyGRG8macjvpqmXJHPeBLN/KhFan2d5a5MhyOugStyY7Xs0Qh+EDROK6LfeMO6Pxw0f7SVma81JuGJzB+Te4zc8ZJUHhVYEFKwmSywWl9p7IFMVdz7UfAvIFtexca0QjioS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtsiWU/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtsiWU/K"
Received: by smtp.kernel.org (Postfix)
	id 44E0DC4AF1C; Mon, 17 Jun 2024 15:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A7FC2BD10;
	Mon, 17 Jun 2024 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718638040;
	bh=YHzyCmbjRgRGgo07OUHWsfCX3a0lL3HsVvGzr0AfBV8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KtsiWU/KgUw64RCG1HDVy+XbMTusBtJ3q74of4B4lTHwAcSabR+yteiJJfjfuEk47
	 uJcEI8gDL4FBgKipRNtB+FI/UbYSYOdIigHIvYbL+i0q3775wyHXc2yPmtkhUu2gyT
	 0yEj+okM0RnkwscYVpiwsruRBtI5+G6Q65h0WYxmEP4GHiTJQQB0zhRnLwogJSmfVv
	 QUyCsXW7or4UnwrRVobWSa40/qxV68eGz6i1PcLxBKZ0c4a3DWg2pmzBQ8I1QsppMf
	 A5zSNdn6brwxa/GirFtrTap90a769fdYtJP0iUB2Oo0TbU5vvVEUdVBbjy+H7GM988
	 4D6E2PoDEW54Q==
Date: Mon, 17 Jun 2024 17:27:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: tools@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: SIGN output impossibly large
Message-ID: <xhlf3ohbyu4jklovfh775q63vbfkleejvvu5dsxaetm3eu7o5l@wodxwp62eja7>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <aaupe74zijtis7zjuqtvoghbql2tzloabormkos5lzb62doicq@mhr6bfikq22z>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="22lpsk6uwunjuyr6"
Content-Disposition: inline
In-Reply-To: <aaupe74zijtis7zjuqtvoghbql2tzloabormkos5lzb62doicq@mhr6bfikq22z>


--22lpsk6uwunjuyr6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: tools@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: SIGN output impossibly large
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <aaupe74zijtis7zjuqtvoghbql2tzloabormkos5lzb62doicq@mhr6bfikq22z>
MIME-Version: 1.0
In-Reply-To: <aaupe74zijtis7zjuqtvoghbql2tzloabormkos5lzb62doicq@mhr6bfikq22z>

On Mon, Jun 17, 2024 at 04:38:55PM GMT, Alejandro Colomar wrote:
> On Mon, Jun 17, 2024 at 04:33:30PM GMT, Alejandro Colomar wrote:
>=20
> Hmmm, since <kernel.org> keeps a single signature file for all tarballs

s/signature/checksums/

> in a directory, maybe it's that there are too many tarballs in the same
> directory, and I should use a subdir for every release?

--=20
<https://www.alejandro-colomar.es/>

--22lpsk6uwunjuyr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZwVdUACgkQnowa+77/
2zL4vg/+OVLQZY6NxicKGS01DDEURcM+IViiOvRHaBWDjTrTdx4s4hqagjfAPHn0
KJHMOSeJascL8F+fzGMlZm5E5GLqMFXG/gtzwYxIIo67rphxi9iq/XuVfYn9Uh3z
qflRtgsh+QmbbsF4bOVVJZc4hJUn8gYj8j8bj80V6yiFmMR2kCQj0Oh5h6G/t23s
KoLcSHIC8vCyBX5ijhQu/zAwlC2i/PBF+FEeVgG516Z+E1uMmQSRedwXLnFZZKen
7RZSvIivWWIWoKbDz/5gTl86ekoOQKPFEKMo8/41fLLVFdS9kp1rz0SpX4xtQ/VR
ebmH+I9dCn6GGwokCUoFYsaO+IWPQD75/kpnA+ySdP+szrACYIuPGnslDqZZT7Vr
SMJG+MP+dJIKJ/TdL8K1cfYA5iRHor584YHLN2IoLsDMvpjk13VTjrlyGjiT4lIF
5xdQkF/37tNumkUeP4jhE2Os+HKXpq3pLJwRYH/DTba1CToYQPg6gmVQzV6mJH76
8etpIGAiFecG5K88/RQbC9bkOILgzdOjq5xyP7zcchXNAOSs3vlx3277n4X+aBFA
4JJRGFFFe4VcuwkV27SB7DKHIROecOBlY3X8pIWFYWNXH+Os7WZTrnk9ugVFpj9G
2g4537a6cZ6yzY6WBiUsVbRNI00Alan3jCQt3IwsIEeqn5mduCY=
=F8B9
-----END PGP SIGNATURE-----

--22lpsk6uwunjuyr6--

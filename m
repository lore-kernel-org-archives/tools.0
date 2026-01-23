Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288A2F2604
	for <tools@linux.kernel.org>; Fri, 23 Jan 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186630; cv=none; b=ZyyejHDlTb8S4DgE600iS29nGjQM8GDssIaUigYWNeNmRQtfvMVIch6geAhNdIt6w5PGCWsx1gIm0JsTRGbSyjTs28COKCDMp5VIZkPAPONSqWtGML1V7HEZ7NqyU5TUe2yrzqvrx4q3QyTVh/ms+0GkldmBoPQJhqp9hz4Vppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186630; c=relaxed/simple;
	bh=Hl9XkwsWqHcGSP17AtSWgvpjSOS/C/4ctwCrvbB5gY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YS5PA5XFWEfHVtcn4npvo5iR70ulNlzJJA5FRBrUj4M/onZUVooN32acSLD59AZ/UDJEcTFy+4+TF6rDeFFiSeueHJYl5jdoOeRzt9DAjiZP5w5OFz/keG1npo5h8APvpf8KTQ8LH8aKCJB5GhwpsxoYJmz8SxG0309V4pdaWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3Bv1cvi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3Bv1cvi"
Received: by smtp.kernel.org (Postfix)
	id 3477DC19422; Fri, 23 Jan 2026 16:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7436DC4CEF1;
	Fri, 23 Jan 2026 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186630;
	bh=Hl9XkwsWqHcGSP17AtSWgvpjSOS/C/4ctwCrvbB5gY8=;
	h=Date:From:To:Cc:Subject:From;
	b=j3Bv1cvi/V5tAbTXHv6Lis+7zcHSIpVb7ySxSeIwgz2UnTSIRQZ18I0CzS8tf14Jy
	 cqIQlS4W4qQLaMeBu7TJF9TumLnzqBVFyPzIg32bPYgQwy0YNN/dT/RSfhayZq1i6j
	 XI3MPFyLO8iQ3DgyJCNA4JC8eR6RzE7K1NITFjkRXwZTyYnduX+TD8hJbF74aTHBmL
	 DcDSIECGfpEfbYhlnxjrf3/UCJ4fL5c71n5POBXimLrF5IOG8sTlboeq10KNr1SEQo
	 m4F7yQe8UNMprOwYlDn1hMDS7JvAn+1g7RMf2U8ECHA3oPF8PwOMpJFKTHjJxlRU6p
	 L+bTgJVD7dobg==
Date: Fri, 23 Jan 2026 16:43:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: korgalore v0.4 now available
Message-ID: <473ed792-f970-49ff-8a11-ac9d6a82f83f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4jHe4uxBStX5p8Z"
Content-Disposition: inline
X-Cookie: HAIR TONICS, please!!


--o4jHe4uxBStX5p8Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

If I run

   kgl track-subsystem -m MAINTAINERS 'REGISTER MAP'

then kgl medidtates for a long time then outputs:

| Found subsystem: REGISTER MAP ABSTRACTION
| Creating mailinglist query: l:linux-kernel.vger.kernel.org AND d:7.days.a=
go..
| Creating patches query: (dfn:Documentation/devicetree/bindings/regmap/ OR=
 dfn:drivers/base/regmap/ OR dfn:include/linux/regmap.h) AND d:7.days.ago..
| Created 2 lei queries for subsystem "REGISTER MAP ABSTRACTION"
| Configuration written to: /home/broonie/.config/korgalore/conf.d/register=
_map_abstraction.toml
| Target: local, Labels:=20

Given how long it took I'd expected it to have done something to the
output, and the above is not going to DTRT given that it's pulling in
linux-kernel.  Probably the program should understand that linux-kernel
is special here.

I'd also have expected MAINTAINERS to be read from the current
directory if it's available and not otherwise specified.

Thanks,
Mark

--o4jHe4uxBStX5p8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzpUEACgkQJNaLcl1U
h9CPnQf+NTDYKsu4sS2H/tveOG0FZym0f8NPp2Qi2D5yaEKYG0EjZKXphEE3SuYK
LV8XGPrLVaRh71NUQEo3py672HEaWDTzCC9bXJTR54IPAr5VNtGYHyHqTdbaALnf
Krf3Rk10VIhTv7u1FepLQv9WBTPfyzqkiPrC0lew1NJvMPG3e4bKvrjXrjt3ASco
1xI/3y0Cb6ktSJKEcmUBaDKNKy9RxSwtPKr/WICNXhCj5BbkaDW3zM4ON965+4du
eF+T0rEB6KepdYwy9Xz+fZP6S5evq89uTlliDOE4A1/y/4ZYYKcrRFvSr+LJhSNI
7sdePJtP97b5taQzMAq8q/XD5HvDtw==
=wpR5
-----END PGP SIGNATURE-----

--o4jHe4uxBStX5p8Z--

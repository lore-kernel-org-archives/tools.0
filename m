Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E82770E
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 17:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5EAC433D2;
	Fri,  6 Jan 2023 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673025084;
	bh=qiAPLpsA39Pqg6zAUsd4uzMQkcgGznwrACY9wUteFqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkeHJkh/N1ZDl8oG/nxQPoMJlLRl0hpPBn225zD8TqkkkOql481BnT3nimfoku8iZ
	 EhctA+No6OZMJpP+qMoTDR7njX8nzfPTwSbxltzX6eVtLT678cfDSoKxjuc2+Dzy23
	 bfeKQT5+PB/T7JKuVBrm8t07jiAo7D7xoUl/YVyxhPXOrpRc8DHmVJuI1FXn5eaF6d
	 s3aOPF0vVRDukjZQUkqXXIDK1n24liBKM9VEAdPqTZnMaA/7ln+7RDKRbt6/dUYxAT
	 HrWx81FOkIUar+e7i25zHDRyE3pVIjpTTqBSCxu1hCIIlVFQraRGxmU97X49jzuI7a
	 oDFCPwbZeWOwQ==
Date: Fri, 6 Jan 2023 17:11:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 am doesn't fetch all recipient headers
Message-ID: <Y7hWOEoqPsF+Wrtx@sirena.org.uk>
References: <Y7hLWvgqqJCK7+yM@sirena.org.uk>
 <20230106170038.tbdihuu667upvqnr@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iKtbnmqJRgUMoeS6"
Content-Disposition: inline
In-Reply-To: <20230106170038.tbdihuu667upvqnr@meerkat.local>
X-Cookie: Do not fold, spindle or mutilate.


--iKtbnmqJRgUMoeS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 12:00:38PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Jan 06, 2023 at 04:24:58PM +0000, Mark Brown wrote:

> > At some point recently b4 am seems to have stopped including any To/Cc
> > headers in the mailboxes it fetches and I can't see an option to get
> > them back.  They're not needed for the am itself but I do find them

> This change was a side-effect of implementing how we handle trailer updat=
es,
> but it's also "more correct" because there were situations where you would
> send info to the wrong people, e.g. when we restored the in-body "From: "
> committer info:

=2E..

> So, replying to this message wouldn't actually have gone to the sender, b=
ut to
> the commit author.

Right, that's unfortunate.

> This will grab the entire thread that you can then reply to (plus see if
> anyone's already replied to it). You can even fetch that into your existi=
ng
> maildir:
>=20
>     b4 mbox -fo ~/Mail < am-ready.mbx
>=20
> I know this adds an extra step, but this is also more proper, I think.

For this workflow a command that would easily let me fetch a specific
message without pulling in the rest of the series would be ideal, b4
mbox doesn't seem to even have an equivalent of b4 am's message ranges.

--iKtbnmqJRgUMoeS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO4VjcACgkQJNaLcl1U
h9D9nAf+MUP+8znLvLHQP0eeTy584GURsWn1fQy+rqW5cyjA2kypVMrqaGSVcp4E
YRRPYn7QJb9iNj2iw6bg83OCtmtwUWVryc8O0jV9o+he4IZSazs9bfFAQhooWMCb
ljvtaJglRP6dWiBkRgOHBqO3mdlYf/jHNZUqDbkss6WM3ceGkibPLb16GPX9Xj5R
JvogPlghbgNUahqnSmdNHNV5us2ylyX+LmDoBCA1e681XKfH+/tZvamXA8JlM6+u
jEotIXHd8zirX8/oSJvUbIwOShU291tF/lY2dYPw1AU28G+ByGjjwygVeCqvERln
kqyxrEGJElIS31yogvfpZhPWQWxBjw==
=mc7O
-----END PGP SIGNATURE-----

--iKtbnmqJRgUMoeS6--

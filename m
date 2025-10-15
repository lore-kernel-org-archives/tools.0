Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C322D73B4
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540886; cv=none; b=QRHbPtr+Z5WRu4sAEKnmj1SADJ0O+Eh7Fk79CHnauIBh3W1AV+ocofGN4wcbq7i5Z3kGanGDlpCQBz4lBHr5oKHSWxt8Siw7UEYl4YNQg412elB1p+KnvbW+C/5aPkrOy3RMhhP1aIBR1IAnZrUHNZHiPf2KseKrNwAxpCaMJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540886; c=relaxed/simple;
	bh=t5o0xmvugTp2M5WOrZoqjm8gNzA81ro7dWLJq4Ot3m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpMzateFO3dIJOv/BHxIDkAlP0VtWnYXh7THiszI2iF2TOZamTc5ajGT343pu7+wE17P99/h8uTRpi4yfHpW5vqGi4sElaQrqx0wJoh5HsIvn/eA3Osiez1kLPDlNExubgaonybC+LyGhtCtd62yHyaxmfgfnztZHzEIgjkdORk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVBT7cbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVBT7cbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49645C4CEF8;
	Wed, 15 Oct 2025 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540885;
	bh=t5o0xmvugTp2M5WOrZoqjm8gNzA81ro7dWLJq4Ot3m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVBT7cbHEzfQGYMp5jTkO36uFlJXtw+Grclt6alDinNhUAFoNJoW6ME8GYBQFd2QU
	 +oE6DC3Qm0GKFRf6QCGEWxqLbMcnTNo0lVLxLnOw02pv4XQa/h4Zwn/5TdU+7vm4KU
	 16KG53DQNpy4+KxMEmt0R2LXchfzu2Tl4otvIJF6Y0RB2MW2Uz+G/3dVWuD7/XNORN
	 UgQwmhToBXGA34XhbsUZZBvnh8JvjE6yxbgI3jPgq81CZlwgp0mEKcSQmwko61gH6B
	 MsffohfLKmLtjS+5LiOSpni34Xy9imfDOiXNRtJlG5YI2xNO5IkB1xbaOQkqcJtEfa
	 sK4Q1cJ5sHtng==
Date: Wed, 15 Oct 2025 16:08:00 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <1de82ab3-931a-4058-9c57-2b8cd7eb4740@sirena.org.uk>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ix0C4kEtYp4NX8RI"
Content-Disposition: inline
In-Reply-To: <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
X-Cookie: Long life is in store for you.


--ix0C4kEtYp4NX8RI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 09:50:48AM -0400, James Bottomley wrote:
> On Wed, 2025-10-15 at 13:11 +0100, Mark Brown wrote:

> > Ccing people makes sense but doesn't need something in the patch
> > body, and especially doesn't need to end up in the commit log.

> Absolutely.  But part of the problem is people who Cc different parts
> of their patch set to different people don't want to use the --cc
> global of git-send-email, so they tend to put it in the commit log.=20

Sure, I understand what people are trying to do.

> What would be nice would be if git-send-email had an option to strip cc
> lines when its sending the patch.  You can actually sort of do this
> manually if you add a `---' and put the Cc: trailers below it (I
> actually use this for preserving the version log as well) because am
> import discards anything below `---'.

That's what I do if I want to include per patch Ccs, just put them with
the per-patch changelog.

> It is also definitely possible to add a git commit hook to strip cc's
> when doing am.

But not stable ones which we do actually want!

--ix0C4kEtYp4NX8RI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjvuM8ACgkQJNaLcl1U
h9ACCgf/fMeqkcbUjcYZ4z8gTws7Y98dp1wANqZskH5MHYPAzyeW/GbzMZyY5VnS
3Ac0aNaiMD+47sWxi+ojXUnUijKxqJEBQ6pUHIt497SNhHr1rkTqkcNtX4BcVCSF
2ixPASOYY1P+cL8PB/0FLuQfuYNNGfLV1mr7dXmkTWQPXJPKLo+D+xoVsTuqgVvw
4j1mVYOckEZpZXq41bqa3eGOXYqWHQ+vZhRScQ1J6uyE/AE5cI9pXCCkmy2CSfVp
l/FB/Wi92podYc4nQeNrAI4LNTx1+8+iEM08wuLpd4ZJ0RILhtla1UulCOcD1OnS
adtGpyaiaU6Z3UzWor2JH/20wE1Bhg==
=5+IF
-----END PGP SIGNATURE-----

--ix0C4kEtYp4NX8RI--

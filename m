Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A6826B762
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353406; cv=none; b=Nzyf7j1ty2jShz+2cb7b9K698XQog+PylA6IFjWrqZDZAW3I/0PG66rLTNW97qDBaaznRlC4GHJBRdGMKghqLHTUl/giNV/29QbAzVs8sZbWMqLP1vG3dP3I8e3Nyct2noaB1DYPm/Fb+lvtIje7BScq5OPb0lcevpaCa9Hw60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353406; c=relaxed/simple;
	bh=W4WLVGnfzrp3kb277elfnfFoM2cWVihdzdvrR3egaEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2r2/wRngcroGgqC3Exb34TfEObspqoND5rdmupQLzWnog1rHxMQx1vI2Vp4L0oUwHLrIq32adUDYdXeCLp+n9QM28aHsfs4NfdMQoZscLWKbjyxA235WtMj9huS2IpmB8Stg/zTP8bywCyxP1tnCEwMOGVRlFBwi8Vii1aOojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhUFZJcK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhUFZJcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19796C4CEE7;
	Mon, 13 Oct 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760353405;
	bh=W4WLVGnfzrp3kb277elfnfFoM2cWVihdzdvrR3egaEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhUFZJcKy7x2yNfHCpo6KYZCQbGRZNh5IHFi7AqzNK8ZCCpZU3vmPw0wnGzT7D1lJ
	 cKG83pHTl3Pz3MfaMrR4hqJ+4Wa/C1vdI78P3PK7r8/F2UAUCzWzFY5L6SLmyoSJs9
	 LQU2irYYKMFfYldlh3iT/trCGI5hVOD3czh8C7IQ4qZrG6NQq7BTR/pIScSY9mzUQ/
	 jwgOegO9EmyOBiNvbLlA83FNSXf1pUVzjoJnumnxgLJBeGXEaV+R0yZTvEP9GaRLFc
	 Fykz14W7lZNotyx/wRgAgB4wrQ7xneVTnexhgKXkBl5En1vFR8mObvxxIwl6gWqi1S
	 ATr9gnyznLWMA==
Date: Mon, 13 Oct 2025 12:03:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Willy Tarreau <w@1wt.eu>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <19d8800c-c48d-4b98-ae4c-f52053b97ac5@sirena.org.uk>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
 <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UAjXP92FMGR1JOor"
Content-Disposition: inline
In-Reply-To: <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.


--UAjXP92FMGR1JOor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 13, 2025 at 10:27:09AM +0200, Paolo Bonzini wrote:

> My problem isn't with dropping Link, it's with not having a
> replacement and messing up the workflow of >1 people. I'm not calling
> for civil disobedience or anything :) but it's not like Linus hasn't
> ever been wrong.

Me too FWIW, it's a noticable speedbump in reporting test failures.  If
the b4 stuff that Kontstantin is working on works well enough that'd
work but it's very new still.

--UAjXP92FMGR1JOor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjs3HgACgkQJNaLcl1U
h9BPcgf/VWCzJjLXMsBm//Dz4x3bY3tpztkW2Zj7+TkPakbVAIPL7vEpGFmTKjPn
uJWwV0iqvO7pWPPIf5+7yfliMofTQvvxrX/DzHDoJRA3LQ0P++1o4cCZW+GlXqiw
oJk+LXzVH0ESDgtdnAoOXKLB3PbUbLdI/+bmQHZ2gQ1YJus3V1BIgxttnDuX8GgX
maphYg51aYRNITDdmC2zWZ439TQkG80uXck5hoPU7fJ1gYWNqpbZ2Xkku3T5nQsj
nDHF493plCCAn/EuaQMo80R8YhlG/YC7LNSQTXQH6hp1SMk920tmg+yGArafYL9e
vBPxWLY/sqB6OXCPh53MMQ/WXEzSDQ==
=2bOp
-----END PGP SIGNATURE-----

--UAjXP92FMGR1JOor--

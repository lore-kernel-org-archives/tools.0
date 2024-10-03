Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EE19B3EC
	for <tools@linux.kernel.org>; Thu,  3 Oct 2024 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969804; cv=none; b=E3LY9WxyyxJx3BUjmw0j1FDHiydtEibx/qyTPMrkZmc4ts2jcRrWclk3ZoFi0NSB+UULPhwfyGKhdOy5bcLn5ax4hgzC7wG/XeZPUMFAcj9kKS+oYox58mUHVm+eALK6p4eirMNw37XS35BvLJfl1+IiHNnuZ08YzZjkLd0NlW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969804; c=relaxed/simple;
	bh=EKEHFkp2Z4clVGXjHyLQvib6mp3umIhBnGkN5d6nsMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Znez/CoH++UHx+PCLFhLJ04kTF5EpOztydg8rKDQ6Oppy3umj5jrdSn9+/wuYi1k3VF4o1kMD3sFbXhf0FGt3tW4+A/pDvmm00YHTXs6b5lDFFcGb4nIP9CXHDyAkQ71Q6zClVX2e75fP9B4l9ohfTwlKYbtzQD5VJL+Bg2lk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlfPdUpr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlfPdUpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74168C4CEC5;
	Thu,  3 Oct 2024 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727969804;
	bh=EKEHFkp2Z4clVGXjHyLQvib6mp3umIhBnGkN5d6nsMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlfPdUprkuBnqHEwrMecxXyF2JajpcPMNkp13hFe1DVt5zMggCTaBo/2g8ZADQbzN
	 kyzJCV1Slu1mjqmTrQTnHU47ePG99Wol85QB8NHZYKvTXl+yqfX8Th4+U6ShmXJSj9
	 l0gUFyPujY6/WCffWegEjRDefyUlgK8jMNMxtiKRnzVSTv0edrmqWtKqcasikunL3M
	 gidrxdHQjMnebuVDMw/gOLH7diJGCwnrTq0f32ubCSOexXMVicWduI0fPgLam/GK/B
	 30QKrNjwY4ocJlfUqDU27wx/xXq7JGKj0KeZPNz/IWtzNyDJVoaGKv4YYxFhH25G5M
	 mHxhqoatBWs1A==
Date: Thu, 3 Oct 2024 16:36:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 trailers --update picks up bogus trailers
Message-ID: <3a2aad68-8c60-43d7-80ad-899dec746767@sirena.org.uk>
References: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
 <20241003-exuberant-eccentric-mouse-7f5aaa@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lA1m1ghPApZa7nAf"
Content-Disposition: inline
In-Reply-To: <20241003-exuberant-eccentric-mouse-7f5aaa@lemur>
X-Cookie: I'm into SOFTWARE!


--lA1m1ghPApZa7nAf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2024 at 11:13:03AM -0400, Konstantin Ryabitsev wrote:
> On Wed, Oct 02, 2024 at 12:51:50PM GMT, Mark Brown wrote:
> > With current git b4 if I run b4 trailers --update on

> >    https://lore.kernel.org/linux-arm-kernel/20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org/T/#t

> > patch 2 picks up reviewed-by trailers which were sent in reply to the
> > prior versions of the series even though that patch is new in this
> > version so the update is clearly bogus.

> Okay, this was a bit hairier than I was expecting, but we now do a proper
> patch-id match for all trailers we have received and only apply them to the
> patches that have not changed between what the reviewer tagged and what is in
> the current tree.

> Please try it out in the latest master.

That seems to be working well, thanks - it excludes the surprising tags.

--lA1m1ghPApZa7nAf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb+ugcACgkQJNaLcl1U
h9CYNwf/ZdRxJ7YtYiAP6MlYBMtOe/TcluihH3P0+Tk46BEZHzOQLBlhLg9ycgrM
ZlK143SzCkDZ8LBl6Ca1gHDX4uMQV8iCKj23BQfTphV2Vnam4pUOg5BK16OQkd0a
3o5TUspEQdAWDyJHVqBwc88Mharh9mgFsafOD8VjesxWk1uOWoAOQG2Q55UyDFOw
NeFMObRhrAhFfJ9J/LJ12aDipbaWyo3qwT3F7M3fEqZIuV4d5LGX26rmVPw18lzo
zNfN0vXGR+Q/GXn2EhJI2IuNRJz8ykZK1gA1ijICm9WpPIH9EAInvYXgaKzKIUxz
OpNBmqNOBb6DLRDbbbXKxly275VZOw==
=rar+
-----END PGP SIGNATURE-----

--lA1m1ghPApZa7nAf--

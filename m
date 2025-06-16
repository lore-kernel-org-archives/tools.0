Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C509A2DBF44
	for <tools@linux.kernel.org>; Mon, 16 Jun 2025 13:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079794; cv=none; b=nZDcLU90M07qeO2xAAxFL/ET16esdkuUVhYKNV7FPCxcKlb5EpvFJmmste1GgkP71DYM1i+rlCtjQCuHlCfy1MANesCzESq/Of4pcjPJlJ+pKIXjZSQeZ1Q1lAclUen3yCRAfVgRljb/ZTq4bS+uF/VsjIMt/DqGKOMkhoyGicA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079794; c=relaxed/simple;
	bh=eHINk/UWchIfuZULIW4dolGIJVh1KxAJGccj+pljt3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBGUS+Ggkf3aX3birQd6o8zrEi1WoXELs0UJnZYDBLykQqesn4ywlJPB8PlsAieoA7NuzRXF8qOPz2qOHH32Hae/h6NSo9fiOSQVgKtZxTRdY/zYvmBTAirNwBXTt9jWf07J5F/XPo15843qOIxUBdOwPME/ajwWuFl90zXxQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTUEpoou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTUEpoou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D41C4CEEA;
	Mon, 16 Jun 2025 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750079794;
	bh=eHINk/UWchIfuZULIW4dolGIJVh1KxAJGccj+pljt3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTUEpoouFRRF6cQgF4qpY6v/nS9LLkTf+zTuR4SYOXr1No68D5eyKKksT+BCQHsh3
	 oL4Cy//E883jLxzEL6UQhvDa0VGIznMiSGtt2VT+cLC9Sz9hrO3m2KKFHryVagr5LI
	 VCs4PBc61ei0CHnMiMK9RW6cFO0gpQ2iRE3R8a6TDpC1AAY+ZCv53SQ/TETtxEKW2p
	 kFPg/7VdFKdBAptc1lNpMQ9K/Eqbo9X98hvEyPbF5mfYUuwsBuAvADDQs5fKP1NzEX
	 b8xc0nCS8rGmvevWPi7m/7hMN+BjuESyEITIKzC5IfM1PrSxnH6oucefNYJ/YxDreH
	 rYcW0UTraUGlA==
Date: Mon, 16 Jun 2025 14:16:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Python backtrace running current master
Message-ID: <feecd4f3-ac9f-4bac-95df-bd5e4629055d@sirena.org.uk>
References: <78832c81-9b84-491b-bb1e-5f67ecddd34b@sirena.org.uk>
 <20250616-prompt-bulky-kangaroo-eb07e0@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z91mmoj8k3zqBlZ/"
Content-Disposition: inline
In-Reply-To: <20250616-prompt-bulky-kangaroo-eb07e0@lemur>
X-Cookie: Keep out of the sunlight.


--z91mmoj8k3zqBlZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 16, 2025 at 08:45:46AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jun 16, 2025 at 01:41:24PM +0100, Mark Brown wrote:

> > With current master (80e1a7f) on Debian stable I'm getting a backtrace
> > trying to run b4 with no arguments:

> Argh, I guess Debian Stable has Python 3.7? It's EOL since 2023. I'll see if
> there is a workaround...

The default python3 on my system claims to be 3.11.2 which seems to be
up to date with what's in the archive, I do have 3.9 installed as well
somehow but that doesn't seem to be what's running here.

--z91mmoj8k3zqBlZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhQGS4ACgkQJNaLcl1U
h9B+/Qf/RMEbQAFySlld/RiLWRIp9TVTSLN9H380ylcToByCd8RvwkvClpGcl7pi
1tEZu+3OXw6LggAn9NnH++1EJ3DufLt55gGk/Jtra7Sa5ZDmIOx0l5h25bZFf9vN
o6JBRt0B9U99m9hPqP2d046h6+BIlu1cu4ADNZfDd+3pnjf4Fh4xbH/dFTuAPnau
bRw1G2b29jF8lUW6XNkbUXAYigliu0Xaum9kpcXMaMwz+VumuJcNNVQmKXHCUPln
pEDH0pnlcpwCmpJUz6szUKyobR5bQ/NMxOX+D1D/SvHE4G7S6XH2Rt9sMB1iKN/J
YfcuWFJ+cgig9g8rHKCWrc/JpaXSCg==
=wl9T
-----END PGP SIGNATURE-----

--z91mmoj8k3zqBlZ/--

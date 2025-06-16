Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90227285CAF
	for <tools@linux.kernel.org>; Mon, 16 Jun 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080187; cv=none; b=d1i7dIjpuTEFISj3o8E11ZRD07LqPrRSxlPybl79ehDzYnC+9gziNMMrp7eBp5AC2cUwnM35x30Nh+HHfoa1psB6C5mf0n6jVDTaStt6JrzEvTmLY6Lcoc0UOjmX4lmmo0LRx8R3yRO6EsFEWr1yvn7G8Ef0G4POKF115ucDSHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080187; c=relaxed/simple;
	bh=Q6kb0Gmx90fvwE1ELDA/RfdNbw1kcdPB/ccxwfLqQLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjEAn7rIBCVQSPjxloboNe5jgD9KrUXcCSJcMfFjJb07M9LxMoO4lLERWz7c/o7AG5fY0On3Lrc1t6XHkAveOMk4kmeVaa1I9rHol8q6uUSelqGkNOjlaD2HgPx8qZyQO0cR7WKzVH3qmIFc0D/PmCYbCroNjJhSyFD8qhHv5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRIjovtI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRIjovtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D097C4CEEA;
	Mon, 16 Jun 2025 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750080186;
	bh=Q6kb0Gmx90fvwE1ELDA/RfdNbw1kcdPB/ccxwfLqQLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRIjovtIWsH9hIqm6xduXbNafL2jP4+2+ke9cV2HPRcLmy7BUQJfYGsCPjUGgfISe
	 q5GeL3hwkixq48yGChrl7XRhTR72Nf0CdT4cztrRzvJeUXidt8x7NmASk9jpG8W56Z
	 D81e+j0SXHRLGZs6FjWLApX0QuOOd7whWPa8qTwul8e6Y87B8BQN4bN2hn85oG2twU
	 8ojnpFgI3VCB6L7E31+ij841q4r8UT2Inb8jR/kCa7GpoxnQF/S/TBdvTnx8/V9jso
	 M8nbxXxa5SyjD7cb8DmmZ3yAG/YWXpITd7h6pvizbsvZgsBvRpag6Hry8bOsj8XP6g
	 ZHkNyNz1KYa6g==
Date: Mon, 16 Jun 2025 14:23:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Python backtrace running current master
Message-ID: <38b40a5a-0f2c-423b-8bc2-420861e81931@sirena.org.uk>
References: <78832c81-9b84-491b-bb1e-5f67ecddd34b@sirena.org.uk>
 <20250616-prompt-bulky-kangaroo-eb07e0@lemur>
 <feecd4f3-ac9f-4bac-95df-bd5e4629055d@sirena.org.uk>
 <20250616-rustling-serval-of-brotherhood-85eca6@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="46o8prJaLrNc6EUs"
Content-Disposition: inline
In-Reply-To: <20250616-rustling-serval-of-brotherhood-85eca6@lemur>
X-Cookie: Keep out of the sunlight.


--46o8prJaLrNc6EUs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 16, 2025 at 09:19:07AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jun 16, 2025 at 02:16:31PM +0100, Mark Brown wrote:

> > The default python3 on my system claims to be 3.11.2 which seems to be
> > up to date with what's in the archive, I do have 3.9 installed as well
> > somehow but that doesn't seem to be what's running here.

> The latest master should have compatibility fixes that I just pushed. You'll
> want to "git submodule update" as well.

> Let me know if that is better now.

That worked, thanks!

--46o8prJaLrNc6EUs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhQGrUACgkQJNaLcl1U
h9AG+gf/dQzFOP2mpeLSmSH8il3QnyVWLVLP8Ok6w7LyP/WNt6x9V/ySUV2HLfnC
acaOP3U/wnd7OmTMDrCDlwJKyjgQL4cDAG4npTiV3AiST6zXRB7ym9HGCGThbjEF
n+oT975e0s+wDYSvit/Xs6zwDBNd/wh8TBoxVASeSlANDuT+dZ3J7m3V3W9JvxGr
x3qJfMEMAnLUkwzmuR/IT28U2r8gRGIEfrP9RkmWU1VrNtpRuYKn+R8M29W/zrfB
GJWhXSpTi5rtGh1laLpiaoxIu3EsZib+F10UNw8UdIY8mNEP6+ifTZCd5zbYWGVJ
RMcuRdUqb5/BkSI+6NW3fZRlU4NzIA==
=g/Jp
-----END PGP SIGNATURE-----

--46o8prJaLrNc6EUs--

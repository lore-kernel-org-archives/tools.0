Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58F1547DD
	for <tools@linux.kernel.org>; Wed, 28 Aug 2024 19:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724873709; cv=none; b=oJKkqZ4/D7qUHNydVNwBbz5TPK/MSttM0XnBYt4nQPloAif/3TLTIOoe3r+lXQRGHipx22gbPmK+zuAm8LhrVvxZ3Vgz8ujTDA10aKGaLQ3nOdq77pFi3XwyON0TU1B48v1PcKw/dkzVNpDDnPi0UL/bpmqPBWTycb0AOx0IFkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724873709; c=relaxed/simple;
	bh=lJQxst/vCP63UVNp+dAsjc1NUQmRvoKpFFaIkVwBvuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/BCbswdzjTfmb8ggsaI+IIma7nI725bFKjv4gReTPdvtFe2wshpask1zfuFImxVJsyg8m50+i49k8VJZ80a8O5v5U5Y27UDxQRug/kEGYaMMeEOTzWtS/F8yZzETlnUtuxJwOf4LrV/gYw19ajhN20kyiQXG48oS1yJ4e9NyQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O95EGXAH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O95EGXAH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2409C4CEC0;
	Wed, 28 Aug 2024 19:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724873709;
	bh=lJQxst/vCP63UVNp+dAsjc1NUQmRvoKpFFaIkVwBvuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O95EGXAH6hehVPK6aD0VwfKhETSJAZj5TE0Kti2ZP4ivf+qLAz0B09i7GervJ1XNw
	 IsayVwOJUG2gXDatBIKczQTSiTHAAhJwZ0uKqQ18UQyU6tdPo8X0it8ghttd/CnA2f
	 mNJiWWxWb/f5DPn0X3kVsPgJ4vRFMUKbdw4eaYqo9m2BuCXHgINvFUeE6nJJ6+lktP
	 S4ndNMZRbl8fy3JaU6gDlhVCM1RVc9rGCyR8N1CsTZOEZV0drxjIm4N3d9sJNksze7
	 MCM7sTBJXwWUoZhcoWM0mlfkZRjEF7pWHXAgn+2UvH9X7DSN/R/7Jc5X1Rx0C9TjiN
	 LjfIuM2Vnlxag==
Date: Wed, 28 Aug 2024 20:35:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Option to filter trailers in b4 trailers --update
Message-ID: <3e795886-dbcc-4877-8390-017b386251a9@sirena.org.uk>
References: <9e5ae790-9c8d-4ee6-a85e-9ac1e32ac24b@sirena.org.uk>
 <20240828-slick-attentive-lemming-6afffc@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0M0IHrdCcCF/alIb"
Content-Disposition: inline
In-Reply-To: <20240828-slick-attentive-lemming-6afffc@lemur>
X-Cookie: You are number 6!  Who is number one?


--0M0IHrdCcCF/alIb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 28, 2024 at 10:23:01AM -0400, Konstantin Ryabitsev wrote:
> On Wed, Aug 28, 2024 at 02:26:03PM GMT, Mark Brown wrote:

> > It would be useful to be able to specify a set of trailers to exclude
> > from b4 trailers --update for the case where you are collecting review
> > comments.  If you've had some Tested-bys which have been invalidated by
> > addressing review comments you might want to pick up further review
> > trailers without getting the Tested-bys.  You can fetch them and then
> > remove them later but for large serieses this can get tiresome.

> I can think of two ways to do this:

> 1. interactive mode where you're asked whether to add a new trailer or not
>    (and optionally remember the decision)
> 2. a non-interactive command `b4 trailer --ignore-from <msgid>`

> Which one do you think would be a better experience?

I think either could work, though 1 is more fine grained so possibly
better?  For option 2 it'd need to take multiple --ignore-froms, and
it'd be good to also have --ignore-trailer=<trailer-name> to ignore a
particular trailer type wholesale.

--0M0IHrdCcCF/alIb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbPe+kACgkQJNaLcl1U
h9BCiwf9Gu2phr0ekOEorISMRMI1MIikjpgav++l1s9cT+WVNWdQHn1PeEuKumNA
BPFkxQMSd533GsmQMWlb6ZR+2XatcKPyZrg4k3weJyzLzgQNkQPfOKQwV8LAo2K2
1vVSkhGvYBmh0ZykBAb2ZWJQx50pfxEEsr00hXg8LXdfdTTE5b+zJiiiw+eUMnuF
VVrtdRMXZawGARiCdyLDf8HH7oBqDDhwv/5Hf25cba6ZPbNxjEhDf1W1uLB7ZFQD
X6NP6ZktyyvlS31JQ/ZTddQ4sHrpDbZf/Kya3oAPrloet8zm9YcZgWv52e6Dr8Qr
NGg7ahyZPCrOkeCx4k/wyWIhTJlgKg==
=wPuw
-----END PGP SIGNATURE-----

--0M0IHrdCcCF/alIb--

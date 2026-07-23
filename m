Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807B31F9A2
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817012; cv=none; b=M9hZ2I41ytg7nIQ9HtTqC4x31ub0TLL7VEpz0DQiypXnkyKIknAAQFZFRnc9fCqEtKNjxgmPav5HJyR5AoIKgaZiZtEZ6puPOgZ3UQavuWt7OI96C6ebltyN3MA/tSOlrBkCAeYhocY7REpAQ18O3oJ5a6ZLiTEQr5XlX4IiTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817012; c=relaxed/simple;
	bh=oLlUhTHuFjdUBprd52FIxZUwsKazPYyK1aoYistmmZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIGpjR/4Qe0lUDJVfHdJf4jrskeViWPADWdF4KB9lnzXBqbB3qFT2KovA34xLCJaUhEKqY+Mf96mNSdfoM8ydYzp5nXbOtinbMlBkNyu/m/NL9wgUyKEmh3IUm0+bYQnflvVhaaqxWqQuY8q+XQ4ATGQAatj+AE98yiFuc9gRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 20DDE1F00A3D; Thu, 23 Jul 2026 14:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BC41F00A3A;
	Thu, 23 Jul 2026 14:30:10 +0000 (UTC)
Date: Thu, 23 Jul 2026 15:30:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review surfacing updated serieses
Message-ID: <dda16a07-f0d6-4d20-b6b8-7c5d65e813ec@sirena.org.uk>
References: <b356bccf-8e14-41da-8369-53eb442d0f30@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7/pKo7P15YlFKfJA"
Content-Disposition: inline
In-Reply-To: <b356bccf-8e14-41da-8369-53eb442d0f30@sirena.org.uk>
X-Cookie: (null cookie


--7/pKo7P15YlFKfJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2026 at 01:38:51PM +0100, Mark Brown wrote:

> It also doesn't seem to reliably move things out of "waiting for new
> version" when there is a new version.

Further to this, it seems like the ones that don't move out of waiting
for new version are also the ones where you have to return to reviewing
before it offers you the option of doing the upgrade even though the
main list UI tells you the upgrade is available.

--7/pKo7P15YlFKfJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiJWcACgkQJNaLcl1U
h9C4vAf9ES3SNV2RREUIi6PNDIbJ24lPd801DiArRM4+H2V2GsWR5WNopZNHb01D
VfA6hYc+wJHSn6s6OoqvPPs08/JTFD4B4EGPss79OOaYxw18Zhwi7NfpBKG5GIkt
gYJWPgDLsf7/jslJqLR7kedsb+Av09Twj5ClkWOGHKIK740idlGrni2ZjISCQhrD
hsav/7d5W6j4TAjZwCm1f/Ew/WjKwYcmhYanMz5femmazIdCZBISCGYtl8AGBTdT
vUJin4Gv7cKcYyAQtISt8na3x5Y4mWukTmTNXRJaDy9W7nWoDTag1d54qJ8nDtJh
eXYrBfTmps0MiFocdYXsRcfUgB4+Jw==
=thgn
-----END PGP SIGNATURE-----

--7/pKo7P15YlFKfJA--

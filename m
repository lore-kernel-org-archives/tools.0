Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD538AC90
	for <tools@linux.kernel.org>; Wed, 15 Jul 2026 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125827; cv=none; b=Sv+pgkZNGKiWBeuj9XtOriUz7ahMlTqUiNTFQQQJWQ4xvyhgPlFC9AaHg2O+7io2glqfJ8ZS9Qc922zJRRNdZqLWhNhPGlB7ijmk38O2H/qiFWak+Pz/xT0Z5u9uaTIYWkJ+Rjf1KpZWycZw1/YFb7jjp1UoVEWwdoZ85sdBECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125827; c=relaxed/simple;
	bh=YNhVltna/BRzOVL8qPAeFlFT1ujulXDaYw0CMD4VbEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ca/ynC0TSSTX3P24qA6QKwaKtScc6sJQdQuYZ9LZDZegIIUemrNMNjm7j94s/R/sD1hNZT433DTQIEGDF98WZD04DMkR5NKgCDzpF3/fOAY/NUFLaImM/pfSjyLUD0insAcr+P73nBAjwwOLYTSKu6CuucBFzaAmIOS5eyqWB/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGfyCBwm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGfyCBwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8CC1F000E9;
	Wed, 15 Jul 2026 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784125826;
	bh=YNhVltna/BRzOVL8qPAeFlFT1ujulXDaYw0CMD4VbEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KGfyCBwmmNwjhdZzjuWgy0eWVWHgTkrEGqfqsaMs5Eet+9qCWdMTUfc8cSFLp6ffX
	 qDeSO4xDAAPnwcxvFd0zoXR1qhC5mmPHBt5Op35mb2CZ/oBVsM1g3xWCC/78lEWHRs
	 Wdg1tWklbF3RUj+ozPSGZNoFvzNYcN9wO4DGyWs1fnc9I+RUopRoN5VnlqhZI1ZJLM
	 jY6DibZsUeAnyhBjFk58uDYAEU5SrchdueljlQfyn0nM+xllrPkuDNNP0r+i7xWVUb
	 Uf7dNiviRYXA0qTFZiBL8LGUg+Iq/bzCoyi2sPAaT41CzSdI3BXfZCbHZhhi7Hnadg
	 ipNQ4eJ5GcJCA==
Date: Wed, 15 Jul 2026 15:30:22 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 review feature request - search :)
Message-ID: <9b39b9ff-e737-4868-a84f-66243cdb6bfd@sirena.org.uk>
References: <aleXuTEXAJ7if1wt@lucifer>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0jDWXP5LgLtA3Uo"
Content-Disposition: inline
In-Reply-To: <aleXuTEXAJ7if1wt@lucifer>
X-Cookie: "Speed is subsittute fo accurancy."


--T0jDWXP5LgLtA3Uo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2026 at 03:24:58PM +0100, Lorenzo Stoakes (ARM) wrote:

> So maybe default-bind '/' to that and it moves the highlighted entry to one that
> contains the searched phrase in submitter or series subject line, or something
> simple like that.

There's 'l' (limit, like mutt) which does a lot of that.

--T0jDWXP5LgLtA3Uo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXmX0ACgkQJNaLcl1U
h9B7mgf/X6R1ocdvN4rZfH9vjhbFFjjZWvn9gGv/SEJ+tNWe0ZbK1PebWvPAWICt
c67wTXYwcgBk6vqnv84O082AtFMktsb5Le5rUXGIPoiE2zifujdt3pZilrV9hGKK
fVeaIR65hy9o4xXCh+l1c3tDwSyhp7+AI7Z8c6EZgKzbKEN8fm7hsaAodd140g5U
OY2Qaw33D3mlJfg7VtoJx8fuyKSAqaK7HsvJtRA1DTEXH9BYyjvfYPUy2eR5vFhy
X4Do/5MXF5qKxRLn0EVXTmZiOSvfnohMZtgTMIHjDPgOCloH5UuZyaeSib/UodBO
aRr6a0S9h3msb0Y008wnxmvK2YA9zw==
=EQp3
-----END PGP SIGNATURE-----

--T0jDWXP5LgLtA3Uo--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9373E49EC
	for <tools@linux.kernel.org>; Thu, 13 Aug 2026 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658311; cv=none; b=Tb+Z/OWf6Fak+MDMtj8KGR1v7J6C9h28XBGUrupzirQZl2MOHornswvSPfEA0lJssFjKYkNgEyjZ6XAGKrxO0vx1xHQfVYpFtEZME8/CHR/Ne6Gs6QAEqgrd/g7kmNdhqoNgWt0Wo2fBqQVb8SGy57pZa5jo5IwFAsj+ZuY4+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658311; c=relaxed/simple;
	bh=k62YHSCvMktQs/9a7ZN6bEAKGcwhjtmexlcdzCOkYIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pn8zF1zZB+UO51NnSxdKcIz4KhIxJkfFr2UpRrgRALaVtoO29GQW1i/tzrmZU6yIi6pq14WmixgDAMtGwpYDReOQaxE+aGX5aRk9O5kFmv20R2LssZbEZB1mz1XL0Yd4Rl88ajuCSj2zoc1Y4gTbIDS8Tlsq+QxJAo7SoxKEH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7AQ2+lr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7AQ2+lr"
Received: by smtp.kernel.org (Postfix)
	id B80E01F00A3A; Thu, 13 Aug 2026 21:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066D51F000E9;
	Thu, 13 Aug 2026 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786658310;
	bh=k62YHSCvMktQs/9a7ZN6bEAKGcwhjtmexlcdzCOkYIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d7AQ2+lrYDoop93c+d8KR6idfJKVH4SHG/3jvstnsgEI42S/fjams5m4ZbN4oqg5e
	 ugSRLmKNC6bysUji5dg6PpkBg86a+X7OSTuu97muol1EPzBjrixYIX1YGyglbSPwH5
	 HtMqSAN4ZGLXfuYp1La+bNbifopoTN7o0TE4R0NdjC9F/vpbeTmsH8vUbcY2L0QzCG
	 UUvxuJHUadxI28mWPJ36Q/7ht5mTVUBEv7vv01PNh40SkKI50oimltHAa6B2dVuUn7
	 XLXo3Nwl0Yv4aK5fLEW6BF0p/VPzMCbj9gxnizJTkgzV190Ryjq/zyJifUHnyMdOvF
	 P+T/x2Sp4I0FA==
Date: Thu, 13 Aug 2026 22:58:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review crash
Message-ID: <791e346a-be7c-4e64-af81-b0f3fd1976c7@sirena.org.uk>
References: <1bcfac04-3a85-4d8d-a0a1-094abe5dd807@sirena.org.uk>
 <20260813-athletic-therapeutic-armadillo-cdd2bf@meerkat>
 <20260813-rigorous-sawfish-of-protection-1aecb4@meerkat>
 <0026503d-6adf-4c22-8785-6a17cf8252d7@sirena.org.uk>
 <20260813-garrulous-jaybird-of-advance-c2efbb@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kuj2CppibB/9HrZo"
Content-Disposition: inline
In-Reply-To: <20260813-garrulous-jaybird-of-advance-c2efbb@meerkat>
X-Cookie: Immanuel doesn't pun, he Kant.


--kuj2CppibB/9HrZo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 05:39:08PM -0400, Konstantin Ryabitsev wrote:

> Yep, take 2 in the master/stable-0.16.y branch now. Not sure why this didn't
> show up in my test.

That did the trick, thanks.

--kuj2CppibB/9HrZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+PgIACgkQJNaLcl1U
h9BvMAf6A6xjioHorG8uB3jkhX+VCnUgkMUp8MFV9X1nNVHlz23X1stoGOthXlLX
V8tZPEYIGCTorRduoJ3U5cZFrF8gWuxWupjSsviwqiLgamWr0w/1F8hQJ30oNlpT
CmG7SskFozEV50zIraFf+T7W0gYFYxSCVGmTXS/Rfv5GnzLOF9u7InjP8DB1l0gV
xm1rfnlioqx3dcewDEW5DBt0Pf+Zj7up4dnMWd3AcjOUqnwhZERJu/N8HonTWILQ
FSYY/Xmej8fQDJjS+Fx3kAGEgHGvhccY6I0V0xtHtvwexH45WuyB4Cz/xT1nPdR0
JvafKQfr5xSpb5qhJ56ie6R/0Gu0CQ==
=9eXh
-----END PGP SIGNATURE-----

--kuj2CppibB/9HrZo--

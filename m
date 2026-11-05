Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899465;
	b=QmJrZkmqfUw1lrAVRp1gPxQOpnGKHHweWPpU3a8taOoe8CDZyhduEfqzV1D+/wdjcy1r
	 pYHB/MPGpdLfd0QUCqRJm/L+lZAXaM8g6jeFifV7LY8sVzQwqm+WdFlnqQZa2S8H/B1cO
	 QZuqnWZKAXBuiTixi4qcrj3Vru0hBkULWg55xdxZXnESSehMirov/QDwCyrCiJANQEu+T
	 axn+LkbHLnIKCIFCisHYY4mTILhgU5PJzyIpEljw3jRfJsGdLMcNU5/e6tOabFknPPVpk
	 VjORGd99GTQ3v6OmoonT5+g2uyOdcvDEL3AmjoudXlDqYaYyigom6ByrOBIwNBP52kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899465;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=a+fGGcvlWeEqD8++4ZhuQj3paEfQXauAK3BvegqL8V8=;
	b=2TUiZMZPiwiHZMCIgypEqgfTpBU/uDyCY5ZxeEMAVCE1rt5fYRKWzFehOgFOAAS0okn6
	 Cy3mZbI62Y0zmK/TkvSwoj4VAQS4I1rD/7PC/j7w6Mmg5UWVLeTzHOvIB0jalHws4IkGZ
	 Qg13vUscm8A7K7FvjXYxceJcubrQP2JpTTpxHTf0mTJzR9NQyggswapMoD1pd5huyL0AV
	 2BLMzm+sEAl6ZIB9Bn+orX6kFjOp3DkhuJhTHuSgpE1FnOgV7Zi3Mk11HV0YVIrB4ry9C
	 DwdM1nkaBLm5rMwi6qW4KI/xc1aNhOkUolkkTZUEyqRVR1JT5C4FvuwznFDdnHB4WLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PncG4YR6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB8606D837
	for <tools@linux.kernel.org>; Thu,  5 Nov 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PncG4YR6
Received: by smtp.kernel.org (Postfix)
	id 6FBE11F00919; Thu,  5 Nov 2026 17:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404FD1F000C1;
	Thu,  5 Nov 2026 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899465;
	bh=a+fGGcvlWeEqD8++4ZhuQj3paEfQXauAK3BvegqL8V8=;
	h=Date:From:To:Cc:Subject;
	b=PncG4YR60n9pAaQuToV19TFQZjbfCIBLg/iXAZByx6O+4SdrwH5hlmxld8PlTRuO6
	 IXaJ2C7tmB4ouaR3ERM3+BkcuO3xeeEATY+tgWDbI0UH9+gBtc5gJ4xFl9LOIp67T6
	 5UDzrJnGqApQi6kY/9m6oFlK2s4vjqJvvifUajtqz7a0otmdPrxJ7LqCbgpkJ/l9s0
	 k3UrWCDP7Af0gadHPMW8niCEnfKO7N7UhZto05vz7euGBqN7kdVcUou9S9ohJdC9di
	 JDqMcBZmilmj8k9Hbn1rymNHw/b0CC9v1N25j3i0JhS1/i1vE2apYEtQeKv1xyamO/
	 5Xa5tfp+xwrTA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 9DD5C27B43F3; Thu, 05 Nov 2026 17:24:13 +0000 (GMT)
Date: Thu, 5 Nov 2026 17:24:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Replying to skipped patches in b4 review
Message-ID: <a50f713b-14ed-4ccc-877a-cf2c95111c09@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3jLVNJhpWCJ5zoQ"
Content-Disposition: inline
X-Cookie: Whoever dies with the most toys wins.


--d3jLVNJhpWCJ5zoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

If a patch is marked as skipped in b4 review then email mode will skip
sending any replies for it, it will only send mails for done patches.
If the reason you are sending a reply to a particular patch is that you
have skipped applying it this doesn't work so well - you need to mark
the patch as done, send the mails, then go back and skip the patch.

Worse, after sending it is not possible to go back into review mode
AFAICT which complicates the skipping.

Thanks,
Mark

--d3jLVNJhpWCJ5zoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauy7vQAKCRAv73Ows9A4
iah/AP4oGZIpCV2Zk1CXSJiZDKtpTD6f8iY1NMcJEjWrjpagrAEAoftJURz9DVWt
DKu0cITHeSuA+BwOvhXuMAwmjAxNKAM=
=BJHE
-----END PGP SIGNATURE-----

--d3jLVNJhpWCJ5zoQ--

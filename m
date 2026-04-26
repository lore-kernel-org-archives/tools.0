Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED02719CD0A
	for <tools@linux.kernel.org>; Sun, 26 Apr 2026 12:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777206196; cv=none; b=Gx0+WYzmLDYaC1Vh2HKEOKImB58Yp96AHDpM6Wtj/TEYSxxaYP9aqq33w0QBo2acaxQ4w/z3BTyI3gAmb4Zv3b0CY5mZhtSYD8OwL8RhO5mafYLioJgkdoYsng//LE+rFr5XqFMK55akgNeq2OGn/vMfB2QHgYW9cLHWYvqQXhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777206196; c=relaxed/simple;
	bh=ild+E33EAw5zEZ+BYG9Jv6xNMm2FO5UUa5Bn7evoU6w=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeAE27MgPE+7deANuvqArjBm7G/4mQmRoRvsVTMU5NRb/VtCAO+EXw5+iFKGNMjy7zLiQQZfSnGhnGDzOozTq7pV0FmzYx1eV8lDT45no46GK5/lqYJdpixO+uSeBCqd+2STsv0S6LoiXRysgxS9AWLh+GjtNL+uaBSQQHT8JyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b=AYdq4ryI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b="AYdq4ryI"
Received: by smtp.kernel.org (Postfix)
	id 9B984C2BCB3; Sun, 26 Apr 2026 12:23:15 +0000 (UTC)
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 638E5C2BCAF
	for <tools@kernel.org>; Sun, 26 Apr 2026 12:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 638E5C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=beyermatthias.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=beyermatthias.de
Received: from cressida.uberspace.de (cressida.uberspace.de [185.26.156.202])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id DBFD4182EF9
	for <tools@kernel.org>; Sun, 26 Apr 2026 14:23:11 +0200 (CEST)
Received: (qmail 18616 invoked by uid 989); 26 Apr 2026 12:23:11 -0000
Authentication-Results: cressida.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by cressida.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 26 Apr 2026 14:23:11 +0200
Date: Sun, 26 Apr 2026 14:23:09 +0200
From: Matthias Beyer <mail@beyermatthias.de>
To: tools@kernel.org
Subject: b4 shazam -H succeeds but -M does not (was: b4 shazam generate
 branch to apply patches to?)
Message-ID: <2qkkv4zikpyfw6wxggxoromsh42hap2ltquihtwivbaikjyso7@wjxvfvavtecj>
References: <2aczixw5erzdkkbnfflkzzyu6pkumodss7uqisvj2lldllsd2x@rd7shjtvz5me>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dp7nac2kosj5xotf"
Content-Disposition: inline
In-Reply-To: <2aczixw5erzdkkbnfflkzzyu6pkumodss7uqisvj2lldllsd2x@rd7shjtvz5me>
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-1.747937) MID_RHS_NOT_FQDN(0.5) SIGNED_PGP(-2) MIME_GOOD(-0.2)
X-Rspamd-Score: -3.447937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=beyermatthias.de; s=uberspace;
	h=from:to:subject:date;
	bh=ild+E33EAw5zEZ+BYG9Jv6xNMm2FO5UUa5Bn7evoU6w=;
	b=AYdq4ryI1l4HI0kuiR1o9/waQUrJpCIXNXz2/ruXP63lAjL3nOaxZZuZLYNjoGYnXqbEJOOXn5
	YSzmDdJ3jY3GZUaWEtjlI518CjxwRA1Oga1eICcx3omEUXlbeLbfMUM5bs2O6BvDRxUhnK5jRhhx
	LwOxA5AgwLMglbgbai19OzaT6pZ+hZrjULgV5u7KSAzHE0T0adDA8karylR4eFgOLbA7el+xityk
	1WYbBOkzOKvF9GyLaJC5bQw1Rzl/aWbREk0nTIXwba6Vxpzdri8Si0cFxG8EwYwvtyaLKokyn6O5
	IC31mWwG8a2Y5rHVKGSr/q1iM1YccwkXnWHb+NcaB7e3HFZEjYtiHeKwwrpfXBupZH5rbBGfpYlP
	wZv7jW0R72OJkQzuPMvB9PdCw+Stf722SCSgbJLXaXBMHY7NNHOjClD2dqN7KuAMpjxTiVivSbqs
	NALcAK1lKaRE1CueuzIT77/foAY6x4NVKhNhMhRTYyvhw6L/Hx0tFIMWwDcHQKtEPujSwHN2qIZM
	icYbagp7DagpH3Rytf2DPla2VUoAy3TeAOp5trRqx8z6X8YoSPLo32RGRLIrwke6JnDxXSnpkS/0
	gC7GAUTB2qU8nFFJXVF6hCCtSmhThxfimTlwSnINcF7CnaNTbKJWQzF3Skq1V9YsFw1J7atjzwuX
	M=


--dp7nac2kosj5xotf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: b4 shazam -H succeeds but -M does not (was: b4 shazam generate
 branch to apply patches to?)
MIME-Version: 1.0

And of course the subject was totally wrong.
Sorry about that.

Matthias

--dp7nac2kosj5xotf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEUJGUus1GMTrRclzcEKWX9Kitz80FAmnuA60ACgkQEKWX9Kit
z83lnBAAmmmGZ6nm8aaskuz05Hwi9C02vZtD/0KqcmwBZLD66Q21X8QXMGv5HVaL
h50KDwM9i7HiMAnAESihXnX4N92Avcr4X1UkVQMrUkoVL8fOuG1NfkBaVaEHBjut
cJxbLpLH3JXheC5whIJ0EREHvmV+a9xdbC0AnWsNqLA0XL/AftrPWylo2OfzEanJ
Mxor6CGSD1D7H1SfMttnm6x0sPyZlqRPRIz7yQ5LuOkpEv/DFSLGW6GOVtyFVqKP
ZQgemEz7V5y9xNOLggGNxpcANSLKRkrlGUa+yh9FGdolh0GJLUEk8MjM/0bNoJUQ
n0GkuO+ihEwLYjyw9odfiSPKcDepzTSWURg5mqDPaS+Ge/nBKpUVqU0pn5adxnvs
9JA3znTG6k9L23WChsMbYtis2/elFgM9CFiZcMD/U4z7IVPAPJycd7gfRvwN+jgs
dYIAd9yZvWJKuyCbypRw7fcrSZdXLZJlDKDiOGFKCU8HQ3jVPl+pdMdfqBpmnVtR
iUKCFIBNdn8ALLZWIaONQkGs28E7OIS+NAxE2rUqC31SfnKAPt2asC5gbcOd+8Bc
iQHuHSZ/JF6pPCXd7nkTpwl0GNxQHGzwuHZmeHa+jGTlvvcKUA3Rm9pE4OYlf128
gFkWZPRu27hkLs2LjSloC4MKbIFnjLrRtuFDi4wOKzobJ6o5RAs=
=UkrX
-----END PGP SIGNATURE-----

--dp7nac2kosj5xotf--

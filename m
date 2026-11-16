Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832389;
	b=TuOHnOpfvl7KKrEVurQJS58hPBSjDhmO5W6l7JqIqdIrYuB+FQJ1tW7r1DuZ/KCmnJnY
	 /7lKMhGNJYr8nqXco2hQsQqttMxfaylCJQM3DrAahaTuPy7miuzfaplurM1zTKIDihZIn
	 Jvx5id0fPTmaXQxL1sbbhDosZKAflzGBbAByAmj1eQE7tAKW8cvSxMiFNAXA4WlNbu2/E
	 bRsyLF5uU4EmdUz9/MjzWLdOYoyAUBabwl2jWIpSp5BoZAUVTCb6QbO4vRfjmqfnJo6Bp
	 6kKkHuBFQLn1tfCeQDB7LIxW7Ffdz1O4t4HDHANYIuZUf/730FEXI435n8p62xqBcSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832389;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=7pCDzF50WR3Ui6imm8/IGNoPhxwdgcVRwn0pQAdv/eA=;
	b=ToUO5N3WzNjeQhG3RAr6F+ykKduhzuZ7h14IYVtTJizE5PnSHw3rJxAA7raQfboeFJD3
	 Ro8vEHjXTB79LkmFfIBulKfPWGGc+vBO311dhPkQGPN/RZDGM23FIw425OlQRBkzLbzKW
	 XSrqdxXJfaJp1oS5ejb/w4GaQ7l1eg5VWMCiwAXjxVuxEd0PyITwHI1uobiOoKst0WGbI
	 HniEQEyFG0uhiWlqMILEpcaKpmAdNa2OnNM+ZDMT4wuouPaswfaxPtJUyZRRrKknCj1vZ
	 e9Arl/5XIjNP1QlQX9Zqp1NyQ8bi2w7jSf49Opq8URm2Z6vCkQ4yij0Q/Qu9R06EcqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIFpaR1Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A3606A323
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIFpaR1Z
Received: by smtp.kernel.org (Postfix)
	id 6848A1F000C5; Mon, 16 Nov 2026 12:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BCE1F000C4;
	Mon, 16 Nov 2026 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832389;
	bh=7pCDzF50WR3Ui6imm8/IGNoPhxwdgcVRwn0pQAdv/eA=;
	h=Date:From:To:Cc:Subject;
	b=FIFpaR1ZDo62+9kDT/aa9IYdE0k5B7NaEQ/ueSBuaV+CwIy0dOTL4nGMlR3kL1Ab0
	 agf7WspXpFRzmW9Vkzs+kVQTlpXHa+GsjrTSC+h5O0urjagPEEkw3vvY0p2z9aGebU
	 rKIBEXJ+V0A6kM03Ywx4N3vXtEin9wbZ/eqaA12kGunA925hQU/qZmRIbCMZZ6HVNX
	 wlgLiw10JCo+iyahwH7iv89v/Thh9pO32vcIA54rRLV8H2E3SdGAAN21cqMZN695on
	 hOsiVqViQOMdNQpj7pKNZxTfdqkEKFFSLTlCNkZ3mGh65KE2LcCcxebmjC7UOVozvR
	 xZAtO9wvg+MBw==
Date: Mon, 16 Nov 2026 12:33:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review failing to find a series
Message-ID: <f144d595-0bf0-49e6-8f85-b6be7e5477ef@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="EI0Xid6/U4V0YaTW"
Content-Disposition: inline
X-Cookie: Don't SANFORIZE me!!


--EI0Xid6/U4V0YaTW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have v1 of 20261116093751.138455-1-stefan.ghetu@nxp.com tracked in b4
review, it finds the v2 at that message ID when doing a b4 review cron
but if I attempt to ugprade to v2 in the UI it says "No series found in
retrieved messages".  If I forget and retrack the series it imports OK.

Thanks,
Mark

--EI0Xid6/U4V0YaTW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr6+AEACgkQJNaLcl1U
h9AAywf9Gj6EeiLajV5FkKUxBkIec+Pl6Q5DEtL4aXqsXyKIjxV6yS6HACFVvt2y
dgCQxAguCPIXaIMAWhf+GRjEyWN7AA7TrfXHB2nTcwc4aoH/1eHhnOEO3oQE+Z13
m+PVxTAN30xAXQJFjV5Nwl0fJIz4RXGnIsbXfK3VQY+obv252kx3dsxgf7Ed9MGY
gf/u6oL2x59XzfkQdCzrn3gNtI+Ia8U+qc24TKugNWy+giEOs+XTG9Wbz0mv74z0
rrdJTmyItumzsjlltK3IHug220txxEQVJQTWuVUKrgEOPCvJ7U+TYBz365no9a7f
T5cL9QHRSwilAACVKBt9VKprc5mo4g==
=74ig
-----END PGP SIGNATURE-----

--EI0Xid6/U4V0YaTW--

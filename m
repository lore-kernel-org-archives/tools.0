Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82936BCF2
	for <tools@linux.kernel.org>; Sun, 10 May 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778419228; cv=none; b=AmEoW5tBTzHqaXY4Jm4ff4i/zcHZaeoeL8dwtomboQnSTKfO/qd6tCMDtxV4cnzZ5/Ozx9M0+eXT/uYIGXzdPHmrE4S5YMHEpzzUjeKD7IvGvnqnAg1cbDLXtpGteu/8Yd9X2t8diz3bOodyfH0kIHDTo+v5xM+E26qnVBoizsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778419228; c=relaxed/simple;
	bh=AQe0Wk8ZG9Z23G/2c5k/Qme63j/s2T5nD7yP/kpDqrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMrrSKdm6MxxyXoNh3+n9gIChEjFusA7cxDLQp0cIMndVyvvK5umJd+0Xc+I/Gcdc8W741/d4O0FiC8Dx6Vf8VLg252nRw9QQdmW3sDxr6J5FFwI6Zcc0qodo483Ytc4Wz9sFFHuy1mxbeOFmZKXTD2wZobOXFpBRDHuqR40xJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwmHG/xv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwmHG/xv"
Received: by smtp.kernel.org (Postfix)
	id 93145C2BCB8; Sun, 10 May 2026 13:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63753C2BCC9;
	Sun, 10 May 2026 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778419228;
	bh=AQe0Wk8ZG9Z23G/2c5k/Qme63j/s2T5nD7yP/kpDqrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwmHG/xv1juLXZ4bjEAhgbhP0c0XFWc5R8L2L8C4ihZTc3Vv8R9cmFJ+HK2XjzeAM
	 jofGzn1hfnlkTj7MQIVmVoW7UJNewC1ksi8aaQxebp2oYqJA5B8ydbP/QvMZsmhqwd
	 Xqlh7uDezJa701jT8+23jl2TEyqhVw38gWo7V3B72uuQaYQbFOHuUHCHbjkhWdkUXK
	 92mWWE1+Mp9+rOckXKfJnsKIvcm06D8X3pal8SuhOXuWSvT24eGEz9e1KiA1m/rujE
	 2htSNbUEAdW/FTEG+rm5Zrr4STasYfYd7jvILdymsYEOYcgh757Dqkb3dxcocoj6Up
	 zm0g+0qo4jCTg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E6CF91AC5898; Sun, 10 May 2026 14:20:25 +0100 (BST)
Date: Sun, 10 May 2026 22:20:25 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl track-subsystem crash
Message-ID: <agCGGdZ9laXFu73L@sirena.co.uk>
References: <e2416f79-9bfb-4f72-8751-f300e9922223@sirena.org.uk>
 <20260128-successful-pegasus-of-innovation-4cd273@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SsEz7GeQX/SDtmE+"
Content-Disposition: inline
In-Reply-To: <20260128-successful-pegasus-of-innovation-4cd273@lemur>
X-Cookie: Truckers welcome.


--SsEz7GeQX/SDtmE+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When I say

  b4 review track 20260510053939.564314-3-enelsonmoore@gmail.com

things get very confused and b4 tracks a different patch with no way to
override what it's doing, I think some combination of b4 and lore's
patch ID stuff is ignoring filenames and therefore faceplanting rather
badly:

Retrieving series: 20260510053939.564314-3-enelsonmoore@gmail.com
Looking up 20260510053939.564314-3-enelsonmoore@gmail.com
WARNING: duplicate messages found at index 1
   Subject 1: ARM: orion5x: update board check in mss2_pci_init() to use the DT
   Subject 2: ASoC: ti: omap3pandora: update board check to use DT compatible
  2 is not a reply... assume additional patch
Assuming new revision: v2 ([PATCH v2] mfd: twl4030-power: update checks for specific boards to use the DT)
Checking for newer revisions
Grabbing search results from lore.kernel.org
Checking for older revisions
Grabbing search results from lore.kernel.org
Server returned an error.
WARNING: duplicate messages found at index 1
   Subject 1: ARM: orion5x: update board check in mss2_pci_init() to use the DT
   Subject 2: ASoC: ti: omap3pandora: update board check to use DT compatible
  2 is not a reply... assume additional patch
Assuming new revision: v2 ([PATCH v2] mfd: twl4030-power: update checks for specific boards to use the DT)
No change-id found, generated: 20260509-mfd-twl4030-power-update-checks-for-specific-boards-to-use-t-d88ef2ad7c39
Tracked series: mfd: twl4030-power: update checks for specific boards to use the DT v2 (1 patches)
  From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
  Change-ID: 20260509-mfd-twl4030-power-update-checks-for-specific-boards-to-use-t-d88ef2ad7c39
  Message-ID: 20260510053939.564314-2-enelsonmoore@gmail.com

Thanks,
Mark

--SsEz7GeQX/SDtmE+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoAhhkACgkQJNaLcl1U
h9CLbAf9H1jjcQXT6DZPV1KqeJCnsfeWij48EN49P0LGyT/OGA/XyO9OChaY0jAP
OnWWIXLIMG8uJsA2N/4MKc4+RVCfWy9yaaabZ1VOY48BHPGvVxJA7RDkoCzsRxUs
yKIYzKvTEE5DXFwwW2ORhmKnhS0DiKddby6ROGXGlMhFAOIeFZMqw9qWKWYLypAh
bei5tya6F7S4jbmef488irTGDPRAOiilqhtOxodAGqrRXerjw8Ry28qR5nRUc1yN
bgo5hOwYIJJv1WiAxtxLh2rbX1ZwTVpcViazCBAx/xRisgbIaSH45gQitu0G4Sun
fdiAvSvSd/fTPjGyDvmy7GSgvd/NwQ==
=9zum
-----END PGP SIGNATURE-----

--SsEz7GeQX/SDtmE+--

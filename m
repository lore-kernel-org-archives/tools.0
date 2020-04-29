Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.1564.1588182652304152782
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 10:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=2nk1T5V0;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 55D8A20B80;
	Wed, 29 Apr 2020 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588182651;
	bh=zH9kHPnilNUgfdq6E/lTzxYJNwcwbVcHvoDNaFucUtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2nk1T5V0eveYCsVOZ692ZELlvh6iPJ09V3VPJQaBR+l1JeqJAaYJqXvnz84hwHStV
	 3H87gHSLHuLKMCJpyl1V05Ctt2bASGeUvk4k3P9WuF3YWDhnAmMNftP37aNmHcX+6g
	 R12V3K8LzmdOeKwGkIUSuKhgSTlsCk0tD6TXb/0E=
Date: Wed, 29 Apr 2020 18:50:49 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Junio C Hamano <gitster@pobox.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429175049.GP4201@sirena.org.uk>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
 <CAPc5daUXCRv5CN9cVdGTgAWinTEFB0RnMF27MA5D4dOMiCCk1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPc5daUXCRv5CN9cVdGTgAWinTEFB0RnMF27MA5D4dOMiCCk1A@mail.gmail.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 125
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h9WqFG8zn/Mwlkpe"
Content-Disposition: inline

--h9WqFG8zn/Mwlkpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 10:42:01AM -0700, Junio C Hamano wrote:

> Are we talking about format.useAutoBase or something more elaborate?

Ah, indeed I think that is exactly what I'm looking for!  Sadly it is
not documented in the git format-patch man page so I hadn't seen it,
even the base auto option is a bit buried.

--h9WqFG8zn/Mwlkpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pvngACgkQJNaLcl1U
h9DCsgf/W32e9uaHa9YOayDlFsEP6aGU5vdWrffcnMTINbMcSQA1G1YKBOopIDsl
1hHbBnjp6PSIM+LmW8tV4Lv9V5d5XohKn8Z3PRLDQul+5YZr4PpPpFIsr9w8IeRC
8k4BY2KMa9m49FgmtfivLKQBIdDd1oc731NUnRdkGbi1zTZwr+nfUq9x1vf31Z+N
aHRNPob0lmBVnY3cOXFb7p5ckqrTblrX8TRqF03e2+e038k0eU86HRuLUS/RCpd4
QHoDt+Ub+MQAiNhavqTXEjO7MjT5eCaw8fCYogNWh/AHMEiAMCoakBs/sHQfuox8
xfx8MHKXW2o4dWcDcPPo1mkeAq0mhw==
=79ao
-----END PGP SIGNATURE-----

--h9WqFG8zn/Mwlkpe--

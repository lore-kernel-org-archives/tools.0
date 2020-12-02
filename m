Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.8218.1606928771501950683
 for <tools@linux.kernel.org>;
 Wed, 02 Dec 2020 09:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=OPp4KgRk;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Date: Wed, 2 Dec 2020 17:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606928770;
	bh=q77vGK110Ed7w0jVKwoZW7ryBrxoFp4kpGb5pelynNU=;
	h=From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPp4KgRkMRHqh8kSZp9qyzZhjmbTSGr3dHjrZiuWYo59uEVJcbhNPTi66QNfswWKp
	 oukU8O7VAdq+kTtMf2Gp8x+lIZRG5cI0hkU92jyrETYHW31cFLckYuo+FZwVTVJvNA
	 ZvDToY2eRN3mMWwf/5P1W6R1Wz0fSK4WM5b1/bSk=
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [tools] b4 ty thanking for everything
Message-ID: <20201202170538.GJ5560@sirena.org.uk>
References: <20201201144101.GF5239@sirena.org.uk>
 <164CA10C94033C15.5074@linux.kernel.org>
 <20201201154354.fw32bk44e6myyi3y@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201201154354.fw32bk44e6myyi3y@chatter.i7.local>
X-Cookie: Sauron is alive in Argentina!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 287
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofZMSlrAVk9bLeVm"
Content-Disposition: inline

--ofZMSlrAVk9bLeVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 10:43:54AM -0500, Konstantin Ryabitsev wrote:

> Okay, this should be fixed both in master and stable-0.5.y. You can=20
> restore the damage by looking in your .local/share/b4, finding the .sent=
=20
> files that you know were wrongfully triggered, and renaming them back=20
> into .am.

This seems to have fixed things, thanks!

--ofZMSlrAVk9bLeVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/HyWIACgkQJNaLcl1U
h9CsGAf/TBv1As/B2Ah4zMDcnxwR8weMP9J8BQj6bGzRxBgn4yieTXrSex5MYejC
ehuqVTt+5eJtSUlCYNvzwXJjPhevJMC4U9PItr3qfYXQzvyrlm0WPClDV8i2A7uF
IIbPzzFwg7wIT+KAfpbcSCkBNwZ9Dkv+7BR3pIntcibAxiriUdC0HFmZ0P4S3NCd
Mr+P70Tb4CRs1opAGYaKxjra0RyhWyxgpXKkWbuA3yDxlrz5WItJeoBr10AzEay9
nVdktWxkCMQqU8RlqTgmhIvQlhMGj8OCt1NKZtZcMdt70tSvHaIbU/w7mTpY1FUx
rhA+LxSifhAGB6UAeGpqp/WOscsjmA==
=tsRY
-----END PGP SIGNATURE-----

--ofZMSlrAVk9bLeVm--

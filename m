Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC93FE9;
	Thu,  9 Sep 2021 13:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05757610FF;
	Thu,  9 Sep 2021 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631195851;
	bh=FEnJ2ZuqfQyQWTe2b3oXe5m6HcII+lHXWeesALtbyNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2x6G5CZDX/dwcJOMxL2nl6mRBthOHUgXoUEW8vKrKjmyo+ox0jD2n62T2Bb+SKvN
	 ZjGmQvxji2/bWftJd15JBbrYiELPm7uTykKUZJGvHmU5a6bnEQvFr8b/rduh2PHJ51
	 lQhNxc7u1K8RjI3exGwa6Elg4+OvGcIocinTNJWDPT1QFO3gt9B+R8IV0r051LI509
	 jXx4JuOMvh3uzjvcVz5F3Vq2uI/1gldKEDU7O+4uzjSXkSPk1qaNrOupFHhnOxfdRV
	 7odf/rkmH9nlKeCDw8jXEha/sPlC1v/SRQC0Ze4u+T8If+CpEIGCD+iFlbF5Mcozpk
	 7jslL6yf1NbXA==
Date: Thu, 9 Sep 2021 14:56:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Greg KH <greg@kroah.com>, Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210909135654.GC5176@sirena.org.uk>
References: <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <YToPeUhL+Ro3zlnq@kroah.com>
 <YToR+jmD1TgdQjXJ@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline
In-Reply-To: <YToR+jmD1TgdQjXJ@google.com>
X-Cookie: I have become me without my consent.
User-Agent: Mutt/1.10.1 (2018-07-13)


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 09, 2021 at 02:54:02PM +0100, Lee Jones wrote:
> On Thu, 09 Sep 2021, Greg KH wrote:

> > I do it from my mail client by piping the message to this:
> > 	b4 am -t -o - | git am -s

> Not sure what -t does:

>   Apply trailers sent to the cover letter to all patches

If someone sends an Acked-by or whatever in reply to the cover letter b4
will pick that up for all patches in the series.

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE6EqYACgkQJNaLcl1U
h9BygAf/V+LSfr0mdokVg1LRpEh22Wnu48Faz8XgOtqGZJOUvRHTjJbRXriQpa+Q
OwXFAc3V8yPGjUdN/lLWCoO1S5IOjNknHEb7kqPODHVhYUmvAJVeo/ejTZKZcjH0
IcPRQTRY8F2DgDrWYZYLM/NcHK7osBQ5fmwMEcObSnoJvzr7G88pcVogslNLllpj
9hHbhKcZupJQqkhCoDn7pRIdQ7riMKLA+ot07J9AAtHm7ySGXjcKwiBEXLn3jxyu
Rgei8RgUwRirbCZk0FJHPs2axMfnvdf/U48MuIJkQ8w0VT1qjjH3YIAeIbmBjyle
6Se8TlbUsQ1puOLEi8GToZQXf59QXQ==
=Bo3t
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--

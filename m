Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E632FA4
	for <tools@linux.kernel.org>; Fri, 23 Apr 2021 16:03:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06A3661445;
	Fri, 23 Apr 2021 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619193819;
	bh=DE9zsJe1OhTudOA3m4M7qne/OO/+6lB1KxiNZj/5PS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7FUmu6F1ljRyYpllnTYUj7UGns5Q2vb8kFEgV6SY6h0WITO9ZGSNaoJXHAHVczsn
	 5t77RwoqqcmcQIP/cgxfjsZy8m6A2jbQVpg4N+Eo3nHz6w7mbCcwHhAcpef3t9u+mu
	 jOKL+1Nw63lGkdyG4X/ACpTxo1nsiVfND5WZ/5r/JACwpEb2T0l0fTEfEiuXpRFVsV
	 BIf7zpJrLKktQuelganWolFFwLsK3uUYb6ax3c7baiXVi/+wKqUk8zUYUMznrbuBA+
	 HL8HO7xxWYZGrc+1uQhxA74YNiM6vttj3/p1OGIcu5wihUIUE90h5AuFuM6MdFvw0O
	 8EEcY090gCTmQ==
Date: Fri, 23 Apr 2021 17:03:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joe Perches <joe@perches.com>, Rob Herring <robherring2@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, tools@linux.kernel.org,
	Simon Glass <sjg@chromium.org>
Subject: Re: Better tools for sending patches (was: Re: [MAINTAINER SUMMIT]
 Rethinking the acceptance policy for "trivial" patches)
Message-ID: <20210423160310.GD5507@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal>
 <20210422092916.556e5e50@gandalf.local.home>
 <CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
 <20210423080454.78f4f662@coco.lan>
 <6c221d801c5a6834168207b5ccadc76ac432c766.camel@perches.com>
 <20210423091320.4f2381b2@coco.lan>
 <CAD=FV=Xi6TL05M2bYKNgNB-ePY40CvonPzJYeMhXMPGgYKA5_Q@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xi6TL05M2bYKNgNB-ePY40CvonPzJYeMhXMPGgYKA5_Q@mail.gmail.com>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 23, 2021 at 07:52:30AM -0700, Doug Anderson wrote:

> I know it's nearly impossible to get people to change their workflows,
> but if you're open to it I definitely suggest giving it a try. Simon
> Glass (the original author) is also quite receptive to improvements.

I have something broadly similar (much more simplistic and overall less
capable) which I wrote myself - the things I have that this doesn't have
are:

 - Attesting the outgoing patches with b4.
 - Tagging the published series in git.

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCC770ACgkQJNaLcl1U
h9AHkAgAg3kolGjCxRflTd5jWq9afn2nTXAeqSQBOmA9COuOc9vRqQDD3GO2/yPP
nGwZFsSdY33HC1A3QyeFDi9rMZG8RVpHbV0dbE2v1/PKRX1S5lq8ioAUFv+MCsK/
aly297RUFBRr//sdgPQxl38aZpsnxpvGiVBj7ukAspzJ2bwPGwYuNTm/U/tbo1YJ
RyhYAYeWJcQH39vYVeKlyeWk7u6u2WpcAKQXKJwuXDeM+ZiOUFx6Jd6yvXECrHAh
QueJy+hWNwJflB3WbNIuunxLqx1kQ9oDqdKHCXn/Z50EQzuMyFc9WrdubL2tymvY
lLatsBvyjKjFL6OcUUXy10zB4OWDTw==
=E3hp
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--

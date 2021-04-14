Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853A571;
	Wed, 14 Apr 2021 18:47:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9786E61153;
	Wed, 14 Apr 2021 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618426042;
	bh=9chUaSNL1upPTLS2mDK78Q8O3+IqQYOAIJkz3xNdsbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FevZs1pIZeHHrKVHoQfT2fwPTUEw2q4qNr/jsPQKm+Nds3kQJ5j2LBdKNj0KHQAQT
	 vxXzoe2W3nZ07Yi8j6/ZdcFdNdHqkHlx370Pqht5ySrfHHetRM/hguOQebjX/mMGSm
	 n5+aaWsfcKduRH8fLzwSWWjhdXiVpuaT25u2u4nPO4J2HDiJA+f4ap8gQ8Nd2frsz7
	 Krs9mRBi6ud8lOywpuYbejlPTAJNX4XrNBMUZ3wvzgOrpmwqREFUeiAWWT6qKjnv5+
	 1K6uV4aKRgbEZhDoKlNyU0UiQ7WuKPlmIhYtQ5k/FoKi4tUO+/TFzneXmHgLHuzRjP
	 L4vbUJ0RT3uZg==
Date: Wed, 14 Apr 2021 19:46:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414184659.GF4535@sirena.org.uk>
References: <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
 <20210414145619.packpzwjauqj4fug@nitro.local>
 <20210414155733.GO227011@ziepe.ca>
 <20210414170751.cpdciflb4vqtkvau@nitro.local>
 <20210414172449.GP227011@ziepe.ca>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline
In-Reply-To: <20210414172449.GP227011@ziepe.ca>
X-Cookie: George Orwell was an optimist.
User-Agent: Mutt/1.10.1 (2018-07-13)


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 14, 2021 at 02:24:49PM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 14, 2021 at 01:07:51PM -0400, Konstantin Ryabitsev wrote:

> > 3. b4 additionally learns a command to grab new trailers from the list by
> >    matching the Obsoletes: message-ids and auto-amending commits with any new
> >    trailers

> > This would allow you to start working on a new revision whenever you're ready
> > for it and give b4 a precise match it can rely on when tracking new trailers.

> While I understand the interest in exact matching patches, I'm not
> super keen on adding more headers to every patch - this feels alot
> like the gerrit change-id header that everone hates, just in another
> format.

The big issue people generally have with the gerrit change IDs is that
they're only meaningful in the context of a gerrit instance that knows
about that particular change ID, usually one on some corporate network,
and no tooling other than gerrit uses them.  Message IDs are much more
generally useful.

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB3OKIACgkQJNaLcl1U
h9CnvggAhFpmWvrzfVHUf5atMVLDNqasw5KuVa22WHipFdlLKrWVj4msGDo8nS5y
Gb89oWPbSwHyYlzGep7MMJfe6XTm2IEMOfu1/xPTqu/WaID7jVb1t75VEwB7aSLI
O2KQQ/190TNVwHyeMGNoDF/skDmZ7XkacMelnUZVyF31RYK00Yvwo/J/YOhGsufz
kwP2ICObZ1fWDskuP65nCF+MHMhel6b/fjERZzxGmhjrGPYHvAGDbK2jKns5Iij/
bCffkc8Dtt4mp5Vn2EgVeAIedk/5csW6ppm6oyd/GSbVjMX1tPndgLdi1UM0PMb9
InR5m0FUFgTLYEWrJFJYO7+2xwyMkQ==
=lYPa
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--

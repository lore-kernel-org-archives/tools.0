Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716343FC3;
	Fri, 10 Sep 2021 16:12:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E0E861207;
	Fri, 10 Sep 2021 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631290362;
	bh=hunikFODFFzbqTwToHvfpW1g4SKLmzL9VjGGGSL/poQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsLMnjvW9j0F7pwPiEL3ayld/VXzK7i9TADDa8XKgz8sYAezGfaxBv8FfR6ycbluh
	 iCopARTrbF7epaoLW6oXaM7hmJLbuSz0rzi92Kr9k+THiSjEe1+mc0hYxh2cL8T9nb
	 lRJRi3KBkrrVlcM9CpF79/6ZLli6GCJKNLJplxtgc3uFH2k5V+oZKmNomdRRDaFS5k
	 oe7Oh5TZHSej1/dSXFPGNkghrI2v1/kvje6iygF9bPcK3nwwyrrkHl16DN2l7T8f45
	 zs4f7YR/wJOFxollszbFQIfCqjFtpQMwTZ7bmE91REellgFrC1o+RBBHYGQLtZ5Jnn
	 3DjleHLFpK8lg==
Date: Fri, 10 Sep 2021 17:12:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Greg KH <greg@kroah.com>, Lee Jones <lee.jones@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210910161204.GE4474@sirena.org.uk>
References: <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <YToPeUhL+Ro3zlnq@kroah.com>
 <YTuC2Og65gtLxsQ/@ripper>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
In-Reply-To: <YTuC2Og65gtLxsQ/@ripper>
X-Cookie: You are standing on my toes.
User-Agent: Mutt/1.10.1 (2018-07-13)


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 10, 2021 at 09:07:52AM -0700, Bjorn Andersson wrote:

> Is this (pick a single msg) supported in b4, am I just missing something
> in the documentation?

You can pick a subset of patches but only by specifying the patch
numbers on the command line - I do this outside the mail client as part
of saying which trees and branches the patches are going to.

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE7g9MACgkQJNaLcl1U
h9BaYwf+P38RIbGUSgLjHgB1bC/ZdnrZKn0Rjg8twpSjm3tb9gEM3y1WsShIxkOw
EpKnr/x2ai8kJF0qMIu1eZ/dNtyRLFdpA0/MUjpMltR7Qy4h6/nJjyqSEGEmKXjv
Chmo5KBO+WKM018MoAefNs+ySOmr4xHbPDQNdzfZkye0id+zk6wZbAA7z05u+V72
sStljsKVQ5Wru0law8OVhrFAxW5d/PZw6KF7SsSaOjzwFZ+bcrIt8vDVFiOSiO1u
a8C1VBWUpwft6t9MMGRMvxpfNGrcLBqipWnftRSkaluG3Ygvvfoyjvc+lhdHg/H7
EpKCjlfbt2Tlx8VDjGRbidRw6bbvtw==
=hFG5
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--

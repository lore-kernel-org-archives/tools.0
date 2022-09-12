Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ACF2F2A;
	Mon, 12 Sep 2022 13:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA126C433C1;
	Mon, 12 Sep 2022 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662990772;
	bh=NCMrYQt0f81vJrM+dFrzJO/W60NX4V/028ky9ut17bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAfn2m+Zeik99geRv4ue6KnXY2OIk57/yEuvX74xbBtoBYtyjQe+f+uZsVHXSnggh
	 vUzfCVCyFu8TMbYROAhEhy2KaQmdO5KpDbYxlO7n7wJQYjdduU9qppSOzRNIkDMXwe
	 mJqSMuTUcJp+o7uf/+vkdudITrlhDhjxng6EOA+t4+4bUYk8Rh2bwU1vEqQSKfrLRD
	 qVQf9DWexUbnC5KmMhPouml7rF6+sC+H9IjI9121mK/IOF6aossxAB2U/7Np2EJ7To
	 dW8QHIgpPVCbnTOr5gRyqYB2jnrVmgVNAEZGkyW3uIUGe/VwNcb2i4ebcfBqoyjPyI
	 Xsdu7p3fqWfEQ==
Date: Mon, 12 Sep 2022 14:52:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Florian Weimer <fw@deneb.enyo.de>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: Resolver splat from b4 am
Message-ID: <Yx85sbHokXZZeau0@sirena.org.uk>
References: <Yx8kXFRXB0chuYkL@sirena.org.uk>
 <87illspykd.fsf@mid.deneb.enyo.de>
 <20220912130656.e4f3v7ssmfolxttn@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="868CqyDF2d4Nwu+A"
Content-Disposition: inline
In-Reply-To: <20220912130656.e4f3v7ssmfolxttn@meerkat.local>
X-Cookie: One FISHWICH coming up!!


--868CqyDF2d4Nwu+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 12, 2022 at 09:06:56AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Sep 12, 2022 at 02:27:46PM +0200, Florian Weimer wrote:
> > * Mark Brown:

> > >     raise NoNameservers(request=self.request, errors=self.errors)
> > > dns.resolver.NoNameservers: All nameservers failed to answer the query 20210112._domainkey.quanta-corp-partner-google-com.20210112.gappssmtp.com. IN TXT: Server 172.16.32.1 UDP port 53 answered ; Server 172.16.32.1 TCP port 53 answered [Errno 111] Connection refused

> > This looks like missing TCP DNS service on your network.  The DNS
> > response is larger than 512 bytes, so it can't be transmitted over UDP.

Right, I can see what the problem is (not sure if it's the
network here at LPC or the server that shold be answering).

> Still, shouldn't crash on that. I'll add the exception that's needed.

Thanks.

--868CqyDF2d4Nwu+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMfOa4ACgkQJNaLcl1U
h9B4Ywf+LQTXScsbcTO4GLacCQh2iMmJTjgOq7FYoH8SZfkWulEi4Ng2Y7y+/5PS
oUXWyQXZY/hR0X3Ye6xk503oXLzR0x4aeSMRXfEWQGjluSTYMw+rNgxDffBdflHE
vvdH8+bBnCcmmoYxdv64Zflqk0hj1d3mzPLrl9jsrU5450w5EnDXRFApf428G1hk
rwOFEKbOxFi7lIoznT3eoFLmuWKQkl8rEczZFhwUQjTeb/wjXUMApI+/4Gi/tVq5
NAV8+y6ro/9XhoSimqGoP96KKjFo+w5XY9QOguo1es68FSzG/O+r6z521q4A3vY8
VH1ajdqSNRet6vgMPWxGoo1NWzXe3g==
=Hvu7
-----END PGP SIGNATURE-----

--868CqyDF2d4Nwu+A--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726708;
	b=0SLj2y6qrsYZDEuHAxu/2Isxug+N36zeA069gt0WtGoQdch2lShQAJv8gKWGt73oAxRj
	 uRQHKEB6s7YId/+61U+sbhgafZhJyp5oveLwjF89WjUuJ4zt/chLW40/dulWckXCElLc1
	 b2W6qmrdGpbrIZoPIh1eMa5w28PeHpPsSirbPm+DkcFN3mob/2fgIabDI0lZfYFm8GSwU
	 XOUOJnoZvzwELjuthnjWtmNf+GQkSJxrmCzRSmD0OjENVvcF+bD+V07oyOJCtJj9W73vE
	 40SCQ9IFS0/c9Hyo817jQZnUFPh8KEkJ6bHhCL9Y/v/ws2/htV9d99X+cBtgxsVaAIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726708;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Cookie;
	bh=0MRbsCv/y0RuhN75R/5l4/QTPoNdguE5uu0/dL1nRnU=;
	b=NlDOUFPclwcX9dn7MWhfpgPPrVgKs8uM2bEhr8w8w8dFBSQNSInpAzZO5X5fYQuWRBSa
	 DkhwiOis13jQPG3meftNP6BdfytT6pgDQ9B7Xk8KNhYhKKJXmVGaf8AhxEottFYhYatzW
	 +8j3+HH2xf4ycaFgiBXfpp1GiLNTdZsNsxASp1dcH5nrYUfircKmX/y7rRvRVIpdCyGRQ
	 /8l+W7ohaD+FnsVc2x7jwUqaVHHbUie9ONJGuDpzDFWfa5tP9tJUkxrwEvWhyFQaYLFWt
	 mjH+kfrDN5hvaLB+FGh+Ely6sm8C9e8W0OFw4DL3VD+QvIAddK+lYKF8h9m4ckl+kSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cqWck8ks;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90515606A6BC
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 20:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cqWck8ks
Received: by smtp.kernel.org (Postfix)
	id 3D09B1F00926; Thu, 26 Nov 2026 20:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806111F00924;
	Thu, 26 Nov 2026 20:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726708;
	bh=0MRbsCv/y0RuhN75R/5l4/QTPoNdguE5uu0/dL1nRnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cqWck8ksxO5zBxIcll7YBcMDijEaoz938lOXgh/tk27Tg/Hxe7yBil5ElW5ORXOuy
	 x/kTCIcv8b9xODDIddLqKaRU+oycBgrfXn3cRDgeTb0FX7984guJnzUcm+gGP6rpQT
	 p7qIvRH5lu3kSeAFrnt0oWCSEd6wVaE7paGmJAXFLeubBn9d4x8EMCHL37iyBNMQd9
	 gEbw5PgOeNBt4egrp5nkwL7aO3I/pYsw2cUBQ1jE3zAevBeO6iRYm6AEQPHaJWDVOO
	 ZHBoQRsxVUS+CyhohWOvaIN6xmnLy2SDbT4J65jcs8ciibLIysz1ewGUkKaHZNo5gq
	 OY6Ys2y2ilyVw==
Date: Thu, 26 Nov 2026 20:58:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4 v2] review: Add a batch mode for agent reviews
Message-ID: <12466b3b-b08b-4710-83df-8eeb86f33019@sirena.org.uk>
References: <20261117-batch-agent-v2-1-d42998f95590@kernel.org>
 <20261126-colossal-azure-bustard-f6bfde@toolbx>
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
	protocol="application/pgp-signature"; boundary="299oLxEjtaYZwCss"
Content-Disposition: inline
In-Reply-To: <20261126-colossal-azure-bustard-f6bfde@toolbx>
X-Cookie: Sank heaven for leetle curls.


--299oLxEjtaYZwCss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 10:28:43AM -0500, Konstantin Ryabitsev wrote:
> On Tue, Nov 17, 2026 at 01:07:42AM +0000, Mark Brown wrote:

> > There is a plan to offer batch operations on tagged commits in the TUI but
> > this feels like a case that's worth handling separately.  As well as the
> > particularly long runtimes compared to other things that b4 does users
> > may also wish to do them in an isolated environment (or an environment
> > with better connectivity for that matter) so a mechanism for running
> > things non-interactively could be beneficial.

> Thanks! I made some changes to better fit with the plans I have for the
> workbooks and batch operation mode. Please test out the master to make sure
> it's still doing what you need it to do.

Quite a few changes there!  Everything seems to be working as expected,
thanks.

--299oLxEjtaYZwCss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsInXAACgkQJNaLcl1U
h9DRxQf/VBHBfVmuola25QMARsrU/r5gok78VpdX8pP4FmmD7lkUy+EqIZONkZwW
eA1WJ87PTNHQTFB/WtgCoVUgI0c9gpopjQRbEGt/xCpyNdPaWLRnUPDPpvZlclIa
g7lPuJNQn/jxln3kAVil9vDX8uqmuU64q4ueLHSgdc1VHUZTXJnqPr0uTER7RAj+
mUyQFG1XMGqyse5hF8/GJcu8rsNuvcRg3JgCXtxkd+v2RkLVmzG911HIRxlu9jAl
FLWOLyjtwuX3ELTJ1NOYr722s1VtqKcIfYbtctZoKaicUD5rFrbPlgWVntQVmqPm
TBxr6rbDM+pvjQ+PIK1QtgQMPzqzUw==
=Oa8U
-----END PGP SIGNATURE-----

--299oLxEjtaYZwCss--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553581F91E3
	for <tools@linux.kernel.org>; Fri, 23 Jan 2026 19:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195976; cv=none; b=jed6Eo3q/oV3pi3LeiyR5h3rlgpw3FC1w706k9XeQ+7dcp1yxXLdWgcmblpWOCv1f786NWpdmYs2WXEAu4YuOUZqXU+QzLF78TJO9o12l/mkjxxcjxsejkDY3DqDK8u8oVfCVbSiPgQZxnunrnfwgS3x14UKFr3g/BJSZ0JUBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195976; c=relaxed/simple;
	bh=ZN7l1aNSSgqNWzHA6DT6HhJHcjWo5E//96FNQ2+hOWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwRr8rdAndNcGF/smeXqFLaqDvw+I4hn1dnWcUugcanDChT3/OC20kKw1CGhlnWk7FXFyqd5tPWsN/xq0i7KKxzsf99CGB6zDP4B4E7aPYp14PPUz3Q+xVU3OsmedW2IqVEgoBe+BKh/hhxeQM/JvBPzXfjGBrMNlrYL/0QsHyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCGl6sO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCGl6sO2"
Received: by smtp.kernel.org (Postfix)
	id 15357C4CEF1; Fri, 23 Jan 2026 19:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEAAC116D0;
	Fri, 23 Jan 2026 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769195976;
	bh=ZN7l1aNSSgqNWzHA6DT6HhJHcjWo5E//96FNQ2+hOWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCGl6sO2sft/JLCOla37lQRuqDiKU6Z+1G8hfpDjyJxMimrM3CdiHfOOjj6A+wnYv
	 7WgXKGb31RbHPuQNXoqu7FrjnJ973bI8m/jt6Ya/7WqYBPoUoNZL1qnfAjHXNGRVS+
	 gBGTFWbXE+Y4Gfntkdu4qmbyKLuwGJB4szYfQyN7Db6DRHmERE661FmO4qCVyedYdl
	 kRuIQXXzK7p3gxKdmrBEvWiexewdhQvIM5+ef6zL3gNkhVqulLi/HGgGUTmbN4d1Yq
	 vWNEmvDi7IZXhAb3pxRIDlqG4FxZdWVUQiyiGhwbxyrr+n4IP+v8r2TYGHy8x4VYtC
	 QliURLumnTLwg==
Date: Fri, 23 Jan 2026 19:19:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: korgalore v0.4 now available
Message-ID: <c9a95ec4-d524-4f2d-8abd-afafa8f1c480@sirena.org.uk>
References: <473ed792-f970-49ff-8a11-ac9d6a82f83f@sirena.org.uk>
 <20260123-ubiquitous-cockle-from-asgard-5eb710@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npM09z2fYWCtVQGR"
Content-Disposition: inline
In-Reply-To: <20260123-ubiquitous-cockle-from-asgard-5eb710@lemur>
X-Cookie: HAIR TONICS, please!!


--npM09z2fYWCtVQGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 02:07:18PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Jan 23, 2026 at 04:43:46PM +0000, Mark Brown wrote:
> > Given how long it took I'd expected it to have done something to the
> > output, and the above is not going to DTRT given that it's pulling in
> > linux-kernel.  Probably the program should understand that linux-kernel
> > is special here.

> Done. kgl now filters out the following catch-all mailing lists from subsystem
> queries by default:

> - linux-kernel@vger.kernel.org
> - patches@lists.linux.dev

Great, thanks!

> So you can now just run "kgl track-subsystem 'REGMAP'" from your kernel
> tree without any extra flags.

Also great, thanks.  Sadly the above doesn't work but that's because
MAINTAINERS doesn't actually say regmap which is a MAINTAINERS issue.

--npM09z2fYWCtVQGR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzycMACgkQJNaLcl1U
h9Dklwf/dbMQElIE6S5nuVoubrjNC7W5IUpsl3DBGDcVblSrijBuXvNe+XjzVobB
ZTraSE3eZIHV9X+frmh+nheeUW7uh2vp4PhGktniakNYkVOAdrs5X4ehpu6yOj3g
PnAu3lai6C+VeVYu3UYFtk1QSGDASg7bA+o9MZoSBEQwWEunWoiijVWb+yIehzGw
bimxjgXbDiio9Kt5HeM9eEd8o6eFyLsmQhZZ2QnNwqTuDYwHxph+063Ol2BWHs9v
7jQ4Uwl8oK/Y3rygQeb39pvGXS3vjT18K5yDvnPYkae+uiDFsZcmaj9Cd5+dcR0G
HKywTRIw9Qzxqmt5Ad2Mm1PPrfh7ug==
=a53j
-----END PGP SIGNATURE-----

--npM09z2fYWCtVQGR--

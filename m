Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C533F58F
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105116; cv=none; b=qVR8LrkF+eRNofUwiv5VFVhS4GSGukyC8ypYGqY2zf7BOD8qGzJXxuBemAzZea+VQs3QE1tt2B2MdiJVmoAw3U7U67uDt/ROBJmiWTjx/0aAsG96Mvl2Jn61AHugH5rM0/8AV7I2IpF4P+eoyCBVCeDEjh/CW4lHRgczp+sLJb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105116; c=relaxed/simple;
	bh=du/Rc/u4nYS3X3Hha/eHttXWutk9gxNe+fNc1YzgJdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuOWJxhQLRDB5byb4qGHR6DZCPFAUqIhHyz9sTBn1JC8h9+GlA4/riZP0nJJ3E0br8B40BuY0oc8lal2QrdTbdN6lVm/krKs0eRHP+sAMXeGkXoPai9sfNs9txAIN+Loi5eMCo95zAw9N5vIT40GURXrnIgSgH4S08Oz7tWf77U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJfXmx6P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJfXmx6P"
Received: by smtp.kernel.org (Postfix)
	id 697A81F0089A; Wed, 10 Jun 2026 15:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233FA1F0089B;
	Wed, 10 Jun 2026 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105115;
	bh=YIoZE0hjll+b/j002YA9MgNTREG8aUFWWGmMr4tnTRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJfXmx6PPvguFKdw7OdxHuFZ+2cm5NJIl5CP+JDiaYSTwNsC7CdNPASoUeAdPuTcR
	 9+YbxJsWLgb1j3Qp2jRm4+ODxQNK0nma9pOhsCpYeDjfaPHjESPe+EFa9j9eoxyv0q
	 kM0ccoPDNaxqnT3Pvo1thKdx8DNl42XKjDwKWYMJhgfGSOiFM1ohPIFFCIwlhG/gyS
	 jO5Yghv+WPLsvXX0HuysW/dHPe3DIFYYD7391jqlQz+f0Nj4iJpOOOLbpsGZEPhv0w
	 B/YkSYztbnXNTYzNG0DkpIk6hx+yuaE3r/QhNVb2dvIGL8PugjsGQNo1BOzi7xYrbB
	 2VHGsVLKQy3iA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9B6DA1AC56C5; Wed, 10 Jun 2026 16:25:12 +0100 (BST)
Date: Wed, 10 Jun 2026 16:25:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review workflow issue with partially accepted serieses
Message-ID: <aimB2DACiXv6MIQk@sirena.co.uk>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
 <178104250404.112711.2880594121343252200.b4-reply@b4>
 <ailGd8akixhx_GHg@sirena.co.uk>
 <20260610-influential-wolverine-of-improvement-f01d0d@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="10umIZmsQfZQCRTC"
Content-Disposition: inline
In-Reply-To: <20260610-influential-wolverine-of-improvement-f01d0d@meerkat>
X-Cookie: Leave no stone unturned.


--10umIZmsQfZQCRTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 09:46:25AM -0400, Konstantin Ryabitsev wrote:

> OK, to help me properly model the workflow, is there ever a situation in which
> you would:

> - accept patches 1-3 from v1
> - request changes for patches 4-5
> - wait for v2 with those changes
> - apply patches 4-5 from v2

> In my mind, this was always a "send a follow-up series with just those 2
> patches" -- should we even support the workflow as described above?

Yes, that's a thing that happens - usually in that case the early
patches are bugfixes related to the work done to enable some new feature
that is the main thrust of the series.  You can ask people to split
things out and model it as two separate serieses but that's a bit of
faff for something that's broadly a tooling issue.

--10umIZmsQfZQCRTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopgdcACgkQJNaLcl1U
h9AGXAf+LeonR/qvctvEJ87itIWxTqYDsPwt425WtgX6+evIPzwMwbxPpvpwRjQD
8196nBrL8Hsrktg+p4MQ8kTyrC2z1DQC00856GCv8PyKSIk3UuE2BdCPJBQEaa6M
ZQcdFu2FjxcOKkQrIP/nEsNhHoyNgDpOzlm71gSVtnKEkBEqvI0QMXgBRPBNIneK
w4QtsS5A/TUtX2+73+BMlgvN2ygjTyiMeozno+Kea/HrTS88s8F8EKpMDh4HJhUq
PzJ0TR358OECDAvV8CCN/tI77DJJ9gE4f1BcFo3bs6mrL9eBKWHnhG73YBDV/fi8
saSNIJovPpeoemuJ1ytuZ0SPn3cDlQ==
=SJmF
-----END PGP SIGNATURE-----

--10umIZmsQfZQCRTC--

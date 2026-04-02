Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E852EDD6B
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128258; cv=none; b=Dnd+qKNGIHZU+XR1jVHbNbV6XQXBYtlZ10O6HJFLUePE8ITVs+kEmysX5fnHLYSxAXMyeevaGjJn0RFohEBQC2yYjSF484eBoczN8Yg4w0/8xmDsE2HthN7vTkcslMGFTGzmyuvAIpU8TS34CntnElOVGZNRZd5nhSNSU+TgM0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128258; c=relaxed/simple;
	bh=/dBnnQzKVoH5/Mog5Gd7m0gCM30W8oMbVlNxg/rIaY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9jklpUfmtQ9rvQjf/ynmfs5WJ3g+vEsoVizHhCEbYu9LtYtuCpqx/u+wWd3pGn7sri4amJbT8pyz6B+S7JTr+UvXAp2yZSQykyy0W61IUAWJQkvonx6JIgw1n6WwQaNw7K01OuNmr6NVuvRHrMoKuyROYPFu5Iyj1BqjBrbV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxYqzn5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxYqzn5E"
Received: by smtp.kernel.org (Postfix)
	id 6F44FC2BC9E; Thu,  2 Apr 2026 11:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44D2C116C6;
	Thu,  2 Apr 2026 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775128258;
	bh=/dBnnQzKVoH5/Mog5Gd7m0gCM30W8oMbVlNxg/rIaY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxYqzn5Efj/BDZR+8SFWWCps0PziCD36GfFqiDnhsk5JDEG69MEmRCW14Ky5S1li/
	 CgoOwQSxcVruHdUNeQnEx5enAVJoLsyppxWPl83eX9XD+UT5LOrMp9TKlqO0/GQDfp
	 v0ZiSAdgakoE0ac4EEktW01vdc6PsbKVpjCxMxirscEMKiVo9ZszVggEGt1k3y3hYl
	 fnPI3H+ZlgCx461FTBnd4Cs6DRDLKfJqwggTbVbKegzoFgwYQGQ3Shluxt8QmTCISU
	 Q6Wew14Od6hte+awYhZ0+ssfx+SCKQDN45F7FZy0934sYWCl5/Yb2sNlMWWBHrLdfR
	 I3TpfciPh9rUA==
Date: Thu, 2 Apr 2026 12:10:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review crashes updating a series
Message-ID: <46a6b31b-a28b-468e-bcb4-9f2b3e7f4bec@sirena.org.uk>
References: <78dff388-0d4f-43f1-b197-af64617f9df6@sirena.org.uk>
 <20260401-curly-chicken-from-asgard-133cae@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ceIsLL6pPgNMaiu"
Content-Disposition: inline
In-Reply-To: <20260401-curly-chicken-from-asgard-133cae@lemur>
X-Cookie: <doogie> dpkg has bugs?  no way!


--/ceIsLL6pPgNMaiu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 04:48:45PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Mar 31, 2026 at 04:04:06PM +0100, Mark Brown wrote:
> > Hi,
> >=20
> > I'm getting b4 review crashing when I attempt to review this series:
> >=20
> >    https://patch.msgid.link/20260319032112.5251-1-chaitanya.msabnis@gma=
il.com=20

> I think I found where it's happening, but please test it out -- the latest
> master has the attempted fix.

That seems to have worked, thanks!

--/ceIsLL6pPgNMaiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOTr4ACgkQJNaLcl1U
h9AcAwf/Wfm9QebMmna2usRiDDzonlFjXgRp5E2TWmyq1clkGWTpn+33kiA7/HPG
rXZq1yoskNqiD99d40IdsD2X4Z9uojv90I0u6DRviIyA6zdcoVQZMHwnkIayPcYO
AspMiSqV4eT+XCmnxL0G0L0Z/Jj39w1DUOlMc0qQBTsI4HUrTLv1JTh8QvwRJsar
8xYYQ/LhIWLYL67pIonxUf7kGyavnXPwM9lGF122a5MARprjv2tvWZTTyyrVSkB1
mxU5F6gTJhS49aVVLuUdVB/9A7Gyl/f6P+2wUbc9fFfvPm9pF9hcLeNsdq11RT4Z
isqtXSPAJJh+NtZ4I7UgptVxuNy4ww==
=efCt
-----END PGP SIGNATURE-----

--/ceIsLL6pPgNMaiu--

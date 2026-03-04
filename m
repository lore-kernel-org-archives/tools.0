Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCBC377ECF
	for <tools@linux.kernel.org>; Wed,  4 Mar 2026 22:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664930; cv=none; b=Vd9wYBHU3z3fkggsFKW7Fe79SqLN5+w725Lizh3lOUswWJxr6xGSbMPZ4Jihg9fwc8+/VkcAKyczlwL5KhCBmGov5RWAhgDjgNAJdw4SKHLsTAiQxpWV8+Dw+bB+aR1hII5kYOgqBpol+FniPVoehVW8T2wu/MwdjluIQZFyc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664930; c=relaxed/simple;
	bh=17BJl0S3z3WCBYqZfSdul7KC405b9xZKZiketbJMZVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjYHrpTEqbLyfFP+wNrN5cBULSVemrAEvSQ51rsyk1UAs085oeRZ0RKqN8AKd7SFRNdpih1STb+Qdt7xI/52jc7nVoWMW0NA4Imkfa6NMgIwm0EBzLkghq4hfU2l4+Zs5gdfneg/srvPQtKLSnQ/ESy8bWZn8ptmgRb9kEulUhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZthtNxfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZthtNxfJ"
Received: by smtp.kernel.org (Postfix)
	id AD9A8C2BC86; Wed,  4 Mar 2026 22:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACBAC4CEF7;
	Wed,  4 Mar 2026 22:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772664930;
	bh=17BJl0S3z3WCBYqZfSdul7KC405b9xZKZiketbJMZVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZthtNxfJb3xUKo5R3WtrcOMSj2kXfZM3+YtOcrHwFr3TZzdAnFgQs/DvUmdDv7ImN
	 b8l7v9fL2lqw84s3aGmDTrpIWxPxVr/f7RywQ7AgX9KLprJ7MivX96UgRduCFchpJY
	 LuezrVqQ71QZqjzIP4p9mpQ06jeJFRJSsl6zQh0I7w9bbdxKz9Zih2xSDdeXehVzfW
	 tUOiAMApgnKB/CxJsLvQ+FATxwkuAvn+Gfyf6tJ+QYLXplWuEFJiNt3d5qC5XpyuIS
	 rMfVgxndtTHgiGVwx3UyrrvgNLFMWxjFuTrCvMPseUxjYiZaAL4Inrx5SY1K9H99Wx
	 0GQjTsEEKqNJQ==
Date: Wed, 4 Mar 2026 22:55:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260304-anaconda-chance-345f697c9ef6@spud>
References: <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
 <20260228-gulf-mountain-5f935fdefaea@spud>
 <20260228-charter-keenness-1256807e458d@spud>
 <20260303-tactful-zippy-oxpecker-fbcadd@lemur>
 <20260304-deviancy-overlaid-e7947f09089c@spud>
 <20260304-keen-clever-cockatoo-a8dab6@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/GlPMV77m7/hFKg/"
Content-Disposition: inline
In-Reply-To: <20260304-keen-clever-cockatoo-a8dab6@lemur>


--/GlPMV77m7/hFKg/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 05:40:17PM -0500, Konstantin Ryabitsev wrote:
> On Wed, Mar 04, 2026 at 09:38:09PM +0000, Conor Dooley wrote:
> > I tried again today to use it but ran into some things flow wise, that
> > prevented me from actually doing any reviewing.
> > Oh, and I managed to trigger a formatting bug again, on 0.15-dev-54639
>=20
> /o\
>=20
> > 	MissingStyle: Failed to get style 'v2,1/2'; unable to parse 'v2,1/2' a=
s color; 'v2,1/2' is not a valid color
> >=20
> > after grabbing a series from patchwork
> >=20
> > 	/stuff/b4/b4.sh review tui -i linux-dt
> > 	Retrieving series: <20260212082105.1878720-2-sh86.bae@samsung.com>
> >=20
> > It creates a massive spam of text, but it contains:
> > 	text =3D <text 'Started tracking:  dt-bindings: soc: samsung: exynos-s=
ysreg: Add hsi0 for ExynosAutov920' [Span(18, 88, 'v2,1/2')] ''>
> >=20
> > LMK if you require the full log for this.
>=20
> I know it's a pain to get textual's backtraces because they are not easy =
to
> copy-paste, so if you just want to screenshot the bottom of that dump and=
 post
> a link to it, I'll be able to untangle it from there, usually.

https://i.nuuls.com/wLaX3.png

> I'm not able to replicate this if I do "b4 review track", so this is some=
thing
> specific to the patchwork app, I think -- but seeing the trace will help.

--/GlPMV77m7/hFKg/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaai4XwAKCRB4tDGHoIJi
0mHgAQDzm1QK7aVyL/ZjdsF8BCS/XewR3Xquv3YI67i2Afq25gD9FSt7AtQMBjOc
5aAe7q+/J8gR0FlHE9Atc5Ssdpb5AQA=
=4MUY
-----END PGP SIGNATURE-----

--/GlPMV77m7/hFKg/--

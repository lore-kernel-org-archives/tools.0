Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C7634CFCD
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772303850; cv=none; b=P5Lg+idQldRo8LPEw6BwhY+OpTA6PTctJDJNO9bemxeSpWghThL8DN8hfQ4biquL+c1/AGEPU1amBemnsVBdQYFR5dX076FtO3JB0tFKQL3kbF55v/2Kf1NXxBvERJeXIzXIxnrG0v061SmPC7oIiDUTnIUF3/Jyk1uxlOrZyBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772303850; c=relaxed/simple;
	bh=slSeY8GWf8SF3b0lM0hqzpkU9GZpR/FWIPvQUZqL3+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f13EUFQFLZSeH1yN0xDdK0NsbdpNu6NUW7g1TFwL+A7Z8WMw9HlvgbrqB00jlmmfe+GKkvs1K4uyqweRQj2peh0fVbIV//SNT3oaKG2KDguvl/kjmYqEnjYJqcMQS9o5uYE6n+UgqodafJW2QgtRqWxtVb4MhwlimIZbwSB3APs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiihW/eR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiihW/eR"
Received: by smtp.kernel.org (Postfix)
	id C25A2C19424; Sat, 28 Feb 2026 18:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9A6C116D0;
	Sat, 28 Feb 2026 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772303849;
	bh=slSeY8GWf8SF3b0lM0hqzpkU9GZpR/FWIPvQUZqL3+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UiihW/eRaI7F3sLTCKpAgyxZPskT9csqdZwhQ6SFwfcoas7VAyZvLqgODgWpmgVe2
	 oky8TBIrO6kkuFj0oXGiSY5Ho0HprIVl1kD+PSnnDuTARcjFb7CFKlHtn5cmnSVHiu
	 XkgGSKOGvmXV+9J8GvXKxtReERbthk9E5zwC0PduSvcqzvsk9ueFguqT+al9NRVato
	 DpOBXa5juX7aQ/8g0F2dpez8KJu3srEO74nsMSouMDeIEUS0uZU3T9It80AHljzAqc
	 DoHP51uHJlz1TXrz+imdSkUhXg6rrHzIe+DtFl613opDUy+12Xi/BbYgBdhxG3Qo/g
	 F1jVZVWCls9rg==
Date: Sat, 28 Feb 2026 18:37:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-pediatric-petite-88e93b4d38b4@spud>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rYzTLdl3ZJuDfXHc"
Content-Disposition: inline
In-Reply-To: <20260228-poodle-of-wonderful-justice-acfab2@lemur>


--rYzTLdl3ZJuDfXHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 12:34:40PM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 12:21:27PM -0500, Konstantin Ryabitsev wrote:
> > Argh, escape_markup will, unhelpfully, only escape actual markup. So, i=
t will
> > escape [bold] into \[bold\] but leave [PATCH] as [PATCH]. WTF, who deci=
ded
> > this was a good idea?
> >=20
> > I'll commit a more wholesome fix shortly, sorry about that.
>=20
> OK, the more wholesome fix is in place now. Please try it out and hopeful=
ly
> that lifts the curse.

Looks like it did, I'll have a play around tomorrow so. Thanks :)

--rYzTLdl3ZJuDfXHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaM15gAKCRB4tDGHoIJi
0it+AQDuy32dag+HRqWn5n/S7vlKYzybA6lu+8FSIjX8HZK8NgEArO6gLYwuN5fd
eYwiYKmNekBSFVdl9ChK2a9XyW8bBQ4=
=l+/0
-----END PGP SIGNATURE-----

--rYzTLdl3ZJuDfXHc--

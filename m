Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329682;
	b=t6A6rzxs8QoA6xPaQef0djKRFKaF1LWKWyCe0FHhONroel4FWFmCvM9DNOWrILweOSGl
	 jMYqIVtHoPLnRQxpsiVvbiSy0ffqSEgccjl8RxbHcShURyRbQlFHyqE7r0i8Npaga5vcb
	 l6AwWylrxPzwpDIVRxxppN++bpAVM6o9fky07TSaumBFwEGN3R260KAG9VnbfBUPOshGU
	 cBvTbxzTxkJW3OwIQ6RkUEc0SLVy9fT74nx9b0cCAV/Z9kLs8GJ+Lv72W3mT2Rq8uaYug
	 ZKV2S0hGoGT/JzjLTh/P23pK/OLkpVZccahvuw0+7z1VMyq0dU0HkKlY8M/CHMmK4Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329682;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=BToN8NR71rXfDStWts/30zCAGaYR42dykaX8r/W5Mjg=;
	b=GzaVewub29ynS9IPIByFchcx83j+ERdovJNTo40vgdQygkSCYKZvBxN84ul059edYPZk
	 ZMUj9RSluszoA9OuQIuNvvrOh5IA4CNQU3O6cuKtEu1HMk7mg0WRoKGmL5B5Zw00HN4uy
	 HEe7neKdCsUx0wElqvZOIStjrP2PAUOBmRQ/WwPZiBqbE9yYponSBzD7GvH9ZDFLk55s4
	 9lkGPAGvY6mBqi66Bvor7B6LIoDvfqR9a/SSZwtJK0sB+9btTKcDBj+GJ4EHy+7y4/UR2
	 45jQxFD1jO1KE3u3MdTxcGnJLvjT7nXFz04ad/DX38LweGtfxZrxVopiLDvkQxR9HsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CG8SusCf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F6660A262D
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CG8SusCf
Received: by smtp.kernel.org (Postfix)
	id B74ED1F008A1; Tue, 10 Nov 2026 16:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008651F0089F;
	Tue, 10 Nov 2026 16:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329681;
	bh=BToN8NR71rXfDStWts/30zCAGaYR42dykaX8r/W5Mjg=;
	h=Date:From:To:Cc:Subject;
	b=CG8SusCfsvks0hZyd5c0oBIz45ZuULV2A8GJUS4ljFf/6i3KG4lAg/S6PQZfFcdCP
	 WaR/Csi9U2YCJ2oH2YAo3F6YFfqvt2fwlf+u0RyEvd+VDLZNXhapr5rX23FrvW+3Ha
	 v9lr8fzDjTxwWZnHl5RNZw8cjuvrhw1rcPeNgpKcVBrWX0O7ff2bPjPMGz/CjG+7Hb
	 jlfblqH1+VXLz5Q4VkH2RrSyDPyj3zBGkvs4wAvC/0EFLwV+O/ZgJrA/6YnOj+2q+S
	 vo8Kq64vboRm2ym1tM4Z93mdRu3M1uh/QY7EdrAkdJBlD9MowoTUgInvdA4zYjWWPA
	 PF2AC6GVHql7w==
Date: Tue, 10 Nov 2026 16:54:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review track for partial serieses
Message-ID: <90215a53-ecfd-444c-b032-1e197b37f883@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="mKOaTqyrYliRk8uc"
Content-Disposition: inline
X-Cookie: You can't take damsel here now.


--mKOaTqyrYliRk8uc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

If you attempt to b4 review track (or I think upgrade) a series before
lore has visibility of the whole thing it will import a partial series
with no obvious way of adding additional patches later other than
forgetting the series and retracking it.  This drops any data on old
revisions and is faff - it would be good to ask the user if they want to
track things now or wait, and/or have a way to stitch in additional
mails.

Thanks,
Mark

--mKOaTqyrYliRk8uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzTE0ACgkQJNaLcl1U
h9CTJQf9H0TJ6o5HYkE+1Gq+lhM3xs5/NFJgXdSEz3mRui8rBdGkiGdXEicnM8C7
lKrPShZboT4bNxFKOXzvD9wxV9DoN7JzL63aavBw8YtBEyRCwnvAGVkSz4oXiI/C
p/iiWXsNmhB5tacQPldt8LpK4iWBu2czKDpaeHSssHJcQT1yGFSmp0eqhw29oyeI
KpWOR6MNOQ3bvDVIGtsoM6rSDm+06G3MmgoFJnl6bzJ5UXWVLn+/IsgmwloqlQaK
pSQ0p0gd81utRvX8NMxjg3U/ljR3SJNequ7Xmx4wFXr5YGZEYg0+n5T4Q13liD+4
/TvguLUvSgs6zrPEU41t7OVdelk6IQ==
=yShy
-----END PGP SIGNATURE-----

--mKOaTqyrYliRk8uc--

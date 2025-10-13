Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704412C0F96
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760375566; cv=none; b=R4ISnAbKOGw07pal5riW5J1PaVDmAuHfpbhlSVg/N2GxuPYlDirPUqex0PGygXWLtVbAOxFircZyCft1Ud4XxUWpJ0P4JWkD2xjA7Gm8ne/+k4bPxwtOJx/2fzkEW/kjQ2g1Mrd7xi4dCZtCMLw+NFbIGAqm6qVBDogHJ5eLM7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760375566; c=relaxed/simple;
	bh=3wecBq08kDLay+g4FmNi2hgesk+eSmRw/IRyBe0uak0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTuP4vR9X/QU8FNhGVnKPSKAVQl5dGH/koiWQi3Q0C2TEi5WuseW0ypea77ZpXWd+18Y8TefZ1SoTd9aIlCr9hWy/2bbHmXBDPuhr2BWPWv+p0M2DNZVYnebfyQS9Mp1ZH8iyhY78UfUIuLSC6bW48WrcgdIl5lw8uBwCoKA5r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOWBgq9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOWBgq9f"
Received: by smtp.kernel.org (Postfix)
	id 17866C116C6; Mon, 13 Oct 2025 17:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27344C4CEE7;
	Mon, 13 Oct 2025 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760375566;
	bh=3wecBq08kDLay+g4FmNi2hgesk+eSmRw/IRyBe0uak0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOWBgq9fuAK/8s6gMkPhastg/x5Bx54nV1Hhf2zo7gp9asV5E4KB04apXZYEOZ24k
	 6RBWzB9waXOee3GQnizn2og+W8w9/m50meEYBCcDpTWePm/JG/LJer/BTO9FN4X8qb
	 ZOxgoY0MsJUGGaEqc8RtsMrCUK203xNgpI+pZMou2ohVWiFhxRZpgJakoTaNDvDgJI
	 oaprpzsVEfr+oAIXOH1wUi/6wCk1EK3jkHyjf6lF/1PT2I1uIYwR7iUTKdm6E51WAy
	 eN3ezZ9KhkGuMLLxSYtC9LPDP/mhsLOgy8I8slmn2ZkvvYEx68xiMUIUk4koZGtk/k
	 B01FREQO3pVOA==
Date: Mon, 13 Oct 2025 18:12:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <59e87e88-356d-4913-979a-cdcd80882517@sirena.org.uk>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vDQT02s7s5s89r03"
Content-Disposition: inline
In-Reply-To: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
X-Cookie: Ahead warp factor one, Mr. Sulu.


--vDQT02s7s5s89r03
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 04:47:27PM -0400, Konstantin Ryabitsev wrote:

> I just committed the initial implementation of "b4 dig" that will hopeful=
ly
> make it easier for maintainers to figure out where a commit came from now=
 that
> we're actively trying to phase out Link: trailers. For now, it only does
> "b4 dig -c [commitish]", e.g. taking some random commits from today:

If I specify:

   b4 dig -c regulator-v6.18

b4 complains:

   Digging into commit b320fce86c04862ff5548ebdd84740e36e79e6ac
   Merge commit detected, please specify a single-parent commit.

but that's not a merge commit, it's a signed tag on a regular commit.

It does also feel odd to have to specify -c, I'd have expected this to
work more like b4 mbox and just assume that an unknown parameter was a
commitish.  Not the end of the world though.

>=20
> Matching the exact patch-id:
>=20
> 	$ b4 dig -c ce740955b238761ec1d8cf0590d7e6802d3a813a
> 	Digging into commit ce740955b238761ec1d8cf0590d7e6802d3a813a
> 	Attempting to match by exact patch-id...
> 	Trying to find matching series by patch-id 469ebf2cf560b32106f206e389752=
deb5f741b6d
> 	Grabbing search results from lore.kernel.org
> 	Found matching series by patch-id
> 	---
> 	This patch is present in the following series:
> 	---
> 	  v3: [PATCH v3] dt-bindings: bus: renesas-bsc: allow additional propert=
ies
> 		  https://lore.kernel.org/r/20251009183630.5451-2-wsa+renesas@sang-engi=
neering.com
>=20
> No match looking up by exact patch-id (and trying myers, then histogram, =
then
> patience algorithms with no success):
>=20
> 	$ b4 dig -c a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
> 	Digging into commit a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
> 	Attempting to match by exact patch-id...
> 	Trying to find matching series by patch-id abc964d5d53674450f7e553bbe031=
edc61ac3308
> 	Grabbing search results from lore.kernel.org
> 	Nothing matching that query.
> 	Trying to find matching series by patch-id adf0918395a1a601a8d54d7d26446=
aadfb6101c2
> 	Grabbing search results from lore.kernel.org
> 	Nothing matching that query.
> 	Attempting to match by author and subject...
> 	Grabbing search results from lore.kernel.org
> 	Found 22 matching messages
> 	---
> 	This patch is present in the following series:
> 	---
> 	  v3: [PATCH v3] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
> 		  https://lore.kernel.org/r/20250829175152.9704-2-daleksan@redhat.com
> 	  v4: [PATCH v4] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
> 		  https://lore.kernel.org/r/20250902142429.14041-2-daleksan@redhat.com
> 	  v5: [PATCH v5] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
> 		  https://lore.kernel.org/r/20250915210829.6661-1-daleksan@redhat.com
>=20
> There are known annoyances:
>=20
> 1. We don't currently weed out AUTOSEL/stable backports, so older commits=
 may
>    end up in lots of false positives for now. I've not yet figured out ho=
w to
>    avoid this without hardcoding it to be kernel-specific.
> 2. Patches that were sent as part of one series and then as part of anoth=
er
>    series (by the same author) don't currently do the right thing.
>=20
> I'll work on getting that fixed, but for now if you're missing the presen=
ce of
> Link: trailers, please test it out.
>=20
> -K
>=20

--vDQT02s7s5s89r03
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjtMwkACgkQJNaLcl1U
h9AeUwf9HE1mtTPaiNGppW4P9OTRcw6t9GReJNFBULdJT7QNqiyRfAN18bArSzvv
cmoYkZI5TJAN0J8a6g3rqLgdBA4M31ay9Fmt0v+/czEQtNEtH1JJjeCn74lCMNar
IX9pVDku/5Lu40dgsF2DEqd4on6ZKlPI+1ltvwMlqrsB/GL672EimwBwcKoIsDdD
tMSCvej6V8Syl0l9bo6XTLP33C/ybqu31SYc1zhSVh04Ti+1aRkjFNuEo6FZbMD9
u7CeZXdCkLUZVPE47B3httLR5pPmn9qW17WN1/qfdopnPcd9QXpiW3ODq8h82K+W
mBSAR+1K5GnahAM9+wihs4cDWsG52A==
=D1/x
-----END PGP SIGNATURE-----

--vDQT02s7s5s89r03--

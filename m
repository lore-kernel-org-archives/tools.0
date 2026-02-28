Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D624679C
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 22:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772316978; cv=none; b=uHCHlZF4ZE/3OTiOpptncYE+Z6kwPOof9GlTyhdtfum5m+dDn6IAh4LfyFnQnoDRfPqPn/knIZkNXq4Cdcd/stBg7wlFQTfJOhGkbZYdIvU+ZZRO6tcvdhAaafEu7fpq90mxL+Tveyfm/8M5nNUC0bKl5yVV8tr2WzHotSGisDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772316978; c=relaxed/simple;
	bh=MYvZpT9rIFs0tnhuAx2zdhQmCV8Lt7skyOrLAWjtvvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtFsIEU5FXLmMCLwMYn+bx/55UiwdcBcftIoGe2wA5Rigt/3ddaTBelaDAS8xxl0r1Vgi/bRPNx01jG552S03IFpWRmz0m6U/ozQGlcTQ19JPcfgAJj4tB8QHIKdE7LMT0riaWq5q6mCJ/RVPgohuyDu5vDmbJzzSC8tczrEOvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFRmAZN2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFRmAZN2"
Received: by smtp.kernel.org (Postfix)
	id 9F1C4C19424; Sat, 28 Feb 2026 22:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7965C116D0;
	Sat, 28 Feb 2026 22:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772316978;
	bh=MYvZpT9rIFs0tnhuAx2zdhQmCV8Lt7skyOrLAWjtvvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fFRmAZN2p6FZr1tv6ldQDO4j95tJAFtAQSyRIiZv1MYZyA9/GMmHBY8JLE+Y0kW0T
	 D7mT6TlD4SAb0G0fZiliOSQEKUb0i0EQBPlAbl2uXIh3Nq1dGWWrDs1Bt9r++hS/pa
	 Oi5hJ3Sx8M0gAAXSb0vbChXR86BSd8CVYinn6E6+WI/976NgERXdm2cPAffllAOoyU
	 I7sVbzhBnbAWoKjdDQnyuI0eP7QNOu9FRYK8Sarv5OJJNyCZ3Mv/fhfgMM3t0QHuTv
	 fQ9N/2ElSonSmRgwEl8uAknKL/XMvH/b9W+K8lcG/VcnRTnzA0KJlV5PCtDQHx5Akk
	 e7z7zGRcMgabA==
Date: Sat, 28 Feb 2026 22:16:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-gulf-mountain-5f935fdefaea@spud>
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
	protocol="application/pgp-signature"; boundary="TU/ED6Dgo2wGseIh"
Content-Disposition: inline
In-Reply-To: <20260228-poodle-of-wonderful-justice-acfab2@lemur>


--TU/ED6Dgo2wGseIh
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

Yeah, got me further but I got stuck again - although not on a crash. I
sent you a mail with a screenshot of where I am :)

One thing I noticed was missing was that I have no idea while looking at
a patch who sent it. If you look at the mail I sent with the screenshot:
Lv Zheng is the submitter, so the signoff chain is wrong (cos there's no
=66rom header in the patch to make Jingyu the author, so either there's a
co-developed-by missing or a from header is needed), but it's impossible
to tell from this UI. Once you hit "reply", then you can see it, but not
=66rom the main view.

I have some other thoughts that are half baked, and I will try to
elaborate on them once I have at least tried to do a days review with
the tool.

Cheers,
Conor.

--TU/ED6Dgo2wGseIh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaNpLwAKCRB4tDGHoIJi
0uunAP91cU8pFSdk1HJaRpC/z+ScBonVy1IxofV7MjpoqYN11AD/ZsUaQkbobjSf
Zk9zb13sNb1SIVdOeGiqcFWVcJfndws=
=yeFD
-----END PGP SIGNATURE-----

--TU/ED6Dgo2wGseIh--

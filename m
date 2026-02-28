Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289AC2D0C89
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 22:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772317928; cv=none; b=UllBvMekJFgoHLwXbq5buijSqlqycu1VZe/jOfp5iP6PpNcxC49eeY90UFde5Tt50B8T58vHVqDfnnhwDRNH09FeEPjMHtuLJrQYirxQEgjST7LQf4s0efNjV0hMYajRlZUcu0AA1uL0kTuRxq+uzd370jKOwknICFdCOz7cduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772317928; c=relaxed/simple;
	bh=JvcXKMoHAfcNjNxKKgWni4T5Zy+nYOgTPdj+A5MrMio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4FOlIb8YzAHVkF9iCzadfPmlvTfl0sQo1/Y/4yF28t/LqG1r2X62kIzo0Ef1U4jV/QOg8tvKqTLrl4sC/8RbD5H5ODRDb8JtGsN01U8PWjOOBZXb7Lygi5armPq3ll+jFDdnj9yYiJrAGAKr/Mbti7ZBnnuKHJS/082+MDo2jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyNy4joh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyNy4joh"
Received: by smtp.kernel.org (Postfix)
	id BA37BC19425; Sat, 28 Feb 2026 22:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D772EC116D0;
	Sat, 28 Feb 2026 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772317927;
	bh=JvcXKMoHAfcNjNxKKgWni4T5Zy+nYOgTPdj+A5MrMio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyNy4johKQ6h6+Fry4o3vDLBq3HgiukRqiuY2XrOU250yXhOQHi3+3v26/CRstYgH
	 Rs59kuLE3BoNbHAnA3Moh5Ww+1Q1xdRt1xnfxAAac4APdUBmd3gCCQdEWDqG/bx4G4
	 oRhtMn4wmOODuVPzT6ht8UR0zEIb8Kg4t9sHZuCI4numeNBQBl56oo+qwNAWsVqMAj
	 PeRnGvQtD+7/qpYv08q7pfE8aGr0VCTU4P7lf0u/HbDp0205/C6xrKd/kC37z0hlmP
	 k2PxfPwnr90uwI/ysbSQvgQyjLT+rVFTeOGrAjvjN2AZzKOVBWDz4pceB0Cln2YcVn
	 uxVaAlYVWoFIw==
Date: Sat, 28 Feb 2026 22:32:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-charter-keenness-1256807e458d@spud>
References: <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
 <20260228-gulf-mountain-5f935fdefaea@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NuLo+nii4rCP67W+"
Content-Disposition: inline
In-Reply-To: <20260228-gulf-mountain-5f935fdefaea@spud>


--NuLo+nii4rCP67W+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 10:16:15PM +0000, Conor Dooley wrote:
> On Sat, Feb 28, 2026 at 12:34:40PM -0500, Konstantin Ryabitsev wrote:
> > On Sat, Feb 28, 2026 at 12:21:27PM -0500, Konstantin Ryabitsev wrote:
> > > Argh, escape_markup will, unhelpfully, only escape actual markup. So,=
 it will
> > > escape [bold] into \[bold\] but leave [PATCH] as [PATCH]. WTF, who de=
cided
> > > this was a good idea?
> > >=20
> > > I'll commit a more wholesome fix shortly, sorry about that.
> >=20
> > OK, the more wholesome fix is in place now. Please try it out and hopef=
ully
> > that lifts the curse.
>=20
> Yeah, got me further but I got stuck again - although not on a crash. I
> sent you a mail with a screenshot of where I am :)
>=20
> One thing I noticed was missing was that I have no idea while looking at
> a patch who sent it. If you look at the mail I sent with the screenshot:
> Lv Zheng is the submitter, so the signoff chain is wrong (cos there's no
> from header in the patch to make Jingyu the author, so either there's a
> co-developed-by missing or a from header is needed), but it's impossible
> to tell from this UI. Once you hit "reply", then you can see it, but not
> from the main view.
>=20
> I have some other thoughts that are half baked, and I will try to
> elaborate on them once I have at least tried to do a days review with
> the tool.

I found another issue. I tried to use it to send an email:
https://lore.kernel.org/all/177231592262.848068.18080490567217057666@spud/
The tool decided to send it from "Conor Dooley <conor.dooley@microchip.com>"
by that's not the from field in my gitconfig, but it is what my
user.email is:

| $ git config get sendemail.from
| Conor Dooley <conor@kernel.org>
| $ git config get user.email
| conor.dooley@microchip.com

Obviously this caused a bunch of rejections due to DMARC issues, because
it used the kernel.org email server setup from my gitconfig with my work
address.

I feel like I am spamming you with responses here, sorry about that!

Conor.

--NuLo+nii4rCP67W+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaNs5AAKCRB4tDGHoIJi
0qHIAQDOLUqZCi1rNt0ZNbPvitPDBGvEYt4LqXkmxbMkE9LoNQEA/zhhTiR6269t
Mp2zF7yLM77lgOPnBusTG6H3W2A+qA0=
=JAS2
-----END PGP SIGNATURE-----

--NuLo+nii4rCP67W+--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1502E3AF1
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772297342; cv=none; b=fkTTfNK6XgNxEFmrF9GHekn/0wZFeXE6JxFL8MCB1NOyDmwz4jCJTJMvqeJyXttnh2w8yWVp2RQC0aFC3DSWakO55WeatLt1VYGNfbRHj0GzBFf8K32jsluaGfsLBnoZLg9VDsNUWzVFvoMj+1h+DJCa0mg4hYDrsHXloWsSHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772297342; c=relaxed/simple;
	bh=DWLeDild2hOGrix8lgztDIvifx5U+EcRZ7X5TTbdqjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEWBfZJzbVf0M8oSTDcXRtdFvE4TO29Z8KT0WelAok1lL60Q+NK3Q5XYdQwwwLCwxkDFLHUDf9LOfl33OmgJcUgnSCjSo63Gga5SOfy1KhOcK3MpjCJcH5PH5B8CKqpknrTwxwJrQJH0nIGYpoE7Z7mKU2ldHu7/neGr35uK4oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzZE9BGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzZE9BGg"
Received: by smtp.kernel.org (Postfix)
	id A2B55C2BC86; Sat, 28 Feb 2026 16:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC852C116D0;
	Sat, 28 Feb 2026 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772297341;
	bh=DWLeDild2hOGrix8lgztDIvifx5U+EcRZ7X5TTbdqjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzZE9BGg74lptRmzd/ViopTlfD1HS8F747zuiRbhKfxA9NGR6efP1gyjX57/Z2Ft6
	 +N4hGyDCI9ZXzwugtxlXTdasZImZpY7ozHircESfDsu6QjmTYr5RxNNSE+5eOAuyQN
	 VLGZOBBsA19gjJ9EY1xh3tQycjFUJfhcKOq96NS8XdLoANzxstb8XitGMXX0KWGrvs
	 T7VZc1n9nEv68krVNiW7vCOKSMScLdlk7uqF7HrRhCljLn36k1VXnN7AUn600CSBTb
	 zzVW6lOZkGa/YhROVIJxU0IgAChGe+6+U8Atd1m2daMTmfjEX1p1y7AlyuMjkppf8d
	 N2PGH83MNqYww==
Date: Sat, 28 Feb 2026 16:48:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-crested-swimwear-a57a3060b860@spud>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CeePUy+BDNdrjnR8"
Content-Disposition: inline
In-Reply-To: <20260228-versed-wapiti-of-blizzard-4677aa@lemur>


--CeePUy+BDNdrjnR8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 11:45:58AM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 04:36:07PM +0000, Conor Dooley wrote:
> > Also, I attempted to open patchwork while my b4.pw-project was set to
> > "devicetree" and got an error:
> > MarkupError: Expected markup style value (found '1/1] dt-bindings: net:=
 can: nxp,sja1000: add reference to fsl,imx-weim-peripherals.yaml').
> > There's some massive splat I can send you if this does not reproduce.
>=20
> Bah, the problem is that textual treats [] as style markup, so there's a =
bunch
> of places where we have to escape that. I expect this will come up routin=
ely
> as more places requiring escaping are found.
>=20
> I put a fix into latest master for this particular one. Thanks!

Seems like you got half the problem? Certainly predictive on the "more
places though! ;)

$ git checkout korg/master=20
Previous HEAD position was a00f452 review: drop Binding.Group to support ol=
der textual
HEAD is now at a21b8a4 review: escape markup in title bar subject
$ popd
/stuff/linux-dt /stuff/linux
$ /stuff/b4/b4.sh review tui -i linux-dt
=E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 Traceback (most r=
ecent call last) =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=95=AE
=E2=94=82 /stuff/b4/src/b4/review_tui/_review_app.py:219 in on_mount       =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=94=82                                                                  =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=94=82    216 =E2=94=82                                                 =
                                       =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 locals =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=95=AE                                                   =
                                   =E2=94=82
=E2=94=82    217 =E2=94=82   def on_mount(self) -> None:                   =
                                       =E2=94=82 self =3D ReviewApp(title=
=3D'b4 review', classes=3D{'-dark-mode'}, pseudo_classes=3D{'dark', 'focus'=
}) =E2=94=82                                                               =
                       =E2=94=82
=E2=94=82    218 =E2=94=82   =E2=94=82   self._refresh_newer_warning()     =
                                               =E2=95=B0=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=95=AF                                                      =
                                =E2=94=82
=E2=94=82 =E2=9D=B1  219 =E2=94=82   =E2=94=82   self._refresh_title_bar() =
                                                                           =
                                                                           =
                                                                           =
             =E2=94=82
=E2=94=82    220 =E2=94=82   =E2=94=82   self._populate_patch_list()       =
                                                                           =
                                                                           =
                                                                           =
     =E2=94=82
=E2=94=82    221 =E2=94=82   =E2=94=82   self._show_content(self._selected_=
idx)                                                                       =
                                                                           =
                                                                           =
     =E2=94=82
=E2=94=82    222                                                           =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=94=82                                                                  =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=94=82 /stuff/b4/src/b4/review_tui/_review_app.py:235 in _refresh_title_=
bar                                                                        =
                                                                           =
                                                                =E2=94=82
=E2=94=82                                                                  =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=94=82    232 =E2=94=82   =E2=94=82   else:                             =
                                               =E2=95=AD=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 locals =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=95=AE               =
                                                                    =E2=94=
=82
=E2=94=82    233 =E2=94=82   =E2=94=82   =E2=94=82   label =3D f' \u270e {s=
ubject}'                                                 =E2=94=82     bar =
=3D Static(id=3D'title-bar')                                               =
                  =E2=94=82                                                =
                                   =E2=94=82
=E2=94=82    234 =E2=94=82   =E2=94=82   =E2=94=82   bar.styles.background =
=3D self.get_css_variables()['primary-darken-2']         =E2=94=82   label =
=3D ' =E2=9C=8E [PATCH v5 1/8] iommu/riscv: Enable IOMMU DMA mapping suppor=
t'                      =E2=94=82                                          =
                                         =E2=94=82
=E2=94=82 =E2=9D=B1  235 =E2=94=82   =E2=94=82   bar.update(label)         =
                                                       =E2=94=82    self =
=3D ReviewApp(title=3D'b4 review', classes=3D{'-dark-mode'}, pseudo_classes=
=3D{'dark', 'focus'}) =E2=94=82                                            =
                                       =E2=94=82
=E2=94=82    236 =E2=94=82                                                 =
                                       =E2=94=82 subject =3D '[PATCH v5 1/8=
] iommu/riscv: Enable IOMMU DMA mapping support'                         =
=E2=94=82                                                                  =
                 =E2=94=82
=E2=94=82    237 =E2=94=82   def _refresh_newer_warning(self) -> None:     =
                                       =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=95=AF                                    =
                                               =E2=94=82
=E2=94=82    238 =E2=94=82   =E2=94=82   """Show or hide the newer-version =
warning bar based on tracking data."""                                     =
                                                                           =
                                                                           =
     =E2=94=82
=E2=94=82                                                                  =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=94=82 /usr/lib/python3/dist-packages/textual/widgets/_static.py:106 in =
update                                                                     =
                                                                           =
                                                                =E2=94=82
=E2=94=82                                                                  =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=94=82   103 =E2=94=82   =E2=94=82   """                                =
                                              =E2=95=AD=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 locals =E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=95=AE                                                      =
                                                   =E2=94=82
=E2=94=82   104 =E2=94=82   =E2=94=82                                      =
                                              =E2=94=82 content =3D ' =E2=
=9C=8E [PATCH v5 1/8] iommu/riscv: Enable IOMMU DMA mapping support' =E2=94=
=82                                                                        =
                                 =E2=94=82
=E2=94=82   105 =E2=94=82   =E2=94=82   self._content =3D content          =
                                                =E2=94=82    self =3D Stati=
c(id=3D'title-bar')                                            =E2=94=82   =
                                                                           =
                           =E2=94=82
=E2=94=82 =E2=9D=B1 106 =E2=94=82   =E2=94=82   self._visual =3D visualize(=
self, content, markup=3Dself._render_markup)              =E2=95=B0=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=95=AF                                                      =
                                                   =E2=94=82
=E2=94=82   107 =E2=94=82   =E2=94=82   self.refresh(layout=3DTrue)        =
                                                                           =
                                                                           =
                                                                           =
       =E2=94=82
=E2=94=82   108                                                            =
                                                                           =
                                                                           =
                                                                =E2=94=82
=E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=95=AF
MarkupError: Expected markup style value (found '1/8] iommu/riscv: Enable I=
OMMU DMA mapping support').

NOTE: 1 of 2 errors shown. Run with textual run --dev to see all errors.


--CeePUy+BDNdrjnR8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaMcegAKCRB4tDGHoIJi
0pNhAQDbImup80S2h2+GlCK4zK9FlPg8s3TZtxPVk4MIiOeh0QEAszK+6DocyEdG
CCIlYZN9On63spx+oOrTJyXMLg0OLQ8=
=o0eA
-----END PGP SIGNATURE-----

--CeePUy+BDNdrjnR8--

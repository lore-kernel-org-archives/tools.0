Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2E2DCF45
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772296571; cv=none; b=sGz5d3CdTC/CV7HRg36j3WB8kUKld+ghQR+oMas6K/mc2uppkC+HraNx/iiJr5Uc+XzG5Xjsi0Eu38gxIGxZpwvCPFGKdhWPEmgkq41kdoV7DjRzAbYZ1/c4fKFOc9wFUEOG5kImFaPiaTQFHMn6MX0fPBo+QkVSYu7ejxp9TdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772296571; c=relaxed/simple;
	bh=4YK+eC77dSZCRUedHdiqSQ+MKTe51L1d+3nSE8MLnkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R38snrW0XxxTKUpSIjUpH9MKdqbQLNptKdku5THSD8Jz+7kCgOtd5xFJSOCA0CRVm2uAhzaEU4XSm3KOLc+RSJhBCSHZplFyuNBXqF6Jzbrsr35TucBzcmOiUiFl39T/ThhF1VwoT/80cHGkbTZTCbBpM2ddBt/hmKlID6tOju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYxeivTa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYxeivTa"
Received: by smtp.kernel.org (Postfix)
	id BDBD7C2BC86; Sat, 28 Feb 2026 16:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDC5C116D0;
	Sat, 28 Feb 2026 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772296570;
	bh=4YK+eC77dSZCRUedHdiqSQ+MKTe51L1d+3nSE8MLnkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYxeivTa4HDGLnrr9YMg32aIJH35i/wb2ILGVWl35g4fWzbXfs1d0OO2Xx3hQjTKX
	 M0p5FQtW1cFxfJ7OMn7gBxbvk635y24L6l+MmP8dYPZhvb4bocloitSxWRgDY3NEO+
	 qC3S/AhuA8ajZiucHEE3TR/am5XQtLO7/ePGlkUoa6NzgjLbFWZhw2RSdyK4s/nWct
	 QRsYi8Bf1/GG3XVbflufKFZqI8UYaQHMxltu12QA9vu8drtkkgkoPZ/KKrrxI7dyT6
	 hOC9A27fpInoaMRiEU8+zCKvT/kc1EVQR4eu/QM1kOeQAOs0DWvowCucjwQrfjDgjL
	 kEDnWSHeeIuUw==
Date: Sat, 28 Feb 2026 16:36:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-battered-numerous-35e130c73b93@spud>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DFASSk/DMU+huPHb"
Content-Disposition: inline
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>


--DFASSk/DMU+huPHb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 02:53:07PM -0500, Konstantin Ryabitsev wrote:
> Hi, all:
>=20
> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> maintainer duties. A getting-started guide with screencasts is here:
> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
>=20
> It's available from b4 master pending initial testing and will be general=
ly
> available in b4-0.15.
>=20
> Longread:
>=20
> I've been working on "b4 review" for a while, with a few false-starts, a =
lot
> of despair, and then a whole new direction that seemed to have finally wo=
rked.
> So, the usual. :)
>=20
> I am finally feeling confident enough to release the code as initial
> technology preview, with the primary goal to get some direct feedback. The
> goal of the UI was to work alongside your usual email client, allowing yo=
u to
> use it for as much or as little as you like.
>=20
> The feature only exists in b4 master branch, so if you want to try it, yo=
u'll
> need to be comfortable running b4 from checkout. It also requires having a
> valid email server configured with git for sending outgoing mail. If you'=
re
> already using "b4 ty" then you're good to go.
>=20
> The only new dependency introduced is python-textual. I say this with a b=
it of
> tongue-in-cheek, because textual pulls in a ton of other dependencies, but
> it's usually already installed on many modern distros anyway.
>=20
> You can do the following things:
>=20
>   - Track incoming patch series from lore using a message-id, URL, change=
-id,
>     or by piping a message from your mail client (e.g. via mutt integrati=
on)
>   - TUI-based tracking list with series lifecycle management (new, review=
ing,
>     replied, taken, thanked, archived, waiting)
>   - Split-pane review interface with patch list and syntax-highlighted di=
ff view
>   - Quick trailer addition (Reviewed-by, Acked-by, Tested-by) with a sing=
le
>     keypress
>   - Inline diff commenting via $EDITOR =E2=80=94 comments are automatical=
ly formatted
>     as proper quoted-reply emails for the mailing list
>   - Preview emails to inspect exactly what will be sent before sending
>   - Fetch and display follow-up messages from other reviewers directly in=
 the
>     diff view
>   - Range-diff between series revisions without leaving the TUI
>   - Automatic discovery of older and newer revisions when tracking a seri=
es
>   - Revision upgrade that preserves your review comments on unchanged pat=
ches
>   - Three merge strategies for applying series: merge commit, linear (git=
-am),
>     and cherry-pick
>   - Thank-you note generation listing each applied commit with its hash (=
and
>     more reliably than b4 ty, since we keep track of applied series inste=
ad of
>     guessing)
>   - AI-assisted review using an external agent (Claude Code, Gemini CLI,
>     OpenAI Codex CLI, GitHub Copilot CLI) =E2=80=94 agent findings are pr=
ivate to the
>     maintainer and can then be selectively incorporated into the review

>   - Patchwork integration: browse series, view CI check results, track se=
ries
>     directly from Patchwork, and automatically synchronise Patchwork stat=
e as
>     you work

This patchwork part is neat, this is definitely something that I'll play
with. Patchwork is great, but I really dislike all the jumping back and
forth between editor/website/mailer. One thing that immediately seemed like
it'd be neat is a shortcut from the patchwork pane that does track + review.

Worktree support is something I didn't expect to exist, but it does that
that's real helpful ;)

Also, I attempted to open patchwork while my b4.pw-project was set to
"devicetree" and got an error:
MarkupError: Expected markup style value (found '1/1] dt-bindings: net: can=
: nxp,sja1000: add reference to fsl,imx-weim-peripherals.yaml').
There's some massive splat I can send you if this does not reproduce.

I wanted to look into whether or not I could quickly reply to stuff from
the tui (since like 80% of binding patches don't require a checkout) and
encountered this smaller reproduction of the same thing.

$ /stuff/b4/b4.sh review track -i linux-dt D8CE6E5B1001D797+a6f36da0272ac18=
fff2a992976b1defc3bb01af6.1772289741.git.lv.zheng@linux.spacemit.com
< snip >
$ /stuff/b4/b4.sh review tui -i linux-dt
Retrieving series: 52E07C3A9B398459+126b1f464ae2a8bfcca6f504c64346541ae4db6=
f.1772289741.git.lv.zheng@linux.spacemit.com
Looking up https://lore.kernel.org/all/52E07C3A9B398459%2B126b1f464ae2a8bfc=
ca6f504c64346541ae4db6f.1772289741.git.lv.zheng@linux.spacemit.com/
Grabbing thread from lore.kernel.org/all/52E07C3A9B398459%2B126b1f464ae2a8b=
fcca6f504c64346541ae4db6f.1772289741.git.lv.zheng@linux.spacemit.com/t.mbox=
=2Egz
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v5 1/8] iommu/riscv: Enable IOMMU DMA mapping support
  =E2=9C=93 [PATCH v5 2/8] iommu/riscv: Add auxiliary bus framework and HPM=
 device support
  =E2=9C=93 [PATCH v5 3/8] iommu/riscv: Add HPM support for performance mon=
itoring
  =E2=9C=93 [PATCH v5 4/8] dt-bindings: iommu: Add spacemit/t100 features
  =E2=9C=93 [PATCH v5 5/8] spacemit/t100: Add global filter awareness for R=
ISC-V IOMMU HPM
  =E2=9C=93 [PATCH v5 6/8] iommu/riscv: Add SpacemiT T100 IOATC HPM support
  =E2=9C=93 [PATCH v5 7/8] iommu/riscv: Add vendor event support for RISC-V=
 IOMMU HPM
  =E2=9C=93 [PATCH v5 8/8] perf vendor events riscv: Add SpacemiT T100 HPM =
event aliases
  ---
  =E2=9C=93 Signed: DKIM/linux.spacemit.com
Guessing base commit...
Base: tags/next-20260227 (best guess, 9/11 blobs matched)
Base: tags/next-20260227
Magic: Preparing a sparse worktree
---
Applying: iommu/riscv: Enable IOMMU DMA mapping support
Applying: iommu/riscv: Add auxiliary bus framework and HPM device support
Applying: iommu/riscv: Add HPM support for performance monitoring
Applying: dt-bindings: iommu: Add spacemit/t100 features
Applying: spacemit/t100: Add global filter awareness for RISC-V IOMMU HPM
Applying: iommu/riscv: Add SpacemiT T100 IOATC HPM support
Applying: iommu/riscv: Add vendor event support for RISC-V IOMMU HPM
Applying: perf vendor events riscv: Add SpacemiT T100 HPM event aliases
---
Fetching into FETCH_HEAD
Review branch b4/review/20260228-iommu-riscv-enable-iommu-dma-mapping-suppo=
rt-feee43387d2a created successfully
Review branch created: b4/review/20260228-iommu-riscv-enable-iommu-dma-mapp=
ing-support-feee43387d2a
Checking out branch and starting review UI...
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
=3D'b4 review', classes=3D{'-dark-mode'}, pseudo_classes=3D{'focus', 'dark'=
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
=3D{'focus', 'dark'}) =E2=94=82                                            =
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
Checking out branch and starting review UI...
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
=3D'b4 review', classes=3D{'-dark-mode'}, pseudo_classes=3D{'focus', 'dark'=
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
=3D{'focus', 'dark'}) =E2=94=82                                            =
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

NOTE: 1 of 2 errors shown. Run with textual run --dev to see all errors

This seems promising though, could definitely see this making my life
easier, with less hoping between patchwork/mutt/git repo.

Cheers,
Conor.

--DFASSk/DMU+huPHb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaMZdwAKCRB4tDGHoIJi
0ulsAPkBemNKK1VXDeDavjuad2rCaMPYsHpuT0z0ahpOxAtT5QEAgvo/0VPGJXq7
r1aLIVTSPDd6+a+Ybgh0E9R5i+y84g4=
=Q7w7
-----END PGP SIGNATURE-----

--DFASSk/DMU+huPHb--

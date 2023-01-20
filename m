Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C5A256E
	for <tools@linux.kernel.org>; Fri, 20 Jan 2023 22:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96D9C433D2;
	Fri, 20 Jan 2023 22:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674254044;
	bh=Zb83WLbA99e8eI368F+ijxI7lpDMHzn9OFmXTk2z4yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIqRvbGu2vN96H3eqBmyrNDjpBPzNZ04NdFt2ZpTbOsj4QV1qpbSvK5Btrbw9o1RM
	 IBIF4+V76ggjTr+NAIHNe7kGFl7A/v9934BSet8/NAb+F8p9ahq1h/CgZMQEIdUXMT
	 9IdLoDeJEdG+Lne3UNsdugoERj/OLAKjIN/LPZoeW231EhwDEBVrF6o0MqcsE+GaAg
	 Xrm4OhadR2ci5WeHdeCnVYHdZAKQA8i5thPju+C+uF/ZopGezTkLCXELQ7HuNoih/X
	 ys33zBEaYBfXeZ1GQ0Yim9bvPCbmNDwcz0mD+BAesEPmgsD+tAqTFluwz4sc2BzpqP
	 0891Iyxb0Ak2g==
Date: Fri, 20 Jan 2023 22:34:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, konstantin@linuxfoundation.org
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] shazam: Add the --merge-base argument
Message-ID: <Y8sW2QoSQk08315M@spud>
References: <20221013175727.17139-1-palmer@rivosinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KjeDChIcsU0hmb2b"
Content-Disposition: inline
In-Reply-To: <20221013175727.17139-1-palmer@rivosinc.com>


--KjeDChIcsU0hmb2b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Konstantin,

On Thu, Oct 13, 2022 at 10:57:27AM -0700, Palmer Dabbelt wrote:
> I was just handling a patch set where the author used English to
> describe the dependencies.  They hadn't yet been merged at the time the
> patch set was posted so I don't think there's really any way to make
> sure the computers always understand the base, this just lets me quickly
> override the automatic merge base detection when I run into something
> non-canonical.
>=20
> Link: https://lore.kernel.org/all/20220913061817.22564-1-zong.li@sifive.c=
om/

I guess this just got lost somewhere (missing a CC?), or perhaps we've
missed some reason why this is not needed?

Doesn't apply cleanly against 0.12.0, but with -3 it does & appears to
work - at least in my simple test cases
For example, the following gets automagically assigned -rc4 as a base:

/stuff/b4/b4.sh shazam -s -t shazam 20230119094447.21939-3-walker.chen@star=
fivetech.com -H

But I don't want to merge -rc4 into my for-next branch, and being able
to explicitly pass my preferred base of -rc1 is really useful.

Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  b4/command.py |  2 ++
>  b4/mbox.py    | 13 ++++++++-----
>  man/b4.5.rst  |  2 ++
>  3 files changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/b4/command.py b/b4/command.py
> index b16043e..5bb674e 100644
> --- a/b4/command.py
> +++ b/b4/command.py
> @@ -171,6 +171,8 @@ def cmd():
>      sp_sh.add_argument('--guess-lookback', dest=3D'guessdays', type=3Din=
t, default=3D21,
>                         help=3D('(use with -H or -M) When guessing base, =
go back this many days from the patch date '
>                               '(default: 3 weeks)'))
> +    sp_sh.add_argument('--merge-base', dest=3D'mergebase', type=3Dstr, d=
efault=3DNone,
> +                       help=3D('(use with -H or -M) Force this base when=
 merging'))
>      sp_sh.set_defaults(func=3Dcmd_shazam)
> =20
>      # b4 pr
> diff --git a/b4/mbox.py b/b4/mbox.py
> index ff96a11..c1a0660 100644
> --- a/b4/mbox.py
> +++ b/b4/mbox.py
> @@ -231,14 +231,17 @@ def make_am(msgs, cmdargs, msgid):
>          logger.critical(' Link: %s', linkurl)
> =20
>      base_commit =3D None
> -    matches =3D re.search(r'base-commit: .*?([\da-f]+)', first_body, re.=
MULTILINE)
> -    if matches:
> -        base_commit =3D matches.groups()[0]
> +    if cmdargs.mergebase is not None:
> +        base_commit =3D cmdargs.mergebase
>      else:
> -        # Try a more relaxed search
> -        matches =3D re.search(r'based on .*?([\da-f]{40})', first_body, =
re.MULTILINE)
> +        matches =3D re.search(r'base-commit: .*?([\da-f]+)', first_body,=
 re.MULTILINE)
>          if matches:
>              base_commit =3D matches.groups()[0]
> +        else:
> +            # Try a more relaxed search
> +            matches =3D re.search(r'based on .*?([\da-f]{40})', first_bo=
dy, re.MULTILINE)
> +            if matches:
> +                base_commit =3D matches.groups()[0]
> =20
>      if not base_commit and topdir and cmdargs.guessbase:
>          logger.critical(' Base: attempting to guess base-commit...')
> diff --git a/man/b4.5.rst b/man/b4.5.rst
> index 073f32a..e889542 100644
> --- a/man/b4.5.rst
> +++ b/man/b4.5.rst
> @@ -226,6 +226,8 @@ options:
>                          Attempt to merge series as if it were a pull req=
uest (execs git-merge)
>    --guess-lookback GUESSDAYS
>                          (use with -H or -M) When guessing base, go back =
this many days from the patch date (default: 3 weeks)
> +  --merge-base COMMIT
> +                        (use with -H or -M) Force this base when merging
> =20
>  *Example*: b4 shazam -H 20200313231252.64999-1-keescook@chromium.org
> =20
> --=20
> 2.38.0
>=20

--KjeDChIcsU0hmb2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8sW2QAKCRB4tDGHoIJi
0gHmAQCeJCmkmgcSMY2uKdclaWiYN+6S3VRs6pE74tWQkl7vYQD9EO6MAh6FBpai
l4pUm3NkzTiUytmmWS4GYNDkbDNZnAU=
=W3Rw
-----END PGP SIGNATURE-----

--KjeDChIcsU0hmb2b--

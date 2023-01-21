Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30029748E
	for <tools@linux.kernel.org>; Sat, 21 Jan 2023 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0391DC433EF;
	Sat, 21 Jan 2023 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674321541;
	bh=ZHT2aYeEWBSLHvpBhJomm0jwNuKAjGn5LoYib+UMPmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIZ/1Nrmdk6iMF1HMg4KcxUcvZulKjW7Va8CfEfWNpvgYHFDmelaBIquxdYC2sc3t
	 sen/TynKX4kizAhI9p3qUMc5YqHQuvjmaQu5ul9YBd7cuHYP+13LtfBrZ3ydJkfigP
	 EBjZ35Qt8WM/lVzH5qo6tAxDvhsAtbGn5xqRiwksJc/KOsFvrWAUyVfIJUlKe9ls+l
	 vXnlyv3ajdTMgmirRnULVaba7Itg8bVAQ0wiWWyZacoezNWibvjuX1z55E03hg5UlM
	 z0S4udH0umDs4rqeHmUuHUxRR0RahDKh4q72+62j4vAqM1pbmDNXAwbQv0FtMmVRac
	 F+DUxdWdBtmPw==
Date: Sat, 21 Jan 2023 17:18:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, konstantin@linuxfoundation.org
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] shazam: Add the --merge-base argument
Message-ID: <Y8wegiQ6pyennOdU@spud>
References: <20221013175727.17139-1-palmer@rivosinc.com>
 <Y8sW2QoSQk08315M@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F5acoRcp5j5YB9LL"
Content-Disposition: inline
In-Reply-To: <Y8sW2QoSQk08315M@spud>


--F5acoRcp5j5YB9LL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 10:34:01PM +0000, Conor Dooley wrote:
> Hey Konstantin,
>=20
> On Thu, Oct 13, 2022 at 10:57:27AM -0700, Palmer Dabbelt wrote:
> > I was just handling a patch set where the author used English to
> > describe the dependencies.  They hadn't yet been merged at the time the
> > patch set was posted so I don't think there's really any way to make
> > sure the computers always understand the base, this just lets me quickly
> > override the automatic merge base detection when I run into something
> > non-canonical.
> >=20
> > Link: https://lore.kernel.org/all/20220913061817.22564-1-zong.li@sifive=
=2Ecom/
>=20
> I guess this just got lost somewhere (missing a CC?), or perhaps we've
> missed some reason why this is not needed?
>=20
> Doesn't apply cleanly against 0.12.0, but with -3 it does & appears to
> work - at least in my simple test cases
> For example, the following gets automagically assigned -rc4 as a base:
>=20
> /stuff/b4/b4.sh shazam -s -t shazam 20230119094447.21939-3-walker.chen@st=
arfivetech.com -H
>=20
> But I don't want to merge -rc4 into my for-next branch, and being able
> to explicitly pass my preferred base of -rc1 is really useful.
>=20
> Tested-by: Conor Dooley <conor.dooley@microchip.com>

Heh, the functionality itself is tested - but I get an error doing:
b4 am -3 20230116074259.22874-4-walker.chen@starfivetech.com

Traceback (most recent call last):
  File "/stuff/b4/b4/command.py", line 379, in <module>
    cmd()
  File "/stuff/b4/b4/command.py", line 362, in cmd
    cmdargs.func(cmdargs)
  File "/stuff/b4/b4/command.py", line 91, in cmd_am
    b4.mbox.main(cmdargs)
  File "/stuff/b4/b4/mbox.py", line 710, in main
    make_am(msgs, cmdargs, msgid)
  File "/stuff/b4/b4/mbox.py", line 214, in make_am
    if cmdargs.mergebase is not None:
AttributeError: 'Namespace' object has no attribute 'mergebase'

I may go fix that up, since the feature itself is useful to me.

> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  b4/command.py |  2 ++
> >  b4/mbox.py    | 13 ++++++++-----
> >  man/b4.5.rst  |  2 ++
> >  3 files changed, 12 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/b4/command.py b/b4/command.py
> > index b16043e..5bb674e 100644
> > --- a/b4/command.py
> > +++ b/b4/command.py
> > @@ -171,6 +171,8 @@ def cmd():
> >      sp_sh.add_argument('--guess-lookback', dest=3D'guessdays', type=3D=
int, default=3D21,
> >                         help=3D('(use with -H or -M) When guessing base=
, go back this many days from the patch date '
> >                               '(default: 3 weeks)'))
> > +    sp_sh.add_argument('--merge-base', dest=3D'mergebase', type=3Dstr,=
 default=3DNone,
> > +                       help=3D('(use with -H or -M) Force this base wh=
en merging'))
> >      sp_sh.set_defaults(func=3Dcmd_shazam)
> > =20
> >      # b4 pr
> > diff --git a/b4/mbox.py b/b4/mbox.py
> > index ff96a11..c1a0660 100644
> > --- a/b4/mbox.py
> > +++ b/b4/mbox.py
> > @@ -231,14 +231,17 @@ def make_am(msgs, cmdargs, msgid):
> >          logger.critical(' Link: %s', linkurl)
> > =20
> >      base_commit =3D None
> > -    matches =3D re.search(r'base-commit: .*?([\da-f]+)', first_body, r=
e.MULTILINE)
> > -    if matches:
> > -        base_commit =3D matches.groups()[0]
> > +    if cmdargs.mergebase is not None:
> > +        base_commit =3D cmdargs.mergebase
> >      else:
> > -        # Try a more relaxed search
> > -        matches =3D re.search(r'based on .*?([\da-f]{40})', first_body=
, re.MULTILINE)
> > +        matches =3D re.search(r'base-commit: .*?([\da-f]+)', first_bod=
y, re.MULTILINE)
> >          if matches:
> >              base_commit =3D matches.groups()[0]
> > +        else:
> > +            # Try a more relaxed search
> > +            matches =3D re.search(r'based on .*?([\da-f]{40})', first_=
body, re.MULTILINE)
> > +            if matches:
> > +                base_commit =3D matches.groups()[0]
> > =20
> >      if not base_commit and topdir and cmdargs.guessbase:
> >          logger.critical(' Base: attempting to guess base-commit...')
> > diff --git a/man/b4.5.rst b/man/b4.5.rst
> > index 073f32a..e889542 100644
> > --- a/man/b4.5.rst
> > +++ b/man/b4.5.rst
> > @@ -226,6 +226,8 @@ options:
> >                          Attempt to merge series as if it were a pull r=
equest (execs git-merge)
> >    --guess-lookback GUESSDAYS
> >                          (use with -H or -M) When guessing base, go bac=
k this many days from the patch date (default: 3 weeks)
> > +  --merge-base COMMIT
> > +                        (use with -H or -M) Force this base when mergi=
ng
> > =20
> >  *Example*: b4 shazam -H 20200313231252.64999-1-keescook@chromium.org
> > =20
> > --=20
> > 2.38.0
> >=20



--F5acoRcp5j5YB9LL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8weggAKCRB4tDGHoIJi
0vziAP9oLem5WuWLRpxFRuDhsN8t9h2HP/5fyk7uo2KvhSTdwAEA26pHNNGvhASk
Rc/w7+hpgxb6fRxdY3PVUjncoCWV7g0=
=/HPk
-----END PGP SIGNATURE-----

--F5acoRcp5j5YB9LL--

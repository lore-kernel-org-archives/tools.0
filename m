Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65F33D8
	for <tools@linux.kernel.org>; Sun, 22 Jan 2023 18:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A1DC433EF;
	Sun, 22 Jan 2023 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674411513;
	bh=GH2O5DTS+wlbq4OenBtjv1RyzbZfGSc0bhH3GJtwlOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xb9l6/HgYcR48bF5/vg3tNy9UB37QN0rSgPlkSm77XT8WBXcF4Hr36eEgZSAsFtkf
	 vExGq1jBC0nriz6wcGW0rTxo2RqEZMDKmbtz17SXYORM+tSKyacy/dJe1FcP6pHKpU
	 Q+0St3z5mGwaHy55xQ9IvCbUziBnotvKE87w9QezbsGOEbJqjxF7U/7XsUeQLEFuT2
	 Bp8H4bSHsRQrq5F9HTvwiD0BUIk/8AoIypbbOU2eqkrV9ISoHrnHrGe/DKwbUKc81A
	 0ONjehefSf1ZKA3j4A+rf7k2AgW4v1rccS0fl5wY00V+5/LVgOs3Qee4V5z62cX6qh
	 KcE9qmi5pLYrg==
Date: Sun, 22 Jan 2023 18:18:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, konstantin@linuxfoundation.org
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] shazam: Add the --merge-base argument
Message-ID: <Y8199aCGNIW37YGx@spud>
References: <20221013175727.17139-1-palmer@rivosinc.com>
 <Y8sW2QoSQk08315M@spud>
 <Y8wegiQ6pyennOdU@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qf/xLlVGoq2qAUbV"
Content-Disposition: inline
In-Reply-To: <Y8wegiQ6pyennOdU@spud>


--Qf/xLlVGoq2qAUbV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 21, 2023 at 05:19:02PM +0000, Conor Dooley wrote:
> On Fri, Jan 20, 2023 at 10:34:01PM +0000, Conor Dooley wrote:
> > Hey Konstantin,
> >=20
> > On Thu, Oct 13, 2022 at 10:57:27AM -0700, Palmer Dabbelt wrote:
> > > I was just handling a patch set where the author used English to
> > > describe the dependencies.  They hadn't yet been merged at the time t=
he
> > > patch set was posted so I don't think there's really any way to make
> > > sure the computers always understand the base, this just lets me quic=
kly
> > > override the automatic merge base detection when I run into something
> > > non-canonical.
> > >=20
> > > Link: https://lore.kernel.org/all/20220913061817.22564-1-zong.li@sifi=
ve.com/
> >=20
> > I guess this just got lost somewhere (missing a CC?), or perhaps we've
> > missed some reason why this is not needed?
> >=20
> > Doesn't apply cleanly against 0.12.0, but with -3 it does & appears to
> > work - at least in my simple test cases
> > For example, the following gets automagically assigned -rc4 as a base:
> >=20
> > /stuff/b4/b4.sh shazam -s -t shazam 20230119094447.21939-3-walker.chen@=
starfivetech.com -H
> >=20
> > But I don't want to merge -rc4 into my for-next branch, and being able
> > to explicitly pass my preferred base of -rc1 is really useful.
> >=20
> > Tested-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Heh, the functionality itself is tested - but I get an error doing:
> b4 am -3 20230116074259.22874-4-walker.chen@starfivetech.com
>=20
> Traceback (most recent call last):
>   File "/stuff/b4/b4/command.py", line 379, in <module>
>     cmd()
>   File "/stuff/b4/b4/command.py", line 362, in cmd
>     cmdargs.func(cmdargs)
>   File "/stuff/b4/b4/command.py", line 91, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/stuff/b4/b4/mbox.py", line 710, in main
>     make_am(msgs, cmdargs, msgid)
>   File "/stuff/b4/b4/mbox.py", line 214, in make_am
>     if cmdargs.mergebase is not None:
> AttributeError: 'Namespace' object has no attribute 'mergebase'
>=20
> I may go fix that up, since the feature itself is useful to me.

Perhaps it is fixed up by simply doing what is done to "protect" shazam
=66rom am specific options. I'm not a pythonist, but I did try each of am,
and shazam with & without the flag. They all seem to work with this diff
applied:
diff --git a/b4/mbox.py b/b4/mbox.py
index ce04062..0b0fc40 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -211,7 +211,7 @@ def make_am(msgs: List[email.message.Message], cmdargs:=
 argparse.Namespace, msgi
         logger.critical(' Link: %s', linkurl)
=20
     base_commit =3D None
-    if cmdargs.mergebase is not None:
+    if cmdargs.mergebase:
         base_commit =3D cmdargs.mergebase
     else:
         matches =3D re.search(r'base-commit: .*?([\da-f]+)', first_body, r=
e.MULTILINE)
@@ -673,8 +673,8 @@ def refetch(dest: str) -> None:
=20
=20
 def main(cmdargs: argparse.Namespace) -> None:
+    # We force some settings
     if cmdargs.subcmd =3D=3D 'shazam':
-        # We force some settings
         cmdargs.checknewer =3D True
         cmdargs.threeway =3D False
         cmdargs.nopartialreroll =3D False
@@ -686,6 +686,8 @@ def main(cmdargs: argparse.Namespace) -> None:
             cmdargs.guessbase =3D True
         else:
             cmdargs.guessbase =3D False
+    else:
+        cmdargs.mergebase =3D False
=20
     if cmdargs.checknewer:
         # Force nocache mode


--Qf/xLlVGoq2qAUbV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8191QAKCRB4tDGHoIJi
0ompAQCalFuzQBcD783E8DxeaTsAzFzHmMm8DEU98B11N9Ax4gD+MeaTHinWEgkJ
pBDEsIEHHLEVcA+IcEOPnpG2R4LVYgE=
=WebO
-----END PGP SIGNATURE-----

--Qf/xLlVGoq2qAUbV--

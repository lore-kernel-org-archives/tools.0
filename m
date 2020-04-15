Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.19669.1586971408324800017
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 10:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=AbLKjcqR;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3AE1920784;
	Wed, 15 Apr 2020 17:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586971407;
	bh=fU+voZhCzTfReiZxtD3cEVhaWAQSZi59vndnh20Y5GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbLKjcqR9MopAprv8g2vbeNiHbrr2YrE+QvWFYIYp2QCQG6p9XwbCwhZf3uR3V5H3
	 Tb4W/PO4vyaMIV5njGNTNPnmTz9EQZ3CBTY7S0+yLxYG9jezXyNZ9ISysjvE2+Xy00
	 /dBsnx1aCR8zaZtso6qAIX5cNYKVCRq5oS4F876Q=
Date: Wed, 15 Apr 2020 18:23:24 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415172324.GH5265@sirena.org.uk>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200415165712.swekibu2xg453sqa@chatter.i7.local>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 78
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXr400anF0jyguTS"
Content-Disposition: inline

--BXr400anF0jyguTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 12:57:12PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Apr 15, 2020 at 04:00:00PM +0100, Mark Brown wrote:
> > On Fri, Apr 10, 2020 at 05:00:56PM -0400, Konstantin Ryabitsev wrote:

> > It seems like this relies on git branch --show-current which isn't
> > supported by the git in Debian stable, 2.20.1.=20

> Bah, I should check manpages more carefully. I switched to a more=20
> generic alternative:

> git rev-parse --abbrev-ref HEAD

That seems to work, thanks!

> > The documentation also says that

> >    b4 ty -s all

> > will send everything but it looks like that just lists all the tracked
> > patches instead (possibly because of the above, I didn't check).=20

> I think I just forgot to add "all" handling to -s. :) It's fixed now.

That seemed to work however I immediately ran into:

Generating 1 thank-you letters
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 198, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 182, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 60, in cmd_ty
    b4.ty.main(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 501, in main
    send_selected(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 411, in send_selected
    send_messages(listing, cmdargs.gitdir, cmdargs.outdir, wantbranch, cmda=
rgs.since)
  File "/home/broonie/git/b4/b4/ty.py", line 321, in send_messages
    signature =3D '%s <%s>' % (usercfg['name'], usercfg['email'])
KeyError: 'name'

git itself manages to figure out my name from passwd.

> > I'm
> > not sure what it's looking at the current branch for but if it's doing
> > that it'd be good to be able to tell it to look at a specific branch
> > instead -=20

> You can already do this by passing -b to "b4 ty":

> b4 ty -b branchname

Ah, great.

> > > Since it's an experimental feature, we just save a .thanks file inste=
ad
> > > of sending it outright -- at least until there's a lot more testing.

> > It would be good if there was an explicit command for this, it'd be
> > useful when scripting stuff I think and also when testing things out.

> Eventually, the plan is to look into gitconfig for "sendemail"=20
> configuration and use that for sending out email directly. For the=20
> moment, you can achieve similar results by passing "--confirm=3Dnever" to=
=20
> git send-email, which should just send the emails out.

That's the opposite of what I'm asking for - what I meant to say was
that I find the current behaviour useful and it'd be good to keep it
around even when b4 can send directly.

> I found a few more problems while testing things out, which highlighted=
=20
> the need to use more forgiving patch hashing routines. Since I was=20
> planning on integrating b4 with some of the patchwork automation=20
> functionality in the near future anyway, I switched the tracking=20
> routines to use patchwork-compatible patch hashes. Unfortunately, this=20
> means that --auto will fail to properly work (since we changed the=20
> hashes we use to track them). Things should still work with "b4 ty -s",=
=20
> as we do matching by subject there when exact patch hashes fail.

I think there's still some issue, not sure what triggers it but it seems
to happen with explicitly specified messages too.  Do I need to clear
out some local database?

Calculating patch hashes, may take a moment...
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 198, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 182, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 60, in cmd_ty
    b4.ty.main(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 501, in main
    send_selected(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 411, in send_selected
    send_messages(listing, cmdargs.gitdir, cmdargs.outdir, wantbranch, cmda=
rgs.since)
  File "/home/broonie/git/b4/b4/ty.py", line 336, in send_messages
    msg =3D generate_am_thanks(gitdir, jsondata, branch, since)
  File "/home/broonie/git/b4/b4/ty.py", line 248, in generate_am_thanks
    commits =3D auto_locate_series(gitdir, jsondata, branch, since, loose=
=3DTrue)
  File "/home/broonie/git/b4/b4/ty.py", line 169, in auto_locate_series
    commits =3D get_all_commits(gitdir, branch, since)
  File "/home/broonie/git/b4/b4/ty.py", line 161, in get_all_commits
    pwhash =3D b4.LoreMessage.get_patchwork_hash(out)
  File "/home/broonie/git/b4/b4/__init__.py", line 822, in get_patchwork_ha=
sh
    diff =3D LoreMessage.get_clean_diff(diff)
  File "/home/broonie/git/b4/b4/__init__.py", line 879, in get_clean_diff
    pp =3D int(plines)
TypeError: int() argument must be a string, a bytes-like object or a number=
, not 'NoneType'

--BXr400anF0jyguTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XQwwACgkQJNaLcl1U
h9DilQf8CLpRplr/FWj+hCWkZu55pCrRy54CKdZFdCCSyrly1sDK2GAkbrkJGyGH
v0g1l+MbXzyJjm8HlZncl9SyuKyK67kLsARzhW0XtpvW4jMZ++k0fECp0wSEaz1b
8NEUv8d1awvCdN4jNsKekj9CjsROiEHzWF7k+BuIoQHEKnv+xj6rhkCz65SPYQvR
PZzszaNOSKUWzFCXStBFwNcQ8lyFoce7L6UNodB31ZKVqfxIkmmMu7Inp8OD0Akl
ogfmPvJrKAb7EGFaLU8KSknEGlMAQzwL28xxTXbnJXg5E75kGPLkA84o5uxNttJR
vpshG1uWXXHJZXGjqQjblQOPKFZhIg==
=3ykU
-----END PGP SIGNATURE-----

--BXr400anF0jyguTS--

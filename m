Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.22917.1586981545813512883
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 13:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=MVIYBnUA;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AD3CF206F9;
	Wed, 15 Apr 2020 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586981545;
	bh=NGI7s5SK2UDfqfoGLrKWIpe6/RK5/Tgb7QZ1krYRsE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVIYBnUASny7+lTsc+5IZ3hG3el1fcLGBNVF+ruCGbGL7ret7fEyQV3J2WRvvnBxq
	 hs8BXgon0q7x0e70h3Fz8gOzndF+07JTnG0pNBZle0X66h5DI1Dh5xZmdHA0lpHm+B
	 U7PvDPcffDfEwMevyUUFQc4k4p2P127IyVNHTsbs=
Date: Wed, 15 Apr 2020 21:12:22 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415201222.GM5265@sirena.org.uk>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
 <20200415172324.GH5265@sirena.org.uk>
 <20200415175548.h4tyddairbltmri3@chatter.i7.local>
 <20200415183248.GK5265@sirena.org.uk>
 <20200415192819.l4osqt6sxdlydbso@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200415192819.l4osqt6sxdlydbso@chatter.i7.local>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 82
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RNRUMt0ZF5Yaq/Aq"
Content-Disposition: inline

--RNRUMt0ZF5Yaq/Aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 03:28:19PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Apr 15, 2020 at 07:32:48PM +0100, Mark Brown wrote:

> > and I can reproduce similar behaviour with other random one line
> > additions.  Does that help you see the issue?

> Yes, we always expect there to be a N,N in that output, which isn't true=
=20
> in a number of scenarios (like a commit that creates a new file with=20
> only one line).

> The latest master should properly deal with this situation (as well as=20
> when a patch deletes all lines from a file).

Did you forget to push...

> Glad you ran across this, as this affects attestation as well. Looks=20
> like I'll need to backport that to 0.3.y.

=2E..I'm seeing a relevant update on 0.3.y but master has c4469dc30c30f6
(Keep track of how many messages we create) as the head still.

I also noticed a couple of other issues.

One is that if I try to specify a remote branch with 'b4 ty -s all -b
remote/foo' or whatever b4 doesn't think the branch exists.  I'm doing
this because I want to be sure I only send out thank you mails for
things that actually got pushed successfully (in the past I've found
people get confused if the thanks arrives and they can't see the
published commit).  It needs a --remote on the git branch command line.

The other is that if I don't apply all of a series then b4 ty will
refuse to generate anything with no way I can see to override.  This
happens a fair amount when people do things like send a new driver along
with a DT update.  Perhaps an option to allow partial lists (though I
think that might need more complex templating), or one to generate
per-patch thanks messages?

--RNRUMt0ZF5Yaq/Aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XaqUACgkQJNaLcl1U
h9DYPgf+OtVVmerYr/n/go5rzgsW6cPoOQglXIobvsLtBl8aT3te2MbJCpgMsxEa
zddGfTO89e78kDnKbV+q47OnUj4IkamsIuru/1bir/nyyeboFKYUBso1zIgw34V3
2a0Sr2c7d0hJJ/JRld18irEZkhyI4MKpr9Cfk/cwMAA9XIRMSgbhr5FiJJ7b9GqF
eaQFFky3SWrpvKXwwdhCcXSk35rUHt+keg34QqlzRxUzuDEb/GL1WwAqcIqyFLRe
mG84Ni0IkWZIuGI+DD9FtCnuWY6Dy1qEkhyJaYZUJ2d63zVzLDdeuPyol2K4NvaS
LBVdCMPC2SoeqqsHcZVlCeypT6DAfw==
=Ggxc
-----END PGP SIGNATURE-----

--RNRUMt0ZF5Yaq/Aq--

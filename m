Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.661.1587141582527811354
 for <tools@linux.kernel.org>;
 Fri, 17 Apr 2020 09:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=pkQfCbXq;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5E30822209;
	Fri, 17 Apr 2020 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587141581;
	bh=/SzRZI3Mi+WkTjBgb7SvMRHzleWlcZ7IIIT6N+Mazn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkQfCbXqaHm2QAvRHiJXAV+j0kKPrpTj1Ifg5weLQgZqKqz/OgF8yKomcq2rSlumO
	 8FWQK3qeck8g/tpDUAvP6Cga2l2+PD54G/xE4Nr4bwPg1MleZNhOBF9hpy6jHZVHl7
	 Wx/RIvYqDs/vsgkUPjn2P7wjTgbZvOlCJ0u7zf5Q=
Date: Fri, 17 Apr 2020 17:39:39 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty feature requests
Message-ID: <20200417163939.GH5315@sirena.org.uk>
References: <20200417154430.GG5315@sirena.org.uk>
 <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 89
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Content-Disposition: inline

--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 12:14:24PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Apr 17, 2020 at 04:44:30PM +0100, Mark Brown wrote:

> > One thing that would be nice would be mechanism to supply some
> > additional values to be filled in the templates - I want to be able to
> > tell people what tree and branch I applied things to.  A command line
> > option to set the templates might also work but would be clunkier for
> > me.

> Branch would be easy, e.g.:

> ---
> Applied to ${branch}, thanks!
> ---

> I'm not sure how to convey the tree information. Would it be a sane=20
> approach to try to use current dirname as default, overridable via a=20
> b4.thanks-tree-name value? E.g.:

> ---
> Applied to ${treename} ${branch} branch, thanks!
> ---

That wouldn't work well for me since I have a single repo with multiple
remotes - I'm invoking b4 as:

	b4 ty -b remote/branch -a

so I'd need to switch out the config file to update the variable for the
tree name and the branch name would I think come out wrong.  People
probably would mostly understand the short names I use for my remotes so
it wouldn't be the end of the world to just say ${branch} and have it
show up as remote/branch but I know inexperienced contributors sometimes
find figuring out exactly which tree you mean a bit confusing so the URL
is useful for them.

In that particular usage b4 could parse out the fact that it's a remote
based on asking git-remote if the thing before the first / is a remote
and use the info from that to rewrite such that the branch gets expanded
into a GIT URL plus branch but that may be a bit too much DWIM.  You'd
get something like

	b4 ty -b asoc/for-5.8 -a

with a template of

	Applied to ${branch}

generating

	Applied to https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.g=
it for-5.8

TBH I'd personally be happy just specifying variables I name on the
command line (the actual b4 invocation is scripted for me) and that's
what I'd been imagining, although something more fancy would be very
nice.

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6Z28oACgkQJNaLcl1U
h9C/bwf+P2Bdw0BDDJAyo1tZ8v+Z2BTYfybd57AiSSKjvKkEseJlTnBo/3inCYfV
Z/k4Ml+2WoWo0sgwzsmjjYDUfqWozctRx3uPjohVlCktMjUu6hhWDKb4/6ThUJcP
1ubb7FkNHMPs7wUSG/vmMmKj7dO9ru7hxRYVa54yjJrfuv7Jaltd0WXItHvKZEFv
PfJm4Ys0I0Qal/tjCvIfaws7AWDVz1pJP9jhOuf6xSrtsMDk00Qshk5XguuEqqOK
0oSaIudL4ZM/fSiKfoQTp1DmEhjaVRPFLJ/3EAJKyxEQybsv1lR5GT6XbGHZIVWx
aUR4xtnCEzdqd1joCe15P4nU+iWAJg==
=q/Cc
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--

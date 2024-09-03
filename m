Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA31D5CD2
	for <tools@linux.kernel.org>; Tue,  3 Sep 2024 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403345; cv=none; b=slQJkzBB6ZCeWpWsQfJ0aPYqosc9vNhrHWACfu+I6mK9aGwdjvSm0adZ9SW7+Jd2ZZTsPhG2g7MwM1uDZn/gbBmP0ozy8nVdub9Az7gNbOlW61xwEHulDnZFhzynaZHJt0eJYVZQjvarzLAJAoFmePdfUJUs76KNqo7XBqaxgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403345; c=relaxed/simple;
	bh=o0yTVKOU1k9PMF5GPGOEtzpfzDlTqTfA8SneR95egEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vlvjny3siGL++ZhgV9CSqJ+IvLoT5fx9T6SDFduBccL5dhCy6+0m1ZZFFXXnjg7v9lL2j0PJjkbU8Cg7kKgDLdwB2PmOsSL2gvRFE2GfqaYltgtBgW3QtJ5DA+dmLk6kOAUECvn6GOd5tf4b77TDVRWDa1y+8ld2/x59awaONxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o990X8Dd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o990X8Dd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CBAC4CEC5;
	Tue,  3 Sep 2024 22:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725403345;
	bh=o0yTVKOU1k9PMF5GPGOEtzpfzDlTqTfA8SneR95egEA=;
	h=Date:From:To:Cc:Subject:From;
	b=o990X8Dd9rKzPDx7C5IeRfEpeb2fpEHFc4ZUVaSO19PnvAmp0Q+PDd99M/vuNxD+o
	 sNFew1DK+Zod0lQc7tCV2sLE0Yj9O4g78yJmAvlLcByg/CDdVGwrqZrQDlPwzUQ7XK
	 WphszP025tylUAycsXZm/yiLq0VLaMNv1LVSY6+cjS2vtvSUNqArvsivGYtGevwlPN
	 XfKEWaY8K7UPz2C8YkKFuVUXcPwvGUGW8NBoFtSKBUS2lZaZJ7KyGbcInOj8/6osaL
	 zNZqEhGrbKf2pYc2N7PMUFm+TkpTrMz302GZO7JAJHLNx3qj7/7h5q+GSvE8/7Lm9A
	 tKyCRUtJ1hGuA==
Date: Tue, 3 Sep 2024 23:42:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 send falls over sending a series
Message-ID: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V3ixujmVLcpokHVI"
Content-Disposition: inline
X-Cookie: Words must be weighed, not counted.


--V3ixujmVLcpokHVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

When attempting to b4 send from the branch:

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git documen=
tation-b4-advert=20

with current git b4 the patch is sent but I get the output below and the
repository is left with the base commit checked out as a detached HEAD:

Sent 1 messages
Error tagging the revision: Could not cherry-pick the cover-less range
Recording series message-id in cover letter tracking
The current repository is not tracking a branch. To use b4, please checkout=
 a branch.
Maybe a rebase is running?
Traceback (most recent call last):
  File "/home/broonie/git/b4/src/b4/command.py", line 435, in <module>
    cmd()
  File "/home/broonie/git/b4/src/b4/command.py", line 417, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/src/b4/command.py", line 93, in cmd_send
    b4.ez.cmd_send(cmdargs)
  File "/home/broonie/git/b4/src/b4/ez.py", line 2132, in cmd_send
    reroll(mybranch, tag_msg, cl_msgid)
  File "/home/broonie/git/b4/src/b4/ez.py", line 2217, in reroll
    cover, tracking =3D load_cover(strip_comments=3DFalse)
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/broonie/git/b4/src/b4/ez.py", line 599, in load_cover
    cover_commit =3D find_cover_commit(usebranch=3Dusebranch)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/broonie/git/b4/src/b4/ez.py", line 742, in find_cover_commit
    raise RuntimeError("Not currently on a branch, please checkout a b4-tra=
cked

--V3ixujmVLcpokHVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXkMwACgkQJNaLcl1U
h9CxYAf/U/4V98BqZnBwuBikGx03Wb5Sa24sFSkhBcwlPSnd0VQQBGXVjj7GV/z+
Ls8i4HU9xD/fV0fQZXAZJszt8GU9u+v959rNuyvXAvQaDp2edz3Vo70T9wn/9+Oz
zUk9Jc4I/Gq+L6PxMgiXlXCxsk+tmRqw/bErWBqQ0w5u7X332rv2Vh73EGRvg6yi
BnGo0YNZv5cg0Pg6NLVMM5P0CuLRsgUwgcr+XahO+6oy1yQyL2CDOSE57shkdH3M
eQixv+mA+ZRxm239tdhFrdmM4fue35CiKn3qdxpLtmZTgrIdTo19ZeX7PzcVtK7m
ePankxYRR/3vCiBIAt6XBSW7zDEtng==
=JJVT
-----END PGP SIGNATURE-----

--V3ixujmVLcpokHVI--

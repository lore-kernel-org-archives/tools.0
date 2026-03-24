Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6643301474
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381752; cv=none; b=Rth47nm56nOLxscOuQkPVtNRDGkMIQ9LlFTYNLYxk0obsJtYQ8R5uQKJrosFCtSFUFo3iq+TWHjaGS8fc7ezeMSl45XVWdbzeW6kFXKTAOLaJtAKchwYA9bXmEy5u3C4kSHjWzGASG8VIqCzNhex3mZvC6jXjVhj+cP7CO1xN2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381752; c=relaxed/simple;
	bh=u12NSieCzjDy4MBbFjEt2oxaglyMpUKYhReFqvC+TNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ReW8U4RzpY/1/+UmnIcHZiqEkMhLg+3XVCCF9og0aNZRdHxazkK4TwSiqzgSEcGFI51NqSFAKV5TaPfxn3vW8RmGaCD1vTGVspvqtr7G4KtMe9MwxzV0EHC7gFWYTPXzKN6t5O1GSu0LBEgO27n1QIbSzqsdGWJdwk3B4NoXEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7bnYTrX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7bnYTrX"
Received: by smtp.kernel.org (Postfix)
	id 9E896C2BC9E; Tue, 24 Mar 2026 19:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C6EC19424;
	Tue, 24 Mar 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381752;
	bh=u12NSieCzjDy4MBbFjEt2oxaglyMpUKYhReFqvC+TNM=;
	h=Date:From:To:Cc:Subject:From;
	b=B7bnYTrXRibRpA7fF555bUsV1g/n5x7XvUV9fty3lkKoXCFdsHU+lmo7medqA0tLw
	 U8XOJTLGOuzgwP3TdOdzWNgb/kNoREKV0p7wSDSCcSCQQCia+Otc6YbJPLBu5gXm8K
	 4+7wfjgo5s3MYckMp+c4bJVQ+3egnZ2/JvFHpIRrJPC/TUtGBH66u6O/th7edMsY/b
	 OsS3Qma7/UguHzlkrusZYwWSgS5fzqu5U1Ry7+sso7Vz/nyGgEoAfxpar1HzMz1Et+
	 FUb3Y/4QC/8Rdx2Q3Px876jG38e1oUC6a6B93w4fcvEjJw9n2pxeyKsKKb22Z8MBZw
	 +6KDaLJ1/kWfg==
Date: Tue, 24 Mar 2026 19:49:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Checks for published commits not working
Message-ID: <7e063a38-1415-40e0-9342-4fe5b31b65b2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9oYOlCnZa+QS9/0N"
Content-Disposition: inline
X-Cookie: Forest fires cause Smokey Bears.


--9oYOlCnZa+QS9/0N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I just processed the queued thanks messages I had.  The list displayed
in the UI correctly said that:

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git/commit/?id=6c2505e185b0

would be checked for:

  https://patch.msgid.link/20260320-no-gpio-control-v2-0-dbc938e462cb@axis.com

but then proceeded to send the thanks in spite of the fact that the URL
it said was going to check reports "Bad object" as it should since the
commit isn't published.  It *is* in my ci.git but the URL above isn't
for that and the UI displays the right thing.

Thanks,
Mark

--9oYOlCnZa+QS9/0N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC6rQACgkQJNaLcl1U
h9AO/Qf/VhyrZiwRXTRVlLdXI9T4JrW7nxcWWrau3d5peFp8XKdd/sF7hhQsI+Yd
DFfqjkdWKp3GfTdoKWXlP1XWV30LfccR3YZD8ei0WfXiQArlqyNjzndbQgOqjtgt
9yUalIyjHscHPxFixpY7W0ingT26SJ7PjENhMcDupyFARPRmU1YkWMwV7FAzbYjj
OaDFWMpffcVwSA5p+muMmdfqmAq7T6/WFblxD5eC4Eb7p43cziPOcDPSDN43Q/Ar
dAbECHtSCR++83gKUPNAnNhr3XdK2oqG3IurDy9v+5MaXgtkzgTszpl3jbyCXBDJ
SkELYR0kqBZaBYPCBMfG83gB55Pcqw==
=tRw4
-----END PGP SIGNATURE-----

--9oYOlCnZa+QS9/0N--

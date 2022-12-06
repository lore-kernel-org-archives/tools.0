Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3247B20EA
	for <tools@linux.kernel.org>; Tue,  6 Dec 2022 22:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE99C433C1;
	Tue,  6 Dec 2022 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670364442;
	bh=sPEERr9u7NbvAWappYd1z4Ukt4MNxFLWuFMp/kq562U=;
	h=Date:From:To:Cc:Subject:From;
	b=GrZ5HY9+LhqWi5eElNCLXBwEms6/5UPA6m6S3r4kKI6m5nrWdxC6rrpdLVodT2yuF
	 zaks1O7+iPH2MGveF1T9bNPeOg3Pe2Sp6GyKsClpON8/ZPjORj2C57EMSbfDFtSGW2
	 q4UiNRcLYsqNsNfrvZP4yJ4ZlLgXZn5dodXEbQPJ/fIYxhmizeVKXrfgL5Y4JJ+/w9
	 wlVCMqPNYZsur90uSoSwvkHm3vhhCUQqXgS0UlZcb4CJGiCXxKkPD31qC6SpcZgRjV
	 wmesiCDodMq7p54hX8B9f8erNBg55UyOQDL4eySvW1811uF4Bk07n7Q9zFXGOgQVUq
	 XwG0qq9z3cwWA==
Date: Tue, 6 Dec 2022 22:07:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 prep HEAD fails when specifying branch point
Message-ID: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eXnCCkJ9GtxRKv0O"
Content-Disposition: inline
X-Cookie: Ego sum ens omnipotens.


--eXnCCkJ9GtxRKv0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Using Debian bullseye with backports of git installed to get
filter-branch if I attempt to run b4 prep it refuses to create a
new branch saying:

| $  b4 -d prep -n b4-test -f v6.0-rc3
| Running git --no-pager status --porcelain=v1 --untracked-files=no
| Running git --no-pager symbolic-ref -q HEAD
| Running git --no-pager config -z --get-regexp branch\.master\..*
| Running git --no-pager rev-parse --show-toplevel
| Running git --no-pager config -z --get-regexp b4\..*
| Running git --no-pager config -z --get-regexp gpg\..*
| Looking for the cover letter commit with magic marker "--- b4-submit-tracking ---"
| Running git --no-pager log --grep --- b4-submit-tracking --- -F --pretty=oneline --max-count=1 --since=1.year
| Running git --no-pager config -z --get-regexp user\..*
| Running git --no-pager symbolic-ref -q HEAD
| Running git --no-pager symbolic-ref -q HEAD
| Running git --no-pager config -z --get-regexp branch\.master\..*
| CRITICAL: fork-point %s is not on the current branch.
|           Switch to the branch you want to use as base and try again.

AFAICT this happens no matter what fork point is specified.

--eXnCCkJ9GtxRKv0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOPvRYACgkQJNaLcl1U
h9Bd7Qf8DFh/IBkRDSLVxGeCfG5wW1boBwESGVeraFKIUU0bN2RTyEh5drmG6w7V
JfTFtdvq3DcQdCiDS3k20H9PzoSQ94wk0Ndb8rdXekZon3ekU8h9QUHOeigb5wqU
0DIiJU9MF86lfGmMjYiOcWybABNbnFMl/nMtJSiu7t9ABu2kew+JpeBbE6qjhKKz
KpY9E6gVgMGxOZwlMMLviqZKSfd4PsHX0xM33kqCrLvEXUYDoZgNM4MMdIN3PcJY
cHF0rdimVJBRNp2oVyLH9hC7PRO/DpUPfGNf9FIvg/8/Jz76++gNiARr8XKMWEpH
20/VYqdNchHYNXIBYdQTkuDsmHib5Q==
=oYwQ
-----END PGP SIGNATURE-----

--eXnCCkJ9GtxRKv0O--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C5D3C2F
	for <tools@linux.kernel.org>; Mon, 16 Jun 2025 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077687; cv=none; b=tfvyxYLqBFOP3goo6Ddx1F0xo2jHRYqNORmIT2lZXo5hVIKCE7Jyqbh1p/DKxqikPQF7ySoIa77Ak23kwlFvVCPu+DbRolbXhmhJOBIMaLQqgZue6qGTRF1A9z1+5aYLpn83UONLktao5yxUA9NZPmicw6NT6roo5+Jc8V+pHOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077687; c=relaxed/simple;
	bh=QA0sNeuN+3zdogzrUEfAlMEFVgkAxVTmGXtzySnIiUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGd0mCYbbx03CGgKzCPCWQ/L5+CFNNNkv6JVmvSjM+3jig/Qgtg59wZdx53h8eYc+PobLHEup/Dkfhmt//8Cy2Fta8NXuJ9J01EOiqEC4yIUJBMjVnOxmxY0FxdwSVL5gNIFAE4lwrYgj5mJnH65Obv8Q3EAafbVvdlMmrBrnrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRTXRby3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRTXRby3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA4CC4CEEA;
	Mon, 16 Jun 2025 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750077687;
	bh=QA0sNeuN+3zdogzrUEfAlMEFVgkAxVTmGXtzySnIiUo=;
	h=Date:From:To:Cc:Subject:From;
	b=gRTXRby324yAxZ/evlYlBT7WK04f/kw4iSs06ywkLAS/NOaxZD8PG6amQpPaAO2kJ
	 sQ54V7sdb9Od1VHUOzpTjJf+GEOhGY39/uPAwBPRHCHxYDoT6iEcTNiYqEwMofQq83
	 Bv+e2ayA3lzSI0DcxqerJ7DVttOhF7Q1R/C2m3NM1uPfPQIuGBW2JTKjSrUJPK7hMN
	 gAneTRuXop8xAK4UXkhphKKXCMnq+ruGwrMr37yso7iAYyEJhuhJR3XIG4tyoi8u1g
	 kCaNOZKecKhjeYsWLRaGDXAh9qnJjXRjIovT2h0jGXYjRchS6Emoy/QEpM87mUeNAR
	 in1KUvKw5XnOA==
Date: Mon, 16 Jun 2025 13:41:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Python backtrace running current master
Message-ID: <78832c81-9b84-491b-bb1e-5f67ecddd34b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7JVwMnmR9n0BNuU"
Content-Disposition: inline
X-Cookie: You are fairminded, just and loving.


--i7JVwMnmR9n0BNuU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

With current master (80e1a7f) on Debian stable I'm getting a backtrace
trying to run b4 with no arguments:

Traceback (most recent call last):
  File "/home/broonie/git/b4/src/b4/command.py", line 10, in <module>
    import b4
  File "/home/broonie/git/b4/src/b4/__init__.py", line 41
    type ConfigDictT = Dict[str, Union[str, List[str]], None]
         ^^^^^^^^^^^
SyntaxError: invalid syntax

Thanks,
Mark

--i7JVwMnmR9n0BNuU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhQEPMACgkQJNaLcl1U
h9DwYQf/bnO4ukkNqg5TYQtC4PJbsyz9fuwHBstY8sh53ucTCanzAiBla0TBhUwA
pAkv1uDz61hMt9sZB7o16AA8HaI0yUC59KekeJLIl27az5pA88Kgt3NLkSIDLLcq
FSNmuiWCexhFlDMzqsXa/C++wCVj2XaH50RfACxKfN0F9xUkTUndXFu403MRj68S
YkOnbQna3OBvbueYnnKLkQJOe9qaNPzvgyXKvbas3TjDEZ/8bQVO9DAqop3dZYg+
cNLnlMGhcD5OXEmS+ctiYmgFmMWlbMe9VyvMIPCugj9u04XiPrM1IakvI+ZG/UKY
zFslxNIlfNQQlYGcfhMGOB6RWIM0DA==
=guyG
-----END PGP SIGNATURE-----

--i7JVwMnmR9n0BNuU--

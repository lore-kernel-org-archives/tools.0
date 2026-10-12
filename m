Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D847D925
	for <tools@linux.kernel.org>; Mon, 12 Oct 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824752; cv=none; b=PPoOphScEXpppyePzMX0SL1Z1GTVs0rXPdj2UR8qrTwoqvk9arhOkLLBrFLPQA7/BxOCTBD9DoaEHvCyTJypSPTTUoelPUIThzZVzX1nVEukCbCck8uZJwxAV3GJB+goWHamSEICJOd+iiBJinVKMfoqNUUerE4eMkQUZpCyvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824752; c=relaxed/simple;
	bh=pe7IAb7i6UYHy13lTRHgK+XEipAit8iePPvgGXecDKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gACXN5glvFTcWE/rSA/ctPQumnb/NxsVnyz+cO0rOPDKa2zMlCCuhDf9+q8CpXQK+oYwOhUr1Dukn2/pguUqsMmqPfGW+bWMnd89oLAbybttB6A+fK5T2CX6MekonrWCH9krne8roRBxnmCH8rDTGhhPAS+qozbiNab7ryyADBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6sm15Dz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6sm15Dz"
Received: by smtp.kernel.org (Postfix)
	id 482DE1F0089C; Mon, 12 Oct 2026 17:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8606B1F0089B;
	Mon, 12 Oct 2026 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791824751;
	bh=omLtnWzHo8gJk5mkS6CxGv4QYZV30Op54fWWhqI+Bjs=;
	h=Date:From:To:Cc:Subject;
	b=e6sm15Dz0Sv90k3x8YQFTP4wHfS0pH6eXOcc7KVmtISBkzdmQm1Fc2/uOmcZkYT0D
	 v9KtvmqWTNv3S+/TkIxHbWlQzZ8xV0eXjVpDlFvfGlE3tUef676q5N8BUIZO98tu7Y
	 YyKH5kNAI1QP5savw4TLj0jo2pm2SP0GSWONRN2bSwvLUKl/y4Rdy2x82bjkUhnGnu
	 z/eL2eSk5ONfkaSp07SK2ORldZx9ZkUMgFhW6mEz5kjyYu5MiPvq31RdQ+ao38J0Rr
	 WFrWWZVejm9KjTtYctfsXeJFbDMs5E1TyclJiDY+qSF+DHsV6mGW4FEwf3UJCW4TXx
	 JFKyvteBI3Z0Q==
Date: Mon, 12 Oct 2026 18:05:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review displays only one patch in a series
Message-ID: <0c582888-ad7c-4995-8674-e9248962d8f4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iton3TimUwEVwiz4"
Content-Disposition: inline
X-Cookie: Times approximate.


--Iton3TimUwEVwiz4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When I track 20261012115408.87066-1-ansuelsmth@gmail.com with b4 I get a
series containing only one patch, the driver patch, and not the binding
patch.  The logging suggests that both patches are found, but only the
cover letter and second patch appear in the UI:

Retrieving series: 20261012115408.87066-3-ansuelsmth@gmail.com
Looking up 20261012115408.87066-3-ansuelsmth@gmail.com
Checking for newer revisions
Grabbing search results from 127.0.0.1
Checking for older revisions
Grabbing search results from 127.0.0.1
  Added from v3: 3 patches
No change-id found, generated: 20261012-asoc-add-support-for-an7581-pcm-driver-d6274ec992f2
Tracked series: ASoC: Add support for AN7581 PCM driver v4 (2 patches)
  From: Christian Marangi <ansuelsmth@gmail.com>
  Change-ID: 20261012-asoc-add-support-for-an7581-pcm-driver-d6274ec992f2
  Message-ID: 20261012115408.87066-1-ansuelsmth@gmail.com
  Known revisions: v3, v4

however I can see both patches present in git in the imported branch.

Thanks,
Mark

--Iton3TimUwEVwiz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNE2sACgkQJNaLcl1U
h9AbnAf+N78LtATkfX5IGq/7T21+YxbRtSAlMvtswbhFbRkNZk6lBcyd0QfaVVpU
Kcr6nWQ8A/taEVVoEpovTrQld7ZPPRxf0XdmGJW54YpHRlMmK98GmxHrKA0mxu/q
n16XkJ82///Bi9olO23F/uf1QNu8h52BBo6Wg8n2f7hmx73tiHnX5w4lvjL7KvEU
W4gqC2bMDSRadJFL2P1L415PHPfqGFY8FPvBuWs6OXcFeQ1cs2yC5aVb+9o4yO5g
o27Dx5uZk9vYnZsdI+PQoGyOBlePvkoDIOV5m7V6Xf4i/oiboiUnALMbby2HjJha
VvqfTdspA5J+6Pk3I+rhItmHPM1IPw==
=40WK
-----END PGP SIGNATURE-----

--Iton3TimUwEVwiz4--

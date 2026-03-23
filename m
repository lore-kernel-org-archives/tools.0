Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911F23B2FC1
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274836; cv=none; b=Haks4NzMOXYZEFa5+lzTjaKvpKe/uc6cFQPRrHwbp88qiL++abAJEBDF9QAYstu/TINFxk/MQMq6Am+k2L/6frvGz0wDsUD4dLitY/N+bWdfsy56IideAbe5u4dgDe3pdqW0t2C1kGA6G6zjGt/jwXEqWqZEQUldSbkC2p60h8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274836; c=relaxed/simple;
	bh=bwtQpvrxdU+7SEGZaIyE1vXJeO3iXOB08XrvEqCuqw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgWniaQM1bFBFR7ndTIiZAjEuKYyY+bmrYMf0AGzbkzssVzpBTifcpwpkn0Wj8RPJ/x8d3zXkmM6Jvjv0Mbx9MvJoWuPUklsc4pnaUX4ailMyfc//2u9aFby7CEvJeKdvZQvdK9x8ynRetnhySZcGuILEWjlKkmmi/i9UMLBIN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuOHj7nq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuOHj7nq"
Received: by smtp.kernel.org (Postfix)
	id 8B43FC4CEF7; Mon, 23 Mar 2026 14:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5CEC2BCB4;
	Mon, 23 Mar 2026 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274836;
	bh=bwtQpvrxdU+7SEGZaIyE1vXJeO3iXOB08XrvEqCuqw4=;
	h=Date:From:To:Cc:Subject:From;
	b=NuOHj7nqfd/KqgTj1hdLF//jOzTG4P2oDB/rtG6g+RLUlG7RRujW4yq+PTO9B/zuO
	 0eWZ36pvV/K7xIuexTtllAJjp1GQyqaLlYnLQVUrcq2DgmkaQEK/sLS78oZNSf+MSn
	 0bEpRHMHU1OX730bt5WbWDAcpg30NEABVktxYxGoU38BAT5lGI9vrH5ntVxBCP6+gk
	 ZBdk2inbtjxQfQq2zfjuJ5nll6OpdamZvCtatFRFB8YGG1olOD+As1a45iFqU0hnrK
	 NHv7B3erK5HZovP5qFYXuZb8160E0r+Qi58oPTPnBDyWxsT6A/srbQdpRi/xKrM/dc
	 dggSfn4Bw8B9g==
Date: Mon, 23 Mar 2026 14:07:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Stitching together serieses
Message-ID: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVy9PZ+cQ7HpIzeT"
Content-Disposition: inline
X-Cookie: Avoid gunfire in the bathroom tonight.


--SVy9PZ+cQ7HpIzeT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When users send a patch series in a way that doesn't thread such as:

  https://lore.kernel.org/r/20260323041505.2088-1-niranjan.hy@ti.com
  https://lore.kernel.org/r/20260323041545.2101-1-niranjan.hy@ti.com
  https://lore.kernel.org/r/20260323041624.2120-1-niranjan.hy@ti.com
  https://lore.kernel.org/r/20260323041641.2133-1-niranjan.hy@ti.com

it would be useful if b4 review had a way for users to tell it that
actually this is a series and please treat it as such.

Thanks,
Mark

--SVy9PZ+cQ7HpIzeT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBSRAACgkQJNaLcl1U
h9CCVgf/YgiMIkp1+px+WjIO7On7As28+jp8V5zjz2840KcpD5jbEF7ucfVOJESQ
i3bCE+vHxB9nhqf/G/+9+cKSuKuKLmlvuWY32K7iQyyxY1/nKsj3d8mJR18AUgAr
lTIHBUkIgdNIoOsW8BEgWV0hLcDl1tJpbS55HJp1jz7LaBz2hNOPm3qy/SZKhJ2X
sx8y8zlPDr0kTniAml6DPMrNZArln6oB234AbTVxCJPHgWdJFa1ez63v48Ney+l9
OEM1Xbjn1J+1/lNLTL281Zeul7Ojr6DM/aqlLUHWss7iTCGi2qcNLRCtbD550LD5
Iv/K42yg1toonL65eOYhHvTkeqBAtQ==
=ASYd
-----END PGP SIGNATURE-----

--SVy9PZ+cQ7HpIzeT--

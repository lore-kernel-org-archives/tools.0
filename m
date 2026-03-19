Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907403D3CFA
	for <tools@linux.kernel.org>; Thu, 19 Mar 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921927; cv=none; b=O5c2C8Y2eJQip5WXOA+bBKnfApwcHydhRMSh2G2KUV8y3mqeHQ+s3ueJdh3nh8Y3jNOO+0YXFp9wL/qSxUYMQkkQE1GULjTAXMMihv8+QPomhCemo+hs5uRXNM2yzRCkfWMrpU/kxXaQUtZEv5LuBcEoOqrqZyw9eluJQiZiNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921927; c=relaxed/simple;
	bh=jJ1KPAKxsHmV2L+Rf6cp8QfzFM6TGIz4vLRujeirHe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSAmKi49zRchh66nQxKrGr0fKEdgWf8RbZfHDLPOasTk7Pb5IOiSgEjuJVzKUNJjDOc7gdpwJp/vghg1EK8E4yuBX5MUOvmVKf+gZvNXhoOtEMtGrUrJ7as1dzOut4aQ4RAwnN/8IaXUq1Fljwzpcn9VRa3tD4shAmcye+LCVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgV3oaAA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgV3oaAA"
Received: by smtp.kernel.org (Postfix)
	id 43EA8C2BCB1; Thu, 19 Mar 2026 12:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFBCC19424;
	Thu, 19 Mar 2026 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773921927;
	bh=jJ1KPAKxsHmV2L+Rf6cp8QfzFM6TGIz4vLRujeirHe8=;
	h=Date:From:To:Cc:Subject:From;
	b=jgV3oaAA/lzAAm3TZDuhktDk7gexdmJMUbQ0QANXaEO+qZsoh+ndXltjq+l395Jbh
	 OjiW+Ab2DMDS8C7szt67u2MjI+Z0rRITKyKCCzqA7gL0P5Ps5ACJSWnGINatuKgpvy
	 0TC9382tRoCW2IiI6VXM3DH7WUs2ZNnz/MAV9zIHAzPC/84cCaWxu7WwoVU0k6VM16
	 QVTVEMGJZy0V9Aw0nefUE4afqG/r9FDTW+1LfT5OAcjHIl904P+Skn/LK84wVv8rMS
	 eMwCzIhPjBouov2/Uao9myeSjzKmFtMEXTGF5smzZpgzUfU62S3BeggqmMNIsmrMyC
	 G65LSJ2JyYfDQ==
Date: Thu, 19 Mar 2026 12:05:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Problems with b4 review update workflow
Message-ID: <64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bb0xzX8+mT+ZV3q3"
Content-Disposition: inline
X-Cookie: Given my druthers, I'd druther not.


--bb0xzX8+mT+ZV3q3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

When you take a new version of a series it's possible that a rebase will
be required to get the new series to apply.  Unfortunately there is no
opportunity in the UI to select the base that a new version of a series
will be applied to, b4 just takes a stab at a base without seeking
confirmation (even if it detected that that base isn't a match) and then
if that doesn't work you're dropped into a shell in the middle of a git
am which makes it hard to repoint the base.

Worse, since b4 archives the old version of the series prior to trying
to take the new one you've compeletely lost track of the review - there
should be an unarchive on error.

Thanks,
Mark=20

--bb0xzX8+mT+ZV3q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm75oMACgkQJNaLcl1U
h9Bq0wf9EGidIVmT72CjSTFs4ZjVmplybeoDM5UEkmfJkLZgzhhP592QMGNN/w+v
pHDaMmMCnjepswyXRnu6WiLWJeOc8ntbEmMYJ5nbBEnDYyth1EizPrbt+tWWoVzI
fo90x24t3nYy9mBONmHSOP4r20Qv+gL+cRCKzKUJy4ZRdmiEX1V7mKpDkGq0y+ea
+kYiAtq0vcbLYSIUsVjKyEAeVcayRdfJQM23CpNddNtKDLGaXj44NQ93fM695XHK
VzMnJ90LytPHmB+d24ra3iZlxCIWv6gg0xqoqHesar1jn7mH+bJR4rJiR9yZpS7s
gE83X5GE2ZZdTz2aYrGvCcSW14VYfQ==
=0sGO
-----END PGP SIGNATURE-----

--bb0xzX8+mT+ZV3q3--

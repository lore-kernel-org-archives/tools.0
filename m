Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D25F20A5C4
	for <tools@linux.kernel.org>; Mon, 31 Aug 2026 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204897; cv=pass; b=RFa7bmetcwpbCwGAMtU+Qxaj05X2t87IbaGFI+FWLZnSQsKqcCHrfsn8UPZT9gEEWQrNxWJTuzNFfEqhe0Zg02vdyGXdblFvLK2joOfIb4HRstSuRvpP1TpqfaOK90iVL1Fo14mWl3PIUx3jc07yRoJZtKc3PBk1O4rkvh0n8Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204897; c=relaxed/simple;
	bh=JGEFjZEHs0FWE7zVXhsmuJbU9WCZ8AtQOyRkOChc9ns=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+dzZmm2PQGhiLDIWvF9WMAIPsYC/7N+5knOyBSLS1sbKfm1oyLRi7kBLbI3aQIg0DGyamQffdGbP0fZUho4K0REVEZSU2R6YLbnbmCCtK9fi/zsaYRr0K+eMLgyStybQV56dEQ0FJgPNB+UwIvdj68ACUX7w7vD8l1qjIMDVXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=singpolyma.net header.i=@singpolyma.net header.b=gQ8VtQDE; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=singpolyma.net header.i=@singpolyma.net header.b="gQ8VtQDE"
Received: by smtp.kernel.org (Postfix)
	id 4D9E01F00A3D; Mon, 31 Aug 2026 19:34:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.99.233.116
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788204896;
	b=KovrIVBE9xLnHf2f+uoRnNPhzIH2v3cxaeEIL6CHPOrtsVgB5K1Dfq9EErEkLfNHn1Tu
	 HZZKvZKlccoq1yIoFWlGCUP0Owa+IePZjwOkN1rwWiQ5yac/8/fFksuy8UNLoox9aY+S8
	 Rfsc2zNHRWWr045DT48w8DATZCGES/rO/nzwY7zfHIyR3w+4wgoGHNdL9tND2aCbB9Cs5
	 b7MHj3R74gEsGFV+Kmf+pbVUhNVnzi1Akq1+lnMMSlzeRwZgHdNHdgkcb7NYfV/v1ErU9
	 ReKHt9uvD1VyVPujEM+/S8lFP2xZ7kCu8Tgq2ly3caotnNSi/Ub7fwo3LAffZT/Qosw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788204896;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:Jabber-ID:OpenPGP:
	 X-URL;
	bh=JGEFjZEHs0FWE7zVXhsmuJbU9WCZ8AtQOyRkOChc9ns=;
	b=HzE2WExke543+aKxQ6XCV2By7eoCvNDI5p4LhUgfYpbf3S2VbqWcknZ2KL+RvconaX0F
	 DtqxQ64QcrF5C6AI1Vw0ZVmBdb+EOlcebQx06PXLsfy70nbTfvPa6T8SuY0Q0yMdJ8XAc
	 xawjmUKC9kKDCIRF/ZHlqGG1zzq8tRWPeSdRtsbXL5MgdmakJRKx/3rDp6E2cbW0cK+gv
	 D1ytfYYvn/3vsRvJSKPvCdTRb5uafsYEoK5jo++ZG5Oyn6cccCTg6EFPGoHKqG2Y5bmak
	 hJ2HcAMHxP4H22beB3FAlR1YJwaqnODVRJjyqtNLPVU7PJTop5WmAkiwnmJ5po8XZYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=singpolyma.net header.i=@singpolyma.net header.a=rsa-sha256 header.s=iweb header.b=gQ8VtQDE;
	dmarc=pass header.from=singpolyma.net;
	spf=pass smtp.mailfrom=singpolyma.net;
	arc=none smtp.remote-ip=192.99.233.116
Received: from singpolyma.net (singpolyma.net [192.99.233.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 972C31F000E9
	for <tools@kernel.org>; Mon, 31 Aug 2026 19:34:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=singpolyma.net header.i=@singpolyma.net header.a=rsa-sha256 header.s=iweb header.b=gQ8VtQDE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 972C31F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=singpolyma.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=singpolyma.net
Received: by singpolyma.net (Postfix, from userid 1000)
	id 938A74861981; Mon, 31 Aug 2026 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=singpolyma.net;
	s=iweb; t=1788204888;
	bh=JGEFjZEHs0FWE7zVXhsmuJbU9WCZ8AtQOyRkOChc9ns=;
	h=Date:From:To:Subject:From;
	b=gQ8VtQDEoD8B1KydFmz/dP2RGrNL7CIvP8GxTYNu5JqVF7Bs+8uCqZ58aMW3KnIQT
	 glAGZBPWHmcyd4HOSK8v/RRfS9TJ7/GBgL537S7A8K9/+S0uwnpsLnAh62zdxa2084
	 L+p/4bq4GTCN+NEsLSTnWBhw82Oqbe8W8GgVbCjs=
Date: Mon, 31 Aug 2026 14:34:48 -0500
From: Stephen Paul Weber <singpolyma@singpolyma.net>
To: tools@kernel.org
Subject: Using b4 review with b4 pr question
Message-ID: <apXXWOJMT8GxhJ9w@singpolyma-beefy.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pr/xG0N5hjEm8e2K"
Content-Disposition: inline
Jabber-ID: singpolyma@singpolyma.net
OpenPGP: id=CE519CDE; url=https://singpolyma.net/public.asc
X-URL: https://singpolyma.net


--Pr/xG0N5hjEm8e2K
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

I've been playing with b4 for use in my own projects and mailing lists, and=
=20
it seems very nice so far.

One question I had was if I'm using b4 pr -e to review a request-pull=20
commit-by-commit is there any way I can import this into the b4 review=20
workflow? It seems like even if I pipe a mail into b4 review track it just=
=20
wants to go out to the list to download this, which of course doesn't work=
=20
in this case because the series is synthetic from b4 pr -e

Thanks for the great tool.

--Pr/xG0N5hjEm8e2K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEWeaCw+rzmiEMpzU00RwpEc5RnN4FAmqV11MACgkQ0RwpEc5R
nN6YIRAAhHLh8fI0pm9Sx001PkpylHkfbGDizjFmNsgnVMjg82qbzJcM6zYha8CD
7KKgj//u1H7MM592kP56keRCrXvfCk5RW9xwN/coiwH71ijaE2OLQDOyO/VujFyL
R99Dy+/EUjrALyt5eOIrzMOPh9kAgPOQ/Vd4btdvYksK9+diS0rkG5iH7m3Xp925
iavZgwYODp8B7H/ve5rB0ux8JOa+dI8bZqlnn27v2EC06ENnbCGklDa60D4QWSt/
Mmx312E6EUKKq7TsZKCnZ+4D+bTLMunzcHx1XcYNc1iNyZOuCPBHcCI6TautfSZU
87qQ8L33jLiPpWI87V0rubd8xpmMhTb1+BijQPqK9GhBvdA6uN40I0DEttTL0u+C
ukl4BtJsHO1DaDohHTkcMU7cY1PWD5qZUv3t9GCRXHFvaj/WvKpGTGdRNnkMNNk6
idQElCzqDil6n/FWprCY9c3AtnY8r/0SA7NJwkNQva0ZPZTfSrVw8RDWL1kfdAB+
aAkl8atX8sLQg/1wVJMTvkII38m5eV7j6fh3SBshjekLI7mrp/Apj6lUrBqdFxiK
7yVdcm1jcU2jxAJs8+mCjkww7aLm7I5psFTJwQesVaqYY3DGdQKLP8lVUMXKfVvf
smM8eJBH9czd2+qTwRbIfRplNdv7eTnsB1rVmhd1dHCjCBhEhCE=
=NruZ
-----END PGP SIGNATURE-----

--Pr/xG0N5hjEm8e2K--

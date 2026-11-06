Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967423;
	b=zaTbuo3PyZj/19OciQE1wjScH7oVrnWARWfqBUr+jVNkfMhQDW03um4bEafSViP+NYiP
	 1PvGBn7JuNUQ3hesZiwp4t6JUGkNBC+R5LraHqUBHCcmz3DIJKZ1H3M3ZW6vrKCigCH8K
	 CRCpIiZ8vSGtI9gUDaG463SZ2OyNWRmeLx1ZbKpm1BbjAKh6BS5SoAODydqGjuIXmsb/w
	 CjpHvSfn8ctYIr32OfcM/8juAyUWa2IRwg8CWBBKTYrnHRsp+AbdovDU0TLOZquDbPxWY
	 XrYgz4Vp+A/dtNSCjLtE8MckygahdiddbTolJ2XuEqYtZ5E+V1xDBcThwjVSAyxGWdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967423;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=qY6gJVpnqzaFUgwjIu2dVr9hWygwHG5TJQGq73qznUc=;
	b=hTJTE5Qr6Uapk1dQJ45nGgF31DpRc7RHqjJIPGoRah1U5lZBvsbu6RoSQa3G1rEm5dT5
	 oaNLhP+wmS/q57nycZ31luodwyZ4nAScYBhdDaUOdbGFKcW/6MIz7y4YXyMeje+GD+A55
	 24rU1tBR5pY1fSDEsj8XF5tdRBKoF1rOrD/5broLVLokX+uGUjZpZQrnDL/aW7HktstaQ
	 KTvC5jIlwMb0ffnmeJt9lJ0X8y0Y8+7a8OqzXz9FqbjJ1wth5U/RRb2xot16FPFFJl3nd
	 OOdHoyycw810i6fjkBN6hPLFRszPpwwXakCzKl3ZoJvE1A4UmlJExMLrn/CvAHQDzFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QimY5JAa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B28B606A329
	for <tools@linux.kernel.org>; Fri,  6 Nov 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QimY5JAa
Received: by smtp.kernel.org (Postfix)
	id EC3D61F008A1; Fri,  6 Nov 2026 12:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F671F0089F;
	Fri,  6 Nov 2026 12:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967422;
	bh=qY6gJVpnqzaFUgwjIu2dVr9hWygwHG5TJQGq73qznUc=;
	h=Date:From:To:Cc:Subject;
	b=QimY5JAaDgaqAgx1Oxhp1JHsTNyNINaJPTwSKW1lAIYKDTE/CCPi2E+td387za4oj
	 PWoYnDoNh7wJ8UGog554awYbeBozY7A1T1jv0ap2EpRqJqgKfOekRy+Bh4IO3pFjmM
	 FrYEC5hw9eZaYvIkz1fV59ccQFxiCdgMq6NdKs6EnKoCUaD2fz0itBDlbSvCDjemyX
	 OPttFndReXw98VLkXKa3wxfxphD9Z0y8t9rQRXiR9INFaCPOhtXzIYUFVUCXqM7wZ4
	 sI0W2u1mCen4cwO+iBpXO4KLRQQVi/Rhtw+u4CNjZBe+fOozMrwXAoewQjSbZJNEYD
	 aVSlNwrqEP4mQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 772262806315; Fri, 06 Nov 2026 12:16:54 +0000 (GMT)
Date: Fri, 6 Nov 2026 12:16:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: lei getting stuck in maintainer-container
Message-ID: <e03267c4-eb39-498f-9a4d-1c0dfb562672@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tGTt9YdqI4Ed4x5X"
Content-Disposition: inline
X-Cookie: Whoever dies with the most toys wins.


--tGTt9YdqI4Ed4x5X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I keep finding that lei has got stuck apparently unrecoverably inside
maintainer-container.  It looks like some network operations which
should have timeouts don't, or error codes from network connections
being dropped don't result in things being failed, but I've not managed
to isolate a specific problem.  When this happens I have to manually
kill lei in order to get syncs to restart.  The hangs can last over a
day (eg, I just killed processes started over a week ago).  Obviously
lei should do better here, but perhaps it'd also make sense to have a
watchdog in maintainer-container that restarts things if they are
unreasonably slow.

Thanks,
Mark

--tGTt9YdqI4Ed4x5X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3FNgAKCRAv73Ows9A4
iU0pAP94pcduYy921hu3fwZunxFqk6LMcHL+7yLrBIenm6nAIQD/b256+9hIk2KR
UaJ0cpGn76gv7tWjevhtPADQFtymtAI=
=R8W3
-----END PGP SIGNATURE-----

--tGTt9YdqI4Ed4x5X--

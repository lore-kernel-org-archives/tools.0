Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FCD3A450A
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741386; cv=pass; b=LftZHpqV+03l9id1Jo4lgUu8dOaSH3XDeXgRWqoz5OOf5m0oFUY4ccXKxWi5Gx5axrs/d6PNHr5myx/+0YiLiQNtmsXWUFT9DBHRTYcWj8tJ3gJFY4hMZwLfd/hJ5v0uLJ9NXLc9iJR8QNbnEvI88Pt1+1SZ58qAny9xvpOI/8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741386; c=relaxed/simple;
	bh=SW6m/+fbZzEUMALH1M0AtitWu1jPDUgYioDIJecJbBA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sd02/n+Ce4MrhMCrHVFQKs69MWY/UIL8CwmkOyi8VkU2aC6Ed8Yl2pO5PL1w8Vjn98couLq76Uc2IpsUAp6NyfC/ERlYhucEnczQfXmRS2/UlT5LhxC4QPA1iGQzeXflE35iD2l36/WpyyqPH5Tzzi5x6fkOnol9+CTbhvYmgVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=QHLkALvU; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="QHLkALvU"
Received: by smtp.kernel.org (Postfix)
	id 6D1B01F00898; Fri, 18 Sep 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789741384;
	b=DNCjpkkC+Vn28nTzrtGmhCKYgGbuLc4CgqUofrgfKFbmbVkhUf4C20nqwCMPRljFHe3X
	 kyZCmDnqVbkM191S9owfJ/ZbZ/a70wh9pLyGJ6NK1bQGjZk/WM2xCqzuqPSpvst9OSxF3
	 tj9Lf7ESpGZjclLwmibzzM2R0W8+KfK9TLY7qYf0ycZjf6OifLrSvIUKwNmL8gNDiIPJF
	 C3EPSyB2goNY6PxrGrOn7SqFz0hLRIK5B2k+q3OJ5huz2ZLh7zsniLXVdFvfWsN6xnfCl
	 cwIXhQlo0nySdHPfK/5bUsNTOYiIvZCAHcLKvXPW5PB9AVb8+eI8JcBNZOVmK1Ub7DA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789741384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP;
	bh=SW6m/+fbZzEUMALH1M0AtitWu1jPDUgYioDIJecJbBA=;
	b=QgI4G3awu9ODdaYNKCYcWVznmx3a+/ZzbB2tUiPKegMfNSTHfeIQK4Vw4qNCViI8Fqsc
	 xyDRY+siV6H9PIq9Gpe8LhNkSquB8w5Ib+b4PhKDjOaRDRYGUiRHNfw1/ZY/+1xGqoRHD
	 wYqII9XKgarfH6N3/VeoH1fIsLXJxlKMauueF6p3noG6X5Q8DcTFyEXJ/4e1I6nVRfjwp
	 ZHZuL/lVy7nSCaegqBkw9OfHwx13t7JuLoZAMHyR9GznEwPBP2iNA2XYW69Oz0DtjCMZI
	 kjurgPlFjPIM243Qhiblp1Mg5g/HQnH12mOIG67h+2+tceAB4ODeK27ZWZ4JnDxsbFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=QHLkALvU;
	dmarc=pass header.from=posteo.de;
	spf=pass smtp.mailfrom=posteo.de;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E5061F000FF
	for <tools@kernel.org>; Fri, 18 Sep 2026 14:23:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=QHLkALvU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1E5061F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C1D64240101
	for <tools@kernel.org>; Fri, 18 Sep 2026 16:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1789741374;
	bh=SW6m/+fbZzEUMALH1M0AtitWu1jPDUgYioDIJecJbBA=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=QHLkALvUydY9SIcvegulm5flYzV1wnxRtE/0mCS4LG2mUqqFNizDr8AnlWoRifsy5
	 bYAVOBf2EIjwMvJd6ivAme72LBXSUX91V8UEmzRiAd72bvnt+vw8Qqx3vGiixPLcbp
	 BGw/pa3694zKYBFLDydla2rx6lDA/vmDRnTibgRcFudcL8bCebb8+EXb5X+bT/4zLw
	 2ZMj4wg75s5AS+UJQTlOVSjGD7hnBZ6cKAT94ENR2fyoQi3YsDGbO4DMR3ShCtqgPv
	 0kRPA/8sobDKQeCnySk34u08dWvkvrcrwQ398VSUuZaYI+P1bPoNSOvLEqAoZ+vhH5
	 wUBGNouN5IkpQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hmZbL146Xz6v0R;
	Fri, 18 Sep 2026 16:22:52 +0200 (CEST)
Message-ID: <43355a6f561148409f440dc75b5b90ad628b9611.camel@posteo.de>
Subject: Re: [PATCH b4] prep: keep auto-to-cc trailers before cover
 changelogs
From: Markus Probst <markus.probst@posteo.de>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, "Kernel.org Tools"
	 <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Fri, 18 Sep 2026 14:22:54 +0000
In-Reply-To: <20260628-prep-v1-1-8ac18db0abf3@rsg.ci.i.u-tokyo.ac.jp>
References: <20260628-prep-v1-1-8ac18db0abf3@rsg.ci.i.u-tokyo.ac.jp>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7gAgxMSiKvrJcbE+omKD"
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-7gAgxMSiKvrJcbE+omKD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-06-28 at 15:03 +0900, Akihiko Odaki wrote:
> After get_body_parts() stopped splitting free-form messages on every
> "---" line, prep --auto-to-cc no longer saw existing cover trailers
> when they were followed by the generated changelog block. That made it
> append duplicate To:/Cc: trailers below the changelog.
>=20
> Teach auto-to-cc to collect existing cover recipients with the same
> broad trailer scan used by the send path. Then let fix_trailers()
> treat the cover's "---" line as a separator even when the cover has no
> diff, so new To:/Cc: trailers are inserted before the changelog instead
> of being appended below it.
>=20
> Add a regression test for a rerolled cover whose existing To: trailer is
> above "Changes in v2:".
>=20
> Closes: https://github.com/mricon/b4/issues/78
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> Assisted-by: Codex gpt-5.5

Tested-by: Markus Probst <markus.probst@posteo.de>

(on Gentoo, net-mail/b4 as user patch)

Thanks
- Markus Probst

--=-7gAgxMSiKvrJcbE+omKD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmqtSTYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPS54cQAJzo9pRZ4INlb1e94hWo
bBeIedxEpI1DJ6YpylDYHafDAYx2JSu5ISoGr2Gj8cI8XGzfAWWgBzIUZQ0qLzK0
EX3vTryTFUS+xWiDEW9PX/cborpyNV95IfitFpi9eR5HSfOmeX4+Aq6lcZFVVcY9
JdgGnu1Y5bPxrWsqlOJfE3nvNIjnnKaSYfprM1xbFFUP30DL+7a7fpMQpK9Yucev
PIS76s48+sviKHmT+evStK5QZsFM0ZDH7jyfLC6P/+pwBCSu/8RZMg5lj5oQWS1M
oJpARIwLpoHzwZ+g99OMu+ZqccYr98idvZwg8cGGVm9QomripO+/xFiP0T262D2m
nlJ0crzNK+Pnyn5gnn6To+4aiOto8QezniZE6HFXSGLHl1lMuNmGnG+wHUkXbBnY
x4zkIPuTLbmRxcyFjr5xuJj7t4Ang4FZ0LMNBTz04DVNgQUnvw5qYLkupIqtCLT9
kJfK/qbj1Mjbf5ry3eUNimVoabFRS2Xk76Pl307K8MOJrRO1tYRHlF9Gzp3iqlgD
PM5zVP3vwtsTJXNWtah6GaWkJgtS3QVE6jhm2Lof08Yq2MXYQ+bO+jUjrPEe+SnP
pHNXHjdo0oIXSZIfbjdxGzwDT9rayTps6P71t+MtuCuJyRxDZb1/JgibNedchQ0L
UOn6y4AHq7vaqSWkIAFdsfyR
=apLp
-----END PGP SIGNATURE-----

--=-7gAgxMSiKvrJcbE+omKD--

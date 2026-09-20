Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34373439F77
	for <tools@linux.kernel.org>; Sun, 20 Sep 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907241; cv=pass; b=C4sBcmyNMbz+ShCiPAV2tZELERKKfgsekKY7hjqDTdiUgVmVz2PiAt4eO/iyuAiZ7nhpGQTEev+V/SMpCvAk149wJFgdNi9AWw8Cjz7pjqjHwFN9N7MZAHaXl3EdAJaRT//4vu9JM3VahJ+nxw6ir/UWwZ/1gBH8sipa2RHtpJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907241; c=relaxed/simple;
	bh=zl+/RUU0bw+56eOK49MED320fWfgK1N0WeuU/2N6slQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jJBziC5FLuhkAT+xxDeA91JeNyocS6nEipMdt5secYY0IVl2ChDJwoT7t0XuAuiIjR3So8LhYUwTWdXlYHeMzppQpyv3Ks4bD7/M4d/C2vYgDqPTz4opdO3HHNwTBkMss2bHdFTM20W6pWXS4jKnu5ncG5tsCYoW+URa1xWh0Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=KFgEqtd0; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="KFgEqtd0"
Received: by smtp.kernel.org (Postfix)
	id BE17B1F000FF; Sun, 20 Sep 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789907220;
	b=CVPQas2oChvJWe7hJOWhDwPfEvEQAlT3kmjNValZ0Lp6H8xaM3m3+fr4038vvCx2skvD
	 b//jEHdTtn6td2iXG8RXREZKBILq5qAKgmCE69LzX80qnC0/26vnS3UZSQABy6QLd+At2
	 AQJriWNPVXzvyZ2L87wT7FB8+GLLmrA4AIwS/jUu2TNZ4sXdIwd8DW4oYP5VGrH7KXteQ
	 AgSJh7mHNPxoAvVykHI3gjmMoGTDKbPZOOuVpOCGepscHWXpvBKb6yVZnJQpGrCD43lP2
	 h4SMnXuuCxW6QT53y78pLytjVUcC/Irvrt+ZcS7/zN8TzvfuJpsU0L86ryUjmeABfKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP;
	bh=zl+/RUU0bw+56eOK49MED320fWfgK1N0WeuU/2N6slQ=;
	b=flYcRuRDhYLA3kQ3lfl+Fmzl6FVOtXd5NKGEpNTnEh/4ksH7drCbW/BJLfW5DZubVF5N
	 ifixj8LxZTQg9aqzCjBb0dFFrCnAwb2hg6hu/oLMsNUPVdp9jhekx2BrWSvDAq+zyTY9A
	 6MbSp4Yw0uJsMlilkwvF9lCMxtBAXLxTsQp6WP1Ypn3NrGjgDDh0dtEI+d1VPBFwPohm/
	 T9TNzuNKnSRHoiHs2cJyeXujOTeNUtx1BfjuGdngmp7P2bfaV1ZcY+BjMzzmUu+H7AbGU
	 1a4fDBNAIu988u2gUAlozkq2Dy9uRvemiv+m/hoe/iyxg+ZXTPz4Iv3msJDabP7/gAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=KFgEqtd0;
	dmarc=pass header.from=posteo.de;
	spf=pass smtp.mailfrom=posteo.de;
	arc=none smtp.remote-ip=185.67.36.65
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0F141F00898
	for <tools@kernel.org>; Sun, 20 Sep 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=KFgEqtd0
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D0F141F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id DE58C240029
	for <tools@kernel.org>; Sun, 20 Sep 2026 14:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1789907210;
	bh=zl+/RUU0bw+56eOK49MED320fWfgK1N0WeuU/2N6slQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=KFgEqtd0Rf+djl/VUk5jqbu5FcQby0Riybqx9ZfHat9fVNgCNnBzf02iQQ9o3Aua2
	 r7bvzM4GhNN6thQXmwdwS0rtazjQPwVeka/eD698lzKpgBRpskJRI1IZGT/MG5B8vE
	 fyOoMml20nmMqV5ppFk6YFo98wLfj9K804gvEhLWN645DMeaO04SvsEJeUBvdHo6wh
	 kJKiLWlJEfkxa/2aKWKnHk+l6HGCSkyyVfpIgY8q0gJ00HJZYdLwwqEbINGAdExTEk
	 60eKTcR6etKvyH5FQOoyNp2SibQbEObR5T3ngu1S0FY0suusTR7YCpAKmlDkLRSgsD
	 Qajvzp2sXPgsQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hnlwS5ZWXz9rxF;
	Sun, 20 Sep 2026 14:26:48 +0200 (CEST)
Message-ID: <0c57c5d6ed9b484616ecb0c76be06d2cb5b99a42.camel@posteo.de>
Subject: Re: [PATCH b4] prep: preserve recipients above cover changelogs
From: Markus Probst <markus.probst@posteo.de>
To: Tamir Duberstein <tamird@kernel.org>, "Kernel.org Tools"
 <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Akihiko Odaki
	 <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 12:26:50 +0000
In-Reply-To: <20260918-fix-cover-recipient-parsing-v1-1-5ccbbb572736@kernel.org>
References: 
	<20260918-fix-cover-recipient-parsing-v1-1-5ccbbb572736@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iJnFdRgot5LXPvtjp4mU"
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-iJnFdRgot5LXPvtjp4mU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-09-18 at 15:14 -0400, Tamir Duberstein wrote:
> When a cover has a changelog below "---", prep --auto-to-cc misses its
> existing To/Cc trailers and appends duplicate addresses after the notes.
> New recipients are also placed there, where the preflight recipient
> check does not find them after the cover's diffstat is generated.
>=20
> bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
> limited separator parsing to bodies containing a diff or diffstat. Raw
> cover letters contain neither, so their trailers are treated as prose
> when a changelog follows them.
>=20
> Allow callers to explicitly request separator parsing. Use that context
> when collecting and updating cover trailers, extracting destinations,
> and folding a cover into a single patch. Retain automatic diff detection
> for other messages so free-form replies keep text after visual
> separators.
>=20
> Add regression coverage for raw covers, repeated recipient updates, and
> separator text in replies.
>=20
> Fixes: bf7beca19f72 ("mbox: don't split on '---' in free-form reply messa=
ges")
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> Assisted-by: LLM
> ---
> This surfaced while preparing a patatt reroll: --auto-to-cc appended
> recipients below the changelog, and b4 send still reported that
> --auto-to-cc needed to run.
> ---
This seems to be a duplicate of
https://lore.kernel.org/tools/20260628-prep-v1-1-8ac18db0abf3@rsg.ci.i.u-to=
kyo.ac.jp/.

Also I reported this issue prior on Github here
https://github.com/mricon/b4/issues/78 .
So kindly add a Closes and Reported-By tag.

Thanks
- Markus Probst

--=-iJnFdRgot5LXPvtjp4mU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmqv0QgbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSnxsP/1XWsMAObVCNwgtek7Ba
6V8SnEK3pLFY0Az52blpBr0X9UHGWa6dkL3Pbbm/SijnTvK6UFSlA9o2Wd4ykZZ0
s+tKEQKcHPI9yWHBjKydgiqUCRddDsU7xkk3/ior1oD5DtuKKtUUG5XuOwWrMCJV
g+OdTo1KOQnaGj6LdgmPzS5o3CwaCXKb0PGspLCEo26DtYn5RZrmsdvfj13TVHr4
4ssxrO+vFEFOaIEBqY58BaQJ9TYPjQ5qVq592ktO1Cs70OM8dKCuwhsNlLOJ5bEg
hpxFh571zDjtvR+rgB8Ph0dQRhOJbZPeY35MsVRQE3nNZQei2dGb2cxUBVG9sQP/
kC3Zyt/TnwshuGiTiKIAMXk+kBceUo/AE3fkgzTewk7dB9E/TlLBXy/v3/I+aPfl
lFpJtun6T7LAK38LQ4Xp2S93RjKMlMc63afJXXUWsbsDmW0LkR7J0loFVtVJWYfy
42mrEVDcDll+kz9miIdV4n0bUziW7G20mLUqaBd+E5wwUzJMvopDk9qOynOnJ+YY
IR3wUN9+lVw2D3yGQNzbJ3JX+6uoQ31dVqSR6++Wo9eUBXBStyekb3Q15CuwXeFF
0ETBq3cRmzcNtczlYs8HtSak4reWncsA2dQcuaF4clYvfoOtWn1FQuTQKIz7Rrt7
X3/RDsLUBhPE41Oso1Q9xFWL
=TM5A
-----END PGP SIGNATURE-----

--=-iJnFdRgot5LXPvtjp4mU--

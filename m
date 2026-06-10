Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E820930E851
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 02:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781059763; cv=pass; b=WgtXEfaIyOpoY7AU55EQbD+9mwfWT8jTPgqo4YiLjrDs8VGtQMvbRfdQuKYF4nvA5wL6Z7J0cnCCC67vpGJU8aISvygxAU7YCeko90d2hG2Ir62D4ynBaOeNZLnYEp7oUkw45/IzJB+LWXQcYrK71ROm5NMiSg6U1t4meIA/Kvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781059763; c=relaxed/simple;
	bh=8qmF3S+ndB3s8mrSe24KrewpVZSyR0vLRKBsq+tFYug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mwxdvSLVO7bmn1TSEal8caglSZ9aK0HE39Qc35jjY0Y901Fz5s6paQrUuECUXA6LhibwITWZn43fzdbz7TAn6kbQLSqf6QtcEgwXwS8X/FOkGE1F0HZSUlhLXhQ08/nOqvam5uuqm06mUB/LPU4JI/tdx/AY0iwlXtEa4oNwSJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=b4vgwGXl; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="b4vgwGXl"
Received: by smtp.kernel.org (Postfix)
	id A16B11F00899; Wed, 10 Jun 2026 02:49:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781059761;
	b=DxZShwQT2Y4FM1xocAReI3CNgVGs8ojzzCjVaFpUc9kj5HhEnbXR9GUZbTre14QHz2r8
	 JSFf0/v/aR2yjk2FBAd3QTFh5Y6RdzYwzXLQPYWlnnrdFjXHg3LszxvpExpl1b4Nh/liF
	 eSL72Aedwmh7SZIH/oeoZ40VspTZ15HH+yaPIqKmRb7h5Dswmbfh0kdUK4R/Rt/1S3I1P
	 rraPJ+/MqwfTNP1NCqDhloDRTbiLlPly8cZ6IzPI4bQBhQBdU7tJFgvIm1GJUbKuj7bJl
	 csC/nbKX3QyzVLS89k0w+7yM0OfGIbYovq6KjbGEUWEHRDdlBqOA3qpo+g3yfdLsPvQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781059761;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=0+yiNYtcCNsSAbHyBsbgk74mKoBbM8lnsE8VMS3tWA4=;
	b=ke3xTkh+lt/zXjmi61OPG7FxRZMSYyP/WnH9cYCyZu7hDdIS74dUbQVzoUQKyIt/5dwZ
	 9WwngO7vkSwthwPNKui2PYokPMj1+8IUjPy5DPz7S1ysVIcYuZxyXsYD1YjtwLVox+Xaw
	 pB92tRYXievKiT8W8t5I7htnJQt1IA8RsTz0s2OouKQwXmcLD5izS7FnF5gGrf/tSm1zq
	 C4cCJJey3GH8TByhMEy0Qs0wTTydLa8K2yu2n/v6jtngdegpTlHOKS/nQGdhZMj//LDej
	 NQE8ul06E9900y9ZK21IX4Aiyjzw0Rl0Vje8PTVeIHnhCcmF33cT0oM5OeqOZ/bT8zw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b4vgwGXl;
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C23F1F00893
	for <tools@kernel.org>; Wed, 10 Jun 2026 02:49:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b4vgwGXl
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8C23F1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781059752;
	bh=0+yiNYtcCNsSAbHyBsbgk74mKoBbM8lnsE8VMS3tWA4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b4vgwGXlbbPnJBKIZYMJOQyEWzUnDKy4yxAjORxR8ix4H80vhH02+VJ48XsvadLoZ
	 RSPlvLCK9VZO6reMS6nJ6Ka3M3Bil1gqqnmk+yy+uhvDelsdhBW/xLj4ncE7VklOKv
	 CgS9+drRVKELhfuBaItyLXddBhgnLw9mOWURo15d9Df0FExECbP/y4MJrerram7KQj
	 043CtK4/XPAR58hFn61sll4h4vHoakBVZoEudiX2aHhyoFbC1j6NVTAgGsrI/jhu7R
	 3UiFXxgHAUOo7C6ybOrrBZj+uvuEr/utAvSRI6qK5ciPZrQ9TFN3L+cbcOhiU6Clpk
	 WZEb5QCRzLHQQ==
Received: from [192.168.72.161] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1387560A12;
	Wed, 10 Jun 2026 10:49:11 +0800 (AWST)
Message-ID: <f7e99f980881f79702491c1440fd282f17f85b19.camel@codeconstruct.com.au>
Subject: Re: [PATCH b4] config: add send-me-too configuration
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Date: Wed, 10 Jun 2026 10:49:11 +0800
In-Reply-To: <178105896854.172387.14154860070343570175.b4-review@b4>
References: <20260429-master-v1-1-f5052d8b7f9b@codeconstruct.com.au>
	 <178105896854.172387.14154860070343570175.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

Hi Konstantin,

Thanks for the review!

> > diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
> > index ba18ef5..5769cd7 100644
> > --- a/docs/contributor/send.rst
> > +++ b/docs/contributor/send.rst
> > @@ -321,7 +321,9 @@ Command line flags
> > =C2=A0=C2=A0 :ref:`contributor_settings`).
> > =C2=A0
> > =C2=A0``--not-me-too``
> > -=C2=A0 Removes your own email address from the recipients.
> > +=C2=A0 Removes your own email address from the recipients. This can be=
 set in the
> > +=C2=A0 configuration using the :term:`b4.send-me-too`, setting to `no`=
. (see
> > +=C2=A0 :ref:`contributor_settings`).
>=20
> Small nit -- you probably wanted to use ``no`` here, not `no` (trips me=
=20
> up all the time, too).

Ack, fixed, and reflowed to 72.

> > diff --git a/src/b4/ez.py b/src/b4/ez.py
> > index 3e81138..39168e6 100644
> > --- a/src/b4/ez.py
> > +++ b/src/b4/ez.py
> > @@ -2252,7 +2252,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None=
:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ccdests.append(btr.addr)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 excludes =3D b4.get_ex=
cluded_addrs()
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if cmdargs.not_me_too:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conf_me_too =3D config.get(=
'send-me-too').lower()
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if cmdargs.not_me_too or co=
nf_me_too in {'no', 'n', 'false'}:
>=20
> Safer to do:
>=20
> =C2=A0 conf_me_too =3D str(config.get('send-me-too', 'yes')).lower()
>=20
> Also, I believe, mypy won't yell at you then. :)

I'm up for less yelling. My original addition did introduce a warning:

  src/b4/ez.py:2256: error: Item "List[str]" of "Union[str, List[str], None=
]" has no attribute "lower"  [union-attr]
  src/b4/ez.py:2256: error: Item "None" of "Union[str, List[str], None]" ha=
s no attribute "lower"  [union-attr]

Which the str() does address.

v2 coming shortly.

Cheers,


Jeremy

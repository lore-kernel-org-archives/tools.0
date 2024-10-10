Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DB19CC08
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580346; cv=none; b=L7yz9m6hu39C5qwjlH65Bqg5kiLO91h2qn5oaeeraz7B34X/COmrb0zA06bC7KlH1tTk7TE81eJxC+t1sfY/JZ4AntGBbuL18kToCjLfUhMatKEK6ySM/nQvbFY4v1pOVJ/iYfMatAemhWN4So8HOPYvnq0pVQO2ji6gMm2KVEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580346; c=relaxed/simple;
	bh=JYWVeP8/6Ut2pdkUKfJwEu3KQRV/3xYyQECOzOX2leg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sNZ9mBZIdPlEicYA3P4efri/5AKTjhI5fh0djAyUoxzwpL5YUJ+TqHmndwJ/o3shrhBxg/x/raZFrbxEuCDYC2FgY1oyFqVwgynlGr1G9tsGLtMkPTPiTD4OJImR/drqZ0oTG62LcuZXEvYjlg7cUhISntKE3FKrjwYsib8Q0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=csGewimH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="csGewimH"
Received: by smtp.kernel.org (Postfix)
	id 84803C4CECE; Thu, 10 Oct 2024 17:12:25 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE5BBC4CEC5
	for <tools@kernel.org>; Thu, 10 Oct 2024 17:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE5BBC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1728580336; x=1728839536;
	bh=NbgjT+uR1OSQKVIN9D3wUDjw3MCWMEqilaJkib7asck=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=csGewimHOoh5tJK8vBr1vZpDv2DuYly494SHyKobVqz0LtAiXMqyxzMt6Gxab2ZOq
	 miiSXbxpqsm5YfF9531nYUxph/Abg+JeAb67MPmECRkoxsFb2a1bOB5dvUa9KeuPlG
	 J00UeBiU7xcVeOhoG4kfTVdDJn4dRcA4m/kjB7lr8wnlNwC+4M5fsMrN5pV0CDGKLM
	 4j8Vv58QCtmOtympzsTgWPcPYsAig2oYolr6EcpYzDp0R0CPLFhT9Plj5CfjpCnqfG
	 YSBkKOFFBIN/HxTfJRjmlz/CL93YRZdSfEK7c+Y+so4A0xailiVuioCrPhFRrd97sK
	 nzcVAagBAqqcA==
Date: Thu, 10 Oct 2024 17:12:11 +0000
To: brandon.maier@collins.com
From: cdwhite3@pm.me
Cc: tools@kernel.org
Subject: Re: [PATCH b4] b4: support optional shell completion
Message-ID: <17fd26a64c611f64.779eeb9e361f5655.8f7af20c5282c140@lt-cwhi-0222>
Feedback-ID: 31210263:user:proton
X-Pm-Message-ID: da5d3bdaa17ed9447b74001b5344a2c30f591100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------0b71b9ab665550a3a6aa752c5a9fe58cbf102d795218c6856e4de2a403e562d3"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------0b71b9ab665550a3a6aa752c5a9fe58cbf102d795218c6856e4de2a403e562d3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: <cdwhite3@pm.me>
To: <brandon.maier@collins.com>
In-Reply-To: <20241009-pypi-completion-v1-1-94f50a157c56@collins.com>
Cc: <emil.l.velikov@gmail.com>
Cc: <konstantin@linuxfoundation.org>
Cc: <tools@kernel.org>
Subject: Re: [PATCH b4] b4: support optional shell completion
Message-ID: <17fd26a64c611f64.779eeb9e361f5655.8f7af20c5282c140@lt-cwhi-0222>
Date: Thu, 10 Oct 2024 17:12:07 +0000

> Many tools support this by having a command line flag that can generate
> the completion scripts. In the original version of the shell completion
> by Emil Velikov this was supported with `b4 --print-completion bash`,
> but it was decided against to avoid bringing in more dependencies[2].

I would recommend using a `completion` command instead of
`--print-completion` to generate the completion scripts. E.g.,=20

    b4 completion bash

This is a more common pattern and is used by many other tools.

> +Shell completion is provided by the command ``b4 --print-completion
> +{bash,zsh,tcsh}``. To enable shell completion run::
> +
> +    eval $(b4 --print-completion bash)
> +
> +To make it permanent on new shells, add that command to your ``$HOME/.ba=
shrc``
> +or ``$HOME/.zshrc``.

While this works, the more common pattern is to echo the output to a
completion directory which is auto sourced, for example (bash):

For global installation:
    b4 completion bash > /etc/bash_completion.d/b4

For user installation:
    mkdir -p ~/.local/share/bash-completion/completions
    b4 completion bash > ~/.local/share/bash-completion/completions/b4

Best,


--------0b71b9ab665550a3a6aa752c5a9fe58cbf102d795218c6856e4de2a403e562d3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBzBAEBCAAnBQJnCArrCRAy5Kywm9vL4hYhBE+hHqFr3OG0O+P29TLkrLCb
28viAABE1Af9Fhsua0MEfepINBaRgq2Xa2S5AhvC90c4W2jDJbj6IBtcqHU6
Ft3ZmeL9at+JmMozdtyddpz99mjrBJ2n8Kh6M9dsufvWZUf8BMcRhg9jlKJy
7ostIsu1UcnpsH1Jdbni09A2BhOv1FPnmzS96hUHDmbELUb+j1FeCtXkOyz5
wPsz1WCFQOdT0cWgpl392Hrn3Le37Xz05D53TDLJfLjd52meL/hqkdLJ3gh6
ufCl1CClvL+xCEeQn7dhMsqSo6lnCv4Kvr6Aa6iHpILemI3h9oFgbdTF11fs
e5miFdy8QWN7godb6QB5A9D+nAqeHqUEaPZp/O/a4zSt5S6d12G+cg==
=HPCp
-----END PGP SIGNATURE-----


--------0b71b9ab665550a3a6aa752c5a9fe58cbf102d795218c6856e4de2a403e562d3--


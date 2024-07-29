Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3B7D3F1
	for <tools@linux.kernel.org>; Mon, 29 Jul 2024 21:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288775; cv=none; b=iZNWgFlfCV5TzJOoY3b4WWwybAU4TUaPdUFn4qlSyPCx4cLe92W9RtZ92xziqsOoZio9q4tEuudaUM87bKNgNmpKhOpk6RNhryZO2a/jXWgFVyyjOjBUU6SwBNKPhWpbc+SDNLMlVHl47y/tk6asDg3KXMSUk/HbhhsskMc4/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288775; c=relaxed/simple;
	bh=8eHMVg6fVCfqTUq+vD+2+i8k4ymDzTz8YJWyhMLFAyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FiKzjuGZoPI2m7DTG30fObYWfZEDTCeSZtv/H5qYyp3Q7CUPRlzTQQfOJJmHTbnlKVJ9nAHut3tnWemPzsNeJPtijlSP2ajB4+h7aZbXQ8uhTHDcT7+uW6KjP5aZs19KYLwOQc6fHxIISxlRUzsnmDlEeo2ygZB0D0SEcAIh+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 32D39C4AF0E; Mon, 29 Jul 2024 21:32:55 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0016AC32786
	for <tools@kernel.org>; Mon, 29 Jul 2024 21:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0016AC32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=skole.hr
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id D5E9C81ACC;
	Mon, 29 Jul 2024 23:32:41 +0200 (CEST)
From: Duje =?utf-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: Can't reauthorize with endpoint using new GPG key
Date: Mon, 29 Jul 2024 23:32:10 +0200
Message-ID: <4608818.LvFx2qVVIh@radijator>
In-Reply-To: <20240729-macaque-of-inspiring-recreation-9e5c4b@lemur>
References:
 <5827210.DvuYhMxLoT@radijator>
 <20240729-macaque-of-inspiring-recreation-9e5c4b@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=duje.mihanovic@skole.hr;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBG3/QdYN8x
 S1t2umMK0xk1JFj60DBQJmiSHOAhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJEK0xk1JFj60D1GABAJVSorZdMOlrp/oQtCSH/G53NE56x/JHA8VX+ZQBd/H3AP4/EcUf6eef
 DUxVMh2bdkmuQKsVZGgOGiXpMksrVntWBrQpRHVqZSBNaWhhbm92acSHIDxkdWplLm1paGFub3Z
 pY0Bza29sZS5ocj6ImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSH/AhsDBQkJZg
 GABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw8A/i4lPOL7NaYoYePDq
 l8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xqh2MRcNmJCHA1YhWAbg4
 BGaJIc4SCisGAQQBl1UBBQEBB0DEc9JeA55OlZfWKgvmRgw6a/EpBQ8mDl6nQTBmnd1XHAMBCAe
 IfgQYFgoAJhYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSHOAhsMBQkJZgGAAAoJEK0xk1JFj6
 0DG5MA/iuo4l2GDEZ1Zf+XaS//8FwdXDO9nHkfbV2MHjF4NZXwAQDroMzBdMcqVvc8GABFlTTgG
 j7KrRDz2HwWNyF8ZeprAQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, July 29, 2024 11:19:44=E2=80=AFPM GMT+2 Konstantin Ryabitsev wro=
te:
> Your best bet is to define your new key as a different selector.
> Add the following to your ~/.gitconfig:
>=20
>     [patatt]
>     signingkey =3D openpgp:YOURNEWKEYID
>     selector =3D 20240729
>=20
> For example, for me:
>=20
>     [patatt]
>     signingkey =3D openpgp:E63EDCA9329DD07E
>     selector =3D 20240729
>=20
> This should let you register your new key with the web endpoint. You can=
=20
make
> selector anything else, including your keyid, it just needs to be defined=
 so
> it's not "default".

Worked, thanks!

> Sorry for the lack of documentation on this.

I suppose I could send a patch to document this if I get around to writing=
=20
one?

=2D-=20
Duje




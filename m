Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D24235C01
	for <tools@linux.kernel.org>; Sun, 14 Jun 2026 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461281; cv=pass; b=MQ12q65VzU/HxuGJimxodE1smJGtmMD6diwNaLkQFQ+n0+N6iBxrE6RNmoKBak04kXAgNfskCod77om7f7oNJ4HK3WfJ4X/SMn9OhdTaeyYlQy/T827G1ExcRbqitg62/hXnoECzMse8eneOQQjJlvNA3apIAkeh0vk/0Hvk464=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461281; c=relaxed/simple;
	bh=UPi/jh0kkVsy+awybJkCLPDCYmYV7V+aHy422SarXnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USiU7EiJjwwTyCltdeUpF12EHsOvmD0yfB7Sx758pQTtDgTe4rE8G0V9cCalur543CuSDFoSXQjJ81QKPOgW/OY7qflsOlB2KXGPCd+h7kklkdwqGCrfpGYUDHnrBruoPZidkAtVw3XgL9iv3gkbFNBhFckSm9rNvRFvB0D9vKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5nqQFMm; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5nqQFMm"
Received: by smtp.kernel.org (Postfix)
	id 7C38A1F00A3A; Sun, 14 Jun 2026 18:21:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781461280;
	b=Jhp2GAZn9d/FqnZVa6TXVp9Am1f3dj4Stv1d0aRk65jc+W92h4rBi9hEozhqFtFlyLM2
	 Hr0i39BdOzPcw2WBpaaNmM4V2V1BkIGXqBf5bfofkRam7eNIwl01/6pLhmMVPP+YVA/VT
	 N8Q8ByqQ5vu1M0XlwRrt7jTK9I7Fb4AMZKrKB2dHUVx9XWuQBIg3BUkE8CPICmg1z+vnl
	 gjzYyT07M4G1rI8FB1fP83KAaRhBMoNPJfK3t3YNXID6XnRtToQx2TeCPRzgENyPUaPcV
	 U7Mbb+PBg+IaGszutrtTE+Szic/J2cLfoR7sCOy+hgsJS7TsTkpN1HM2aLf58ut1Zaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781461280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type;
	bh=RORIJbLuesgIhSoJ5Q4dppMxHh/Z0dXsuuvKVA7OKfY=;
	b=0YSQuYbr+Qw8FTbdmV/KLutwpAvnOCt53s0vb+Aq/MD1NVQZgad+AZlrUCX6PqfNeFBm
	 KbIsXtdzp+ciI/ZXG9QAdEm6BCmvZa2rrXRsu5iEDXn24WekiOlq8Fl7WMftPYqyMj4Ib
	 7R58T5RHrqawQ56goM2Psx8HRC5exrHVuDtuex6NJGZ5X+8MacyeHo2twiauJIZyrLs9j
	 eujNHH2W1qkenC8Tesmz43i21ydJKJzSFlIOc23eA2D7o63k5Du2TvqN/4UBSx96TgQrn
	 iahtowd5dGeEXDseyo1Dktd2kKl8Rj4YRIn2dtZspmyJuvkVwZOPGQ6Q2aWk9jGYADA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C5nqQFMm;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EAC491F000E9
	for <tools@kernel.org>; Sun, 14 Jun 2026 18:21:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C5nqQFMm
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EAC491F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso1653228e0c.2
        for <tools@kernel.org>; Sun, 14 Jun 2026 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461279; x=1782066079; darn=kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RORIJbLuesgIhSoJ5Q4dppMxHh/Z0dXsuuvKVA7OKfY=;
        b=C5nqQFMmGme35jCifLtfxjkSyiyVjP90NcodJ130GD69RIaR+VJLFKR1CaRbfabssv
         zEInBH3Fhext7nG59+2xPXzA4CmajJD0eGigpRlDZW/bySVN3yl3ApwslxbgH2359coj
         DKh4zIb8+46aSzjqFs4z+/RseVOq0zOCnCvAYP2+0LQkt4G94HD/oia4S8ehZ8HZFEkx
         4hox1tCDZhex5mCdKZy2AoeX1fPD1Br97JGzF0ORvrvWpo6Nsa/X2jcrOyRrxd9e+QDk
         D8urNo3+HYZj4/xALKNSDyADp+28JmPHSQsU2+yH0VAv1ATrqPoDD/ghNaG8Z75iAPoO
         DXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461279; x=1782066079;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RORIJbLuesgIhSoJ5Q4dppMxHh/Z0dXsuuvKVA7OKfY=;
        b=GrABCt3NzwQrZbsF91BKbrD5TtMrsqVfyoLTZhHJtjyI3Q8sfgMkoGa9XoUDLJjbp3
         xlGheMO0OkHtRJa3+osxuW3XhyBn0tIzI4GiVZIps+PNyE1t5LV2QtuskHkNNECecRJd
         CIAvUYJW5/G1ehUhblVndAiFAbMTz7DUKyXo3ETPSnfOnj+V2Q2iafZYh2D0uQogwv0p
         G7QrKOsS9k/GZRcRbDYuHVevAndAfoLcj/Oeo7voDombalCCLguYRnqRycXdMKnTK3pE
         /bmUx67/vJDUsUmEh/8dRIU8nolqnVvnzzPHuztksFe+QlQbsGDJ7qlIyBXAtZb23hj7
         FZ2g==
X-Gm-Message-State: AOJu0YwQc6RrlXHBu0W9htGu4WjfJWA88NG2aIh7u9t4f3JTwcVg7IRw
	mXXvxjRTxicDE0HYcDVvVYYG+xN9HyJnzN3GM3itcZB4QAH6FS+pXgUlLcgVAOAL
X-Gm-Gg: Acq92OFWaX9UAbzACs+I41Mvf9a3hHj1wtpq6yt3LedhPWubdvDTgfybmt6z9AkAFTB
	1y4zf4vHP32Z7egGCOxc1RLeYf1YqQ+Y4yKyCTVCUn4dUslEVORnJNtsScO3BP5HEV4FrKJtFBe
	YMMFufVxoz0jg0J3g4VBouzKmJmK3WIeokfxUI/HljpgKDPOkSi8Q/o90LntYJ+hLPxq1avMbfA
	G/Xrf+LO9ie1utfbRI2OilTAMvthvd7wXHlj1T1bfTlhjOLBBPloNn34Xnmq88TXe4l14PIa9Is
	hiTfWk7RGnYDtMJf8Tvb4ujJLuwntP4CmocHlEw8bEJteVa0lcdbTmy2sV+89dc2folv++Ql2Tr
	Vsqz6rqPLU6cNaUIy8ZlQ22a22XOBHR9I3VcAmQAZ3TIG0lAqpTlEZaVRzL9OcyHS05ruyWqa/S
	iFdiupoy8Z471ZeSi5q9ysRwRq6MKym3fJ8RXHLBELV4VU7tatfxvB6h071c6CYlHQxkPaHl73+
	A==
X-Received: by 2002:a05:6122:2388:b0:5ab:26f:4a42 with SMTP id 71dfb90a1353d-5bb6bdb791amr5863319e0c.0.1781461278806;
        Sun, 14 Jun 2026 11:21:18 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb94f2ee64sm1198338e0c.11.2026.06.14.11.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 11:21:18 -0700 (PDT)
Message-ID: <e3b32690-651a-4224-87f3-ba78757ccac2@gmail.com>
Date: Sun, 14 Jun 2026 15:21:14 -0300
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 v2] ez: avoid duplicate signatures on resend
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com>
 <20260614-unbiased-favorite-marmoset-194aff@lemur>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <20260614-unbiased-favorite-marmoset-194aff@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rpiZwipLu0j00c4uJ3vHws0Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rpiZwipLu0j00c4uJ3vHws0Z
Content-Type: multipart/mixed; boundary="------------K02A60E09lJWt7vFislpg8u8";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <e3b32690-651a-4224-87f3-ba78757ccac2@gmail.com>
Subject: Re: [PATCH b4 v2] ez: avoid duplicate signatures on resend
References: <20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com>
 <20260614-unbiased-favorite-marmoset-194aff@lemur>
In-Reply-To: <20260614-unbiased-favorite-marmoset-194aff@lemur>

--------------K02A60E09lJWt7vFislpg8u8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6/14/26 12:40, Konstantin Ryabitsev wrote:
> On Sat, Jun 13, 2026 at 02:30:03AM -0300, C=C3=A1ssio Gabriel wrote:

>> ---
>> base-commit: 474350a3035537184556061872e9e905b47774ca
>=20
> This is unrelated to the patch, but I did notice that something went st=
rangely
> wrong with this submission. The base-commit line moved up above the bas=
ement
> into the header, and the bottom is truncated:
>=20
> https://lore.kernel.org/tools/20260613-resend-signature-fix-v2-1-ddd560=
f810bc@gmail.com/T/#u
>=20
> I've never seen this happen, so I'd like to understand what may have ca=
used
> this.

This happens when I send a single patch using
my custom 'b4.prep-cover-template':

       	${cover}
	---
	${shortlog}

	${diffstat}
	---
	base-commit: ${base_commit}
	${prerequisites}

And this happens when I send a patch series using
this custom prep-cover + ${signature}[1] --> https://lore.kernel.org/all/=
20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com

And without ${signature} --> https://lore.kernel.org/all/20260612-alsa-ce=
a-channel-allocation-v1-0-b1bcbb6b1051@gmail.com


Note: I took off the signature 'cause I wanted to.I took off the signatur=
e 'cause I wanted to.

--=20
Thanks,
C=C3=A1ssio


--------------K02A60E09lJWt7vFislpg8u8--

--------------rpiZwipLu0j00c4uJ3vHws0Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCai7xGgUDAAAAAAAKCRDQXT8aWv/ug6NN
AP9APjv7Zk3cik3hsGP+nI7JtN6R6i7ci/g+E4mUgnzBrgEAlR7TK20725unQBhRMGmi87eaTrJr
2xmIpIrPHhRWawA=
=R3Um
-----END PGP SIGNATURE-----

--------------rpiZwipLu0j00c4uJ3vHws0Z--

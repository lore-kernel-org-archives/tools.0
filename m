Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A323C09FE
	for <tools@linux.kernel.org>; Tue, 16 Jun 2026 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781576898; cv=pass; b=pFLtH+mhvLjUpflz/7KycBA9rIuaNVApe6wOIzl+yf4OXoDsWGuvkAo4L8YYMm4sZ1HvCwgbWcUsXw3NXUomp0oCc7N/p7I3vK+uTxyP6lHoyBA5xoOMhOz/5NbXWTTcusBRNKkv9Yh/t0E1oswaZwmp1SGsDYwT9OpUTQS7JUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781576898; c=relaxed/simple;
	bh=1SP85uWH3RGpwuulZMKScqOEui8rdaBxOAnvvwomEAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmASRcElSRet5Ohk2UYIqrWfDh2wrrNtjScLZM3cc4Vs3MF91TPE+I/FrtgZp19itiQ/8PB0rehfKabBMxtrpa0S6XhK1zo+JHw1enec36+dgcgS+5LG7kXMKcEYWz6rfFNvQ3upipFfzxsZUm/3iFkIfUE9PbHBvQxDQ7xOw2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFP8hGIb; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFP8hGIb"
Received: by smtp.kernel.org (Postfix)
	id 2EFE71F000E9; Tue, 16 Jun 2026 02:28:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781576897;
	b=PHSFLxp4AGyrORjr6X2VHwySt2YkDAEPaKwvUxqCWvWBETQQlFMHFQ4UIPN8iccfu0dh
	 JHTV3aLqhMYsAJBLaZJhzFCTEuiMx16r5IpmsNq/imJE+qQ3hw9zpcNtGZjBnNyaYBogh
	 qpLUq8cQkQDjicmJUFXufHfOVYgzPpb3laBvNXXmYBilLxgr3p0Mu2AcChSFS35gvYvRF
	 HASFFDlpJlPwT8FCF9HheBwyxTOJNmlHH+1ZTkURAB8DSrIBTAo3Idslwqq9Nt0sRD7f4
	 JGf42F7MfsOy1C3BofXby8O9gTzB3/DTeJk9RG1snUNXtftXwTFcFDlTymWhw4v1f3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781576897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type;
	bh=R+qQg29S8NaR9aaRzWiyhNKdK/dCGHrYF1K0mAnsLR8=;
	b=LhypYEFkpcBvmU84Kwp8ccUU/58stAtz3ggp79inp1YLwYj6CPM9fwJW/ju7bp2a01Fp
	 M5uXdBdyTfV37IMc9TAIXGrOxcYunmolzM98gc5oUYl7e/XOM8Zv3aMktzZfvSpIz8dQ/
	 Xstg22jqoFpm5gpz6Qtvz/QLxFiEZtm66LWJl1NU3egDvwoAymrHmdQSXpfmYNGCjZv4A
	 DJuvD/DSd0BpJhGtHaaeRST3hGF4XKYQNbyfkc6yP/Km1yTp9+c5AH6RjxM5oBnP+F76t
	 yV8WnnhSLMKJjcxgYdN5zlgBs6EidIF7FjgUNWp/foH3uUuvWY9UdZ5AXtS6beEz/xw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZFP8hGIb;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97FEF1F00A3A
	for <tools@kernel.org>; Tue, 16 Jun 2026 02:28:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZFP8hGIb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 97FEF1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59bf145a74fso3369628e0c.1
        for <tools@kernel.org>; Mon, 15 Jun 2026 19:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781576895; x=1782181695; darn=kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+qQg29S8NaR9aaRzWiyhNKdK/dCGHrYF1K0mAnsLR8=;
        b=ZFP8hGIbSEtr+TneX7N6zC0St987XDeVC81NetHpsFKHMRnVjGZPQSDzajlStELjvc
         AOOsZY2t1kr8uUlVIgjsuQIzWOiLprjTrSsCdjrNNtozHjaWrjul6BHGPEDw2dB712tZ
         byl4iV7tBe4YcUS7m9YySKGNY136X9FgefzYFzLw1bBUO4qIr9t3BEfH5yW1cB1nCLa4
         LOco+Zmy2Jtl0mfyEV2Zxu8Qz0e5aG3p813JJwhBs999m5VwDk6lIpoI0Zw4RAK1RQUV
         LJW1YiXR4o0uo3L4N+htzCjWkyfC68R71qQ/CziXuNeB+upst0Najv0eOrj/Eus0XqZB
         eUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781576895; x=1782181695;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+qQg29S8NaR9aaRzWiyhNKdK/dCGHrYF1K0mAnsLR8=;
        b=OHwcrhs+eytcter/wGoO6nep2en/M3+XzgRMYAEGgdgzmPEi+mMJi18a+DDwcmaPvk
         YqqvwbikwuKnmzecPF7/Z+k4eNGGjsxvdxewaKlW8w+8/7H9W1uP5e0G6PZz84Dw7HLh
         UCO82hwt/0WSNjUS4meGlMYjgi14DE+q/p1VSrn/YeEiwH3NC1+C2s9lZKChIL0QevE9
         94D6fCE/peNY1HdQdL3VV8CBrpx4a5GZM+g6LXRasejdzo1yyr6C4ip0HcpKanqFfK/w
         eVSrhAUXSVAqSQ1EhsfCjnvVk3wKXNftJ9WR7REo6sjUYf7YkbEdCSMnP/2dqcyO+F6M
         HikQ==
X-Gm-Message-State: AOJu0Yw1ZW4iSTGWjfv0ms0FqrPLoSEK2Cs58mItyAY0aloFwQYt7vUc
	cifUJ/+w+jkbVKIF952dAOOtuIGJUX1pEcHdun4YRHYyawoxkgUwit0K8H5aGtQe
X-Gm-Gg: Acq92OH9GoflMhy5L6qojLsIXxHkMxYFdoNOCBHxJccU3qsoIJt3D71f1jSmb4E0mU6
	XfzEaZUhCZCD2xoP//asafYDQyZxZK1Yb3G2k7YjXGo8XTOM3DIhv385HD1rVPt9xvRyW48EDC6
	FKYt8TXA4MUx9S+S74q4OxfeFX30I9Dcp/P2BmXh6jS3VhGXbuZHEwQcI7NHxBB7yk7crYgqXlV
	7Z+gq+MD4ogcxCBZaGw+ynBY/IXmIQIfA+9p9hfVVWY+z46ufbFTQGkq5XC/szIKbe9SKbIydBR
	4Q/xv393Cg/J5GlYNtmWD4IF96dN4BiKIG7+KCzuzhwyRX2SAp6ik7efC4QEnN8MPnTH4/GOAbY
	3SeDbjZd0hvibud754ZJz0KHB9BVKSB4n/hLd5wftO+0wJ38ycMocQLVExmYTU8SKtiCCIfM2l7
	Mt7xLjyUAcuMC+M7KynDfgoKv7nWZfalZ4fneVHzM0NZhwkSSmgz0w2HN17YU1hu6RBlxADqnK3
	Q==
X-Received: by 2002:a05:6122:1daa:b0:5a0:90e0:a4c5 with SMTP id 71dfb90a1353d-5bbada26191mr813335e0c.8.1781576895280;
        Mon, 15 Jun 2026 19:28:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901f1d1esm5113516e0c.18.2026.06.15.19.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 19:28:14 -0700 (PDT)
Message-ID: <7fc9d7e7-d6ce-449d-a511-8754480f3c5b@gmail.com>
Date: Mon, 15 Jun 2026 23:28:10 -0300
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
 <e3b32690-651a-4224-87f3-ba78757ccac2@gmail.com>
 <20260615-beaver-of-unknown-revolution-ec6da5@meerkat>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <20260615-beaver-of-unknown-revolution-ec6da5@meerkat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------spiKCBwzlNn2M3rKkLVlO9jU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------spiKCBwzlNn2M3rKkLVlO9jU
Content-Type: multipart/mixed; boundary="------------UnXkBgOtOqLLf3NB6Y5joyPu";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <7fc9d7e7-d6ce-449d-a511-8754480f3c5b@gmail.com>
Subject: Re: [PATCH b4 v2] ez: avoid duplicate signatures on resend
References: <20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com>
 <20260614-unbiased-favorite-marmoset-194aff@lemur>
 <e3b32690-651a-4224-87f3-ba78757ccac2@gmail.com>
 <20260615-beaver-of-unknown-revolution-ec6da5@meerkat>
In-Reply-To: <20260615-beaver-of-unknown-revolution-ec6da5@meerkat>

--------------UnXkBgOtOqLLf3NB6Y5joyPu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6/15/26 15:19, Konstantin Ryabitsev wrote:
> On Sun, Jun 14, 2026 at 03:21:14PM -0300, C=C3=A1ssio Gabriel wrote:
>>> I've never seen this happen, so I'd like to understand what may have =
caused
>>> this.
>>
>> This happens when I send a single patch using
>> my custom 'b4.prep-cover-template':
>>
>>        	${cover}
>> 	---
>> 	${shortlog}
>>
>> 	${diffstat}
>> 	---
>> 	base-commit: ${base_commit}
>> 	${prerequisites}
>=20
> This did unearth a bug in how we were looking for basement info. Your c=
ustom
> cover template no longer includes "change-id", which is what we were lo=
oking
> for to identify the "---" separated sections.

Yes, and at first glance I did not pay much attention to that bug to be h=
onest
since was I just testing my custom settings.

> I am putting a fix in to use more than just "change-id" but I'm curious=
 -- did
> you omit it on purpose, or is it just an oversight?

Yes, I omit it on purpose just to see how it would come out - and that is=
 the result.
Interesting bug!

--=20
Thanks,
C=C3=A1ssio


--------------UnXkBgOtOqLLf3NB6Y5joyPu--

--------------spiKCBwzlNn2M3rKkLVlO9jU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCajC0ugUDAAAAAAAKCRDQXT8aWv/ug4uw
AQC0if9G8Gn/8WAZniiDKLjzO78FkFgnC4KP9VnMuVZKMQD/fY4BVl9A+RhxDFdAWp4y/yi0bovp
udP9fQjHCxfbEAE=
=4MD0
-----END PGP SIGNATURE-----

--------------spiKCBwzlNn2M3rKkLVlO9jU--

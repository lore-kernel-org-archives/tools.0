Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D832737FC
	for <tools@linux.kernel.org>; Sat, 13 Jun 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317817; cv=pass; b=s4e1m9mzKSmMo91FZ3Po2W2CigAZ7+zwydrvfvCTtBKHNDKIMP64DvH2gX4nu6sm+PJMRnZK9osXIaVVqNtRsj1HX6tEwXJVij44BjOH/DWxlGaX7CqlJaxNRHlFVTspyhXGGbQPLpbRRTKU9DyhKdUBRG2XznhxiAhdcYyAAZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317817; c=relaxed/simple;
	bh=eetabHJ6SAQ/XBAzi0QdhjdlPzil7KVGWndrSXMmSvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvJznXbez8CbqfQtts5jXRtLo6DpB5rEwiCneTZYN0VCdtNwf2UdHrke2CCUTsyPEHIuF7fcSHEY/dIxO1mCooCMsoNoseVgEVPxTwSOTGl1VzYomrFn6ic5AtUaMk7i7wwQLW+QmHPfa1BZNL0/8vDDMdQp0ryqhVsdVqhridY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+Bk+80K; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+Bk+80K"
Received: by smtp.kernel.org (Postfix)
	id 143AA1F00A3A; Sat, 13 Jun 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781317816;
	b=Ko6amxHeBBD6xzT/qEg1aE6r7E2SWvw+EzHoC4p3SGciVQ6eRiT+8rcINxDy5G468v3P
	 Ug4y1C27AP0giWDaOe+1+HoEaT0vyab7799e72Io+lK2nad3mYiCAcRk04DmL8a68E9mQ
	 cXSZP+h8eQvjz7CFtghGaCV8xWLUc80gQW+8vXEo9mInT+eKOt+PRnM2alySYjF3GMdna
	 /HSvGGfcSOb9HOioDIbiuaha2duBU2BuGW4tjqF8P2FcbIvfVMA5XRB/8dsYp4G+A95tj
	 kJEY8OiCRNETYb90o8wuB5KZLtF85HrjZ6eNVKcAc9DTQue1wTd6woiAIGlEMpz3CKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781317816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type;
	bh=znLxgxoWFXhsbrFYD33/NvKuYER/pLkjjfmokvqMwuM=;
	b=GOH95T1i3pmZCt6PHS02l6NNwUFBDMzIOUic7lNWAnHJLRmqs3Kg5oTaUfDU5WzcYGdV
	 klZG+P+BqeCOm4gy0/UPIhSHBmG+KzmOtEuAA6FqsbVfG+B8nvVlOtuDJLCBmQ78Y3ua+
	 YgfJDXvk4o0rwnV249ti5bj4xhZUsh4K4CUuAadcOARb+izIjFE8Xl97pWBtgFYdOURO7
	 sCslEk/IzNeGODpZK2AgjMjt9za0oFaeug+KMAnYxHZH1BtagmsT/dcn7fkALtJvQeRzs
	 PIIK2fQJByeyOjbqmyDfUpkK7VVtsvP3flRHPzKw4Rd+z96/hGR27g74k3HLukg1OmA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M+Bk+80K;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BBDE1F000E9
	for <tools@kernel.org>; Sat, 13 Jun 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M+Bk+80K
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7BBDE1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304fb780deaso1786949eec.1
        for <tools@kernel.org>; Fri, 12 Jun 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781317814; x=1781922614; darn=kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znLxgxoWFXhsbrFYD33/NvKuYER/pLkjjfmokvqMwuM=;
        b=M+Bk+80KGrekWTWvmelPtnJJs/egJ6V4GTmn5ljDmU9GDg47Tlos6t+YWeMXO3FTeu
         ZJbF54GAjjkA1rCpRStnFcvRmuity+7JvGpl6c80gHbdpGWTtk0qbpwvKq9dPEpObsl5
         6yz/vvLH7jneIZ/GvvMIiA/8bSTrgJCVyNxo8mpt7FX6XH8DLv9rGPip1hnET/eR4UsQ
         fFbDdjBf52B6Z3OYl64g/Cbadw2Fh0ykVxsOnD9R/xpYbwLOR9McSQ/v6ErYzp1Jrorq
         CCcpwm1PaUY4JZieQ4aPB+MdZXw4yJANHj4tbZwLs/0O93EHiLWysQaaDvLLS8lggpUe
         8A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781317814; x=1781922614;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znLxgxoWFXhsbrFYD33/NvKuYER/pLkjjfmokvqMwuM=;
        b=GirzPbla1TKEez1u7VW/Merh+oVYKEdmfEpN81Er6v5xhiodheH0bEjFVFmGyCPNll
         4VxYHp7ELHweXPW34ViYWLL8giKUJPYn3xlslBMZkMYy8g8H9dtudPFSxex0Cm6Jb4e7
         zByi/Limv6kKHWiOSoRoYzs9j2wKnpWiQGJv9lJzRwmValcZqKqGjerDuVMwNKxblBVl
         uiP2FIiTanIhUpM07SAV1sosXqjGZcIqh84RYfiScSdSpRlxQTgnyqwVlGUkSfT5Gx4w
         1zWlqNDACKjL7/BDY7Ni2JHGoQ/u2BIt7wVRmyT4uRq06Xd1RJSoSX4tT0VuGkeWkfS6
         9VKw==
X-Gm-Message-State: AOJu0Yy3R0rhaqjNk3WMF20bREfPFug0Ypph38CdeCei+JPyVRF3voe8
	fhF0/HYe/NDJTz2kHdJfBUSMi00cUSGyjV8GejkmyRpSZZs7XuAhEr57
X-Gm-Gg: Acq92OGP8ziWanorx+II4TKZiC71yxH4On/LUQ39IKomaBbCTsjwLBC6674YYeJQS24
	14yKd8p2n0w9BlRqBwhhuDqtbdASYFS8CCWgxqS74C8YZvvdxX6CG8hFxWyOEQTzTCnBBA6orFx
	h/Y1Ajn8adDXju4Z+ox5UggCjuLSzJuxIbBw52J2/sMBYFlBWEkQFQzzxSaBjFQbKNqdh3j4rLx
	MgR2tkj6qLbeqdqq54A+30UdSLw5Pe/xqWFVuLTNZq62Bs9XjONsxDhhFtPlD7aggph/zFzujiK
	SBhWLWnQfUYieFGO/uCufA/iJZlA+If/56z33HiRSpQW+tuTDo2FcaLdrjbiGW0cB2H4dOg+Goa
	GuplHMYH2zccWeFDjHUCwOzpZLrhPk/7oTVShqmc/Avk1/S2pQGHCMxS+rgIu3lIc4+miIWb4hG
	e9HTvajs2CGU7A/8c5kI/RZn9PBDeBZB/GM02GBgFYiplfma0HuztSbEucuu7PhFyasXzSBv3fs
	CZQv0K1CjgZ
X-Received: by 2002:a05:7300:7fa1:b0:304:de43:130 with SMTP id 5a478bee46e88-3081ff4befamr2961895eec.2.1781317814138;
        Fri, 12 Jun 2026 19:30:14 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea447b4sm5492217eec.23.2026.06.12.19.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 19:30:12 -0700 (PDT)
Message-ID: <6c0ffae5-e63c-4968-bc9d-e55678aeba41@gmail.com>
Date: Fri, 12 Jun 2026 23:30:09 -0300
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] ez: avoid duplicate signatures on resend
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20260525-resend-signature-fix-v1-1-09fd09faf34f@gmail.com>
 <178105802269.171297.16359053180453686328.b4-review@b4>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <178105802269.171297.16359053180453686328.b4-review@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cOeUiAWWyXyhIBmh07CNKXxp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cOeUiAWWyXyhIBmh07CNKXxp
Content-Type: multipart/mixed; boundary="------------uv0x6KvSK56lNWyXPQhm1TSw";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <6c0ffae5-e63c-4968-bc9d-e55678aeba41@gmail.com>
Subject: Re: [PATCH b4] ez: avoid duplicate signatures on resend
References: <20260525-resend-signature-fix-v1-1-09fd09faf34f@gmail.com>
 <178105802269.171297.16359053180453686328.b4-review@b4>
In-Reply-To: <178105802269.171297.16359053180453686328.b4-review@b4>

--------------uv0x6KvSK56lNWyXPQhm1TSw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi!

On 6/9/26 23:20, Konstantin Ryabitsev wrote:
> On Mon, 25 May 2026 01:14:23 -0300, C=C3=A1ssio Gabriel <cassiogabrielc=
ontato@gmail.com> wrote:
>> diff --git a/src/b4/ez.py b/src/b4/ez.py
>> index 3e81138..4f55f0f 100644
>> --- a/src/b4/ez.py
>> +++ b/src/b4/ez.py
>> @@ -1734,6 +1734,15 @@ def get_cover_subject_body(cover: str) -> Tuple=
[b4.LoreSubject, str]:
>>      return lsubject, cbody
>> =20
>> =20
>> +def strip_cover_signature(cbody: str) -> str:
>> +    body =3D cbody.replace('\r', '').rstrip('\n')
>> +    sigpos =3D max(body.rfind('\n-- \n'), body.rfind('\n--\n'))
>> +    if sigpos >=3D 0:
>> +        return body[:sigpos].rstrip('\n')
>> +
>> +    return body
>=20
> No, you should drop the '\n--\n' (bare, no trailing space) case from
> the sigpos search. The canonical email signature delimiter is '\n-- \n'=

> =E2=80=94 that trailing space is load-bearing and intentional and we
> deliberately only recognise the canonical form, and for good reason:
> bare '--' appears legitimately in cover letter prose =E2=80=94 markdown=

> horizontal rules, CLI flag documentation, SQL comments, and various
> other contexts.  Matching it here can silently truncate the cover body
> in ways the author would never expect, and the conservative posture of
> the existing code is the right one. If someone's cover carries '\n--\n'=

> from a non-conformant mailer, a doubled footer on resend is a far
> smaller problem than silently eating half the cover text.
>=20
> With the bare '--' case removed the sigpos line simplifies to:
>=20
>     sigpos =3D body.rfind('\n-- \n')
>=20
> and the '--' parametrize case in the test should be removed too.
>=20
> This is the right fix for the resend path. The previous cbody.strip()
> also stripped leading whitespace, which this helper does not -- a minor=

> behaviour change worth looking out for in case it wasn't intentional.
>=20
>>
>> diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
>> index 3d05ef9..5abfea2 100644
>> --- a/src/tests/test_ez.py
>> +++ b/src/tests/test_ez.py
>> @@ -408,3 +408,24 @@ def test_store_cover_preserves_series_notes(prepd=
ir_commit: str) -> None:
>> [ ... skip 18 lines ... ]
>> +        'Cover text.\n\n'
>> +        '---\n'
>> +        'base-commit: abc123\n'
>> +        'change-id: 20260101-test-change-id\n\n'
>> +        'Best regards,'
>> +    )
>=20
> The '-- ' parametrize case is correct and should be kept. The '--' case=

> should be removed along with the bare-delimiter matching in the helper =
itself.
> Optionally, adding a no-signature case would lock in that the function =
returns
> the body unchanged (modulo trailing-newline normalization) when no deli=
miter
> is present.

Thanks for the review.

I'll respin these suggestions in v2.

--=20
Thanks,
C=C3=A1ssio


--------------uv0x6KvSK56lNWyXPQhm1TSw--

--------------cOeUiAWWyXyhIBmh07CNKXxp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCaizAsQUDAAAAAAAKCRDQXT8aWv/ugwc3
AP43ljx8ZbIO4CRKXjZGXrPTxj/e45lvZWyfucNktjEqUwD8DT6AaYxaDhTZgbJguX33iZVcEpjE
CtD9dBoqpk2EfA0=
=4rPj
-----END PGP SIGNATURE-----

--------------cOeUiAWWyXyhIBmh07CNKXxp--

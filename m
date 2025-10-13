Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724BD4C9D
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 13:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360549; cv=none; b=toHZ752vO4hKCvCQ0NQVy63XODtlnc3RCYhSSzVo+YwRdwhK9R49f6dtIRy3DXYdJzC8xraYFtBPypvCb2tysPFeQq/OZvZBdYQiHW+J0paQcxZVZ3ENDqBMVufcxmmpkXrHuhj6nycAKJlEtuv0hwNLQQp1qIMCKuysIwkVHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360549; c=relaxed/simple;
	bh=JWq+JiXGjLaIMYYqSGIV8yBtDQBH0j9zBzfyld0ldVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBvQXcBGfuIynkXDsFf/10ZnOoTH/iMTFg15a5YIGw4lAhsJa7PlfiI12Qyf4xdZHs1FK6vUcwi9Ex0QMgRwSjfiCoI/Kt60U3wcgZGdu9+vxuBNE3YSab3fvlnmCbsvlaOyAKblcTPCyUWQpl0ta8Db0mdSdKqGS9hzbI7l4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Cm897aWN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Cm897aWN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-639fb035066so6541420a12.0
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 06:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760360545; x=1760965345; darn=linux.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JWq+JiXGjLaIMYYqSGIV8yBtDQBH0j9zBzfyld0ldVs=;
        b=Cm897aWN8a0w7rBJnkVIeXpj08cA6vCPhrRZdOU87NUuoqCQ2zhnulAoxGPfAYTyIw
         0JRF+K3+PJKXfD1EKUAtIr2okh8x67QJ7Y865JsvWcKuAjQ/5BeI8Pf9Q2sHAK0C9vYm
         dUBbDBMCBkKpdJtpMuLbeh8Da/8BTxqrwkf38bo2IApQqI0Gu4cMKRPP6DNPs2WbT63D
         IqTS7sHGQCefZ0MYs9fFqsMRyYZHW+yMrek4JjfJFBbwopNpiXstNmXOnr3z8zSwsiNn
         EA2vOFUsGKCbEFEEoqueJwVcd/97ZVeHxFSseBFetEyo/J1j3FrqmObJH4za60bL+NiH
         DqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760360545; x=1760965345;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWq+JiXGjLaIMYYqSGIV8yBtDQBH0j9zBzfyld0ldVs=;
        b=UsZh9v1DrCD2CeOkWG6U1Lo86YtJXAJOi+7EoY5OabE5sYYIaEYGZIqqnseNJ2PJ0A
         oQqoCa0Rp39z6U2h6bHdrqicTXZaxCFzU8kLwTgNZON1eSAGHencJSoBQaMs+na3Tjxv
         qWpYjYcapleH4b8V4u9SnzDh2zk9KpGN6Cr0LvJ0xtlgNIJceCor2MhTB1GIHSCIlNcw
         6eBJultSL79jSCgM5cT4VbZ6k7xeeS0LZU9TmmiRk+ZuLFkDEj9RGvdu5ueWGScIpi0z
         W+0oaXeEcfNRF7oImB8fjl0joh8Lc6zoYDWcU7CM2BGQtMgLkQlUUgAKeWJoH4DxexpE
         AEkA==
X-Forwarded-Encrypted: i=1; AJvYcCVwNy0uFTPtriFCXTaOTOqVjRZ7clVPO2+zFANUtMsTmZczZQk/PkiAIWP/HfqrM31wX2H7+A==@linux.kernel.org
X-Gm-Message-State: AOJu0YxxQs/l+WEAGMcsird607iwrw0ngOAaN7DrNmrAEpEbyJBXAPM8
	O/vBPPJZxlQ2z0pYE5WWq1Et5SbC3QJ2ma4zaFoPM8MkBVglreiNPGuD5CW1oJst81I=
X-Gm-Gg: ASbGncs9Mhs0lDATHaISr8U/aBSDxr6GACvTkq1rRr5+0T7jkMU/qzgBd0/vpaJNOl1
	774pQ1szAZpryFUpdwyEOBrrvGhq2sjVyUhN39GQabDgQCKibfbCeqAQX5GXz+g4D1q0fdKcyt7
	MHOR9LM9wWVHjm6WsIsGYxib0bbi8lpWXbqthIZkTqrD5Qqe4vEw+9CFxZy68H48OwpCo29DxtD
	n4tGWFJ+Khemtv29HY0ubUVhEUUldyxa13uNgbaMBFTJfDPp2h5VfT9D+Kz6DUcAPHTEg/iBu4j
	KrPuS0iAix47YYCM3CUHbbhsulavU/sNVZEmJrZuKltNDJQ5Q262cm7w5rVZETPH58E+wilROhF
	vLKuWUkRg3+xr0rwII1TfPwT5SVQu11bMIeS2U9MPjlIM2qtUOZnYOxtikVGE+WgxmYTVYtGisi
	ux9dZjGDYdPDZPjmILNgJ0FOnWh6g7vA6jxRLvcFSRsJP+HXmEX+4rmQX3IgLwVzI=
X-Google-Smtp-Source: AGHT+IEljHsIGPJQU+z6iDS9tfGf/lNpjz1xbJLHypuZvm2RAbS3GMwoeFigyhw4izfiOvJBP9PA1Q==
X-Received: by 2002:a17:906:ef05:b0:b4e:d6e3:1670 with SMTP id a640c23a62f3a-b50aa48ca83mr2282385066b.11.1760360544588;
        Mon, 13 Oct 2025 06:02:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86? (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de. [2003:e5:873f:400:7b4f:e512:a417:5a86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67c7483sm929078366b.31.2025.10.13.06.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 06:02:24 -0700 (PDT)
Message-ID: <7a56fc6e-a85e-4b93-9cf0-5376e12d93f3@suse.com>
Date: Mon, 13 Oct 2025 15:02:23 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Brown <broonie@kernel.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Willy Tarreau <w@1wt.eu>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <19d8800c-c48d-4b98-ae4c-f52053b97ac5@sirena.org.uk>
 <4f9d75f4d024bf9340f5d6936a2a2dd73c6eb1f3.camel@HansenPartnership.com>
 <CABgObfboX1k8FxERevPc-BkNegEJuQVd0E1OjznCkk1BqxQQfQ@mail.gmail.com>
 <fe3500f401a6cd2666c908a73a3db93ef6982e7f.camel@HansenPartnership.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <fe3500f401a6cd2666c908a73a3db93ef6982e7f.camel@HansenPartnership.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oJypLEUJW67GzBx7ZnftmppW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oJypLEUJW67GzBx7ZnftmppW
Content-Type: multipart/mixed; boundary="------------D83byjYmTjO9pvh0YTUnixgl";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Brown <broonie@kernel.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Willy Tarreau <w@1wt.eu>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
Message-ID: <7a56fc6e-a85e-4b93-9cf0-5376e12d93f3@suse.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <19d8800c-c48d-4b98-ae4c-f52053b97ac5@sirena.org.uk>
 <4f9d75f4d024bf9340f5d6936a2a2dd73c6eb1f3.camel@HansenPartnership.com>
 <CABgObfboX1k8FxERevPc-BkNegEJuQVd0E1OjznCkk1BqxQQfQ@mail.gmail.com>
 <fe3500f401a6cd2666c908a73a3db93ef6982e7f.camel@HansenPartnership.com>
In-Reply-To: <fe3500f401a6cd2666c908a73a3db93ef6982e7f.camel@HansenPartnership.com>

--------------D83byjYmTjO9pvh0YTUnixgl
Content-Type: multipart/mixed; boundary="------------SV19m1RO7iyVb3Rtupx9UEzg"

--------------SV19m1RO7iyVb3Rtupx9UEzg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjUgMTQ6NDcsIEphbWVzIEJvdHRvbWxleSB3cm90ZToNCj4gT24gTW9uLCAy
MDI1LTEwLTEzIGF0IDE0OjI5ICswMjAwLCBQYW9sbyBCb256aW5pIHdyb3RlOg0KPj4gT24g
TW9uLCBPY3QgMTMsIDIwMjUgYXQgMTo1NeKAr1BNIEphbWVzIEJvdHRvbWxleQ0KPj4gPEph
bWVzLkJvdHRvbWxleUBoYW5zZW5wYXJ0bmVyc2hpcC5jb20+IHdyb3RlOg0KPj4+IFdlbGwg
aXQncyBub3QgbGlrZSBoZSBpc24ndCByZWFkaW5nIHRoaXMgbGlzdCAuLi4gYnV0IHNpbmNl
IHRoaXMgaXMNCj4+PiBhIHByb2Nlc3MgaXNzdWUsIHRoZSBmb3J1bSBmb3IgZGlzY3Vzc2lu
ZyBpdCAob3IgcmF0aGVyIGZvcmNpbmcgdGhlDQo+Pj4gaXNzdWUpIHdvdWxkIGJlIHRoZSBN
YWludGFpbmVyIFN1bW1pdC7CoCBJIGNhbiBwcm9wb3NlIGl0LCBidXQNCj4+PiB0aGVyZSds
bCBhbHNvIG5lZWQgdG8gYmUgYSBjZXJ0YWluIGFtb3VudCBvZiBicmF2ZXJ5IGluIHRoZSBy
b29tLg0KPj4NCj4+IEknbSBhbiBvcHRpbWlzdCwgYnV0IG1heWJlIG5vdD8gTGludXMgaGFz
IGhpcyBvd24gd2F5IG9mIHJlYWRpbmcgdGhlDQo+PiByb29tIChjdWUgdGhlIFJ1c3QgaXNz
dWUgb2YgYSBmZXcgbW9udGhzIGFnby4uLikgYW5kIGlzIGRlZmluaXRlbHkNCj4+IG5vdCBh
IHJlcGx5IGd1eS4NCj4gDQo+IFN1cmUsIEknbSBob3BpbmcgYSByZXNvbHV0aW9uIGlzIGFy
b3VuZCB0aGUgY29ybmVyIGFzIHdlbGwNCj4gDQo+PiBUaGVyZSBhcmUgZW5vdWdoIHBlb3Bs
ZSBmcm9tIGEgdmFyaWV0eSBvZiBiYWNrZ3JvdW5kcyBleHBsYWluaW5nIHdoeQ0KPj4gaXQn
cyBpbXBvcnRhbnQgZm9yIHRoZW0gdG8gcHJlc2VydmUgdGhlIG1lc3NhZ2UtaWQgbWV0YWRh
dGEgKCpub3QqDQo+PiB0aGUgTGluayB0cmFpbGVyIC0gdGhlIG1ldGFkYXRhIGlzIHRoZSBp
bXBvcnRhbnQgcGFydCkuICpEaXNjdXNzaW5nKg0KPj4gaXQsIGFzIG9wcG9zZWQgdG8gbWFr
aW5nIGl0IGEgZmxhZyBkYXkgd2hlcmUgYSBzdGFuZGFyZCBpcyBzZXQgZm9yDQo+PiBhbGwg
bWFpbnRhaW5lcnMsIHNlZW1zIGxpa2UgYSB3YXN0ZSBvZiBwcmVjaW91cyBNYWludGFpbmVy
IFN1bW1pdA0KPj4gdGltZS4NCj4gDQo+IFdlbGwgdGhhdCBkZXBlbmRzLiAgSWYgaXQncyBh
bGwgcmVzb2x2ZWQgc29vbiwgYWJzb2x1dGVseSBubyBuZWVkIGZvcg0KPiBmdXJ0aGVyIGRp
c2N1c3Npb24uICBJZiBpdCdzIHN0aWxsIG5vdCByZXNvbHZlZCBieSBEZWNlbWJlciB0aGVu
DQo+IGRpc2N1c3Npb24gd291bGQgc2VlbSB0byBiZSB3YXJyYW50ZWQuICBFaXRoZXIgd2F5
IHBsYWNpbmcgdGhlIG1hcmtlcg0KPiBub3cgaGVscHMuDQo+IA0KPj4+IENhbiBJIGFsc28g
dGFrZSBpdCB0aGF0IGlmIGEgZmFjZSBzYXZpbmcgY29tcHJvbWlzZSBpcyBuZWVkZWQgdGhl
bg0KPj4+IGV2ZXJvbmUncyB0b29saW5nIGNhbiB3b3JrIHdpdGggYSBtZXNzYWdlLWlkIHRy
YWlsZXI/DQo+Pg0KPj4gU3VyZSwgdGhhdCdzIHRyaXZpYWwgYnV0IExpbnVzIHByb2JhYmx5
IGhhdGVzIHRoZW0gbW9yZSB0aGFuIExpbmtbMV0sDQo+PiBhbmQgb25seSBsYXN0IHllYXIg
aGUgYWR2b2NhdGVkIHVzaW5nIExpbmsgYW5kICJiNCBhbSAtbCJbMl0uIDopDQo+IA0KPiBJ
IGdldCBpdDogaGUgd2FzIHRoZSBvbmUgYWR2b2NhdGluZyBhIGNsaWNrYWJsZSBsaW5rIGlu
c3RlYWQgb2YNCj4gc29tZXRoaW5nIHlvdSBoYWQgdG8gY3V0IGFuZCBwYXN0ZS4NCj4gDQo+
IFBlcmhhcHMgd2hhdCBLb25zdGFudGluIHNob3VsZCBiZSB3b3JraW5nIG9uIGlzIGEgc2Vy
dmVyIHNpZGUgdmVyc2lvbg0KPiBvZiBiNCBkaWcgdGhhdCB0cmllcyB0byBwdWxsIHVwIHRo
ZSBlbnRpcmUgcGF0Y2ggaGlzdG9yeSAocGVyaGFwcyB3aXRoDQo+IGFuIEFJIHN1bW1hcnkg
b2YgdGhlIGRpc2N1c3Npb25zKSBhbmQgdGhlbiB3ZSBlbWJlZCB0aGF0IGFzIGhlIGxpbmsN
Cj4gc3RpbGwgd2l0aCBhIG1lc3NhZ2UtaWQgbGFzdCBjb21wb25lbnQuDQoNCkFmdGVyIGFs
bCBpdCBpcyBhYm91dCBtZXRhZGF0YSBvZiBhIHBhdGNoLg0KDQpUaGVyZSBpcyBvbmUgc29s
dXRpb24gd2hpY2ggY2FuIHByb3ZpZGUgdGhpcyBkYXRhIHdpdGhvdXQgTGludXMgKGFuZCBv
dGhlcnMpDQpiZWluZyBkaXN0cmFjdGVkIGJ5IGl0LiBUaGUgb25seSBkb3duc2lkZSBpcyB0
aGF0IGl0IHdpbGwgbmVlZCBzb21lIHRpbWUgdG8NCmhpdCBjdXJyZW50IGRldmVsb3BtZW50
Og0KDQpBZGQgYSBuZXcga2V5d29yZCB0byB0aGUgZ2l0IGNvbW1pdCBkYXRhIChlLmcuICJN
ZXNzYWdlLUlkIikuIEl0IGNvdWxkIGJlDQpmaWxsZWQgaW4gYXV0b21hdGljYWxseSBieSBn
aXQgd2hlbiBhdmFpbGFibGUgKGkuZS4gImdpdCBhbSIpLCBidXQgaXQgd291bGRuJ3QNCnNo
b3cgdXAgaW4gYSBub3JtYWwgImdpdCBzaG93Ii4gSW4gImdpdCBjYXQtZmlsZSBjb21taXQg
PGhhc2g+IiBpdCB3b3VsZCBiZQ0KdmlzaWJsZSwgdGhvdWdoLg0KDQpPYnZpb3VzbHkgdGhp
cyB3b3VsZCBoZWxwIG9ubHkgaWYgYSBuZXcgZW5vdWdoIGdpdCBpcyBiZWluZyB1c2VkLCBi
dXQgaW4gdGhlDQpsb25nIHJ1biBpdCBtaWdodCBiZSBhIGdvb2QgaWRlYS4NCg0KDQpKdWVy
Z2VuDQo=
--------------SV19m1RO7iyVb3Rtupx9UEzg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------SV19m1RO7iyVb3Rtupx9UEzg--

--------------D83byjYmTjO9pvh0YTUnixgl--

--------------oJypLEUJW67GzBx7ZnftmppW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjs+F8FAwAAAAAACgkQsN6d1ii/Ey/C
pgf9FGDkgS5fUDNMEv5IQhWJD7VJq/o/NOEZEtxIrLBIL92VULTbycyCc94UrPZvsqdJumqec2r7
FxOOPy1qm8jM1+7LMnRzoWUUFlgkMBv2Tjf8CK37Z+IgxhOeIXThsr3dCgF8urvAC+2Wrbluuln8
BPasGPic/mIilqkBihQ5872Kd6kSNJl9LS1t6N9oMOeAYIWCbxKgFa8w7SHLBs30d7svx1/pKm94
SDXb2eUMfGXenCySc7u9JVWawMklcZ/VmkFHybkk0Cralm5Ymuq/svNSfhFPLRdWrh7q/XkEBbuj
Opf5DpB7Vo3qVvBNxClOg5NnFR5sdMSrBAK8Xdjn/Q==
=+UE3
-----END PGP SIGNATURE-----

--------------oJypLEUJW67GzBx7ZnftmppW--

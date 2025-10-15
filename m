Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B440F241696
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536800; cv=none; b=BdSNUnZXQ4KHVcZW2O8gZQ2Z14wIaIbgPLmYPmOljYd/B5sg7IjL5R7SZYqjNOYTJHWofYKowhMhGX3wKVrd8mTDp4W55WwuQWuFSLTuBnHUKyXqmFkwgOkxy3wtmLl1nBjCFbrh1PYzKNxXPYTiXVy6mvu539KFup7FCRQaYRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536800; c=relaxed/simple;
	bh=3je8O/20B3u09J9iu64de2Ax1xWO9nFs7esMDIShaf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Er2ycJlD6VZMBCS7l7HVkPigVNtoG/FQO2kw/7XGYVL1imL50eioXnn05u3PNbY3m4/QD0Kl3tFAqEwDMkRziSM4UbpuNSREUw2fpzkmaH/AOCveeogWr24MdAxX+UTgepIq/7y33Ih4aQvCva2yb8Ghh4bTEYKu/XO/5VEr2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JTHAYo6X; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JTHAYo6X"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso8707696a12.0
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 06:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760536796; x=1761141596; darn=linux.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3je8O/20B3u09J9iu64de2Ax1xWO9nFs7esMDIShaf0=;
        b=JTHAYo6XIJ7hXJ1+VoLp/7xlQQArw3XmdAMx9hu6+QZCgoVhpjdSTKvXPrkrGDMjN2
         zvoRD4gxl2KD5Ixx4M/F4FKS0PwW5Yr6rNqq0I1S0//PubL5bhiwQtPyx0HGsq9h/8Ce
         e2xNjqxL0uyOAoWBZi0d/codkDOHntH58cpHv1ZOC3wdBg/vai8LsNrV9tklSiYLbn2h
         Z0fLpclxcn6DCSVtZ+jvuzmKodlkPrfyAdn02fji1aSMKo9Zs4l4SxcYhzVRndFdhVrB
         gSH/z2eMYRCM4AGMOKUTnPz5UEAvykLOI4zjmbe9zcNfW4fcapPwzSnGIagR9cltlNwp
         vxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760536796; x=1761141596;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3je8O/20B3u09J9iu64de2Ax1xWO9nFs7esMDIShaf0=;
        b=aXgK43sfMFRlX9xi5jb6L3hqXoik2mQXJo9YIjjavn4Bd2SAuBJO0WuD4It+81hAGW
         DIQPslWuUVRx/oQ+TJEKdMELRKleT4+ZPHYeZs16/vT9r5KkTFVKvyJwuKD2VmwTiT9p
         Pq3RHYDH4UR2w2V/OsI8PDPFzA/U67OmjNa3av4pbR13qF/dbDXlhBG3Wm4L1mc08BUW
         aVwcu1QE/CeKglWgm+4CulxiZXlOmQgB1+VMgUPcNK3Vf0qMyHKWWRl2tPhJ0lymnBXe
         Odd82zI3MlD+DvY1mmzqQeTkQrDwQmpDBLGCxNP/xKRDstLjZUYaro+GVEEP+NmtYz3h
         /awA==
X-Forwarded-Encrypted: i=1; AJvYcCXEifXLv3kOwu/t3ymnyGJjKK2v3UJvuKpUE6zO09+tGI+lJUGvTr1AVRp8mq1QXMgcB5zG0g==@linux.kernel.org
X-Gm-Message-State: AOJu0YwJqar6qKRMag3R2nVK9tQwjD+eGCqWPy0x6TXwUUUhjSJ/rMT+
	gQIdky9+l8x2Oi2guDNTDXKxIJCchriLJ5oOTDQXvVvH5JWcO1w9Fr6OIdu6qiq9Pts=
X-Gm-Gg: ASbGncvudNZKWj+safFXXAT31IM5wZYPXO+AknBzfbqujcLGd76RYUI00A/ptRJaqd8
	a0wDdKe7/S/ny0YCsvqRSOYPwyOVmrgH4mdG5+pplGh5Br6opUKm5SLnCdHqidNO+3or1+VUOX9
	YbhlGoFAKJCFbqR/nMHwGwOBloBaR32+aOC+LYyRppUVQRfIYH0jYTeEyO9VydGrbpldixaUcys
	FACJxmJSk3Efxm3IBfUxe0C0pQaScXCzibPpXGWr/r1Br8V4obGZAlC870A7c5jbpqXoAulPI5J
	W1YQwPq6ilClzYRnUIB7NsvmXBsKxCUOZ7ia9/JlpyBFcGTpQ0981eFUTwHPHXmid2Y8f7qiOhL
	3TyQP+4vDr7YWdfTpAEFoIyr3Q87Flo97IW6ZqXaC95wUZRQKZ4i4Wp+ujAg340X6KCP+yWwMz+
	CzOsen3spjFCmj5tGmeSadWY/ypSY4+/RAIzAYKk8+pDiO0o+6Hl3Fxxxl0uZy2vdmmt+69xRjA
	Q==
X-Google-Smtp-Source: AGHT+IHsnyxqoPa4/mRuf4x7/3ycJD7ZFnmFXlsrgEOOOWtfjFtSHCZn9QePzvSoYmJ82HwPiiKFxA==
X-Received: by 2002:a05:6402:848:b0:637:e490:4609 with SMTP id 4fb4d7f45d1cf-639d5c59deemr25968811a12.31.1760536795863;
        Wed, 15 Oct 2025 06:59:55 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86? (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de. [2003:e5:873f:400:7b4f:e512:a417:5a86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235dcdasm13563902a12.6.2025.10.15.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 06:59:55 -0700 (PDT)
Message-ID: <dd47fe2c-decd-4831-8b68-858e0b3ca58e@suse.com>
Date: Wed, 15 Oct 2025 15:59:54 +0200
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
 Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
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
In-Reply-To: <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DKZJ6iFNZPsrz8aDZxWZEQJt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DKZJ6iFNZPsrz8aDZxWZEQJt
Content-Type: multipart/mixed; boundary="------------p2GdVr8e548YI0r0irlhtWhZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
Message-ID: <dd47fe2c-decd-4831-8b68-858e0b3ca58e@suse.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
In-Reply-To: <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>

--------------p2GdVr8e548YI0r0irlhtWhZ
Content-Type: multipart/mixed; boundary="------------rqkVpa0sxTPsWvNmfCcs8IWF"

--------------rqkVpa0sxTPsWvNmfCcs8IWF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMTAuMjUgMTU6NTAsIEphbWVzIEJvdHRvbWxleSB3cm90ZToNCj4gT24gV2VkLCAy
MDI1LTEwLTE1IGF0IDEzOjExICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPj4gT24gV2Vk
LCBPY3QgMTUsIDIwMjUgYXQgMTE6Mzg6NDFBTSArMDIwMCwgTWlndWVsIE9qZWRhIHdyb3Rl
Og0KPj4+IE9uIFdlZCwgT2N0IDE1LCAyMDI1IGF0IDk6MzfigK9BTSBHZWVydCBVeXR0ZXJo
b2V2ZW4NCj4+PiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPj4NCj4+Pj4gRlRS
LCBJIGRpc2xpa2UgdGhlIHVzZSBvZiBDYzogaW4gcGF0Y2ggYm9kaWVzLg0KPj4NCj4+PiBZ
ZWFoLCB3aGVuIHRoZXkgYXJlIGFkZGVkIGF1dG9tYXRpY2FsbHkgYXMgYSBiaWcgYmxvY2sg
KGUuZy4gMTANCj4+PiBsaW5lcyksIGl0IGlzIG5vdCBncmVhdC4NCj4+DQo+Pj4gUGVyc29u
YWxseSwgSSB1c2UgQ2M6IHdoZW4gSSB0aGluayBzb21lb25lIHNob3VsZCBiZSBleHBsaWNp
dGx5DQo+Pj4gcGluZ2VkIGZvciBhIHJlYXNvbi4gVGhhdCBpcywgcGVvcGxlIHRoYXQgbWF5
IHdhbnQgdG8gcHJvdmlkZQ0KPj4+IGNvbW1lbnQgYnV0IHRoYXQgd291bGRuJ3QgYmUgQ2Mn
ZCBvdGhlcndpc2UgZnJvbSBgTUFJTlRBSU5FUlNgLA0KPj4+IGUuZy4gdHlwaWNhbGx5IGZy
b20gZXh0ZXJuYWwgcHJvamVjdHMuDQo+Pg0KPj4gQ2NpbmcgcGVvcGxlIG1ha2VzIHNlbnNl
IGJ1dCBkb2Vzbid0IG5lZWQgc29tZXRoaW5nIGluIHRoZSBwYXRjaA0KPj4gYm9keSwgYW5k
IGVzcGVjaWFsbHkgZG9lc24ndCBuZWVkIHRvIGVuZCB1cCBpbiB0aGUgY29tbWl0IGxvZy4N
Cj4gDQo+IEFic29sdXRlbHkuICBCdXQgcGFydCBvZiB0aGUgcHJvYmxlbSBpcyBwZW9wbGUg
d2hvIENjIGRpZmZlcmVudCBwYXJ0cw0KPiBvZiB0aGVpciBwYXRjaCBzZXQgdG8gZGlmZmVy
ZW50IHBlb3BsZSBkb24ndCB3YW50IHRvIHVzZSB0aGUgLS1jYw0KPiBnbG9iYWwgb2YgZ2l0
LXNlbmQtZW1haWwsIHNvIHRoZXkgdGVuZCB0byBwdXQgaXQgaW4gdGhlIGNvbW1pdCBsb2cu
DQo+IFdoYXQgd291bGQgYmUgbmljZSB3b3VsZCBiZSBpZiBnaXQtc2VuZC1lbWFpbCBoYWQg
YW4gb3B0aW9uIHRvIHN0cmlwIGNjDQo+IGxpbmVzIHdoZW4gaXRzIHNlbmRpbmcgdGhlIHBh
dGNoLiAgWW91IGNhbiBhY3R1YWxseSBzb3J0IG9mIGRvIHRoaXMNCj4gbWFudWFsbHkgaWYg
eW91IGFkZCBhIGAtLS0nIGFuZCBwdXQgdGhlIENjOiB0cmFpbGVycyBiZWxvdyBpdCAoSQ0K
PiBhY3R1YWxseSB1c2UgdGhpcyBmb3IgcHJlc2VydmluZyB0aGUgdmVyc2lvbiBsb2cgYXMg
d2VsbCkgYmVjYXVzZSBhbQ0KPiBpbXBvcnQgZGlzY2FyZHMgYW55dGhpbmcgYmVsb3cgYC0t
LScuDQo+IA0KPiBJdCBpcyBhbHNvIGRlZmluaXRlbHkgcG9zc2libGUgdG8gYWRkIGEgZ2l0
IGNvbW1pdCBob29rIHRvIHN0cmlwIGNjJ3MNCj4gd2hlbiBkb2luZyBhbS4NCg0KSSdtIHVz
aW5nIGJhc2ljYWxseSBhbiBhZGRfbWFpbnRhaW5lcnMgc2NyaXB0IGZyb20gdGhlIFhlbiBw
cm9qZWN0IFsxXS4NCkl0IGlzIGFkZGluZyB0aGUgbWFpbnRhaW5lcnMgZm9yIGVhY2ggcGF0
Y2ggb2YgYSBzZXJpZXMgaW5kaXZpZHVhbGx5LA0KYmFzZWQgb24gdGhlIE1BSU5UQUlORVJT
IGZpbGUgYW5kIHRoZSBmaWxlcyB0aGUgcGF0Y2ggaXMgdG91Y2hpbmcuDQoNClRoZSBjb3Zl
ciBsZXR0ZXIgd2lsbCBoYXZlIGEgbG9naWNhbCBPUiBvZiB0aGUgQ2M6IG9mIGFsbCBwYXRj
aGVzLg0KDQpUaGUgQ2M6IGFkZGl0aW9ucyB3aWxsIGJlIGluIHRoZSBoZWFkZXIgcGFydCBv
ZiB0aGUgcGF0Y2gsIHNvIHRoZXkgZG9uJ3QNCnNob3cgdXAgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLg0KDQpbMV06IA0KaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5n
aXQ7YT1ibG9iO2Y9c2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGw7aD01YWQwODY5NzMwM2Yy
YWE1OTI0ODExNmYwYmVhOTJlNDg3MzY4YTlhO2hiPXJlZnMvaGVhZHMvc3RhZ2luZw0KDQoN
Ckp1ZXJnZW4NCg==
--------------rqkVpa0sxTPsWvNmfCcs8IWF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rqkVpa0sxTPsWvNmfCcs8IWF--

--------------p2GdVr8e548YI0r0irlhtWhZ--

--------------DKZJ6iFNZPsrz8aDZxWZEQJt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjvqNsFAwAAAAAACgkQsN6d1ii/Ey/8
lwf9ErQxYZwKfIWSZlfEmWxI/uvyRjMHRXkKfocC+untBQn5sAmBjnoSVXXYByHZ34upQE7FAokz
tnY9qb0IZFnoudLrJTo8OihJQwVuaMbMF4V8qpA+2HC5eBeZ5C4rpYRqouO1NIyFSqfGUKhe3aZB
JonRKUwXR8MjwjajZmJLHbLLKyhhpaYYMqONm31JZCZAbRYFWht9K8cJsY4ACXu3YSz2afb0zApX
us/3JC3xWmv8Aj1pth3IsoAn7vGhiB3wRLT8UxWKzCDYSU1eElq2rdE5NmpOWnI03oDXZX7FQdbd
qQrRjjEdG8kPt7aUJlyLkSXT9yvAZQzFsP2720QJ8g==
=qUCp
-----END PGP SIGNATURE-----

--------------DKZJ6iFNZPsrz8aDZxWZEQJt--

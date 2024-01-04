Received: from algol.kleine-koenig.org (algol.kleine-koenig.org [162.55.41.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED721A1B;
	Thu,  4 Jan 2024 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kleine-koenig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kleine-koenig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kleine-koenig.org header.i=@kleine-koenig.org header.b="OLWdD1H0"
Received: from localhost (localhost [127.0.0.1])
	by algol.kleine-koenig.org (Postfix) with ESMTP id 9AB80C41D0D;
	Thu,  4 Jan 2024 13:46:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
	s=2022; t=1704372360;
	bh=X0RrNNKYyH22xFrGCixPkKZiJMg08gxIzk7tokeWPEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OLWdD1H0vuybsOaYv+BB1RRk/uHy95hfvRPxPAKBCXrbFib73CqcAcXXqZsQc26J7
	 6g1zU3OGJ8DFwA2W9UZ7AGReMcka1KJYGh6QFIkLN/PR22ZR3QPVl+/1nW9Y+XKn1e
	 lXwCAG3c+Yv0Y8LisxCQAEvRU4NHSI4tFeVc32XqnwHLLUhpfkDErwkq0xplBvya0t
	 7+08TwqiUM/T+j3uDbIy0MAz/MmVS7C9YV6thgqxlxaIAI9tvqfnwfmCd3+8c8hXtC
	 IrN5wVef6tNHylYlrmEU3lGqRUOjRRdQm6kbPF3y06sVcAL8JPpJfXgUMUGiJymaOV
	 xKFDdoCW/PYeA==
Received: from algol.kleine-koenig.org ([IPv6:::1])
	by localhost (algol.kleine-koenig.org [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id BoQiDTMrUDLz; Thu,  4 Jan 2024 13:46:00 +0100 (CET)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:fdb0:5279:7365:400:e76f:d19e:1462:62fd])
	by algol.kleine-koenig.org (Postfix) with ESMTPSA;
	Thu,  4 Jan 2024 13:46:00 +0100 (CET)
Message-ID: <c4bc2926-e0ea-4e3b-ad92-2227a66203c0@kleine-koenig.org>
Date: Thu, 4 Jan 2024 13:45:58 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 modifying Cc-tags
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users <users@linux.kernel.org>, tools@linux.kernel.org
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur>
 <20240103004415.42xndtocu2ggr2a5@pali>
 <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
 <f8d3ddc69bd95bc8553b5908523e55e0be245e84.camel@HansenPartnership.com>
 <20240104004108.zs3wlfju6gzfl2mo@pali>
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Autocrypt: addr=uwe@kleine-koenig.org; keydata=
 xsFNBEwXmCYBEACoJSJcKIlkQcTYia0ymmMOBk2veFoy/a0LlqGUEjQ4WECBL19F2BYX1dSp
 5/ZdfKuV605usI6oq4x6k/LKmqZDl6YnqW/YmN/iZVCRunBRfvpTlL4lcNUu5Va/4GBRzBRr
 rrIhCIVL5zMV6hKywhHKTdOHVSZRftf+eRSBwENKXahmfOMDmekyf585etDPdzkFrLHNVFOC
 sFOU0gCK0uVPyY0LH13eo4qEEMi88RCOfwYCFQqKXDdo41DWoDPB5OGCMaphIx9wC/nvtdcv
 MowsGde5iGgmHWK6sdC/O/xaV7fnz1sJzoJB1eT91LkGbdGxsLAT6nqlaNJiJtiBoRhscguV
 xVbn/I9mnUu7bLmTFBEAlaQGU/J7uQ4w94FXfosNGROt/otqltetMZlPbNvNhKnXv8U6eRyA
 P3ZMKTJa4hGr3UdYdt4+MIiHcsANWp8T7oLYVxRbHPXPG49IURnhXUoGbscZmpptWcl29ebo
 qCxL9n3KIyUT3ZB1xHbW3Sk/Dqzf52tQOxZubzrpUJ8zaGIwYVUjfcPFwf3R3zrQvJq7mI4S
 ddNIE8w3WJOPXDOYx7GjOa+IubhSpCrr74NbN8q9oS3hnsqWw16i3HSUuPuYeZo1t6D5p/mX
 EVyZ2QrS1kGgGi7bmlQMSFkb6g1T8aWSYuX3PBYq2VntnWAXPwARAQABzSlVd2UgS2xlaW5l
 LUvDtm5pZyA8dXdlQGtsZWluZS1rb2VuaWcub3JnPsLBlwQTAQoAQQIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAIZARYhBA0lEfMiv6scFYAma+Lc3ZEyZpvWBQJdD2/6BQkaXdlUAAoJ
 EOLc3ZEyZpvWXJIQAItguVGhM5bXhr+T5Dq8tUPUzfEE2agVUhtwNUG1HEqF9Ex5PRRauCN5
 YW318C3MRWgQepr8q2xgQ+Ih1Irl8GCVLh0vIIZRd8DbDSKBiPC0orKkHU4WgX48xl0WVnLS
 hUOt2bk1Vv5twB1a19f6W5ww1x0roxrNtAbDpPB/z0siynnqdQSeiJe+TbPwGT5eginTRiC6
 hf+QGOz2jl0HQBmzabI+IWUuyZqb1kG78U1Si33N8GXCGrHzAKOtGI/7vzqlLGulMcWIRxkP
 U0Yg9FeH033ko16d8g2R2VPaP3ntm0KYaJngrbiTKGj7OXxUSASC7lBY7zf1UzJQYSU9TRrz
 3XZ/4GEDkfQL0M9rPjWBj3HbwtQzURhL4QjC77Zi1OKT8TXrDGOoO8q6Th1y8ipaKOhAakUb
 ywZMCZi1RqOf53RnAquRApHfpu1I+W/iDtI51wZsuolqRlYd/nAbvzKt7SFG6V+ZeV9df6/x
 V3kS2NkNawy/dDqwJWA3gTHX1SEu2y04/qOyH/CR6sLEozQnqxVS343TJxyfJYW7TCwrDz0i
 jEFcy+xyyqvPn0Yc5zp2CnLKiB5JyV3mnz8qJVP0QfWUKKI6740m/1U9nDQYttGlklxgayLJ
 KoEG/FYxEe1m93U8anvxb4IULSHTgfCHpSJjLeVJVXUffH2g3CYAzsBNBGQUsi0BCADZgHzJ
 P/uN+XTyDAKGVz1XpCUhzf3j6Ha3p1rNf8ig4XqeSQDQkBf3NjYJ2bOXXCZygi1UUg9lBSVK
 aIM9DijOjyTMiBOCxr6WxE95f6Q/5XgErDGrME36uAjaaXktQVd0KsRwnOQOemdlEiAEkA9c
 ejevht8RClCUKdIc7eeQ5qNdZoSpmo3SoYlj2nLpljyIcyujTisvJfrpglqTGSjeQPfGg92Q
 5WhmfS+5jqG3VnITYiheuHrZrfpn+TvbWKrxoU6cB7eOca7ea68FDYef9ZYwO8PC+P8bpE6e
 DR1X8tn/dUgESwNIto6Q1HZqeDu9ydcSMgKgGH8Sgeinz+jNABEBAAHCwXwEGAEKACYWIQQN
 JRHzIr+rHBWAJmvi3N2RMmab1gUCZBSyLQIbDAUJA8JnAAAKCRDi3N2RMmab1qu5D/9Oih9b
 8JGTCvR5YzBOcB0tUy18pmK7VqTMGy2wDiUI+mmEpGWW8lkpKWvR+A6YpsZDi58aL102Vl8x
 5qeL1wketV/q0gea/NMxaks0E3FO0pediScb9Ip8mzofchXQstx65r49ypIb7JTuhHGFnOA+
 tDSQdWAPYBD3GBTE8Yl3wcIphb5nR//6n36VmMRJwofCwOCSJ1VD79QmTF85cPN9hibfoRun
 GW6ervJaj7g9cGUlDNMO5MQyeDq13s8Iu3aGyE7wKlE1bynQZmrsIxGvpbsfyS1U9XVpd3Sl
 AOPCxopXPsWaLNrzgwcxBA4/Mgd0RG4MUbMAtfPJl/L4pztvd9ZO54U1LMo8W2pZ8dd9t+8n
 GiJMNSU7VG+iYd60GoMivrt5pbp6R0Dv7ecKNEzkFobdz9YeXQcOI3M4RsrfdfEw4NQEuwtt
 t1rgjMCy4wiP5ZVfBf1udND3x8cZUV3lwakqL2jFCX3wdooHXqU9+pUwZRlbbN1EuEegKB4+
 x6QwF77Ji0nTM/PmfNWtP+LwHS14GBf12u8BEcR7QBFxvlvjkfEXoapN8WTPlck69yYuznHd
 UD4hxvULdkXMJJmDRN/NcUQUGZYxOOEtLy8+a021Ph0968RrWXMqvNhcDYS9ni6xhPRd/zMi
 FBOP7eYxpCTKpsGohvEE2AA0ITl5OQ==
In-Reply-To: <20240104004108.zs3wlfju6gzfl2mo@pali>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cyqF0BKyRUdn08WYQl5cHKAN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cyqF0BKyRUdn08WYQl5cHKAN
Content-Type: multipart/mixed; boundary="------------WzGwUFM1Lh0ttGitJVONMa5b";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users <users@linux.kernel.org>, tools@linux.kernel.org
Message-ID: <c4bc2926-e0ea-4e3b-ad92-2227a66203c0@kleine-koenig.org>
Subject: Re: b4 modifying Cc-tags
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur>
 <20240103004415.42xndtocu2ggr2a5@pali>
 <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
 <f8d3ddc69bd95bc8553b5908523e55e0be245e84.camel@HansenPartnership.com>
 <20240104004108.zs3wlfju6gzfl2mo@pali>
In-Reply-To: <20240104004108.zs3wlfju6gzfl2mo@pali>

--------------WzGwUFM1Lh0ttGitJVONMa5b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gUGFsaSwNCg0KT24gMDQuMDEuMjQgMDE6NDEsIFBhbGkgUm9ow6FyIHdyb3RlOg0K
PiBPbiBXZWRuZXNkYXkgMDMgSmFudWFyeSAyMDI0IDA4OjE5OjE1IEphbWVzIEJvdHRvbWxl
eSB3cm90ZToNCj4+IFRlY2huaWNhbGx5IGlmIHlvdSdyZSBnb2luZyB0byBkbyBTUEYgbGlr
ZSB0aGF0LCB5b3UgY2FuIGFsc28gZG8gREtJTSwNCj4+IHlvdSdkIGp1c3QgaGF2ZSB0byBk
aXN0cmlidXRlIHRoZSBES0lNIGtleSB0byBldmVyeW9uZSB3aG8gdXNlcyB0aGUNCj4+IHNl
cnZlciAob3IgbW9yZSBsaWtlbHksIGdpdmUgZWFjaCBvbmUgdGhlaXIgb3duIERLSU0ga2V5
IGFuZCBsYWJlbA0KPj4gd2hpY2ggbWVhbnMgeW91IGNhbiByZXZva2UgaWYgb25lIGxlYWtz
KS4gIEVhY2ggc2VuZGVyIHdvdWxkIGhhdmUgdG8NCj4+IHJ1biBzb21ldGhpbmcgbGlrZSB0
aGVpciBvd24gb3BlbmRraW0gaW5zdGFuY2UsIHdoaWNoIGFkZHMgY29tcGxleGl0eQ0KPj4g
b24gdGhlIHRyYW5zbWl0dGluZyBlbmQsIGJ1dCBpdCBpcyBwb3NzaWJsZS4NCj4gDQo+IElu
dGVyZXN0aW5nIGlkZWEuIEl0IGlzIHRydXRoIHRoYXQgeW91IGNhbiBoYXZlIG1vcmUgbW9y
ZSBES0lNIGtleXMgaW4NCj4gRE5TIHpvbmUgKGV2ZXJ5IGtleSBoYXMgaXRzIG93biByZWNv
cmQpIGJ1dCBJIGhhdmUgbmV2ZXIgaGVhcmQgdGhhdA0KPiBldmVyeSB1c2VyIHdvdWxkIGhh
dmUgaXRzIG93biBrZXksIGFuZCBkbyBzaWduaW5nIGR1cmluZyBzZW5kaW5nIGVtYWlsLg0K
PiBGb3IgbWUgaXQgc291bmRzIGxpa2UgdG90YWxseSBjcmF6eSBpZGVhLiBCdXQgd2hlbiB0
aGlua2luZyBhYm91dCBpdCwNCj4gbWF5YmUgaXQgd291bGQgbm90IGJlIHN1Y2ggaGFyZCB0
byBjcmVhdGUgZmlsdGVyIHdoaWNoIHJlYWRzIGVtYWlsIGZyb20NCj4gc3RkaW4sIERLSU0t
c2lnbnMgaXQgYW5kIHdyaXRlcyB0byBzdGRvdXQuIFRoZW4gaXQgd291bGQgYmUgcG9zc2li
bGUgdG8NCj4gY29tYmluZSBpdCB0b2dldGhlciB3aXRoIHNlbmRtYWlsIG9yIG1zbXRwIGJp
bmFyaWVzIGFuZCBnaXQgc2VuZC1lbWFpbA0KPiBvciBhbnkgb3RoZXIgdG9vbCB3b3VsZCB3
b3JrIHdpdGhvdXQgaXNzdWUuIEFsc28gY3JlYXRpbmcgREtJTSBzaWduYXR1cmUNCj4gc2hv
dWxkIG5vdCBiZSBzdWNoIGhhcmQsIHNvIHRoZSBmaWx0ZXIgYXBwbGljYXRpb24vc2NyaXB0
IGNhbiBiZSB3cml0dGVuDQo+IGluIFBlcmwgb3IgUHl0aG9uLiBJSVJDIGdpdC1zZW5kLWVt
YWlsIGlzIHdyaXR0ZW4gaW4gUGVybCwgc28gaXQgY2FuIGJlDQo+IGV4dGVuZGVkIHRvIGFs
c28gYXBwZW5kIERLSU0gc2lnbmF0dXJlIGFuZCBubyBuZWVkIGZvciBleHRlcm5hbCBkYWVt
b24NCj4gbGlrZSBvcGVuZGtpbT8gUHJpdmF0ZSBrZXkgY2FuIGJlIHJlYWQgZnJvbSBjb25m
aWcgZmlsZSwgbGlrZSBzbXRwDQo+IHBhc3N3b3JkLiA6LSkNCg0KRGViaWFuIGhhcyBhIHNl
dHVwIHRoYXQgaW5jbHVkZXMgdGhhdCBpZGVhLiBJIGRvbid0IHVzZSBpcyBwZXJzb25hbGx5
LCANCmJ1dCBpdCBzZWVtcyB0byB3b3JrLiBTZWUgDQpodHRwczovL2FuYXJjLmF0L2Jsb2cv
MjAyMC0wNC0xNC1vcGVuZGtpbS1kZWJpYW4vIGZvciBhIHVzZXIgd2hvIGRvZXMgDQptYWtl
IHVzZSBvZiBpdC4NCg0KSG93ZXZlciBkZWJpYW4gYWxzbyBwcm92aWRlcyBhIHJlbGF5IHdo
aWNoIGlzIHByb2JhYmx5IGVhc2llciB0byB1c2UuDQoNCkJlc3QgcmVnYXJkcw0KVXdlDQo=


--------------WzGwUFM1Lh0ttGitJVONMa5b--

--------------cyqF0BKyRUdn08WYQl5cHKAN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWWqIYACgkQj4D7WH0S
/k6aDgf/TNcfo5G4uoOARtD/6D34qUal0K6cEKQLGA8tJ+YQbk7j5xHH+cpWpibP
Vznlq46+7Btp7LgAbsEa6H50/hhUmGPEqTt9lqj+nXyk3Jv2ZQB5I8dAYtMfIjU1
+efnIq85vE9CjPoHnf2AvM6M7kXJeHIp2SjrErD8C1QW6zEYzREFF+mgLlVpFwVX
qF6dipe2p8eG0lSPLzFmwzSHj2LWQvd+Z/HSbM/ufWoULHMAUA4bFUXm3vMwQKiS
xlNg0XjIXjgIqjvsArQXtm5ubXcXU+zHocEaFKyBxx6BHmaD5pJnlaEN0fKw7zb7
boywexu1+iLsd9hsDEup265Gw/8/Rg==
=Jt7f
-----END PGP SIGNATURE-----

--------------cyqF0BKyRUdn08WYQl5cHKAN--

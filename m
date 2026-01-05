Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7696010FD
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767642938; cv=none; b=LqWavZVv9utdySVvWoV+12Zp0+a9XJzGR7HRHQdL2PEFXD6xfSKCluhl5plxF385fqxbARi5MepZA7A98K/BiHu/2Tw4wTOfaU6nMpy1D6g0reEVHBPTV8YKmwmY0hRRe8SB+DB9oKiLwFEcIjdyCQ7Ueiz7RvZ1MKjoiY70z48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767642938; c=relaxed/simple;
	bh=Z7wIl0ztwHklPKkKL1Td2RZDdm59FRigP8kVYMYb8Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLMxBZC95O8IhLGkYVtXjfmSzlF/UtRLmzQRS5l4ppx+ve5S+SNk5PSXTQe8qY/D/dEoXMSOIp60ii+X6OibsiAeFPkwXNlTxF1NjIl4oSKvNdDEld/Ke379foo9XFKzbPKLndfI5rwFbzzoq4dKHaUyUST0UHnsmy5c2o6bC9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=aG+KXRKw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="aG+KXRKw"
Received: by smtp.kernel.org (Postfix)
	id 14D1CC19422; Mon,  5 Jan 2026 19:55:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B975C116D0
	for <tools@kernel.org>; Mon,  5 Jan 2026 19:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B975C116D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1767642934; x=1768247734; i=christian@heusel.eu;
	bh=Z7wIl0ztwHklPKkKL1Td2RZDdm59FRigP8kVYMYb8Zs=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aG+KXRKwkJ+NDhDJV658JsQo1EWwXg2gdrf+hKg9ztLVRyGyoW0qDSXxhwQT+eiL
	 JqmKoNs5bL7Omn538awCKmjWki1iTfLOMQRoS0DAaFCp3R8rWNdGXtXpNgDRd5f00
	 4HyH8NNP5HK7PJgVasFHWOAcHHvtLUhauvGRgP14hFSQ5alZq/1N4aW8QyT97CxW5
	 TBhGn+yWBWDfkuL3B64mRnN6A/uULpKR9Wt8mYlittKGKYjI1jQPopQWnJVHN1vX2
	 mU/YhKHVvWwN3M/Mbfgd2qhOrfpjvOAodasBF6hEpKBizEDKWdaM427/pXr7Q3oRs
	 0bUW+HPYKrpf9zITKw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([94.31.75.239]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MY6TD-1vMijH2ab7-00YM0N; Mon, 05 Jan 2026 20:12:26 +0100
Date: Mon, 5 Jan 2026 20:12:25 +0100
From: Christian Heusel <christian@heusel.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mike Pagano <mpagano@gentoo.org>, tools@kernel.org
Subject: Re: patatt - tests source request
Message-ID: <868a94b1-16bb-446c-a238-8901feb968ec@heusel.eu>
References: <f0fb89e1-a37b-4871-bf0d-23f84ef450ff@gentoo.org>
 <20260105-curious-russet-goshawk-d97fd8@lemur>
 <fc0cacbf-d8d1-48d2-8817-d69e6eb3e049@gentoo.org>
 <20260105-ruby-aardwolf-of-glamour-342acc@lemur>
 <b81c15a5-0030-4ba9-a7b2-cbbdb19d4222@gentoo.org>
 <20260105-sticky-goshawk-of-happiness-d1d9c8@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbwlnke3t3ngbq6c"
Content-Disposition: inline
In-Reply-To: <20260105-sticky-goshawk-of-happiness-d1d9c8@lemur>
X-Provags-ID: V03:K1:AyV2w9+Js4/CB5hzB+2dF9cm5X8bCGqBH5nYxRWcc7BcAaemkHd
 VZAQYO4F+ZKxbSIV3BLNiKxl2QCDnPqzJKlsEk8Kf+9TsE77ywby93CxMeKDjloYNjW+Fs6
 8X4EEh/kJcYrAvSzV5x6F5usy+L6tq3keB72wjquHEp+I7aNee8iutZ52mrquWWvf7tnUCU
 dyjkZg1h5rP2bzHo8JWHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t9YL+q+EujU=;OJ18YM5A0h35YgzJztZAX6LjRr+
 VXHl1onsYlilNHdcESS2giBNhucEWL+cC//Y4UzyCbGJtJE0+xL06pUSDjegRc3lvYOVLLVCx
 qlTYsZmp5eKDx0Knz0xJZnWbE79IkKa5/a7evmyr8pN4VP/KteJPVAVFU+pUid7pssD/oHPbP
 wirM3jdodi6Xfr7JmzH8nnLi/go9IZoo6YF6sqM694G6AL1FDcmJiLiFk0B/cg6djTDzXWhHs
 lfOWR99XvDPHwaHSzf8GwZdvHRRAAYjCe3QSQk++KwrtxbpyXQAbGMld4otaPjxb9weV7gbrD
 5PeEVFi1XoyBHZh+aWlLEeguYIR16/5ezmFTx8l1sOoW/9Q7mcQrEBLMsKhilonwSupdFX2tj
 WkhCi0A+re09f3s0KQnJ4bHbTPmDLel6Iep5Kyczl71zq9sorYOA0Hk4XlU9Hgxo7WJAxdP2q
 9featR9r5mZHddEmEUADPtalbqs9Dq9CkAEzuWc14A3nsyyi0OEvJGtgT0bgiIkGJkhtO/pns
 pYFzfHGzCoUQrv80VtuiK2NK+X7zOTgU132gyvIlbl3Vq8oOwARYrW+IN/7EH25mXIN4sBdFk
 crf4mPtcjkDfZ+sEU4ga8nkQnniDxlCkSgtnR7dBAalXfp2gMQ6WNZJKYqWkuvKymTW3SpXj7
 3phTnYnyas7lOuSfu8h55FLtIqefuwoF6L2guOvFeeRFNXBVOf8ro7QzVo+LGDkt3LTVasI61
 7ZqMWh2xYgrn9IXJOsVHqoxSebGay3hbKFrr3xTHktlrLwJYISiYcuT99caCBChTRY1ke/s3T
 EWUpm2ThMHVvjHlFVrh0OiWRgOzKPpw3UKqGi51jCVAlZZjN5+3eb43+I58fYcAwcBYNq5w15
 nnyJzTIcDr3ekx2bssNjGLNT1PFqd/eOfD48EbC/lOjzTEX8MSl+j7irOurJidwuDqQtHNo3I
 Gze2kS3uZTY7SR710Gltk8Td5FhyMy4tltzcLudhnPRbjNujWbry1/v4x9HV0ECe5jCkeRcLb
 z38zQ2f/wv+XbfnlrFFkISTCRR/oYLhwqUcueVCx+RNMTS7GZyPX+kpQjd6ZI8r3c7KJr+Zb3
 YN43xLeQhWYK9B2CPSlRB4vUKVFyFGgUWEM/U362z07lGJ17Ai40Js0965zPplmZIQ8XKakXs
 FNqvTmVunjBXWvOd6NPCJV3e1s4twJsptk0wyyyRmaKF+jelJsHHTMxhQA5YTbd3GPR7au1el
 5YgmOBfLQ2PmVZxxI4hMxqznlk9JulJdSNSgCXE3oGXVT74Yp3Bfkbex9c33RxZS+4Iqz2hKf
 8ad78vumJ7nkKgXlYSvF5WALt+rDcBjnKAePrjmE+2c9+LvyC4yVBLwTTUovGjJFH0YtD0Lvt
 6ekeMEa5fiBzULFzUQiX5dnXA+3fiaV0sjYjJmchDkrU3KZTWY2c8VNAs+j/XEPeZrnPG8MPY
 x77Cd5CXsfzkr3XOUeloc9BBxY+GxdiYGoZFHoHPy+MI+OcbAdOqseqnJRssD+O0A8mkYVkg9
 uefbT2svlmr8Dt4PQuhmBhcQ0LFE6KBkAhjsIwxo+4Ir6cQKubHmwglWTURJKURLQiHmCvKbz
 Ul1w7kxUPeFaQMwc9R1nO4N1eGnY1V8BdnKGsJi+XjNisblwJNnZyklj8z+07o17NWLEy7TQD
 yXaNIcJTBsVBw4YQ6hk0mrPiXGWjQ9AAhytzJeyCQZWP0V6uHgPSVnph/Vt56AHELyMT9BPX7
 UM85AGFiFRIjlaJgwpvtWobarEM4aDnGUlg==


--wbwlnke3t3ngbq6c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: patatt - tests source request
MIME-Version: 1.0

On 26/01/05 12:20PM, Konstantin Ryabitsev wrote:
> On Mon, Jan 05, 2026 at 12:02:04PM -0500, Mike Pagano wrote:
> > > Did you download yours from here?
> > > https://www.kernel.org/pub/software/devel/patatt/
> > >=20
> > No, we are downloading from:
> > https://pypi.org/project/patatt/#files
> >=20
> > I will update our URLs to download from this URL.
>=20
> Hm... I'll check why pypi's files are different, but yes, please use the
> official tarballs (that are signed, anyway).
>=20
> -K

The sdist tarballs hosted on pypi are apparently often times different
=66rom the "regular" tarballs, which is why we default to not using them
on Arch Linux:

https://rfc.archlinux.page/0020-sources-for-python-packaging/

Cheers,
Chris

--wbwlnke3t3ngbq6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmlcDRkACgkQwEfU8yi1
JYUWeg//Ykha+Q+eVPxj7JSfN9nqR3pIJ+v4SaS8O8zpZLeI63IWR/89za5VTroU
uZY4tV6kn+Ez8AeUbiij66Zt3eYvG96lOou5ViOGRECTPOxqUSkxvwWBTkgJFZmC
ScvrgtmYXESYVPUlNmQQyBpT8WLRbbiRqah50bJ1SPfWdfeJmNuthKfzZr/9MhN7
VmI3pAtFcbXWRbMUxevQiQv543yliDEAbygJssCn4iOwGCse5wTBPXkeN+DERu4+
ZLFypnvmM8tPfQ8VFNJzrdKeoklILr4qv3fdgT6JiKiqCg3jBe3UAgbg9df2Puwl
06G4xc5WJoxz+v+QSJnVgr5zhbNFlpvTxw+1iWxeiXpvQvDcqh1nRagBOK9+KCkb
ULQTGbzv4PMCxV49fzKJ468SpuC+WmxLjQdI/xk10jzw6Dx13XvkgI/BNpNIHk7E
nuat5jGolwg+E0xtk+ivTPD+0M4T5lOcu+VFGr0Trkb26nObuDs5tb+MdwgrqTDH
RXTMMFUkJJWWBcUKUUsztvFI2oKQbNQ4YXvowdz9XDcvzRdjsVQm7c3+1f8hpbAz
K2xpfqesE9+4pJxzssV4pHr/Lh/jBnH+taQM3xvEwLZTAOwNvXT1FRnIMd9hS3hG
TZ9y4VnFl/YhqsRWYmTMI90rmYqMhXQ+XdM6Pe10F9EPoaixi3o=
=Mbf4
-----END PGP SIGNATURE-----

--wbwlnke3t3ngbq6c--

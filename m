Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B271CA45
	for <tools@linux.kernel.org>; Fri,  4 Aug 2023 14:10:25 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-76c93abeb83so165251285a.0
        for <tools@linux.kernel.org>; Fri, 04 Aug 2023 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691158224; x=1691763024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPz4nhsWPoYCutIAUQz4k2i5d13R4ExRrgXURQiYpFw=;
        b=fBA0Z94qOQJmrDCQikNn9eOyIpoGgICx804SIJotwJ4msDI8n+Mo1UBHTRfRP8BXri
         kbbw7VqmovFGMIu+QwK7bOvlokwq/Ps7Kc+QvrEILWmRfMenivt/on5xHUcHBBqonmPd
         PkRXqbhnqvqrQZ53Iq9AoWWxoxAOSeXzNcsPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691158224; x=1691763024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPz4nhsWPoYCutIAUQz4k2i5d13R4ExRrgXURQiYpFw=;
        b=Vejib5n6DuUe+xpes/yYRfsUdlg+N0EWAfFI5p28k8hYNwYgv8bMnN5saEuCEEJrhH
         1+4quUeF2ZuDE5yfyPRJMUdwbbanxktd/Kwnr2dOPxR9/Zy9LWDFXAGCK3FQg+KkTSyn
         Y+b9ym+DTPHGaKehorzXTil6wxR00eMYlEOtdhlp9WHXmEqVkErcEHq6M3eRLnd88jVv
         TJJCPyutzgeAgkcD3qiTAdKzGqPJPonM/9Md0bO+w65aXALuZx10T7H8bpTJfYiVBhh9
         Nro9NdcbJKxNUuMKRgXIDvN3dKJ2i5r/F1Ci4UMoyxzZGgFMDqpzjX4B+SWkyoUa+a9g
         AM5g==
X-Gm-Message-State: AOJu0Yyt/e1gFstmc4dNCq7c83DniGvaMYINT8qU0Wcdc4i+LtlSyRQr
	+w1ZO49C3zEQ5YCA226gmKnurQ==
X-Google-Smtp-Source: AGHT+IG5HsGdyF7rz3JlyMrsZWC5qZfvONlTNRM8+Jtjsx/o6umMBJtxcqx1iELfCipkjCx8gYEPXQ==
X-Received: by 2002:a05:620a:1aa5:b0:76c:b12c:2ff1 with SMTP id bl37-20020a05620a1aa500b0076cb12c2ff1mr2165586qkb.66.1691158224041;
        Fri, 04 Aug 2023 07:10:24 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id 7-20020a05620a06c700b00767b24f68edsm664443qky.62.2023.08.04.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:10:23 -0700 (PDT)
Date: Fri, 4 Aug 2023 10:10:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: End Date in August bug with lore?
Message-ID: <20230804-niece-pregnant-7db381@meerkat>
References: <jbgsz57nc27lwdgfmhyoruvybzwa7dsphdhsiga2zkvnehj5cf@6atzulc4kpad>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lx7ug76itbcnnoyb"
Content-Disposition: inline
In-Reply-To: <jbgsz57nc27lwdgfmhyoruvybzwa7dsphdhsiga2zkvnehj5cf@6atzulc4kpad>


--lx7ug76itbcnnoyb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 03:50:52PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> (Sorry, sending the mail again with the ML)
>=20
> Hi,
>=20
> I've encountered a weird bug with lore, if I do a date search that
> ends in august, it doesn't return any result:
>=20
> https://lore.kernel.org/all/?q=3Df%3Amripard%40kernel.org+AND+d%3A30-07-2=
023..31-07-2023 -> Works
>=20
> https://lore.kernel.org/all/?q=3Df%3Amripard%40kernel.org+AND+d%3A30-07-2=
023..01-08-2023 -> Doesn't Work

The date should be in ISO format.
https://lore.kernel.org/all/?q=3Df%3Amripard%40kernel.org+AND+d%3A2023-07-3=
0..2023-08-01

-K

--lx7ug76itbcnnoyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCZM0GxgAKCRC2xBzjVmSZ
bNNdAP9cd1s1yjXU9y0gddo99a0xIjDEI0lAo7Jx3KmkPhTg+AEA/E1fzQjloOu2
MUf7dJczNvry0CM1jTuGK4DdGbDHzAg=
=duAE
-----END PGP SIGNATURE-----

--lx7ug76itbcnnoyb--

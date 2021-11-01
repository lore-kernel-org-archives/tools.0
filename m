Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993A2C8E
	for <tools@linux.kernel.org>; Mon,  1 Nov 2021 21:03:02 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id br39so4676318qkb.8
        for <tools@linux.kernel.org>; Mon, 01 Nov 2021 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QGfF3G4ZSO5Or9UsksHX62Pusg06Ym+I7UDJgvxBwVA=;
        b=SaD3ss6UVleAlcyDT3Yb/nZcBcondBs1ZuWAkYhbzwfYDZv/rJv8i7EUj83VedzYPJ
         PPC3ZfjujN+967FVZRSJRJom2s8G8yv+8Ijp17g7xCT3AC60zJa3iQdk7yZE0iQgf2S0
         qc/wG6YTrr+roYO0zG/jRdvOEZ4PWduXiWxF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QGfF3G4ZSO5Or9UsksHX62Pusg06Ym+I7UDJgvxBwVA=;
        b=7v9o8BT4NIzNWYXI5tk17NUcT3nVwt1jNHGOjZBvIrHUpMx+9nTywinbHKuBkZxQhw
         zrAwvFnlXTznlaVvhsQwNi1xZGvRTuVLhQvQNbw+qPSARHTvsPGQiD41zJHN+CZjwZhH
         X5QNmGaMD6zkfZ6HD5Tzo9kLgIbtCHfpO39nXsaRmnQxZwpwqqldS8WC/7LQb+HO2jkR
         RCsKvr5ysxZY0AFv0lHA/lEHBfcDcH0DUyyT7/nwKyYAdbQjrnYM67a8YvZ5jHB0zGUi
         nWqymRi+c974gfs5jmH9056URpC+GKmakZry7tu0zOC7QBU3x9vvrtykTfnzTjwVXOQe
         GB7Q==
X-Gm-Message-State: AOAM533sFGCzHPHHFg5lL1ElcCgrvxj7kIK7ANb/vFp0MX9QOZ3jjPbR
	CudSamHER0UvoZhtEq/lY2sQHTzrj5ZFnw==
X-Google-Smtp-Source: ABdhPJxEBsmbnVh3UZS4HsLvADdygi2b5vUUIEIP/Jxz/UV7N2LoAvMXu3JV9m5BCRKFEq2iIHsNkg==
X-Received: by 2002:a05:620a:40c7:: with SMTP id g7mr8327772qko.330.1635800581242;
        Mon, 01 Nov 2021 14:03:01 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id t13sm6615510qtw.37.2021.11.01.14.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 14:03:00 -0700 (PDT)
Date: Mon, 1 Nov 2021 17:02:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>,
	Eric Wong <e@80x24.org>, users@linux.kernel.org,
	tools@linux.kernel.org, git@vger.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
Message-ID: <20211101210259.2patkw62rkemdqlt@meerkat.local>
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
 <20211101190905.M853114@dcvr>
 <211101.86bl333als.gmgdl@evledraar.gmail.com>
 <20211101202220.dlcebvckeoz6c26k@meerkat.local>
 <20211101204914.GA16445@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pn2g6p64hawgdpnr"
Content-Disposition: inline
In-Reply-To: <20211101204914.GA16445@duo.ucw.cz>


--pn2g6p64hawgdpnr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 09:49:14PM +0100, Pavel Machek wrote:
> > I think the following would be a sane check:
> >=20
> > 1. are there unicode control characters (CCs) present?
> > 2. are there other characters from RTL languages present in the same li=
ne?
> >=20
> > if both 1 && 2 are true, this is a legitimate use of Unicode CCs. If on=
ly 1 is
> > true, then it's likely worth a warning.
> >=20
> > Maybe even relax #2 to just check for unicode characters above a certain
> > barrier where RTL languages live. I think everyone will agree that if t=
here
> > are unicode CCs and no other unicode characters in that same line, it's=
 likely
> > not a legitimate use of control characters.
>=20
> If you are worried about malicious patches, then it should be easy for
> attackers to add some RTL characters and escape the check...

Well, the point of this attack was to trick the reviewer into accepting code
that the compiler would treat differently (e.g. something that looked to be
inside a comment block is actually outside of it).

So, if attackers include some actual RTL text, then the reviewer would no
longer be (as easily) tricked because there would be stuff other than just
invisible characters in the line of code.

This actually similar to how we treat unicode domains. Most browsers only
allow unicode domains when the entire domain name consists of unicode
characters. I suggest we take a similar approach.

-K

--pn2g6p64hawgdpnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYYBWAwAKCRC2xBzjVmSZ
bJz0AQCVJ8fxeC3GQJpFr64VwhBIEH2YMLVBUDC521BJRU9fkQEAoHZ5nIcqWYSu
mlkiYs+ipc3LyCL2vXBhbPulxAiStgQ=
=V/dh
-----END PGP SIGNATURE-----

--pn2g6p64hawgdpnr--

Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD23FC5
	for <tools@linux.kernel.org>; Tue, 21 Sep 2021 12:49:29 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id u21so18726774qtw.8
        for <tools@linux.kernel.org>; Tue, 21 Sep 2021 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wMaGLsWedMhIdjMVI+7NEFrirfMcUbWTxTS5xGQ8Mvw=;
        b=RY+kw2yPsxGCkHu6xTv4RDHX/wHxayPvVaOgx5HKy7HZx3uXu1YH3OiulmKyp/5i8I
         4Twb7yIBnJz72YEMq38VYAwXTEU2VEEJO10EPf+HtWXCjeHdwR8xULpPJcp8Yc0e0hJz
         9DlrHaxdFjGtnNsTmKPrkO47f2nH3/aDux5gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wMaGLsWedMhIdjMVI+7NEFrirfMcUbWTxTS5xGQ8Mvw=;
        b=hdm8N6wuTNzMCFldfz8OHyBSKbtosQRFB2N0n87CXq9kk0wVAXz5s1wBEVcc5uDrDv
         us3S+OM3mRL6SW5+MT4GydudZYT+O89gdnz1wmsI/mL08o0JI5CZwdK61fBJ7aSS9qzm
         VflzQmauvffFCJ8urYTbfn3gQuWBtPh/8tN32zoPS7MAPKBfvUzcad9j04/93plXLnp2
         CdN2gU1Htpkf1i2l8eINkEEXbK6p5qVSw4+nAUPZeAoLQpXa6qrd85iJGASu3DnMVaqQ
         JCk9QB8xhvu205L9w73Bp8+P3KoRiiA4+fxeH3CwKWm/4lbASv9lKLomsJ8OsutQIKL3
         MZ3g==
X-Gm-Message-State: AOAM531jkNPiEe++8UQ/bmXIFoySbKu8YCtPlVIYYpcVjfBJYZHtlXgp
	yPH8/kzF4OFfcXyqe247WrY/yw==
X-Google-Smtp-Source: ABdhPJzAmKdVVBSyKWY4+plBK5iqjVMR/PmzDa81/u7pkwEavKXomJnDavJ9Z6nk2gXGqfvgAiaGqw==
X-Received: by 2002:ac8:5b8d:: with SMTP id a13mr27355695qta.130.1632228568345;
        Tue, 21 Sep 2021 05:49:28 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id p12sm10590437qtw.54.2021.09.21.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 05:49:27 -0700 (PDT)
Date: Tue, 21 Sep 2021 08:49:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Issues escaping Froms
Message-ID: <20210921124926.5j5z4pdedkk4ulwc@meerkat.local>
References: <20210921115544.GB4203@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u2pon5buikuiap5k"
Content-Disposition: inline
In-Reply-To: <20210921115544.GB4203@sirena.org.uk>


--u2pon5buikuiap5k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 12:55:44PM +0100, Mark Brown wrote:
> Attempting to fetch 2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se with
> b4 am I get a mailbox which is for example interpreted by mutt as:
>=20
> ->    1 N   09/16 Peter Rosin     (1.7K)
>       2 N C 09/20 Peter Rosin     (  0K) [PATCH] ASoC: pcm512x: Mend acce=
sses to
>=20
> Due to the fact that the message has a From line in it as well as a
> From: but that doesn't get escaped by b4 so mail software interprets it
> as the start of a new message in the mailbox.

Unfortunately, the "mbox" files that git expects for "git am" are not the
"mbox" files expected by mutt and other MUAs. If we escape the "From " entr=
ies
as mandated by the format, they don't get unescaped by "git am" and make th=
eir
way into git commits:

    https://git.kernel.org/torvalds/c/137733d08f4a

There is no working around this, short of saving everything as maildirs.

-K

--u2pon5buikuiap5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYUnUzAAKCRC2xBzjVmSZ
bCjVAQDIxaCsNhwTYytAPkReayUpROfodjjRz/NG4bRMAPyztQD/TocQ2+vBIdPx
FrNzN+hkwgluVdjCXkz7kSix0DIFVw0=
=bCgX
-----END PGP SIGNATURE-----

--u2pon5buikuiap5k--

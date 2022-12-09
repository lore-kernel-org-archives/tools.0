Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968B3214
	for <tools@linux.kernel.org>; Fri,  9 Dec 2022 21:09:35 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id ay32so4593848qtb.11
        for <tools@linux.kernel.org>; Fri, 09 Dec 2022 13:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SD5LEHnT0choF/M4cKVkKIfxM8B3z5AkYCuTf/U5Nb0=;
        b=ZzpI7qRRDemu7M9Ev+jPuPqSsk5qhiof5B1yTMPxO0lmTh41qBX7dtvnrv7yOFv7xM
         aFN32xrXglWofudExVT9LIddGyH1oPRhmNJ43vp00T4cRX1yH8oedLxihCq9c/shPjc7
         1i2xIp4Nz3dTJqsXLLFTRg+qnYLMzma7TMH18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD5LEHnT0choF/M4cKVkKIfxM8B3z5AkYCuTf/U5Nb0=;
        b=ig0TxXq87a5VybPlsXILJI4mZpA67fY5JKKpCegUNdYho5YkeGEcI6K//9nSmo6sE6
         EW9ka50y73SoJ40Nvxg/fn9RP8Oyt7Ed2dQjfwzjMuNPA21VYGeAr3Ir93KG2uc+aSbC
         k86jXKRYmGBHYYEgGP4027rIe+YiaKe5ZUGhnbC56lMev8d0rHSKZ7aIC9KOJsRF/EIK
         0MAkZ7oo4LvC4QXw06LfjVc83YB2iXdSAxN3xZCDHlyqPtUa0uyL9WugpxU9K5gXYzeJ
         Zh2gLlkaM02D1zTkDvUkKSV+rGk+IRpkg/YtMVClJUfcIQffxUi1GqUnCuxRjAHpewOW
         PnXw==
X-Gm-Message-State: ANoB5plZN+er05QwspmhcWXMOyrVVVZaN4h5BrzLuZQmhVOcdHv9/+eF
	yPF2AQX6Mw13O3joIGJD+nTDkQ==
X-Google-Smtp-Source: AA0mqf7cIb1MCOA38KY9MYQEWpN0e+9gMaU6OG80GogwWQdSNVZezYug96oD945HgXEkPshQanQ2Kg==
X-Received: by 2002:a05:622a:c8:b0:3a5:fe93:7dd9 with SMTP id p8-20020a05622a00c800b003a5fe937dd9mr12446698qtw.44.1670620174589;
        Fri, 09 Dec 2022 13:09:34 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x18-20020ac87312000000b003a50c9993e1sm1585652qto.16.2022.12.09.13.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:09:33 -0800 (PST)
Date: Fri, 9 Dec 2022 16:09:32 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Feature requests
Message-ID: <20221209210932.rabvalmiry2a3zge@meerkat.local>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
 <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
 <Y4/VuYDJq9aUQiPv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vfbjhau5cvnbukq4"
Content-Disposition: inline
In-Reply-To: <Y4/VuYDJq9aUQiPv@sirena.org.uk>


--vfbjhau5cvnbukq4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2022 at 11:52:25PM +0000, Mark Brown wrote:
> Hi Konstantin,
>=20
> I've had another look at potentially adopting b4 prep/send as a
> replacement for the bits of my scripting that it covers.  I did
> find a couple of gaps that are causing friction though:
>=20
>  - Some command line options for extracting the metadata for the
>    series would be helpful - the main one I'm looking for is
>    series.revision, some of my scripts operate on all the
>    branches I've got that have unsent changes which I could do by
>    comparing the current version with the last sent version.  An
>    equivalent of git config get/set for the series metadata would
>    cover all this and more.
>=20
>  - Being able to get the commit ID of the metadata commit would
>    be useful so I can do testing on the actual commits in the
>    branch (when using the commit cover strategy).  Alternatively,
>    I'd use this to generate a list of commits in the branch so
>    that list would also do the job, but getting the ID for the
>    metadata commit seems more general.

I believe the latest master should have what you need:

    $=C2=A0b4 prep --show-info
    branch: b4/bupkes-bogus
    cover-subject: [RFC] Another completely bogus series, ignore
    prefixes: RFC
    change-id: 20221205-bupkes-bogus-8f0db5172091
    revision: 6
    cover-strategy: commit
    base-branch: master
    base-commit: bce9332220bd677d83b19d21502776ad555a0e73
    start-commit: 8398c66ced5379a8b84d59ec7f703e9809b17c12
    end-commit: ae4436d441721dd884355b637f02dbc620ad422d
    commit-ae4436d44172: Rename linux into pengux
    commit-c0075ed67f3f: Makefile: Make it a ninja penguin


>  - It would be nice if there was an option to sign the tags used
>    when tagging sent branches, especially when signing the actual
>    sent patches.

Theoretically, this is already possible via tag.gpgSign =3D yes. Would that=
 be a
suitable approach?

-K

--vfbjhau5cvnbukq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY5OkDAAKCRC2xBzjVmSZ
bJv/AQCWlnrD5JRyTmmVvI466FuQlmndS/b8tQSBvWkMHpzZZQEA1jnYkpP8x5SK
arQIbbOppiULyFgnrFntMoVIkKygXAc=
=zfQF
-----END PGP SIGNATURE-----

--vfbjhau5cvnbukq4--

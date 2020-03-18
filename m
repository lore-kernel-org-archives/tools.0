Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.1202.1584565643680937289
 for <tools@linux.kernel.org>;
 Wed, 18 Mar 2020 14:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VpKilTNs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.65, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f65.google.com with SMTP id q73so4332468qvq.2
        for <tools@linux.kernel.org>; Wed, 18 Mar 2020 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k5uQjQ8cRT/6fCi7bJEuOUGyX97t6YMEQs+pcLt9PQg=;
        b=VpKilTNsu3s66iOzRt8G66gkRUsqhiVJb3FaeUfjYFnGyj4YWevHG0ST7a8zCacJTh
         vFEC2N/KVVhV81mTra7WLxpd86BaeHag7Ms987DPkODKVYqgo4aLKXEhvHihlEl4e8De
         UXwhTFaTyvbv9M5W+rOKFT0C3Qa1Q1r/PxGQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k5uQjQ8cRT/6fCi7bJEuOUGyX97t6YMEQs+pcLt9PQg=;
        b=DKhhaONSmA1jo7irCjSG/6FYrcPRzru8+PegnqJfixW5Yod6C0H73IkXRWkDMj3bZr
         UH54D7dZc18kqGF3pq1z70KDtY7Ihza7oBJw1F3xr7RvGicVBkAWYJcyq4r9zRinUnvJ
         pZVBXX6vCi9oxKr7t8Ry1I1dZic9JzYmySi0NtPTYFL2DV8ONQDHMEP0LjCfQkS+nRkM
         m5KDiUU6D36mXbHK0QxJvTYvicrTjb2KTGIClbt6yEqRO8AYi/J2m2zeKAnXy2tlaKKn
         NRdSNZZL1hQO74uwqjCqtqiRPnHob8v+7KvAkg+GFUwLxw5VGpsVOr42Tkidwkrmd9GQ
         YELA==
X-Gm-Message-State: ANhLgQ3Ik0x91zd2OwforSHRYCeaptp8LdEOKer+hNfsRalqWWkN/3eK
	4fFbt1uY4bdkImOL2ZCJciwFxA==
X-Google-Smtp-Source: ADFU+vvft3+xtR8gb1umOYQnSaaeivStkk5q2sWWArawxkU7oqGW0sv9rfhBsgdeajO4WKwBELVxrg==
X-Received: by 2002:ad4:4442:: with SMTP id l2mr6307116qvt.198.1584565642778;
        Wed, 18 Mar 2020 14:07:22 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.207.139.2])
        by smtp.gmail.com with ESMTPSA id b6sm5238123qtj.15.2020.03.18.14.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 14:07:21 -0700 (PDT)
Date: Wed, 18 Mar 2020 17:07:16 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 not finding patches
Message-ID: <20200318210458.m4vkzhkjw52puodx@chatter.i7.local>
References: <20200318202335.GF4553@sirena.org.uk>
 <20200318203838.jb2q4g4sxstob75e@chatter.i7.local>
 <20200318205914.GG4553@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200318205914.GG4553@sirena.org.uk>
X-Groupsio-MsgNum: 6
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jhygi6evfzo4nfv6"
Content-Disposition: inline

--jhygi6evfzo4nfv6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2020 at 08:59:14PM +0000, Mark Brown wrote:
> > >    https://lore.kernel.org/alsa-devel/87wo7kolfa.wl-kuninori.morimoto=
=2Egx@renesas.com/
>=20
> > This is because the cover letter is the only bit where we see "v3":
>=20
> > > [PATCH v3 0/6]
>=20
> > all other messages have
>=20
> > > [PATCH N/6]
>=20
> > I'm not sure if there is a reliably clean way of handling this=20
> > situation, but I'll think about it. For this particular case, you can=
=20
> > just pass -v1 to "b4 am" to grab the actual patches.
>=20
> ...but not the tags added to the cover letter which is the main reason
> I'm doing this :/ .  I do see the issue given people sending new
> serieses in reply to existing ones though.  Perhaps some heuristic about
> lack of ambiguity (eg, if we're looking for six patches and find exactly
> six patches)?

This case is probably easier, because it properly threads those patches=20
below the cover letter. I'll work in some logic to handle cases like=20
that:

- patches have no explicit version info
- the 00/NN immediately upthread specifies version

in this case we can fairly safely apply the cover letter version info to=20
all patches.

-K


--jhygi6evfzo4nfv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXnKNgQAKCRC2xBzjVmSZ
bNWmAQDo4JoXudW0yD+1RB+/VrztuMpN2vEVs2Ovp1/TBPAMrQEArxg95nQAX97K
o2IDNNqJyVhpGf5ZU7YlWHzseI4vXgo=
=Fo/+
-----END PGP SIGNATURE-----

--jhygi6evfzo4nfv6--

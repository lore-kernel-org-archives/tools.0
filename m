Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AB2C8B
	for <tools@linux.kernel.org>; Mon, 25 Oct 2021 21:50:41 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id t1so8190433qvb.1
        for <tools@linux.kernel.org>; Mon, 25 Oct 2021 14:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uggdsXGn59aYgkLfJizW2dZEpM4CIOLiCMjfmKTtk3E=;
        b=DnpEAmixpSGQlWkd3zVwHR34MZoxuvAWqtKB/6ZAsJrne3cUjnHYs903gxSXb50Jco
         GN8EsGpdN1lwW+LodUZsZ5rbfGft72YenAg5iXPyMBnvBaOEbR9GeAlhAhKKJ7tDu8b4
         Lf2nBpGtbulGB9QdfJwZ9boVQ/MAVczN9+BOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uggdsXGn59aYgkLfJizW2dZEpM4CIOLiCMjfmKTtk3E=;
        b=PHqPXuxU9YqBS4XWfBc31zqQ8BB0cbfh3tT1w2LnPJMt5+cnFtxtX/cwDwr4Bjfw7e
         qi2HdSRbqUocNXM4EeVACHrrOIO3TnyDjzgllR2mVd12QodvheGkHZ7DBvlnVP2EQjNI
         QOCeMCZ2p83wMcOj14Lb3bHb9PCNNoTx0O+DkqqlZH6dSa3cL7c9hPISOg6zTtKNH7jd
         GPpqTLms0JHFcQLbOJGbpzg06XPv7BloDcGR+EFzWjdmKWkoZcGYy+if/JAJVdg0BhjS
         Wl11QmKeLxO5qQ1kMlJYH3v7NxIlyrDVpz4bGn/d6/05cD5zEYiVGiexavJ2wnZJRHbc
         zenw==
X-Gm-Message-State: AOAM532L3SkrowMiAFh0LWGwuukYj3YUpKZiv0+5m0Uf4fpJSvClfsVe
	gIAO8VL9lrKOaS1b3K3LqXcSnG9CZt4zGQ==
X-Google-Smtp-Source: ABdhPJys2rw5Xvh9l5pzU0571aws7rDNmYttOgwzD+jyrNCCyk/cLNjJyBWcDtVsxcZFSU+IAGOK2w==
X-Received: by 2002:ad4:5988:: with SMTP id ek8mr18235473qvb.29.1635198640261;
        Mon, 25 Oct 2021 14:50:40 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id g18sm9066007qto.71.2021.10.25.14.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 14:50:39 -0700 (PDT)
Date: Mon, 25 Oct 2021 17:50:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: shazam and ty flag changes
Message-ID: <20211025215038.iimnihsw57u7bjvs@meerkat.local>
References: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
 <YXcHfu5mTWkiHY6L@sirena.org.uk>
 <YXcMYRe5fsHlYIeL@sirena.org.uk>
 <20211025210914.63j2q5cuslxwekwg@meerkat.local>
 <YXci+zYdqNmv0fEF@sirena.org.uk>
 <YXckZtqzanA3QwC0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fcclvzrqm5ulttb6"
Content-Disposition: inline
In-Reply-To: <YXckZtqzanA3QwC0@sirena.org.uk>


--fcclvzrqm5ulttb6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 10:40:54PM +0100, Mark Brown wrote:
> > 	[sendemail]
> >         smtpServer =3D mail.kernel.org
> >         smtpServerPort =3D 587
> >         smtpEncryption =3D tls
> >         smtpUser =3D =3D broonie
>=20
> And now I put this into e-mail I see the double =3D there which is what's
> breaking it *sigh*.  Sorry for the noise here :(

No worries. As I often say, my favourite type of problem is the one that
doesn't require any effort on my part to fix. :)

-K

--fcclvzrqm5ulttb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYXcmrgAKCRC2xBzjVmSZ
bPheAQCEebBu0b/N5ouck/ssmRauhmD4i1GcDkTVnLvVaSnGrwEA7I/hgMhL355H
SawoTjclwyYP2T9WOKtM3Ut0aNXV5Q8=
=89p4
-----END PGP SIGNATURE-----

--fcclvzrqm5ulttb6--

Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203053214
	for <tools@linux.kernel.org>; Fri,  9 Dec 2022 21:06:01 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3f15a6f72d0so68147077b3.1
        for <tools@linux.kernel.org>; Fri, 09 Dec 2022 13:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezLIhP0zsxzmo13QYms/rwu5E0vFxVU1sYpZ5/vbfJA=;
        b=Lw9Bf9XYuMBYS9KGbktRG9kvNtJucHPfEcEQdWKWpvKUVNsUApqmcBHtf9Bu9m6GAX
         l+4UK1DAyWRRshLJuTfahUILEcp0MDrtUkgeHVvBjqIMJYxr7D3iQs5You5+hRaFKjV8
         xc/OOgEGlzEbEYo4VnhcQ4jQfENBXC7zFVAuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezLIhP0zsxzmo13QYms/rwu5E0vFxVU1sYpZ5/vbfJA=;
        b=lVfA/ccDFIMyouqIU3AmvySSVrORQ5NkslTctJ8uJEobiKmQzquJQBpxhIcLzOc+84
         yH8e2Vo5Y2TrV2KsYNIxEKatH+EVbwnI1LmHyEak8U/06iRK2J8Y7rxy1azg0VjGhYEu
         mlzCcZ3/SPdCGQ9atti038vvhLA7WZlGiQzAMtI004myhCBYlJEKfdd1T+1WT6WwT9c1
         qOGmFXH8yQrUnmS7wWFJswbCtmTTuPtmFcA42NflCi4lIdoyEK8A/EkmpMp/vbSAmnsH
         J/58m6KZ/UDQf5tBgVqDu9TJeNAdrMfgyuMjOX8chmw3sNdIVuPwHaxMV1EaIN2JlQFj
         VU7w==
X-Gm-Message-State: ANoB5plLsA5N1biIBxXE4syHYmk+PNGeEAyJREv4/m6UFSPmoPdZu1tb
	56gryQb2m5cW2Yr4BHdwx2kKetQonKap0bER
X-Google-Smtp-Source: AA0mqf6gHEvQNnmrRpbOGWrrFgHBo5BzT2f4F4f5bHnAd8zvx3q+BRGlTISUq4Ua6TD7OwWGtK+nDw==
X-Received: by 2002:a05:7500:6d0b:b0:ea:a2c4:c346 with SMTP id kd11-20020a0575006d0b00b000eaa2c4c346mr842503gab.68.1670619959857;
        Fri, 09 Dec 2022 13:05:59 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y5-20020a05620a44c500b006f956766f76sm751850qkp.1.2022.12.09.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:05:59 -0800 (PST)
Date: Fri, 9 Dec 2022 16:05:57 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 send needs a subject in the cover
Message-ID: <20221209210557.dii35qbb3iltxsgd@meerkat.local>
References: <Y5EbjU+W7vcqtE/d@sirena.org.uk>
 <Y5EyJaSdOXL3Nzwg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kle3dt2kbmtgldux"
Content-Disposition: inline
In-Reply-To: <Y5EyJaSdOXL3Nzwg@sirena.org.uk>


--kle3dt2kbmtgldux
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2022 at 12:39:01AM +0000, Mark Brown wrote:
> On Wed, Dec 07, 2022 at 11:02:41PM +0000, Mark Brown wrote:
> > If I've got a patch series with a single patch in it then there's no
> > need for a cover letter and if it's the first version no need for a
> > changelog so I'd expect to just delete all the text in the b4 cover
> > other than the recipients.  However if I do that then what seems to end
> > up happening is that the first recipient gets deleted, I'm guessing
> > parsed as a subject which then doesn't get used due to this being a
> > single message.
> >=20
> > I can see why this happens but it's a bit of a gotcha - printing the
> > subject might help make it clearer what's going on in this case?
>=20
> ...and further if you look at
>=20
>    https://lore.kernel.org/r/20221207-arm64-mvfr-fix-v1-0-0c739eb77bea@ke=
rnel.org
>=20
> you'll see that the to and Cc lines end up in the sent patch which isn't
> entirely what would be expected.

I believe the latest master should fix both of these problems.

-K

--kle3dt2kbmtgldux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY5OjNQAKCRC2xBzjVmSZ
bIQyAP9L/lQG2Cb69dn8wLNVBKWVFstjAC6lzDco24sFJgWCWgEAhraFNwgqa2+z
5K2woMjxKko9V6KclZpJL0nz7fWQgAk=
=HMWx
-----END PGP SIGNATURE-----

--kle3dt2kbmtgldux--

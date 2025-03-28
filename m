Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828ED1DE2C3
	for <tools@linux.kernel.org>; Fri, 28 Mar 2025 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159024; cv=none; b=bUxbe6s2806pWl81+t0iF1u8YT9X54cYP6Y/FtqNxWquzwR0Mz7NHLCtRROBhrfS5kF7Sa3r2qgYNa8ABHvt9qULxGaF+N+S6UbSeDvI4jBOsJwYz5mXAFILaBcVNJa6IvCz+l/gX5fSAPSkApI5ebMH2k2CNUH2DJVm2FbT814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159024; c=relaxed/simple;
	bh=8dSk/hkkmWq7EZ6nSs3pY+u4Wzl7iUlhZXNZn5a3W2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFr4yWgyAT+hkqdw4wA8rlHAZ16PSA11dtyDJZnAxD6Tq8wxc0q1wQGU4Tlbs7A1kVeULDtgN1eNGYGBKumQVgarm0XAADiEDHQTcxvwKkRfJjUKOatH6h8igJaj8k6dlmaoKQDvRIqMkJJrsdbOqsCc/QhgkkPI+x+gB02adf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K9veejoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K9veejoc"
Received: by smtp.kernel.org (Postfix)
	id 13F22C4CEE5; Fri, 28 Mar 2025 10:50:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B522C4CEE4
	for <tools@kernel.org>; Fri, 28 Mar 2025 10:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B522C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3996af42857so2016553f8f.0
        for <tools@kernel.org>; Fri, 28 Mar 2025 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743159020; x=1743763820; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7GcCWDDRIpUmuvs6Ru4/zpWkic6qo8StZhuczq6NWc=;
        b=K9veejocsebXgY0GfCv8AS6VZw/h56H1PZ/ypNYaYc0Bm/rMGrtH+UXp0s6Q9aXq8L
         x4TlAcxzcaEjelKsj7rPRRVuJVRLqrmpsB++c9GYyWZvEu1Qy3uAfy03IotJZRMj2fWL
         LRv9J0ysI2ZIUwK5kN1Nj8TjuG74b3AjTTGp57pVEv7sTrgDZ/fNMhVqcyEQ8bd0z0M9
         wQ1e/t6JIahx7jYu7oW58Pd07ekTI2SjV7Hle3PF3AC8nDYC0095cztMqSRKirxI6G9/
         dbTeao3po2hlmUDByy3kFeB/55I7s7ou9ZLF+fxZVeRAJ+MMy0+ntQjkFax747/zk085
         y1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159020; x=1743763820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7GcCWDDRIpUmuvs6Ru4/zpWkic6qo8StZhuczq6NWc=;
        b=Vt1GhNP4gDIcD0TelJcgFXpJGfhsZ83xGT1S5YIDmiMQZj63VbLu5p96MGLHUEOR5u
         oN3yWqWzQUyFi28Vq9rdssoDPhPxrbR40JLL58bmnP7PgF2mPX3Lljw9uYlWWO6n7ZYD
         cfDEUFulpmkmzPXhdPU39IRSo2QAIVkLp/zWf8kxPfZwOqn+v4TOUDdjnA96ey3xSZlp
         YLJn8bYMtRQJyvBNbJ326QajhJrCxUiEGJwo1caKquJsNlnmRrvCUGuL3xv4/LPWmzLx
         fgTEPfzpxCjpAQhHOP/IZRh8FZOJyfNwoZvwQTneiwtoRThHUiSPBDBJ8Gmb5YmRezK3
         nZDQ==
X-Gm-Message-State: AOJu0Ywv5AAphcxZrirpxdlciOvnjgWcfUMF8x/q5etm5WkC9mjoVqkz
	ZU0TSlpqeEZXScsVUm+OIKd7b0exwxxFDGYEA7yFWprILdDJ2MXontkaercQphJ7eTBSne/jowA
	l
X-Gm-Gg: ASbGncuFDdldkxFK0HOyZfaHMi2UCG2PCL14vcQRPKAG1zVrs4M+ThCVJhB9yi4SWjp
	m7hw0CWw2FxUOPS8cTbL8vll76fe4m0b1QRAuWeY6WXspvLyT8qpqtDRPQWFlqDYhMh3JR3jMBV
	GVQiraubCbUBjdIntLjJR+W0hnKwPX0Mvu7ShIo5+9RZ9wVOczC8b83uoiKxbhxlJvshuOt9Hkx
	CWSAWUKSSkb8+rZOBXA5iylc/sZqg9YN2jSmqkcstImuOGc9Xobx2dbTMjauMWM7rUwSPRsbY5T
	Dpoqe94Rxn0ezRnlUF4zI/mKiwrPuZhtJIQW8XgavRaR6HpBtbXmZtn/gWGxf1eu3xTODU7QQSg
	TgFjGo+Lb+kU=
X-Google-Smtp-Source: AGHT+IEWhCUd7W6nLwHvgv86pO91bAgx+EU4mYUt6rBaCZiqdjCeM49DfOpFukzt4CTcr5/CMEEQBQ==
X-Received: by 2002:a5d:5846:0:b0:39a:c9ae:a198 with SMTP id ffacd0b85a97d-39c0bf232d1mr1928230f8f.1.1743159020474;
        Fri, 28 Mar 2025 03:50:20 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efeacasm66195745e9.23.2025.03.28.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:50:19 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:50:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate] Tweak trust path formatting for readability
Message-ID: <gnbwmhpamgk4nedkfr2ej77jbvvdj4y6frxx4aqixedvddisfm@nwivn3g2g4b5>
References: <20250326-trust-paths-improvements-v1-1-21c6db48a29f@linuxfoundation.org>
 <3brmutov3nr5zvjc3zybr3fgibpv74ez7glb6gpqitz3qcbvnq@24mfzd6opz3s>
 <20250327-complex-peacock-of-infinity-9c0316@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vpfkpu3edkmfbe65"
Content-Disposition: inline
In-Reply-To: <20250327-complex-peacock-of-infinity-9c0316@lemur>


--vpfkpu3edkmfbe65
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate] Tweak trust path formatting for readability
MIME-Version: 1.0

On Thu, Mar 27, 2025 at 04:22:03PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Mar 26, 2025 at 07:04:06PM +0100, Uwe Kleine-K=F6nig wrote:
> > > -        key_paths_repr =3D '\n'.join('\n `-> '.join(wotmate.get_uidd=
ata_by_pubrow(c, rowid) if rowid !=3D to_rowid else "." for rowid in kp) fo=
r kp in key_paths).encode('utf-8')
> > > +        kpblock =3D ''
> > > +        for kp in key_paths:
> > > +            for lvl, rowid in enumerate(kp):
> > > +                kpuid =3D wotmate.get_uiddata_by_pubrow(c, rowid)
> > > +                kpblock +=3D f'   {lvl}  {kpuid}' if lvl > 0 else f'=
=66rom  {kpuid}'
> > > +                kpblock +=3D '\n'
> > > +            kpblock +=3D '\n'
> >=20
> > Now this isn't a one-liner any more you can also work with indention as
> > you proposed initially. Something like
> >=20
> >                 kpblock +=3D f'{4 * lvl * " "}`-> {kpuid}' if lvl > 0 e=
lse f'{kpuid}'
> >=20
> > (untested).
>=20
> I tried it and hated it. :)

As I didn't test it, I didn't see the result. I expected it to somewhat
match what you suggested earlier. But I don't feel strong here.

> > > +        key_paths_repr =3D kpblock.encode()
> >=20
> > Did you drop 'utf-8' here on purpose?
>=20
> Yes -- it's the default encoding when not specified (and it isn't affecte=
d by
> the user locale setting). I can put that in explicitly if that makes it m=
ore
> consistent or expected.

Ah, I expected the default to be the user's locale. I confirm it's utf-8
and so dropping it is fine.

Related to that, I wonder about:

 a) keys/E2DCDD9132669BD6.asc (and a few others) are latin1 encoded.
    I didn't debug that, but I wonder why these are not utf-8.
 b) The key 4A55C497F744F705 has a uid that is latin1 encoded and 4 that
    are utf-8. See
    `gpg --list-keys --with-colon 4A55C497F744F705 | grep -a ^uid`=20

> > >          # Do we already have a file in place?
> > >          if os.path.exists(keyout):
> > >              # Load it up and see if it's different
> > >              with open(keyout, 'rb') as fin:
> > >                  old_keyexport =3D fin.read()
> > > -                if old_keyexport.find(keydata) > 0 and old_keyexport=
=2Efind(key_paths_repr) > 0:
> > > -                    logger.debug('No changes for %s', kid)
> > > -                    continue
> > > +                if keydata in old_keyexport:
> > > +                    logger.debug('No key changes for %s', kid)
> > > +                    if b'\n# Trust paths\n' not in old_keyexport:
> > > +                        logger.debug('Old key does not include trust=
 paths, skipping')
> > > +                        continue
> > > +                    if key_paths_repr in old_keyexport:
> > > +                        logger.debug('No trust path changes for %s',=
 kid)
> > > +                        continue
> >=20
> > I would add the trust path info already now in a commit changing all
> > keys at once. Then we can benefit from it on the next real change of the
> > data.
>=20
> I don't want to do that for a number of reasons:
>=20
> - this would trigger all keys to be reimported for anyone using
>   the korg-refresh-keys
> - this would make it harder to quickly judge when the key was last changed
>=20
> One other possibility is to keep it out of the .asc file and to append th=
is
> data to the graph/ file instead, like so:
>=20
>     ...
>     </g>
>     </svg>
>     <!--
>     Trust paths:
>=20
>     from  Linus Torvalds <torvalds@kernel.org>
>        1  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>        2  Kevin Hilman <khilman@kernel.org>
>        3  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>
>=20
>     from  Linus Torvalds <torvalds@kernel.org>
>        1  John Hawley ("Warthog9") <warthog9@eaglescrag.net>
>        2  Ben Hutchings <bwh@kernel.org>
>        3  Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
>        4  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>
>=20
>     -->
>=20
> What do you think? I like this better, actually, because this will still =
show
> the diffs as we want, but not touch the .asc files (which would trigger t=
heir
> reimport on trust path changes not necessarily affecting that key).

Good idea. This also fixes the problem that grepping for "Linus" in
keys/* isn't a good method to find Linus' key any more with the original
approach.

That brings however the difficulty to detect when it's time to
regenerate the graph. The check could be adapted, but maybe the cleanest
approach is to put the trust path in a completely separate file?

Maybe also put the keyinfo into that new file, given that this doesn't
always represent the current truth when it's only updated on key
changes?

So something like:

	$ cat keys/570338B018144F28.txt
	pub   rsa4096 2022-09-23 [SC] [expires: 2027-03-20]
	      8234A35B45C0D26B31C1A2DA570338B018144F28
	uid                      Mattijs Korpershoek <mattijs.korpershoek@gmail.co=
m>
	uid                      Mattijs Korpershoek <mkorpershoek@baylibre.com>
	uid                      Mattijs Korpershoek <mkorpershoek@kernel.org>
	sub   rsa2048 2025-03-20 [S] [expires: 2027-03-20]
	      2EE942A7B61F6ABE5313AD00190D1DB4664E1935
	sub   rsa2048 2025-03-20 [E] [expires: 2027-03-20]
	      F12C50B7B942A1FC14C1AA298A31723BB5DF5B73

	Trust paths:

	from  Linus Torvalds <torvalds@kernel.org>
	   1  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
	   2  Kevin Hilman <khilman@kernel.org>
	   3  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>

	from  Linus Torvalds <torvalds@kernel.org>
	   1  John Hawley ("Warthog9") <warthog9@eaglescrag.net>
	   2  Ben Hutchings <bwh@kernel.org>
	   3  Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
	   4  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>

maybe?

Best regards
Uwe

--vpfkpu3edkmfbe65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfmfugACgkQj4D7WH0S
/k7/3wf9Gk9uZe+Lk8e+ngms6btckQrzEAkB2CQSzwZpwuXKOI2/ox2/tigtTCWO
ulkjJV4Ak4o17Mf01rKXEp5C3yPgEJ9VGiXEzp/nABGkxlx6KEfphB3XMfsl5Fu+
ym1LWo98DhtKZIM45+aWyz3uCvMKfs4XOBgnx/Jhe0CzBRahBRFx9hm7YckkRyeo
k/vMb9zm3lE+mVc0d2JDMjuhDGgz+wlOMto5hEyXhL8YNlcrr9wpFxqUkT6+FTjh
GxmzlsbjKI0k+riuCBW3u3JZjbK1Sff1lnixpQhNdhmUYjPESoxykTJvvM6lOfAD
fzLMI9RxuLaaQ6I0TcVuslCe3a2e1g==
=89Ap
-----END PGP SIGNATURE-----

--vpfkpu3edkmfbe65--

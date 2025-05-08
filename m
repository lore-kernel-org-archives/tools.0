Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558628A1ED
	for <tools@linux.kernel.org>; Thu,  8 May 2025 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736594; cv=none; b=mXZraakR2Odk/mhbhA8s7kOtWckU1O9E5DSBBqYLEDvl9/ir+Ap/FkuDZ+bG8Jk56UQPoxCGeepT34l6YO0jC+YsZyaFiH7zulkNychj+ODCqSG07rmdZg5XRm7WEbHEFaKPcy9IhhtjNzD6kPz90AYy3QmDYoLgtWO5/B4mNYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736594; c=relaxed/simple;
	bh=p0TsJBpo3E/Pg5ySYukNJ3ZQkTSigmlRauzNNT1A6Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dp/3G3R+qUu8vhY3MoXlq9lXk6sMdVju2iOMYjJouZz34TvM9jMJS0tv0cnMsRYZ3OLjDohwCr76VCqodu6DlXz1eGieuo81pBJpUSkIV897dSjEx03GdEA4lhYvuEzmXbUASU8KGAEsOLDQlQb5MrBnc8WbxJLBI9BHaQ+AIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jFvyMSKT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jFvyMSKT"
Received: by smtp.kernel.org (Postfix)
	id 4F487C4CEE9; Thu,  8 May 2025 20:36:33 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F4A0C4CEE7
	for <tools@kernel.org>; Thu,  8 May 2025 20:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F4A0C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbdf6973e7so1802169a12.2
        for <tools@kernel.org>; Thu, 08 May 2025 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746736588; x=1747341388; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1gb5TQ+vSpB79Hk2kvtLMbygBjBINELV4REOnCZmIi8=;
        b=jFvyMSKTUSkrgLOXiskYgp5QUj6DHNrc4NxhQBx8sGjEhcE6G2cKpdoL+5qyhK1soI
         JEjtbOX0gr/iyZCKYXA2tR9JD6asodFl6NvmKf2BWSDh6w9lwtts6/MY7SVBWqAds5YA
         PW/bIY3Evokk9BqmWpME8e+5iedsNQrIj5KViYRnx8a4OigmMseCGumW7pHwFG4S6aAe
         Vwz9bIrfwMFORFnTcRcegldyjFVeLkz/Snn5C57WQU2NSa4CI1qb8Y+cB4XMa+6eKyCH
         MThk3/fFPI8tM1vOilojtOqXLnLrTwrskKgMXTNCiVOfhs8S44wz8lqVTz2EszqQxL/T
         M4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736588; x=1747341388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gb5TQ+vSpB79Hk2kvtLMbygBjBINELV4REOnCZmIi8=;
        b=l/+mNGiw+6kd6Pn0StLEPKgmxXRkJi/wZA3ebILH3Vo4r4YCoOMa8SGoD/6tOdV67U
         0zIJ6kdzBygnw4Z6DISXY3ZqGM46mVPQPLS0/zqC6uz7FpBFFHY92BShn/uczKXtO/Sy
         X0Y3yb4GSvCISkpjTo4SXJYPannsl8HiikecgCMSjn4PuAQmVo/OBLiA8xwsorK6KfG8
         EyH1lEilnN+GntZvO2VhRLG75oF+FHkKKuxnGsxXgR5LhljFtcTyy2GEieiF+xEKFeF9
         ZF3kLNzSmFXNIYFrWrLbJ9wowFf0KLu0xqgmjgOUhJhk5CiONo3fYQfucdkChqNbXBU5
         iNpA==
X-Gm-Message-State: AOJu0YwgrVVLMu1FkNaghgoiNf3jTTIPjIZ7PP+TBVHU6COBn+VOR26M
	fhDzhoo3h51EIq9+JgCyAcZr2sk14EwKCUelvk79kPVhPN69hgg8aF/O2UQWIRgzkMAzy+M+kiu
	Q
X-Gm-Gg: ASbGnct4FhzOd+0gT364Tr6+UXK6IpyE/n2FeRVufzoTlQ3exciUlxwgPwUHlX5mIa2
	YDBUziY5i6H3EKEmx9/wZ9Pnz9WbMEbcM6OEkp2EMRGhAxUdNqSHuDQ92OA1mfEWqdWO7J/Regg
	ZaSamsLI9fgU1jrqnSD3ILtUCQHNFeARrq/ug0y7WWg8F0OAklLwBoe3ES+UF8fJPO2nwzGxqS5
	K+1Ex09Pd6gjZrTalBlV/RLuCTTH5ypdhdnIEBU0WqRzEis7uHc5kZKmrPzN1MiK2yDmdZJ1jFd
	uD2sPBeXSo0+KTFIWLA0sLAZvl6NDz25JBS2czD//khaHA==
X-Google-Smtp-Source: AGHT+IHUl/BNkiaCP3P5yendEMIQF87u+7On/ycEl/+MccmABsr58lfzFRKkHdmu8FqTRDfVWoOxSg==
X-Received: by 2002:a17:906:c109:b0:ad2:15d3:534d with SMTP id a640c23a62f3a-ad2193090bdmr97098166b.57.1746736588214;
        Thu, 08 May 2025 13:36:28 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad2197465a1sm38093666b.96.2025.05.08.13.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:36:27 -0700 (PDT)
Date: Thu, 8 May 2025 22:36:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate 1/3] Put a representation of the trust path in a
 txt file
Message-ID: <3u45tiz5x3mcu2rumfsvgbwa2a73gbma2ie7lqxl45lnbybyd7@of6jkmjakzf6>
References: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
 <20250508094451.762484-6-u.kleine-koenig@baylibre.com>
 <5hkczvc3idfnjjijgel6ntj342akxefa534dt3nfj2l2zb3pp6@xlq2cjzsp3rg>
 <20250508-fresh-futuristic-shrew-5593b6@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x7b4bbaesar7umyh"
Content-Disposition: inline
In-Reply-To: <20250508-fresh-futuristic-shrew-5593b6@lemur>


--x7b4bbaesar7umyh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate 1/3] Put a representation of the trust path in a
 txt file
MIME-Version: 1.0

Hello Konstantin,

On Thu, May 08, 2025 at 04:03:41PM -0400, Konstantin Ryabitsev wrote:
> On Thu, May 08, 2025 at 05:29:12PM +0200, Uwe Kleine-K=F6nig wrote:
> > > diff --git a/make-sqlitedb.py b/make-sqlitedb.py
> > > index fec199def51d..e8c5969f4d50 100755
> > > --- a/make-sqlitedb.py
> > > +++ b/make-sqlitedb.py
> > > @@ -163,6 +163,11 @@ def keyring_load_sig_data(c, pub_keyid_rowid_map=
, uid_hash_rowid_map):
> > >                  ignored_sigs +=3D 1
> > >                  continue
> > > =20
> > > +            # skip SHA-1 based signatures
> > > +            if fields[15] =3D=3D "2":
> > > +                ignored_sigs +=3D 1
> > > +                continue
> > > +
> > >              # do we have the key that signed it?
> > >              if sigkeyid in pub_keyid_rowid_map.keys():
> > >                  uidsigs[sigkeyid] =3D (
> >=20
> > If you apply this patch, please drop this hunk. This was not supposed to
> > be part of this patch. While I think doing this change is right, it
> > should be done in a separate commit and well considered.
>=20
> Okay. Can you respin as v2 with these changes?

Yeah sure. On my way home I thought a bit more about this and I realized
that patch #3 has essentially the same effect as it will prune all SHA-1
signatures. Are we ready for that already? I will prepare a v2 tomorrow
and let you decide by picking up or skipping patch #3.

Best regards
Uwe

--x7b4bbaesar7umyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgdFccACgkQj4D7WH0S
/k7cpwgAlGV3IAYJNlw16MyE1jFOVF3y8ekHT7cQZ7ZmCp+t2sq8JxkkSz1uYfnQ
LKktW+SNln4Mj1gjwgA2uZavM4eREmSn6uZYG77VHKNMnQkn2G4tHhbg28Vk3QjJ
8Evff217dy2pKsEZjhYCeJsNAvWLU+CD8favH75ZRdfsF1ayaowHF4+m5qeAWnbd
4MtfA0gmC/CMAy5w+H0NkmaqJSZ3pdWRSKQT++Pi5F/8A1y12T4mb1+tQiIZKLQ2
wy6E0L+7aevZ26lv2u8G2E4K8bfinT7YblyFsSh7tP1RpO8/t31Wlh4cdokWvfvP
3t7iwrxd+AJ3RuKDVqaKk2wDOLjyXQ==
=KiPe
-----END PGP SIGNATURE-----

--x7b4bbaesar7umyh--

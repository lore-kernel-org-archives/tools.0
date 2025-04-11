Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FA27D79A
	for <tools@linux.kernel.org>; Fri, 11 Apr 2025 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350670; cv=none; b=kqEwuXpgAp5/yAtURHnYusJ6NyX7UGfQnPaYC61ZCDC4lYX3m/7rofOC8FtXbVD9tAD/K/Dy7RePqkU996m2bcv5efODILHqB5A8QbWKGJeLq/yAM+XHwW5uIA/wwoM4/ASt5g8d5XPJ3oNooGQc5rFs/a1n83bs/eVmlwpCwKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350670; c=relaxed/simple;
	bh=O0RX9xaJZ9yYoJ3cm11CBd6j1FVwcjj/YsDcx5d9JNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdOnRsd0IAyVPbdN2CqYzusm4rKc0S6X/2Dn785J/I3xz4ysSDR+4Bt5fNIeLV4vjT8lG6bU2xfhiblMtNx7inDmh9R1nXxL3geO66eL6gOwScWeNosrTYxou6l6q5MJWwuEYtrVdZeagPf4abcaF6kdZxoufyiN2yBnIuS3eAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TBRFWFUj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TBRFWFUj"
Received: by smtp.kernel.org (Postfix)
	id EA98FC4CEEA; Fri, 11 Apr 2025 05:51:09 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 825A3C4CEE9
	for <tools@kernel.org>; Fri, 11 Apr 2025 05:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 825A3C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so2483269a12.1
        for <tools@kernel.org>; Thu, 10 Apr 2025 22:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744350663; x=1744955463; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsh8cVBchecMZXYyL3KMl3sdhZg97r84lgFgoIdgHYQ=;
        b=TBRFWFUjl4SROJ8hWfmDDFBH3WwYjwduV5+BP8ZIRwNHEUFqqrVtBQbB8qBKJFijnH
         iMEv6aSvVRh+L5gF8ontvdAIWmsilL67oZHqhanMOlYQKH1DLGvJytd+xLUwNqJy1htE
         YiFzULcSFkeJcuAsuSENfqDjCjrC2Db05Bmv9h7q97MseG/sEO3BFEOCY0MzVllbuYUC
         +qVU0bGaK0SWl7I48jMydOskYjm0BIijg9SzJR60rBIcx4wtxTtA98rsB+OVH5JElIgN
         JHCq0H5eHykzxu/mukvvshw8mhN970VZX9wtbgmxJhc99FWsE7sO+P0F4hmU87570F1y
         DQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744350663; x=1744955463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsh8cVBchecMZXYyL3KMl3sdhZg97r84lgFgoIdgHYQ=;
        b=js7TaStYioR2uYiRfrynScs2aXqzAqNcuEa78cXzzyj6ni9XUnInzLgSXqGW+m2eqx
         XkvnRaP0Xz4hqNvrkGG9pl1cX6mAKCmSWyr8Ugr2f6xT1jBSrrk37szXxLwiT9utvA9T
         WS6nbw03u1MZAsLRiEzX/iBQCQmyEMAZiJ8Q3JCs+GjRPSNj6qZN39mp7yRkQBu9otI3
         IsNtoov8APnZqh5Qk90SI6P0zWHH6549G+vvpW2Kna4AJBW96zz/jqRM4DvhJkQjvS27
         diiZQvaAlxl/ULcinpC/zPcX/qUU8bi9ygb/ltajBl9pwue7aFWyxsgaYhOuboNhyfW8
         B2oQ==
X-Gm-Message-State: AOJu0Yz6mRMcYJAV6Ld7UdBOZpV7507BwzlZsR3q5zFOMMJY3lGqQb2k
	paFpibk/yWuohWrizVP7yxS38kUbSt7oDrnx8JEWOZeBV/I5Nd5C/eLCRlcjlWE=
X-Gm-Gg: ASbGncto3F7olQZnAIV8po+jfAMTzNExbCT9bwOqz5lM0UPGub+3SiiPm0SjrnfdATq
	ENC8wxJBHx90ogD3StJhSIBZCnxr86GO6c7IxesoiBsCH4bOL+VwYIW8NtprfmBvBMO2PXCZ237
	wxepQUMy1yEkYjxBP/ZE34Y3STp3kpZvsiql9FDs9P2ToYwRa7mCQ97FUUI/lh1x/1/NzR/rY/b
	qmDbxAdSoGhOiHJDbCVZTZlBOTTuecg9N0eRSr99GZieJETljE1NRkV5lR0glHZG4a0is5RZ4BB
	BhjzdmS08ovzBu3LvatLI8EPF28xfLuD0HbSAnNbp06g0Q==
X-Google-Smtp-Source: AGHT+IFf9iOiniTfYog581IWGWhVvkM2qn9gScI9G7gFQfYJrt5kdtIDKexsMZFj/q4lDxfVzSqJyg==
X-Received: by 2002:a17:907:25cb:b0:ac4:3d8:2e90 with SMTP id a640c23a62f3a-acad3489538mr113398766b.13.1744350663524;
        Thu, 10 Apr 2025 22:51:03 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acaa1ce7068sm392776166b.179.2025.04.10.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 22:51:02 -0700 (PDT)
Date: Fri, 11 Apr 2025 07:51:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v2] Write the text graph into a separate file in
 graphs/
Message-ID: <6sa3iqt64w2vxne3h2w7oxuna7wae5o3ko664vvrd5aqffk6zg@v6iioe56nnma>
References: <20250410-trust-paths-improvements-v2-1-adfd17e41b3c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xp7zspajvnco5k6d"
Content-Disposition: inline
In-Reply-To: <20250410-trust-paths-improvements-v2-1-adfd17e41b3c@linuxfoundation.org>


--xp7zspajvnco5k6d
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate v2] Write the text graph into a separate file in
 graphs/
MIME-Version: 1.0

Hello Konstantin,

On Thu, Apr 10, 2025 at 04:51:36PM -0400, Konstantin Ryabitsev wrote:
> Write the text graph representation of the trust relationships into a
> separate file in graphs/, with the following formatting changes:
>=20
> - Show the depth of the signature
> - Don't use '.' to represent the target (I'm the one who suggested it,
>   but it doesn't make sense with these formatting changes)
>=20
> Co-developed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
> Changes in v2:
> - Based on mailing list discussions, write the graph out into a separate
>   file under graphs/, which still gives us what we want and makes it
>   cleaner than writing it inside the key file itself.
> - Link to v1: https://lore.kernel.org/r/20250326-trust-paths-improvements=
-v1-1-21c6db48a29f@linuxfoundation.org
> ---
>  export-keyring.py | 123 ++++++++++++++++++++++++++++++++++--------------=
------
>  1 file changed, 78 insertions(+), 45 deletions(-)
>=20
> diff --git a/export-keyring.py b/export-keyring.py
> index 3e455f9..318a125 100755
> --- a/export-keyring.py
> +++ b/export-keyring.py
> @@ -110,59 +110,86 @@ if __name__ =3D=3D '__main__':
>              logger.debug('Skipping %s due to invalid WoT', kid)
>              continue
> =20
> -        key_paths_repr =3D '\n'.join('\n `-> '.join(wotmate.get_uiddata_=
by_pubrow(c, rowid) if rowid !=3D to_rowid else "." for rowid in kp) for kp=
 in key_paths).encode('utf-8')
> -
> -        # Do we already have a file in place?
> +        kpblock =3D ''
> +        for kp in key_paths:
> +            for lvl, rowid in enumerate(kp):
> +                kpuid =3D wotmate.get_uiddata_by_pubrow(c, rowid)
> +                kpblock +=3D f'   {lvl}  {kpuid}' if lvl > 0 else f'from=
  {kpuid}'

kpblock +=3D f'   {lvl}' if lvl > 0 else 'from' + f' {kid} {kpuid}'

?

> +                kpblock +=3D '\n'
> +            kpblock +=3D '\n'
> +        key_paths_repr =3D kpblock.encode()

I wonder about:

	$ cat graphs/79BE3E4300411886.txt
	from  Linus Torvalds <torvalds@kernel.org>
	   1  Linus Torvalds <torvalds@kernel.org>

but I think that is unrelated to this patch. IMHO Linus' trust path
should be

	[[Linus]]

and not

	[[Linus, Linus]]

=2E

> @@ -176,6 +203,12 @@ if __name__ =3D=3D '__main__':
>          graphout =3D os.path.join(graphdir, '%s.%s' % (kid, cmdargs.grap=
h_out_format))
>          graph.write(graphout, format=3Dcmdargs.graph_out_format)
>          logger.info('Wrote %s', graphout)
> +
> +        logger.debug('Writing out the text graph')
> +        with open(txtgraphout, 'wb') as fout:
> +            fout.write(key_paths_repr)
> +            logger.info('Wrote %s', txtgraphout)
> +

That part can be skipped if not trust_changed.

Otherwise I like it, and yes, please squash the two patches.

Best regards
Uwe

--xp7zspajvnco5k6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf4rcEACgkQj4D7WH0S
/k67Fgf+KgNFr92d+EplQ4kSAbShE0Wl50SvAt0CEKFxMc4pm5G80NJl1Xp041zG
pWrIXFnlBKi315W/hFvkhDRo+t12NLpxaYjXPcTIO7hySYyoI/dpxxKD4JNHUKSh
gy1+GOGSDAkpLGVu3tt6O5w0kYtE9/rVqzhM3ZtiUQvkuES45hxcRwIXGbtgYYjD
vQWVQH1XQbgzV+prihootR7JoXftZvlMzM2F6WLhtXFKNivcoGO0x0P/caKTREcc
dK2zX8HAoA2hLTvAXODp5akG+KogN1f4OFAUkKXyusdQGWVO+zAY7Ausc/32PB+L
IupSN3PfbqT68pzxyHewDK9m3mOAvg==
=nBGY
-----END PGP SIGNATURE-----

--xp7zspajvnco5k6d--

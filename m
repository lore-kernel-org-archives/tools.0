Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76FE214230
	for <tools@linux.kernel.org>; Wed, 26 Mar 2025 18:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743012256; cv=none; b=KAYNTDQUnMot/1Pswo9lxvQQKyB2NnMhxNWYb8i2V96i/tbkOiRsFnNoDomr/Qst70KuhL2OSWNFvst1RAq1aQJT1KdvsZVfDqPx23y4J3I1WEScFzOWmyr3G/9eQQxo0PRn2PNqu6kZFTOzoP0lxWM5JX+FPUFlh92nkyi/lDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743012256; c=relaxed/simple;
	bh=ZMLeTBUUdaXZlMhBwFZawp/hIvx7kb88FmZueoOPmM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nd16WKDpOz1aciafzxdPVTuoGuvQk44drxq9YjxZpxWwAxrrTVBjQdXq3Uwb8fZHJjIZ5SLVZ53KewMIBwZuYSYMwq0jCVxFt+gnJKdMKATOdrp88xBjeebfrC5Ktr6TIOzb2f30KVbKMyH9jMIBltqkplbtsiysBLoGKcB8BaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sUThjFQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sUThjFQm"
Received: by smtp.kernel.org (Postfix)
	id 78362C4CEEB; Wed, 26 Mar 2025 18:04:15 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3268BC4CEE9
	for <tools@kernel.org>; Wed, 26 Mar 2025 18:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3268BC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso2425920a12.1
        for <tools@kernel.org>; Wed, 26 Mar 2025 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743012249; x=1743617049; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=woW754OoH4L8mDANz3D58N5TCufVXlxjrLRD5VEUOC8=;
        b=sUThjFQmj1FNnxvSf53gQKHUhL5OH8RhlMcqLC/Kl/wPVvi6EVE1LH+ldcN04pZ+vY
         KLj53wfXwsWp5R9zMIwQyNhw6La+DDPu0165mgVE9/rI96mgmNdBGVJqVjVLTI8Bd25P
         DSH9nyUCePyjUuSId7Mh1VgWC1I3zv28Jrgrtr4ndCdJ2gFBwqhPzFIVbM9rMgoLjeEE
         ksEQ4BP9AqNWSugt1lsXnDTMU+BpomchAGLrbNQI53Q80VBYKzG8jcBWveumKW6GwNpv
         tdCT+npvemPAgfhogzRUrg2LInsNMWmNhLR0BnNDxBG6XO63ACJvJZTJYPkmHzc3HkiX
         UA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743012249; x=1743617049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woW754OoH4L8mDANz3D58N5TCufVXlxjrLRD5VEUOC8=;
        b=H1CGZ4WPVzmDFJ8E7UfJjHhij/I7pd5aPdvfxWWsCPU0Au7XpikcHTuqN0YnFaIc5y
         4g8idFWhp1ivo3pPc+BAcARc9GThO9xWfZlELkdMwJJM8IpMKGgA1Hjm9iBDKRFxcp93
         uM5Y9rakT1Aka8kHdi8Bt8dw8IHC8stqEXO+NrFHjCoelI5pSJz0IVn/K1V5ofOYUop+
         PIKfSVdWJVI6OqD1YESzPU7A8doK6kJgu9KdH/U9Lf0pskRJS/sN4b4gyN+wGFoCiPB/
         /DUQSyB+gfL6fCbOj+/s2QkbpdzIvgwVZ0vUE/e0GlleOD9nz6CAuWtBtiWGi9SkYDTS
         k0lw==
X-Gm-Message-State: AOJu0YwFde7GcLv6vix+K8pRaQQepFjfjSZ0WunKBuNmcNr2isFQpvq/
	4CDxSK8hplSW6xGgtdAIST7O2sg6vmJKe00NOxyPVogRDVtd2lPu6YauBAcAOfI=
X-Gm-Gg: ASbGncu/dswrfKVuYVFqrVSlFsbV3WwpEEhQvxPS1bykRyo+khD+Mh2d8PujVly/CHV
	Z7FS5WgDTiDyAsb9u7HA1LyPTixFJtFXPadOU/MnrInXwShRqlZ/E18B0VD7fDDozYm7fUkPKsa
	JHNCQA28JJGXs/MXGBq9St+VHXT58AwQyL+fcDW0NVhXAB8sqUQCCX6Ovo/Xhw5Db0I4aZ0kmfX
	FNVRYi/jkwcBbzjRzPRdBI9mhSncwTPBNWzJY4i7gIr8hepi+GjAxB4OtPNvWZAI77kZihSp4R3
	B3Y7I02fcVuHmqSgqKHhnvXRmtwGAfomueagxaJWvL2leA8Hmg==
X-Google-Smtp-Source: AGHT+IHVV4KxdzySb4vWpkocMUa9asJOH14CwajoxqUBPA0ey0gcVtIZAly7TitlzmhtS4APWUPZ1Q==
X-Received: by 2002:a17:907:3d89:b0:abf:6f95:22fc with SMTP id a640c23a62f3a-ac6e0da6563mr444977666b.28.1743012248984;
        Wed, 26 Mar 2025 11:04:08 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6ea5ef3f1sm137271166b.79.2025.03.26.11.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 11:04:08 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:04:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate] Tweak trust path formatting for readability
Message-ID: <3brmutov3nr5zvjc3zybr3fgibpv74ez7glb6gpqitz3qcbvnq@24mfzd6opz3s>
References: <20250326-trust-paths-improvements-v1-1-21c6db48a29f@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5u6x25wwszxbgals"
Content-Disposition: inline
In-Reply-To: <20250326-trust-paths-improvements-v1-1-21c6db48a29f@linuxfoundation.org>


--5u6x25wwszxbgals
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate] Tweak trust path formatting for readability
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 11:37:15AM -0400, Konstantin Ryabitsev wrote:
> Tweak the trust paths output:
>=20
> - Add a '# Trust paths' header to the paths section
> - Show the depth of the signature
> - Don't use '.' to represent the target (I'm the one who suggested it,
>   but it doesn't make sense with these formatting changes)
> - Only modify the key for trust path changes if it already has trust
>   path info in it, to avoid having all keys change at once.
>=20
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  export-keyring.py | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/export-keyring.py b/export-keyring.py
> index 3e455f9..967e1ef 100755
> --- a/export-keyring.py
> +++ b/export-keyring.py
> @@ -110,22 +110,34 @@ if __name__ =3D=3D '__main__':
>              logger.debug('Skipping %s due to invalid WoT', kid)
>              continue
> =20
> -        key_paths_repr =3D '\n'.join('\n `-> '.join(wotmate.get_uiddata_=
by_pubrow(c, rowid) if rowid !=3D to_rowid else "." for rowid in kp) for kp=
 in key_paths).encode('utf-8')
> +        kpblock =3D ''
> +        for kp in key_paths:
> +            for lvl, rowid in enumerate(kp):
> +                kpuid =3D wotmate.get_uiddata_by_pubrow(c, rowid)
> +                kpblock +=3D f'   {lvl}  {kpuid}' if lvl > 0 else f'from=
  {kpuid}'
> +                kpblock +=3D '\n'
> +            kpblock +=3D '\n'

Now this isn't a one-liner any more you can also work with indention as
you proposed initially. Something like

                kpblock +=3D f'{4 * lvl * " "}`-> {kpuid}' if lvl > 0 else =
f'{kpuid}'

(untested).

> +        key_paths_repr =3D kpblock.encode()

Did you drop 'utf-8' here on purpose? I think it's sensible to keep as
the output of gpg --with-colons is expected to be in utf-8 (though I
don't find that in the docs immediately) and you don't want all graphs
regenerated just because the caller's locale differs from the previous
caller's.

> =20
>          # Do we already have a file in place?
>          if os.path.exists(keyout):
>              # Load it up and see if it's different
>              with open(keyout, 'rb') as fin:
>                  old_keyexport =3D fin.read()
> -                if old_keyexport.find(keydata) > 0 and old_keyexport.fin=
d(key_paths_repr) > 0:
> -                    logger.debug('No changes for %s', kid)
> -                    continue
> +                if keydata in old_keyexport:
> +                    logger.debug('No key changes for %s', kid)
> +                    if b'\n# Trust paths\n' not in old_keyexport:
> +                        logger.debug('Old key does not include trust pat=
hs, skipping')
> +                        continue
> +                    if key_paths_repr in old_keyexport:
> +                        logger.debug('No trust path changes for %s', kid)
> +                        continue

I would add the trust path info already now in a commit changing all
keys at once. Then we can benefit from it on the next real change of the
data.

I never was in the situation to have to justify an "why did all the keys
change" situation, but without knowing how that was for you in the past,
I wouldn't fear that. (Assuming that it's only the trust path that is
added and keydata doesn't actually change.)

>          # Now, export the header
>          args =3D ['--list-options', 'show-notations', '--list-options',
>                  'no-show-uid-validity', '--with-subkey-fingerprints', '-=
-list-key', kid]
>          header =3D wotmate.gpg_run_command(args, with_colons=3DFalse)
> -        keyexport =3D header + b'\n\n' + key_paths_repr + b'\n\n' + keyd=
ata + b'\n'
> +        keyexport =3D header + b'\n\n# Trust paths\n\n' + key_paths_repr=
 + keydata + b'\n'

Adding a title is a good idea.

> =20
>          if not wotmate.lint(keydata):
>              logger.debug('Skipping %s due to bad linter results', kid)

Best regards
Uwe


--5u6x25wwszxbgals
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfkQZMACgkQj4D7WH0S
/k6GzAf9FeNEiP1b11eBtCBc97Me4Y72ogDBvqsGq69Mamuctm/NtwqsEueXkyQL
gyz5H2gUk3nSEGV+QkhuNgZgpDipAbvWSx1ycsW/USN5GaVm+f6zuPrgmZaxR0zb
/oaAh78izimB/Nl6vzxdPiaxJr37NXjMAXRA987v3nxKJmw9RdOaLq819yOhN3Qd
Mpf07lCAjlmhmJSXpUBBe/OyVy8SOgT2WnhuUI6oiOKREBgFT+nv74z6Gb6pG9oZ
Lp4qWCxz//tTo6w4V5f0OK8Suo06NvlmpKt32se46I5LrtZGyID2gyV0Z7YvRkJM
JiOTa4pq9cGkr9eF2T2F1Ag8GdK/OA==
=8N4U
-----END PGP SIGNATURE-----

--5u6x25wwszxbgals--

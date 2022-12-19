Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297C79C6
	for <tools@linux.kernel.org>; Mon, 19 Dec 2022 21:37:18 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c11so1612492qtn.11
        for <tools@linux.kernel.org>; Mon, 19 Dec 2022 13:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNFGioo7rE4n3845I/WGsM7dqLeXGzgdxYK5bPLOxW8=;
        b=N7iViLFK5sPUHrvKM7C9GAEjKH/z7cI3Y7Px+/3I6drmAfXbyHgQNPBZ2i1AjF42cU
         mWbyeTccU3CCmwTPjI6hnSaOSKv6n8rQSRx4Lnw0x+UYejKwU4FnhxqjmzzHuBTOkAx1
         nSKgP96PWmNZjLgHwg6NfYFHwHrQ4RpDr8Bi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNFGioo7rE4n3845I/WGsM7dqLeXGzgdxYK5bPLOxW8=;
        b=55SSK0jCLsQad4D5WxT4NuUNHiXqSjebnLgt4joFyDYrRaSJ7zrajUqVEe1qpY50gR
         KHeOZu02boPocDkurgfP929Y+o4msxzoobBnqOHy11NyuIZfr7WLbqW4gkkpDEP3k7vr
         Iw5XoxNzhXgt0cDnmgWvdp9BOHZYVhM5DO5wSJVtlAI+FIFkRGNY/3i7h9SRDsFcmef8
         iZHTdsTsSaff5jJ6+kEr6oPnAj9L8njJcL49qmbxzomUyyH4f0vrTodlIhOCeM6HZHL2
         K+Ct5rZAaXFU6TEVWgQGrWtxsYw2rticrap8VNxXJ/cR3iskxMxC0fiKfvEoLn+8hveN
         qhYQ==
X-Gm-Message-State: ANoB5pmElAGcX+lW5E93YCxHxai/4Xl5i2vpubvg02cX20iFzThRMAsy
	JP9lO5GfSz3G75wtO2IOSH6rc6TtDSf/Wrni
X-Google-Smtp-Source: AA0mqf6WIatNE6t+TLdfWq/ek0RGhUK7a5gABc9CPkn1x8nLJEC81yW4ChOHFq89QlozCF51XSTS/A==
X-Received: by 2002:ac8:5805:0:b0:3a5:31cc:50ff with SMTP id g5-20020ac85805000000b003a531cc50ffmr75070477qtg.9.1671485837285;
        Mon, 19 Dec 2022 13:37:17 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id br36-20020a05620a462400b006fed58fc1a3sm7834765qkb.119.2022.12.19.13.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 13:37:16 -0800 (PST)
Date: Mon, 19 Dec 2022 16:37:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: b4 v0.11.0 available
Message-ID: <20221219213715.2qozw5emt5j7t3xr@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lne24knlegvos5tv"
Content-Disposition: inline


--lne24knlegvos5tv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

I am happy to announce b4 version 0.11.0. There are many enhancements to the
contributor workflow in this release, so everyone using "b4 prep" and relat=
ed
features is encouraged to upgrade from 0.10.

# Major highlights

- b4 prep --compare-to N: shows a range-diff between your current prep bran=
ch
  and the previously submitted revision N

- b4 ty: can be configured to always send mail without requiring the -S swi=
tch
  (via setting b4.ty-send-mail=3Dyes)

- b4 send will no longer send the entire series to the addresses found in
  individual commit Cc: trailers; such addresses will only receive the cover
  letter and the patches where they are explicitly Cc'd

- you can now set extra [PATCH] prefixes permanently either via b4 prep
  --set-prefixes, via the cover letter subject line, or by using git's
  format.subjectPrefix configuration

- b4 has internal changes to ensure that we generate 7-bit-clean headers for
  all outgoing mail

- b4 send --reflect: prepares the patches but only sends them to yourself

- b4 prep --show-info: shows information about your prep-managed branch

# Documentation

Full documentation is available at:
https://b4.docs.kernel.org/en/stable-0.11.y/

# Upgrading

To upgrade to the latest version using pip:

    pip install --upgrade b4

If you're using b4 from git, you can switch to the stable-0.11.y branch and
update the submodules.

# Acknowledgements

Special thanks to the following people who helped with this release, in
reverse-git order:

    Luca Weiss <luca.weiss@fairphone.com>
    Mark Brown <broonie@kernel.org>
    Noralf Tr=C3=B8nnes <noralf@tronnes.org>
    Douglas Anderson <dianders@chromium.org>
    Philippe Blain <levraiphilippeblain@gmail.com>
    Maxime Ripard <maxime@cerno.tech>
    Dmitry Torokhov <dmitry.torokhov@gmail.com>
    Geert Uytterhoeven <geert@linux-m68k.org>
    Quentin Schulz <quentin.schulz@theobroma-systems.com>
    Rob Herring <robh@kernel.org>
    Palmer Dabbelt <palmer@rivosinc.com>
    Bjorn Helgaas <helgaas@kernel.org>
    Nicolas Schier <n.schier@avm.de>
    Neil Armstrong <neil.armstrong@linaro.org>
    Peter Zijlstra <peterz@infradead.org>
    Amjad Ouled-Ameur <aouledameur@baylibre.com>
    Guillaume Ranquet <granquet@baylibre.com>
    Leon Romanovsky <leon@kernel.org>

Great thanks for everyone who helped test-drive the new contributor-oriented
features despite a lot of potential for bugs.

-K

--lne24knlegvos5tv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY6DZiwAKCRC2xBzjVmSZ
bL+1AQCvyrz6G8Zb2Q1gyNhoUo57rRttaSRJc+dn1pF9/fqFggD+IxPz2U+a3ivx
VtOnJwFUxybkJE5x4pAjbuPbikoMpQI=
=sI4s
-----END PGP SIGNATURE-----

--lne24knlegvos5tv--

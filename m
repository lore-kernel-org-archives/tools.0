Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815233CD
	for <tools@linux.kernel.org>; Fri, 20 Jan 2023 16:57:15 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id t10so6319987vsr.3
        for <tools@linux.kernel.org>; Fri, 20 Jan 2023 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2H8mlazaJpdn/pLWXNCKdwGEPT/T0QkTbMGFP5VzYM=;
        b=VFDiLLH0Nz3bfxUClBeWm3gKDpT/jUPDFvXWTnbNonblV4oidYrj5bxUIB+6L3fErC
         KlHdeAyrU9NGfn7Y1tU8bK4DMV3I050GimdncnMIOqAnwBRyU2ZjuroUsqHNranrnGBB
         c8WyOFxN8zaenN1HPy3VaGUmyr1JZFzTkdb4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2H8mlazaJpdn/pLWXNCKdwGEPT/T0QkTbMGFP5VzYM=;
        b=wYaCAIPvgwznJcLbKrhyEFlZaKQO4kdXEbB8AE5PDG4qjfVZitndhfC9vcSOI8tdFJ
         VaF1nuXhyMXJUMtrnWsDpU7FTSCKW1HMBEmC7RothPDXRp3BWVEdBIqMoJeWVSArwGna
         +5iWsJk1NJvaSFaOcqiD0SbRACMNj0B1tltZu9vsk0+nJeBZ8QHVr5Zynj5KTobxMwHH
         OT7LeSCu+yn87oYA0c9q/u/LJPq4lGgsWFaHw7rdotBJBjBX4NALAYf1ZEaQg47yTjdz
         aRrfgBVaIJ5bQ2/RTh3V3GqXQuoiFYyuCd3uGauRs7tZRzj45sJYeWfRvlM36bA3q5yp
         BhRA==
X-Gm-Message-State: AFqh2kqF+sTetUtLBtQI/jqipi+kdsglDmO7X8dbJchmgsEy75z1AMlG
	9UcX9/ez6zJAbvB+hxYol0RSFu7XJiTZsHsu
X-Google-Smtp-Source: AMrXdXseERGdokMMWpjNMZj9b0kZPVEvLuhjuM/U1l6G31vfKu340GopU3s+t5jHvKngPhkGL/sXjg==
X-Received: by 2002:a05:6102:304f:b0:3d3:e24b:fdb6 with SMTP id w15-20020a056102304f00b003d3e24bfdb6mr14500196vsa.0.1674233833979;
        Fri, 20 Jan 2023 08:57:13 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id dt41-20020a05620a47a900b00705e7daf6f0sm11227560qkb.129.2023.01.20.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 08:57:13 -0800 (PST)
Date: Fri, 20 Jan 2023 11:57:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 v0.12.0 available
Message-ID: <20230120165712.rznwonw6nbfhc7fo@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zzefuwnop3drud6w"
Content-Disposition: inline


--zzefuwnop3drud6w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

I am happy to announce b4 v0.12.0. The primary purpose of this release is to
work around critical bugs discovered in the Python email.message module that
was causing message corruption when certain conditions were met. Specifical=
ly,
we have discovered and reported the following Python bugs:

- https://github.com/python/cpython/issues/99927
- https://github.com/python/cpython/issues/100884
- https://github.com/python/cpython/issues/100900
- https://github.com/python/cpython/issues/100991

None of them are fixed at this time, and even if they are, we're still look=
ing
at months or years before everyone uses Python versions that do not contain
them.

For this reason, b4 v0.12 implements its own message generation routines th=
at
sidesteps the problem entirely. Since patches are ultimately very simple
plaintext messages without any mime content, this wasn't too challenging to
implement, but there are probably subtle bugs hiding in that code as well.
But, at least we can fix those when they are reported.

Everyone using "b4 send" really should upgrade to 0.12.

# Other features in 0.12

The primary focus was fixing Python's email bugs, so the list of other
features is small:

## b4 mbox --refetch <mboxfile>

Since version 0.11, "b4 am" saves messages with minimal headers. If you wou=
ld
like to respond to messages in a saved mbox file as part of your review
process, you can restore all original headers using:

    b4 mbox --refetch that.mbox

## Always hiding To/Cc trailers in the cover letters

B4 uses the cover letter to track To/Cc addressees. In version 0.12, "b4 se=
nd"
always hides them from generated cover letters, so they don't overwhelm
reviewers (this info is already in the headers anyway).

## Bugfixes

Mostly minor bugfixes and corner-case crashers.

# Upgrading

To upgrade from pip:

    pip install --upgrade b4

# Thanks

The following people helped with this release, in reverse-git-log order:

    Geert Uytterhoeven <geert@linux-m68k.org>
    Vishal Verma <vishal@kernel.org>
    Rob Herring <robh@kernel.org>
    Matthieu Baerts <matthieu.baerts@tessares.net>
    Thomas Wei=C3=9Fschuh <thomas@t-8ch.de>
    Nathan Chancellor <nathan@kernel.org>
    Mark Brown <broonie@kernel.org>
    Quentin Schulz <quentin.schulz@theobroma-systems.com>

-K

--zzefuwnop3drud6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY8rH6AAKCRC2xBzjVmSZ
bLyqAP0QKlTqMi5GbrHDTfwHhazcjYH49goYjFRdoG34l1piggEA+rFctRO8LFfl
VU+JYpXXgRdRBvmu7xqGzY6I/BxLuws=
=/hVY
-----END PGP SIGNATURE-----

--zzefuwnop3drud6w--

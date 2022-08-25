Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F9C4C74
	for <tools@linux.kernel.org>; Thu, 25 Aug 2022 21:18:05 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id d1so16419810qvs.0
        for <tools@linux.kernel.org>; Thu, 25 Aug 2022 14:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=fROVXbFmtbUr+o25LXSeimUOmTyxVJMJaobpidL+Vmk=;
        b=ceOzIi4Fxt5GhWVsmcUV/dUqvioQarOr05M5mrlmSPoNl1o8QN8Qe4yxBp8fL5JwJU
         zmAd5Lb6vwGisCFbyvM0BlVuV7NK+9GTyBZIwdSPi3IKEzc5rod23CljrQtMMtyIxYQZ
         vgIcRNISB7pTD0tt1wS4w22A0whK2+SrCcu9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=fROVXbFmtbUr+o25LXSeimUOmTyxVJMJaobpidL+Vmk=;
        b=GwGAdfo1tD+/oKc/ZeC3I2jK511cos1mUWpPWHWiHL0uWKUeUFyg1XHp90BxSdMylr
         GRnRjkCNpLhHJfHQOzbgZzgv1COltHWvhhbS2RJnqWivjeWM5GWZ6cSseiWRiu6YZKIs
         MIKIdMwEM7crgm1f0S0B+t2Jqs0vxW5U4YB8aoIePm+v541YIWmhtXvbQWgWVYSLxzGy
         95kulFhtev6OELripxSfDHsewNzWqVPk9k/AEtVDDnIc+E3G8cZYp5RGhG2KjoqfSgNQ
         yibr+CHlrshCucYBXJaE0ynTn811v0xkguAn2dtDZzcsas2SuxNUh2Ba0tAXgRaML5ml
         UD6A==
X-Gm-Message-State: ACgBeo27abMX8yc2QZ4278A/NrSRgsghOr901nEaRcrugZGfKZvpNIi7
	luAXv05lcRF6FEMS2sGQpEXDO0/Q+oyW1A==
X-Google-Smtp-Source: AA6agR68hEnGXbgPdFWnu/ZXml5lPL3Ej+tjjG8ZeINHE/Bktrcpuwdq2YIvgOmVqVb16Xq+j8ax4Q==
X-Received: by 2002:ad4:5de7:0:b0:496:d0f8:7000 with SMTP id jn7-20020ad45de7000000b00496d0f87000mr5421525qvb.12.1661462284274;
        Thu, 25 Aug 2022 14:18:04 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y29-20020a37f61d000000b006b97151d2b3sm370436qkj.67.2022.08.25.14.18.03
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:18:03 -0700 (PDT)
Date: Thu, 25 Aug 2022 17:18:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: patatt 0.6.2 is available
Message-ID: <20220825211802.bmzicdfo2n6jr6kl@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j5kmpu6pmzbz66iu"
Content-Disposition: inline


--j5kmpu6pmzbz66iu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

During my testing of the upcoming b4 web submission endpoint I discovered that
patatt's gnupg validation didn't properly handle situations where $HOME (or
$GNUPGHOME) isn't writable. The 0.6.1 was an incomplete fix for this issue,
and 0.6.2 contains a better and more proper fix for this problem.

It's not anything that would affect regular users, so no rush to upgrade.

You can download the tarballs from here:
https://mirrors.edge.kernel.org/pub/software/devel/patatt/

If you installed from pip, you can:

    pip install --upgrade patatt

Best regards,
Konstantin

--j5kmpu6pmzbz66iu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYwfnCgAKCRC2xBzjVmSZ
bIiTAQCMnfohnlHA/or9nkPOpUcEIHgonjGoJoz5zVUEVfacIwEA0P9rG8cnfplT
y3Spfq/g2UiTLKeb55TppruOo0WjEg8=
=h6M4
-----END PGP SIGNATURE-----

--j5kmpu6pmzbz66iu--

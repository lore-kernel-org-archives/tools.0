Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F554A02
	for <tools@linux.kernel.org>; Mon, 22 Aug 2022 17:02:29 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id b9so8344554qka.2
        for <tools@linux.kernel.org>; Mon, 22 Aug 2022 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=XFUSuFXI5rfPKheHfTh2yZQPDISLFSuqfNybRe9XQZY=;
        b=cPAheNwOfxxauoza2WooLdjPVAt2dUE9X+1TjSOEU1yOAEw/+S1lyrIVQtq7rSxrRM
         KKCH2h9k6+xvVntO4e/okq4M/wrYeIT4ay2zutL2Z7EES4qgVTOHGpd7s6l4ibmrCqjI
         t9OM/v/Q/PAdGlf5d8iy1SKR50Tqydt6UrOWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=XFUSuFXI5rfPKheHfTh2yZQPDISLFSuqfNybRe9XQZY=;
        b=OYhyjkhYwDO/lW9YS7P7t9FjRaPSt82vw0iaH+3ANKsTDmryblKEpsBe7qSrd6LbBD
         aradv2/rcDIsONkYJ3IiEr1w14EJQb9WurEL5E8715c2TX7kFuASJl55rhXbloxsKDP7
         Nlqb7eeroSH294ZZv0bR03EKAXuOJ9aeKihA1TYAWMvvApdquA3QkNz2303a9uJ1eMOb
         TdJdB/l4ne4wSfbc/vgMvdxqqv71pzSow47F2gbCHa/heznTR2+ry75Ols34rk0BPV5O
         XmpJy71yr/HXUZw8lL+XOA59iM2oMDG6KUyJBCjD34UIdzym1LEz1VAlkf0dp1XVVwqe
         Y3IA==
X-Gm-Message-State: ACgBeo1nZxqIkaZR8BlHEYXaKcGaDT00/k7lbVEYcBkR3vqpNwuomLq3
	0lfiIBLjHkGj4B3jG/7mQzr8PNSn+FbbbA==
X-Google-Smtp-Source: AA6agR4S0G7G6+RdSVjy6AnnCyA2ThJMXGb9RO6g/A7vDZjfGxnHJhVuseuv3QdQqtvRByK29KCn7A==
X-Received: by 2002:a05:620a:1a07:b0:6bc:3aa1:90fb with SMTP id bk7-20020a05620a1a0700b006bc3aa190fbmr606773qkb.292.1661187748531;
        Mon, 22 Aug 2022 10:02:28 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id l8-20020ac84cc8000000b0031f0b43629dsm8982636qtv.23.2022.08.22.10.02.28
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 10:02:28 -0700 (PDT)
Date: Mon, 22 Aug 2022 13:02:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: patatt-0.6.0 is available
Message-ID: <20220822170226.4amnes5dt7ng42xg@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rhhijs53zxn6citk"
Content-Disposition: inline


--rhhijs53zxn6citk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I have released patatt version 0.6.0 with minor new features and bugfixes:

- Implements a pythonic way of signing a message using
  patatt.rfc2822_sign(bytes)
- Works around inconsistencies in git-mailinfo when there are in-body headers
  and the message uses CRLF line endings

Mostly, this is required for the upcoming b4 0.9.0 version. Current users of
patatt do not need to rush to upgrade and can just wait until distros release
newer packages.

If you installed patatt from pypi, you can upgrade using:

    pip install --upgrade patatt

Best regards,
Konstantin

--rhhijs53zxn6citk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYwO2ogAKCRC2xBzjVmSZ
bNmPAP9iZ5S1NMKim65WqlijRIcU6rrsKUqXhdJ1wMAO6KxYbQD/cXrSz1rkfvb9
7vY7Ns9oZyIPblF5QEKAI9tPfWBBfg0=
=moCn
-----END PGP SIGNATURE-----

--rhhijs53zxn6citk--

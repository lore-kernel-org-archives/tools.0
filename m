Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0B233DA
	for <tools@linux.kernel.org>; Tue, 13 Sep 2022 14:22:38 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id s13so9263967qvq.10
        for <tools@linux.kernel.org>; Tue, 13 Sep 2022 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=e+stmcad+bG10u5fCW5YalUDbGSP98i2PdsIVJNEJxk=;
        b=XROs/ZoDnMibZOGHzbUs+iF1wR02sEFHl1EiC+GvdYhCO9PUg3/czmEJ1p+bJ9U1R2
         mtXt30febZ6n6CsV7LmmyAmlLidYqTCVeK0+GXYMitgiEtcDaXfRIitgWg2Db4jjiB0X
         0JVJAahV/RWQrTuggsx8xN9jPkrZ64xE+MF7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=e+stmcad+bG10u5fCW5YalUDbGSP98i2PdsIVJNEJxk=;
        b=JT7p8fyIoJu6vP2YkY5qjOBt9b0x5ssDNeKwaxyLAmsTc+LVbs8UjD093aV7uMCnvH
         FYbLVxLRN92UFAgp47zMov9l4o6gFTlxeq5hC7VVuxnA5Dl5XP/W3GmPD3iSEAbCQhPy
         xy4LtGGd/3oRl+IlHW7j7G5Jj5G3pTmVyv6P69SWt8dfHMq553TGFNMpvnejcvK5jK6E
         iatrAM7OmVBOV5/+dwouKLzvA3Jz3DO/CAcsu31PMFFlS7t6wFMAKXdfnQSEL5kkEs3z
         DytxkXrOmc5F5+u7+iIhR8W3Y4UFJuMwPa4TeNayNf4vNG9EM1ymPpizD22T8A7gz7cK
         qDiQ==
X-Gm-Message-State: ACgBeo2FGlDR6iFbRuqiRqURJASa5s3YzNBrerdsGJaIBQ9Ej+1N4hBy
	ak1wHCvaBynGUbMcmi4mWefPc7CAQjTK4Q==
X-Google-Smtp-Source: AA6agR4Us9skcBtGN507bkFjWFmQ/3zYY0P9R7Cx55JqKGIAHu7SKpkyqndHVlvOUaf1jwbtPstMLg==
X-Received: by 2002:ad4:5aad:0:b0:4aa:a266:d1a7 with SMTP id u13-20020ad45aad000000b004aaa266d1a7mr27778634qvg.70.1663078957723;
        Tue, 13 Sep 2022 07:22:37 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id g21-20020a05620a13d500b006b9264191b5sm6007940qkl.32.2022.09.13.07.22.37
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:22:37 -0700 (PDT)
Date: Tue, 13 Sep 2022 10:22:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 v0.9.1 available
Message-ID: <20220913142235.jh43kraiqv6trl34@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yg62wpx4wcauhu56"
Content-Disposition: inline


--yg62wpx4wcauhu56
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

B4 version 0.9.1 is now available. It is a bugfix release that addresses the
following issues:

- bumps Python version requirement to 3.8 to match reality
- allows retrieving threads from arbitrary public-inbox servers when full URL
  is passed as parameter
- fixes a crash due to DNS resolver issues during DKIM verification
- fixes a regression that resulted in the -p flag not working

Special thanks to the following people for helping with this release:

- Mark Brown <broonie@kernel.org>
- Philippe Blain <levraiphilippeblain@gmail.com>

To update if you've installed from pip:

    pip install --upgrade b4

A signed tarball can be downloaded from the usual location:
https://mirrors.edge.kernel.org/pub/software/devel/b4/

---
Shortlog:

Konstantin Ryabitsev (5):
      Create stable-0.9.y and up the version to 0.9.1-dev
      Fix regression that resulted in ignored -p
      mbox: accept arbitrary public-inbox URLs
      Don't crash on DKIM resolver failures
      Prepare for 0.9.1 release

Philippe Blain (1):
      setup.py: bump python_requires to 3.8


Best regards,
Konstantin

--yg62wpx4wcauhu56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYyCSKwAKCRC2xBzjVmSZ
bN9JAP9V6yN+p4N+PPxrEphOEGYpC+6ihnSm1ZaL3koLLwVpSAD7BZ9HAwYL53WF
xXyOqJVO69jdqBQHfoUYIVrulXskhQU=
=epWe
-----END PGP SIGNATURE-----

--yg62wpx4wcauhu56--

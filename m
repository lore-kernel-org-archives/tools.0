Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B46CD53F
	for <tools@linux.kernel.org>; Thu,  5 Jan 2023 16:40:06 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id i10so16974384vsr.12
        for <tools@linux.kernel.org>; Thu, 05 Jan 2023 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9Q+SBXvukexyHVBLw7sSucscC++rEnr5Fcsx0asniA=;
        b=SPw4cJ19RmXifGuJQUu30CuESBo+cbEU0Gd7/vET/JnOoNWAmsp5TzHxy6A4oOr+md
         88FYpsWF/MMLpeBCE30hY3iCQTvixO8iVpPix8+DY2AmmasGxwWqUjpqQTsfFF6UdoRg
         xztsafVKCWBFguCrLHBzYUochtTvnNsXuXDU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9Q+SBXvukexyHVBLw7sSucscC++rEnr5Fcsx0asniA=;
        b=0ZlIhrfsJsd7xBEYabjqcCPhgtTNecrLBJzK0AAzrr0v023qGXw6oEp97Yk3jjayyr
         UZB2lrp0BiuDKgclMwjawaN8OORaQVqGaheqI6izGM5yV4o5ZZoFir+Kiezfg8guPYqb
         tDcSMQeLI4cafoQRKizgblhlmzyn8QDEKVrco4BPLtXPubKJUSam9AtRwI8WL/hSm+Nv
         bNKYJTDn/YWpocQeNJeFov/38EeD3AeNzWKctzpEZmyBaJkR74sV/mWIpM77FZqsOShD
         9kpDQMfC8Nth+8mnuGyhtSxlYIfezzSnAw9zWYDoebtobqshVqtm/9l1wumDvCQtPfvV
         7Q4A==
X-Gm-Message-State: AFqh2kphEwpy1pou/QU3cxG5gIjyEamfkjCi/wzd56bzoZ/0yBdlVhXh
	PNGiiWaLxAiWZpV68TeRgqNUUIO/WRsxc/3e
X-Google-Smtp-Source: AMrXdXv5pakjOqSjDbYXNUR/UB1pbp0i/nJJLah3wgmU6BwZQkTnrJgSZAEbJ0LH9ByDmuQsUvHKHQ==
X-Received: by 2002:a67:f2c6:0:b0:3ce:88b3:d7d8 with SMTP id a6-20020a67f2c6000000b003ce88b3d7d8mr9055004vsn.19.1672936805155;
        Thu, 05 Jan 2023 08:40:05 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id d136-20020ae9ef8e000000b006fae7e6204bsm25362170qkg.108.2023.01.05.08.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:40:04 -0800 (PST)
Date: Thu, 5 Jan 2023 11:40:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 v0.11.2 available
Message-ID: <20230105164003.kv35ovoeshcvgnia@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gonl5ey562r5lzvr"
Content-Disposition: inline


--gonl5ey562r5lzvr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

B4 v0.11.2 is available in the usual places. This is a small bump release with
a number of hotfixes. Everyone using v0.10 or v0.11 should upgrade to the
latest version.

To upgrade using pip:

    pip install --upgrade b4

Shortlog:

	Konstantin Ryabitsev (6):
		  Always run log with --no-abbrev-commit
		  Handle series with more than 999 patches
		  ez: dedupe cover letter CCs taken from individual patches
		  ez: avoid header wrapping when writing to file
		  ez: don't crash on non-existent tag in show_info
		  Prep for 0.11.2

Special thanks to the following people for their bug reports, in reverse log
order:

    Quentin Schulz <quentin.schulz@theobroma-systems.com>
    Nathan Chancellor <nathan@kernel.org>
    Bill Pemberton <wfp5p@worldbroken.com>

-Konstantin

--gonl5ey562r5lzvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY7b9YwAKCRC2xBzjVmSZ
bIQYAP9nM7qxGytLvnv3/AlSFoGjBodwTKXIjWZoRSd+/Vh7+gD/ag8nnwzrgbF/
NZmj1Omq6PdDx0Ts4WsLs6Fd3FAjDAo=
=RLUz
-----END PGP SIGNATURE-----

--gonl5ey562r5lzvr--

Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6CDABA
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 20:59:37 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id ks17so4467752qvb.6
        for <tools@linux.kernel.org>; Fri, 10 Mar 2023 12:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678481977;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kh/aT0WBEz9uYm/09yK8PwxbS580HBX+/kntbnQIzJc=;
        b=KMbRPqOG5ArjGtRLe1ZBCcPI4skKGQGNU3RxESKdcAnAIBapkyj4yXJQjR1T1SZOHH
         FwpjQIsVUEnEyNvC37+5KaJPvwewvE/eEnmQwPwZ3HjAFgGJnFJJYBPLfgFn+nB1Eblw
         xq21oAhuB5N3m8RD3ov/jFPD01PXQxjFfpoh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678481977;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh/aT0WBEz9uYm/09yK8PwxbS580HBX+/kntbnQIzJc=;
        b=8BqotatbKb1xvL3hPrF3udrP3yardQVapTGCOjpGD++HgkHp/7hRIWflMaP681tv8E
         CHFMIkldsW6VUQ+OwEtiLBwNdssYzlLpOZULdCPULU5c5aB35Cy9fusrUqO+u4IafnJJ
         f1w0uIK5luMMzoObltlWArCyfvzjJ3zxg+WyqiqLzxzwkb11lazIfD7Czo4FvvYa/I4K
         WtgPUYwupiCxLVVac4qrA6fifFQqzaHodV8Rmc4eBSrLQGrJv3tr8DX9lkz3IhTyPKYV
         /ZFLLgJyqQA+dJgSHUApJ48hEpCM08k16z5/eKtX6AG8q343fTyoAFzIBvyFfWZPVadK
         J9ZQ==
X-Gm-Message-State: AO0yUKW0qQ2Jpg0J4WEvgCZuTrv11BWv7LspihD7CwgCXQok8Kt1GRIZ
	Jrtp+fbxlmKq+AoNl0uQmeGD3g==
X-Google-Smtp-Source: AK7set/iN7RxZGvAIpwUQT7m92r5I74nFPBJg7Vd7eBrexpr+LwzTOqOvleDLY5nI01MT3IU2QzpCg==
X-Received: by 2002:a05:6214:19c9:b0:56e:ab08:670b with SMTP id j9-20020a05621419c900b0056eab08670bmr571748qvc.34.1678481976717;
        Fri, 10 Mar 2023 12:59:36 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id w25-20020a05620a129900b0073b8512d2dbsm462600qki.72.2023.03.10.12.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 12:59:35 -0800 (PST)
Date: Fri, 10 Mar 2023 15:59:33 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 v0.12.2 available
Message-ID: <20230310205933.yumi2udfqrfubccg@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdxveb6uvskwm3k5"
Content-Disposition: inline


--bdxveb6uvskwm3k5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

This release contains bugfixes and minor feature improvements:

- prep: add ability to use markdown in the cover content (requires escaping
  the leading "#" as ">#" that is stripped on cover letter rendering)
- send: don't require vN to --resend (will resend the latest version)
- test: don't require running from git
- plus several bugfixes mostly dealing with corner-case conditions

Updating:
https://b4.docs.kernel.org/en/latest/installing.html#upgrading

Special thanks to the following people for their help, in reverse-log order:

- Marc Kleine-Budde <mkl@pengutronix.de>
- Michael Ellerman <mpe@ellerman.id.au>
- H=C3=A9ctor Or=C3=B3n Mart=C3=ADnez <zumbi@debian.org>
- Thomas Wei=C3=9Fschuh <thomas@t-8ch.de>
- Philippe Blain <levraiphilippeblain@gmail.com>
- Rob Herring <robh@kernel.org>

Best wishes,
Konstantin

--bdxveb6uvskwm3k5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCZAuaNQAKCRC2xBzjVmSZ
bI2pAP4xgXmZCpFgjm5RV6WpEJYrpOocOyzWEMQTHKXlkNcy1gEAsQ1rhJKkxBU0
uwThjs21E0aPKJrCEUvW1Te00GLQuAQ=
=698K
-----END PGP SIGNATURE-----

--bdxveb6uvskwm3k5--

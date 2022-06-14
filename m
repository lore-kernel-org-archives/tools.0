Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E87423C3
	for <tools@linux.kernel.org>; Tue, 14 Jun 2022 21:39:59 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id p63so7406465qkd.10
        for <tools@linux.kernel.org>; Tue, 14 Jun 2022 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=oJunlsAmzGkFE+eYonEN7ePIMkPBJmtXhZS1qoyxgjE=;
        b=EduGzTJxrJm2sAnPayk6sMXbxSrYGYlSfQZkTSawg25NSZHneCdQjv5IBE4ACLTzIz
         QUrL4LI0dgsDoLaSR+3e2AZmYcodYFxweql84RSeEbcZDTFmPPjzWtOSPcQlC6Fv+U7b
         JVZkayi6iZU19yynSm3NviCk8fGIfuB3y58ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=oJunlsAmzGkFE+eYonEN7ePIMkPBJmtXhZS1qoyxgjE=;
        b=wXmwh9cs45BHjcYVX201DEeyqvUS65zaC4BnnNCwhGeCX6HL8GXknoV36oV2Kr+FLs
         VO/UjiyIyGXAvr5vk6cAYMwtgt/tv/TlpUbs7OWIIoVVR7iwXShpgrz/RTDeTAijk60B
         drtvZT6dY6w5GblhE4SnnuXIc1B0vLlKWINHrnNcZRXxx72vs1Ss2dQbsPMGGUKg2lWN
         iIDDq6dVqQTppeeC0U5YeOBxKcgS8iSp5GfUBqMSdytdjrCKbuhjzrJwF+0Fc/PA+GfR
         DEk07z0Kcn6wsFZ3dCwsC8lTkc2TOr96/95PTdWYlJtgCBKM2M8Yb+okIitNWtvm4exR
         vUcw==
X-Gm-Message-State: AOAM533j7zVDf89vCL1zxY0yqqqNblIvmxxLajtOHpzV2JXhfM/pyWQC
	qidoJpBZCedlb/5DTCSGa477bNiiboKhVA==
X-Google-Smtp-Source: ABdhPJyRttHGW+x43FKGjTlPqLNLF+gkW4XUepXtGXiMZUfB7kkNk3l63zWiqi6aEuaB2s8GLD8dqQ==
X-Received: by 2002:a05:620a:1272:b0:6a6:bdc1:8f92 with SMTP id b18-20020a05620a127200b006a6bdc18f92mr5729030qkl.330.1655242798080;
        Tue, 14 Jun 2022 14:39:58 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id cf11-20020a05622a400b00b003050de40028sm7716837qtb.84.2022.06.14.14.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 14:39:57 -0700 (PDT)
Date: Tue, 14 Jun 2022 17:39:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 Link: trailer disambiguation poll
Message-ID: <20220614213955.eyex4bekp44iroud@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iowow3kig7lom65t"
Content-Disposition: inline


--iowow3kig7lom65t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello, all:

It is common practice to use Link: trailers in commits to provide a way to
view the series as original patches sent to the list; "b4 am" will do this
automatically in the presence of the -l flag.

Recently, Linus suggested that this should be disambiguated in order to help
maintainers distinguish pure archival links from actual list discussion
threads where the feature/fix is discussed. See this conversation for conte=
xt:

https://lore.kernel.org/CAHk-=3Dwj9zKJGA_6SJOMPiQEoYke6cKX-FV3X_5zNXOcFJX1k=
OQ@mail.gmail.com

One of the suggested solutions is to use "PatchLink: " which is similar to
"BugLink" already used for linking to bug reports.=20

However, other options were also suggested, and I want to survey everyone's
general preference.

So, please vote on this poll to help decide what the trailer for linking to
patch series should be:

https://docs.google.com/forms/d/e/1FAIpQLSf8fiT3Q_9LhqEvE2K8n22HZ0B2t7kpEK_=
XapoGK_kE0SOb4A/viewform?usp=3Dsf_link

The winning option will go into b4 v0.9.

Thanks,
-K

--iowow3kig7lom65t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYqkAKwAKCRC2xBzjVmSZ
bFmzAQDMRjjbDrycjZcoaMmBLL95ZfOiZlo640tFSF7RzBN49gEAyAYGVUF1L5j2
7opqsc6Fd049nynA6OdYpOT/x02ucgI=
=W3Ao
-----END PGP SIGNATURE-----

--iowow3kig7lom65t--

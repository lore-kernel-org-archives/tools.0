Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.1006.1589221590933864603
 for <tools@linux.kernel.org>;
 Mon, 11 May 2020 11:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cf3XFL4F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.52, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f52.google.com with SMTP id z5so3118177qvw.4
        for <tools@linux.kernel.org>; Mon, 11 May 2020 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kUcW/qqcbdlg5TNTcV51OQbYIYNyl9lQNZCgXsAwavw=;
        b=cf3XFL4Fvwq73UxXiSMfZsJa1ioPDoAcM33xbuF+yZ4DEwW1SqfoMrhhTVixSfQCoO
         /Z56lNDDrYpWueMq+bSUxHpwk6rzOfUZ7Zy63fIcFcx8p13e+e43h/EnOGiC76+Sz+m7
         n+n/KcYNbhhqc4WCnCF8MyO3rDaxMTbkDp9PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kUcW/qqcbdlg5TNTcV51OQbYIYNyl9lQNZCgXsAwavw=;
        b=mTfHrdqXbu1KC4qeqZPKuJjuP72Zw5m7Zf8esvHhA/hWeKFgTvmcmpFsqmvFSI4dK7
         RZpeBA+nBcMD/+KchLvrA3N6hYl0cGbV14HjVbphtU8T9wHNs4FNGZqzkKymmxJ98BxH
         o7rBFBfAQOKamc6dgfq2u4rbeIg2++m4iDTUCUCrCh5bdCb12N2UszIoA1BwBWlHL4Wf
         ubBUnyKZfq1Csp9qL+GYLkpbORNTk39AWhriYmKSvcfLy5uK5zANczN8502n0GEX8/OJ
         BzmBcN+PDHXDA+3qmH3vthPrBvBgcuUh9DF9KVh7TOJZhjsfYf6dbmqcZhP+tMwj3oLx
         qXkw==
X-Gm-Message-State: AGi0PuYGru/2g7e+BfukX7MVZU3tevt/n5LOeRsmLtIa3X5DOB1UzYTE
	r2h/RXy6jsnlaoqBpR9OZ4ey5Q==
X-Google-Smtp-Source: APiQypJfx89YVROzYbeds37f4juLb2URjePLG8CWqMvcAvu7G8eMrgyKnOrFOkoY6t9cj2UxQUn+SA==
X-Received: by 2002:ad4:4b6b:: with SMTP id m11mr16668286qvx.130.1589221590029;
        Mon, 11 May 2020 11:26:30 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id 124sm8900548qkl.76.2020.05.11.11.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:26:29 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 11 May 2020 14:26:27 -0400
Date: Mon, 11 May 2020 14:26:27 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty issues with no patches matching
Message-ID: <20200511182627.477l2gclz5dhagvc@chatter.i7.local>
References: <20200511172803.GI8216@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200511172803.GI8216@sirena.org.uk>
X-Groupsio-MsgNum: 149
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pktwkir4gsph7u7l"
Content-Disposition: inline

--pktwkir4gsph7u7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 06:28:03PM +0100, Mark Brown wrote:
> Since a recent update when using b4 ty -a to thank for everything that's
> applied in a given branch it started generating thanks mails for patches
> that aren't in the branch at all:
>=20
> |  WARNING: None of the patches matched for: [PATCH v1] ASoC: rsnd: add i=
nterrupt support for SSI BUSIF buffer
> |           Please review the resulting message
> |  Writing: /tmp/tmp.f58uBPLZuA/giraffesnn123_gmail_com_patch_v1_asoc_rsn=
d_add_interrupt_support_for_ssi_busif_buffer.thanks
>=20
> which then causes further problems as b4 expires the patches from its
> database.

You're right -- when I relaxed the rules to allow forcefully sending=20
series selected with -s, the auto-thankanator logic broke.

The latest master/stable-0.4.y fixes this.

Sorry about that.

-K

--pktwkir4gsph7u7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXrmY0QAKCRC2xBzjVmSZ
bGgpAQCaqb/QgUgxc1NNJyExTDYypmQkPifidIBAOlUw1uu/1AD+MWmRpQXRPIvV
1mAxd+Hal+FCfxmBbLlFHuWrizG6nQ4=
=aNdt
-----END PGP SIGNATURE-----

--pktwkir4gsph7u7l--

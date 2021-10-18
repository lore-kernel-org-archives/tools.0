Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49472
	for <tools@linux.kernel.org>; Mon, 18 Oct 2021 13:44:48 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id b12so15298404qtq.3
        for <tools@linux.kernel.org>; Mon, 18 Oct 2021 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zIFW2fKOA7zj+GfN9/ccZbeIX2JSi+GR8121cKWTLF8=;
        b=SnTPc67pHkJqvJl2a4V0jWcBs8ISblXyJyu6rtNRHkV53QXjlTH6JSy9SBTyHDeI1V
         VMpPlWs0bob+9q9/AxFJp0fA8G8nKZvfZuMUPvmEfiXh73L031G1QbdqgYWPUy/q5JBd
         8y1B7VbbGfReuZ1X7HGpWhXrP+aIozeTSEYlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zIFW2fKOA7zj+GfN9/ccZbeIX2JSi+GR8121cKWTLF8=;
        b=LFb3O+fDKfVekxQGfg9pm31KmqrHMO7+4Iv0je2dPD3HlWwN73HmNHN/39cXMb9CIb
         4kohw7x5/9NJdSnCVHG93QKEaYcFz/tjRtSt4MJt3caSLTFhAsaoH+T2aUXElv8j5LcP
         aDLQ+mNL3o4vDvtpb4Yw35DP5Afu85hm8j9lD+eL2Ju/d4QN+YH31SNV6EwVL92gu/bq
         Kybao/h/USpECeIRKoj+9a0jNqY6Tpro6Z8zAVWRF/pSUEZ055Pg1xXpsGoDLKcD7O4w
         RO6aSDRmCwNo8+UuqRi77+k8EWJIDaxXyE+h73/BIQogWfV9TF4zI+AU7EBOr3ZNVqRc
         rKkw==
X-Gm-Message-State: AOAM531TYxT/N1whWX0lluDTLZa1J5+NCRmlZ1bPy7w/TynZQnxAtX+k
	IBBkyiGOi7ukWluuSyfYEmOCFA==
X-Google-Smtp-Source: ABdhPJy6Vsb0mev8WuwH/b79C5PTLrH040D+AgEgy+2K+3wbd6ociOrSr0T2ovqbFJqEe/wu54MrDg==
X-Received: by 2002:a05:622a:118e:: with SMTP id m14mr30296411qtk.135.1634564687010;
        Mon, 18 Oct 2021 06:44:47 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id bj37sm2431543qkb.49.2021.10.18.06.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 06:44:46 -0700 (PDT)
Date: Mon, 18 Oct 2021 09:44:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: tools@linux.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2 net-next] Let spi drivers return 0 in .remove()
Message-ID: <20211018134444.k5k45xiy652cklyl@meerkat.local>
References: <20211015065615.2795190-1-u.kleine-koenig@pengutronix.de>
 <163455901125.7340.7337638653547301526.git-patchwork-notify@kernel.org>
 <20211018122346.ur4lyv345fbijh2o@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vaamc6candj7g7lw"
Content-Disposition: inline
In-Reply-To: <20211018122346.ur4lyv345fbijh2o@pengutronix.de>


--vaamc6candj7g7lw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 02:23:46PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> the patchwork bot did something strange, see
>=20
> 	https://lore.kernel.org/r/163455901125.7340.7337638653547301526.git-patc=
hwork-notify@kernel.org
>=20
> . My email address (see To:) was somehow mangled. The resulting mail
> didn't get into my inbox. (Just noticed because I also get mails sent to
> kernel@pengutronix.de in a different folder.)

Good find, let me see if I can fix this. I think I've handled a similar
problem with b4, so it's just a matter of figuring out what I did there and
porting it to the patchwork bot.

Thanks,
-K


--vaamc6candj7g7lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYW16TAAKCRC2xBzjVmSZ
bJFTAP976MhXO1zaZx+Xe+3iopLMFxTgwolUbKv7hbHKtl3+cgD+Je10ZN6AMtbO
cpoiZpwATyGhKo7mCleyhkYDtxtkjAc=
=xNA/
-----END PGP SIGNATURE-----

--vaamc6candj7g7lw--

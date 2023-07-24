Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F16C1C03
	for <tools@linux.kernel.org>; Mon, 24 Jul 2023 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690186078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wxrkxkdUsFbpRuuU4HKTJ9HeYWX/i4gWKHSFF179S0o=;
	b=Ai8D8dIMM/01ZJxD0+HTTpnfvBNPsXZe5+OkbXEkoYKcAxYOaSRxZPTOGmPqP8eLaJy071
	m0eN2YGoaRmhjKcfn4dwxmPIrXi7e55C17i/8KPnt/oveNYNyFTRYhTSaSg8sL6ak/VAoI
	YjROEPN//hICQcCidMrBT1AqwY6q9NE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-5VQhyd6IPrGxL1hTxQse4Q-1; Mon, 24 Jul 2023 04:07:56 -0400
X-MC-Unique: 5VQhyd6IPrGxL1hTxQse4Q-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-315926005c9so1881263f8f.0
        for <tools@linux.kernel.org>; Mon, 24 Jul 2023 01:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186075; x=1690790875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxrkxkdUsFbpRuuU4HKTJ9HeYWX/i4gWKHSFF179S0o=;
        b=AcpTasCIzQnksQvZmr3i/fgaNIzfOqL9rDrMT1C+UCGH0VlnUkse3TqGV1ydcfSFcE
         9xLnRRQ6CNitNsUcRn2qJVPCx+4ELQssBu+CZeXisrRwu8lgs4QdZNFIKY63qxRyW0Sl
         1Ra4DZNVYJP9Z4l8+OZdnyApxGoDDSRhvBJfnMsHFLxBtVg5c5GtM5cPoo0hoK3S/INy
         Dmk4xLfkxuJvsCWBfM6ZOX+0cZqVaea7QgAvm1ckry2jr0iVR28xVS5p8ZhoRGHobHe4
         CY3dOmJ2qnQK66uNwyegbJhd2iYGvJo7vtmq+6DNO0O0ZaSHRBssLUNXoLn9OLk1qHsj
         2tuw==
X-Gm-Message-State: ABy/qLbCLJZzIsrdnizA2lW0FHZ5BglyJSgfTK6WeyfOYoPd3Eq1JMGc
	qLYDBYldX3pHtE3cupyEdoyGMcCUvveCnOB1shpkDW7fodS4aItEWy5hS9w0jtsd4wEvmyKOiWH
	p+h5gYyIxZ+Wj1Nnt6yP/0eNp
X-Received: by 2002:adf:fd92:0:b0:314:a0:6363 with SMTP id d18-20020adffd92000000b0031400a06363mr5902479wrr.50.1690186074883;
        Mon, 24 Jul 2023 01:07:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFbKafarGMtjUQb8ZHpstToA0B9DIjJxZQN7n+ulbD1pslPpx+uhhLrNvWb0f2AzfnQ84zhIw==
X-Received: by 2002:adf:fd92:0:b0:314:a0:6363 with SMTP id d18-20020adffd92000000b0031400a06363mr5902471wrr.50.1690186074604;
        Mon, 24 Jul 2023 01:07:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d6382000000b00314427091a2sm11899843wru.98.2023.07.24.01.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:07:54 -0700 (PDT)
Date: Mon, 24 Jul 2023 10:07:53 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Fetching an mbox from lore
Message-ID: <fhamkwzcikyuczlnkdzg5u3hsfp65lpttdumz45wputrqveaid@oqrdi6vte42n>
References: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
 <CAL_JsqLW4rs5AqCg+Ghxeb7+Ge3tnu7JQpA85HxrTX-1DZQH_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ztlqc5mxun2beoe"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLW4rs5AqCg+Ghxeb7+Ge3tnu7JQpA85HxrTX-1DZQH_A@mail.gmail.com>


--4ztlqc5mxun2beoe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Sat, Jul 22, 2023 at 04:34:01PM -0600, Rob Herring wrote:
> On Sat, Jul 22, 2023 at 11:13=E2=80=AFAM Maxime Ripard <mripard@redhat.co=
m> wrote:
> >
> > Hi,
> >
> > I've been trying to fetch an mbox from lore with an arbitrary search re=
quest.
>=20
> Any reason you aren't just using lei? This is my script to get such an
> mbox and open it in mutt.

Yeah, I'm trying to add support for lore in did:

https://github.com/psss/did

So I'd rather avoid adding an external dependency and prefer to do it in
pure python.

Maxime

--4ztlqc5mxun2beoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZL4xWQAKCRDj7w1vZxhR
xUpIAP9mfSHEj4Y2sDpIPgjGm2EGULSbv1eXzVP5Aq0CZMvrhgD8DWuHwIoUsSVf
zG8M00cF1ptcjCZrxDSW9Qq1LiomXg8=
=AM6z
-----END PGP SIGNATURE-----

--4ztlqc5mxun2beoe--


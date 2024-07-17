Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902AB433DF
	for <tools@linux.kernel.org>; Wed, 17 Jul 2024 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721221181; cv=none; b=NM6izHiFmgItXfozjtYRjtA+pqrrW2ovLVbYYAE0BC/hek8DseMjh6joYLH/kbR61Mxv6V674HNfZZnWkn6geKzFU4dSiwaGvBf+HKzyWJeMkmH5PJau1a5G0Ke5GP5mw9FexOH8DI+bAYkVuBYwNyiH4bdJUnk5CPIJbplS5r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721221181; c=relaxed/simple;
	bh=w5deseea/1hKnkJjj2ARxmdC+XkevGDYZX/7Qj9KWNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3rzGVwJJFjM4l5qf5sKSy1KTefZCBU/b/F8N2QM7FpJfWTuKYOvzJnlsjRwzBU9AuLuxSvL447D3XdjfHOsOelhYg6jMLyrt7vebs7yoIQuvD+P2OunLCy8u1ouy+ug9rwQXExZT2orkpnIpKdfadlGFnPuEPaxSVfalChTRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HATWJf1f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HATWJf1f"
Received: by smtp.kernel.org (Postfix)
	id 225B0C4AF09; Wed, 17 Jul 2024 12:59:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6307AC4AF0B
	for <tools@kernel.org>; Wed, 17 Jul 2024 12:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6307AC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721221178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w5deseea/1hKnkJjj2ARxmdC+XkevGDYZX/7Qj9KWNk=;
	b=HATWJf1fWhhpzFXWc0+71G30GrNWlRx8saDzDQVCU+k92dF9rzQVeMMYkxOSVOy017RHzJ
	iLVSc0HzvFZURpxgoseKKv+oDipIvoxhbfnhLVwGZn7ezTNE8MJuxLP4Jf7xAfXgs+0Y/1
	NP8OJpJomuHRmU2SJmo5emNLNADtF9g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-6Gr3H_ztOBumIEdOsRfSqA-1; Wed, 17 Jul 2024 08:59:36 -0400
X-MC-Unique: 6Gr3H_ztOBumIEdOsRfSqA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-368255decf3so1660604f8f.3
        for <tools@kernel.org>; Wed, 17 Jul 2024 05:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721221175; x=1721825975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5deseea/1hKnkJjj2ARxmdC+XkevGDYZX/7Qj9KWNk=;
        b=fbZjRR4i8+3guflmvKnP6eAuizlxNRVMO2LNgsyNOp9WE0XBq8NGrUsQffeEkDEB/l
         yJq3A9WJ9iznXC0aAFcr+rK6HvFPB187lRW1+FVdIuItqyaqK5AOlqekbddnIKYqn3GU
         4IpDjWHZLvAA9pa63VMd2zQ4R1SmxX9631J+LqVN4apV8+Ad/O4RX0gVS+1KIBHNCzRd
         VteBqaLHu9WEV9+C39j8QZisTUNbzuPE/VAA80vIzAufZj8EJTgMxYiznc2bqpz0jGq2
         WZ0Pb+3oqKCVh4bWyHSBBNDevl1/n+P3G8WKVRPepT/8g9v1WTtJw4ApmW/rKwuhbYQ9
         pskw==
X-Forwarded-Encrypted: i=1; AJvYcCUwqv4+7xtDWJhZCc5D5bb9U2Y2F5PBIZnNpwKJmMY/q8cX3x9XAXFEO2InfZOeUs7nZIzZjtTIC4Nrf7lSVgdg
X-Gm-Message-State: AOJu0Yy6dp/XUT2X2v7nMAbwn7asRlZFLMw/DjrRslPeexyvuCLol/TX
	ONYCThD0VmzavZhkbKJUkJeinYe+a5cr/3tB7V3afIB9l6e3kh7jWntyPqVkhxQ0UFof2wsSynf
	8U2si3qnEGB9lnPYpMC8INyw9WIE22MAsviqNd6UkjnbY1A==
X-Received: by 2002:a5d:544b:0:b0:367:8e68:4472 with SMTP id ffacd0b85a97d-368316511c1mr1308523f8f.34.1721221174970;
        Wed, 17 Jul 2024 05:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYLENmMBu9RsIkD6PhzigiwO4Twz92OAcrnIz7n2LrhkZyBekSdmbE8vCStu6ly4JyoVYanQ==
X-Received: by 2002:a5d:544b:0:b0:367:8e68:4472 with SMTP id ffacd0b85a97d-368316511c1mr1308510f8f.34.1721221174561;
        Wed, 17 Jul 2024 05:59:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb489sm170002045e9.37.2024.07.17.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 05:59:34 -0700 (PDT)
Date: Wed, 17 Jul 2024 14:59:33 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, tools@kernel.org, users@kernel.org
Subject: Re: b4 0.14.0 available
Message-ID: <20240717-curious-earwig-of-argument-ee5dae@houat>
References: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
 <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>
 <20240617-ancient-newt-of-art-6d2b27@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hn5jt3fz4c4ydn4m"
Content-Disposition: inline
In-Reply-To: <20240617-ancient-newt-of-art-6d2b27@lemur>


--hn5jt3fz4c4ydn4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Mon, Jun 17, 2024 at 03:10:15PM GMT, Konstantin Ryabitsev wrote:
> On Mon, Jun 17, 2024 at 07:49:58AM GMT, Jiri Slaby wrote:
> > On 14. 06. 24, 21:26, Konstantin Ryabitsev wrote:
> > > If you're using b4 via the git checkout, you can either update to lat=
est
> > > master, or checkout the new stable-0.14.y branch. You can also downlo=
ad signed
> > > tarballs from the usual location:
> >=20
> > Hi,
> >=20
> > with the new toml, strange files are installed:
> > /usr/lib/python3.11/site-packages/tests/__init__.py
> > /usr/lib/python3.11/site-packages/tests/__pycache__/__init__.cpython-31=
1.opt-1.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/__init__.cpython-31=
1.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/conftest.cpython-31=
1.opt-1.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/conftest.cpython-31=
1.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/test___init__.cpyth=
on-311.opt-1.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/test___init__.cpyth=
on-311.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/test_ez.cpython-311=
=2Eopt-1.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/test_ez.cpython-311=
=2Epyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/test_mbox.cpython-3=
11.opt-1.pyc
> > /usr/lib/python3.11/site-packages/tests/__pycache__/test_mbox.cpython-3=
11.pyc
> > /usr/lib/python3.11/site-packages/tests/conftest.py
> > /usr/lib/python3.11/site-packages/tests/test___init__.py
> > /usr/lib/python3.11/site-packages/tests/test_ez.py
> > /usr/lib/python3.11/site-packages/tests/test_mbox.py
>=20
> Sorry about that, I've now excluded the tests subdirectory. I'll publish
> 0.14.1 in the near future.

It looks like it wasn't enough, with current master (131835a44c63)

$ python -m build --wheel | grep tests
copying src/tests/__init__.py -> build/lib/tests
copying src/tests/conftest.py -> build/lib/tests
copying src/tests/test___init__.py -> build/lib/tests
copying src/tests/test_ez.py -> build/lib/tests
copying src/tests/test_mbox.py -> build/lib/tests
creating build/bdist.linux-x86_64/wheel/tests
copying build/lib/tests/__init__.py -> build/bdist.linux-x86_64/wheel/tests
copying build/lib/tests/conftest.py -> build/bdist.linux-x86_64/wheel/tests
copying build/lib/tests/test___init__.py -> build/bdist.linux-x86_64/wheel/=
tests
copying build/lib/tests/test_ez.py -> build/bdist.linux-x86_64/wheel/tests
copying build/lib/tests/test_mbox.py -> build/bdist.linux-x86_64/wheel/tests
adding 'tests/__init__.py'
adding 'tests/conftest.py'
adding 'tests/test___init__.py'
adding 'tests/test_ez.py'
adding 'tests/test_mbox.py'

Maxime

--hn5jt3fz4c4ydn4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZpfANQAKCRDj7w1vZxhR
xXm8AP0TzcgaYq4UVfMlwVJsHUj1xEF8Ho+E/uRX8MWJx3XBEQD9F6/7Hj4j5722
FQBaUE/4oEJnvwkHNIDIQv+qDZvw+Qg=
=XXaD
-----END PGP SIGNATURE-----

--hn5jt3fz4c4ydn4m--


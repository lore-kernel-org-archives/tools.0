Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884D823C8
	for <tools@linux.kernel.org>; Thu, 18 Jul 2024 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721300764; cv=none; b=owOcIzgicsEBm9UI4AlzPSYsRUO5idFV/VM6eWAqKQ+Y993uFbLAG/KdSA9GIIJ3I6KJApJkduV5vUlkQcWHE4YLKp0j45Ece+6QBvJSv5Z3THOJ4S+Nt4LzOizKiDU5H+TFQ/9u7teT/FUq7cwAg3JGo66wRFexF31CHuwcyBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721300764; c=relaxed/simple;
	bh=O8DtNjrtj8zJ8gU9y4z8RzlpkoQHM9tqGUya2j2TdtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msNPEpHqSLxNpp8KZMrtqv3QDMqNnnJkc3luAuNPVJb13bud0Fv5kFSs3J+Udbz2A++7rt3TNCsaTe5x4roHRSvivFA0FlYsbBqVJojuJ4K9Zy6Task5KA8oWEGAkj/W5cEH4vLeE8wNcf9r2rWjYh+hrlaNof1APiu0XTo68TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqYL6O7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqYL6O7o"
Received: by smtp.kernel.org (Postfix)
	id 60EEAC4AF0B; Thu, 18 Jul 2024 11:06:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E85D0C4E672
	for <tools@kernel.org>; Thu, 18 Jul 2024 11:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E85D0C4E672
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721300760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O8DtNjrtj8zJ8gU9y4z8RzlpkoQHM9tqGUya2j2TdtU=;
	b=EqYL6O7o9/xMT54WXWfA0PvfaFD+XsMzkS/PanzYFz0Z2IEJrlY7gUiJZuMgAo+MR1jhz2
	zSY+h7/UVZ7U5Ng+HvFUUNVlSBc5l29i0Da4hjkAQNWlukmeBAsoOH3ckvWHHVZsoMbr7L
	KFj5W0APu7XfQRChystbHG8l7SPxT4c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363--uClEDbpOm6XVEyGIg7lBQ-1; Thu, 18 Jul 2024 07:05:55 -0400
X-MC-Unique: -uClEDbpOm6XVEyGIg7lBQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42725ec6e0aso1522685e9.0
        for <tools@kernel.org>; Thu, 18 Jul 2024 04:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721300755; x=1721905555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8DtNjrtj8zJ8gU9y4z8RzlpkoQHM9tqGUya2j2TdtU=;
        b=dC9TZ3RCM0iaIjl/6P0CCZNKRVj3JLeIgaCp37lZlJlr8HOd24iiNM3ul8H0pZU9pw
         An/ibQW/HodneI5nQKj2IR2qFFIyYo/T+6fdrFL4DLt6aS0K8gdgiBd44QBo0MthIo8V
         uimfLZEdLArL1o5FFxpMZTs4yH+RT/X3i1KnLnMZm5iDZH9gKijMKvzWdtCCuiDTUweE
         ClpHs1nOeNjXib5ZbncVpYWaIbdt8gp43iKpZG8UJtjYuYTL9WdVmdzdue2GTrTOGmP4
         DOUVKZq5ecYLPpEhtm1IXaLwfvs4uO2ma++U70MqgqbR+Da2YngemQ4GZ8uFJVVDZrkT
         tP1w==
X-Forwarded-Encrypted: i=1; AJvYcCVFbFdYiOiLwhjUHSDPoqEZbt4eKUDGPBUEBsESJh5jfxsVMWfivHq82zLLATf6iTbmaDcr7b1DQl7zlPHjYAn3
X-Gm-Message-State: AOJu0YymJdE//W8NF8OfwYU5JlX+KKiQOBkMhI6thIRUCSm/dgrXVhtb
	VGwz6RUPYXzECQryRaNAiQ8D11HvJSLLHDkPuwkOgSXJYNSib7cvS5dlv7KgPc7+pbTnOQmV/Jw
	0nQa0S7nGkQsKLa1d4LuHei0Mblnj+RxX8BWIcml2Akv43g==
X-Received: by 2002:a05:600c:3d15:b0:426:6b92:387d with SMTP id 5b1f17b1804b1-427c2cc37a0mr30397895e9.21.1721300754722;
        Thu, 18 Jul 2024 04:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS/9JLd8t325FQXj3g+qIU45pEraMl86JBp6KsSLNBSvO5jH92Wi37dcq9IgNpFNT5zSYuEg==
X-Received: by 2002:a05:600c:3d15:b0:426:6b92:387d with SMTP id 5b1f17b1804b1-427c2cc37a0mr30397715e9.21.1721300754289;
        Thu, 18 Jul 2024 04:05:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2b2a11asm7424315e9.40.2024.07.18.04.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 04:05:53 -0700 (PDT)
Date: Thu, 18 Jul 2024 13:05:53 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, tools@kernel.org, users@kernel.org
Subject: Re: b4 0.14.0 available
Message-ID: <20240718-quixotic-laughing-dog-fb14ba@houat>
References: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
 <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>
 <20240617-ancient-newt-of-art-6d2b27@lemur>
 <20240717-curious-earwig-of-argument-ee5dae@houat>
 <20240717-dark-noisy-copperhead-3ac7cb@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4nhjl42knm5rricu"
Content-Disposition: inline
In-Reply-To: <20240717-dark-noisy-copperhead-3ac7cb@lemur>


--4nhjl42knm5rricu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 17, 2024 at 01:15:04PM GMT, Konstantin Ryabitsev wrote:
> On Wed, Jul 17, 2024 at 02:59:33PM GMT, Maxime Ripard wrote:
> > > Sorry about that, I've now excluded the tests subdirectory. I'll publ=
ish
> > > 0.14.1 in the near future.
> >=20
> > It looks like it wasn't enough, with current master (131835a44c63)
> >=20
> > $ python -m build --wheel | grep tests
> > copying src/tests/__init__.py -> build/lib/tests
> > copying src/tests/conftest.py -> build/lib/tests
> > copying src/tests/test___init__.py -> build/lib/tests
> > copying src/tests/test_ez.py -> build/lib/tests
> > copying src/tests/test_mbox.py -> build/lib/tests
> > creating build/bdist.linux-x86_64/wheel/tests
> > copying build/lib/tests/__init__.py -> build/bdist.linux-x86_64/wheel/t=
ests
> > copying build/lib/tests/conftest.py -> build/bdist.linux-x86_64/wheel/t=
ests
> > copying build/lib/tests/test___init__.py -> build/bdist.linux-x86_64/wh=
eel/tests
> > copying build/lib/tests/test_ez.py -> build/bdist.linux-x86_64/wheel/te=
sts
> > copying build/lib/tests/test_mbox.py -> build/bdist.linux-x86_64/wheel/=
tests
> > adding 'tests/__init__.py'
> > adding 'tests/conftest.py'
> > adding 'tests/test___init__.py'
> > adding 'tests/test_ez.py'
> > adding 'tests/test_mbox.py'
>=20
> I believe I made the right incantations in the latest commit. Please chec=
k and
> let me know (you may need to run "git clean -fdx" before "python -m build=
" to
> get rid of all caches).

Yes, it works great now, thanks!

There's still the manpage issue, but I believe you're on it too.

Maxime

--4nhjl42knm5rricu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZpj3EQAKCRDj7w1vZxhR
xXXfAQDZvD2de8AAQTGx9O3/VR/ZjO2e+9NtJUF3AbL6r8s7RAD9EoXGcqMvAjJL
XgMqu5FO04C0ywyI16QlBhzGfXBqYgs=
=bltJ
-----END PGP SIGNATURE-----

--4nhjl42knm5rricu--


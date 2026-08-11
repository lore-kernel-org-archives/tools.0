Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DD83A16BC
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461324; cv=pass; b=lVx2vNbUfUhKzR7L96EC2r32WEY5j2xwgkAzHaHiinnK6xPrflwzjQMt2PXOI4L/Dg7y5NP7PxFS0dHfXSYpEW0qt3DpWASuYDVtK7Mi+aIQS2QRN0dIInTcAHeZN/aHNyglCXBIvO8bJOo9PeImb2LXzuGaBohvLZNkUeomVYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461324; c=relaxed/simple;
	bh=aQke8CSZ5dwSpSIkhqIDlIMr+XaINB9OWq25aXuI5Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvpJuzHdlKWmFsNIHPhO2AJxlNYNUuJqP7H7Q5j2eXR3Qo8odrZiMS7Pf2tRLQAUAJGfXBJojxF9Hx9gDtVFGczTbusll95YTkPiheFExElHO5WD82udD8yTpzrx1cEHdEOo31cLqrSaMWLxOBZxbey4RCZGZJ9LQdjJgHtVmI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fmLR+Xns; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tEE+2BsR; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fmLR+Xns";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tEE+2BsR"
Received: by smtp.kernel.org (Postfix)
	id 3A3991F00A3D; Tue, 11 Aug 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786461322;
	b=RFUefpHGPZLAlmPQkclAnGXntE2oJEJc15yVArktHnR14hPIQMUTSa7qU1FeM+KW+nNn
	 SHMSex/4DtkFHZBSm0DwmrHYl/ItOhMtIVfzrCDTptpckopeYOHQVp5JHl+zQ6GM8sqSQ
	 QAhFFGjSvJT/uxsQD3/B5uMrw8UxyhiMInRZcmKHvKhM3wH7YedGVGWADGn9t+DgYifzF
	 gdQCCXzeEe2NU4vgrEQPOhJ3N0qJaCYZg7CEFIKPCJ5VuwBQu9oVVaAbvDmN9xPI2qfC3
	 rrG94RvOnXfiZ6K+xGkfJhl9MpZp2HhuQZb2UBMeRn79pxowoE/+V++ac8FEb+g2a7Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786461322;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aQke8CSZ5dwSpSIkhqIDlIMr+XaINB9OWq25aXuI5Ss=;
	b=IuHOnhQj/wkM0VouD5Hja4Q1hpf8c+ylEqW+NPmBSLf9YZ6XI2Cbj2o0acCkakRnKS0P
	 LlS1bRtrmgaAYDa0kQlkKWtHjtEkPKhTua3bTlKrJO8j90U1xCXrW2sjLO7PD1nUNlMag
	 756S/N00MwwzLBBHrupY4zkg95IFdyeVgV6zzmx+tYw/9eAZJ9yDpTAPcwN9h7FgFnGso
	 re6YfQ6OZaFMoj7OCXW5c5vZu7zK9SyvOoV88wiT+2naxfDwlSTdYaG9OnZVr6Rr0QRR2
	 5XuVBB6juBZ9GLAd40hSVig/hjV4F1xKNKljMmCmn1PdDQNn+qK0+/NI/St4B9faf4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fmLR+Xns;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tEE+2BsR;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DB361F00A3A
	for <tools@kernel.org>; Tue, 11 Aug 2026 15:15:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fmLR+Xns;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tEE+2BsR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5DB361F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786461320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aQke8CSZ5dwSpSIkhqIDlIMr+XaINB9OWq25aXuI5Ss=;
	b=fmLR+XnsfKLT4Y3mOL6UOOxXt/INEUFSoNMqOHZzCwEFAuVIBKiSKUlCUUbmu4A+SMwYcT
	wQVP0IU2VJaSj2QshT6vOqoLpDh+hGojQDg73a5vaIzqb6XB6Pqv5EIp2RY6xwRdSIpylN
	4nzC056poKEMNjzYCyoc8cQUnjEihTQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-7Zbx11bbOia6m7gAnqlNJg-1; Tue, 11 Aug 2026 11:15:18 -0400
X-MC-Unique: 7Zbx11bbOia6m7gAnqlNJg-1
X-Mimecast-MFC-AGG-ID: 7Zbx11bbOia6m7gAnqlNJg_1786461317
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49808ea1b64so14579585e9.1
        for <tools@kernel.org>; Tue, 11 Aug 2026 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786461317; x=1787066117; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQke8CSZ5dwSpSIkhqIDlIMr+XaINB9OWq25aXuI5Ss=;
        b=tEE+2BsRE592qf/JvKxRSPvD8AQdjxY2XwUTXm9ogkTvFD5y2LqZDjXW/lfFWMf8bk
         1CQBQZTnvtmvdB08RRxWxxQ58aK33/MeuWDyNZAkksa8VwiOqo0216w+zDxr6jC3eJWL
         5+y9p7Sb4rq49s8767SI3S4R/NSNZ7KcneDC5SzSHczDzTEUowd0lv5r9ZfizE0uz51u
         qNSVYjiMqFcoFd07ScCNWlaJLUK6Tsd2lE901tFPQS40mMfUBhTXmxazi1IPBvGVILfF
         QLB4iR81ZbvNtWFGi1cMFGYk96hdf+YJzieRD1ZqsKwgrNTxapTJtMFihpeFB1EnAxN0
         YUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461317; x=1787066117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQke8CSZ5dwSpSIkhqIDlIMr+XaINB9OWq25aXuI5Ss=;
        b=Bj8LmR+qm7waFkgXXvvfCmZZWJ5XNPz/uQmhlgkGzv8U4op18L7Cpo3FaygUczSNRn
         yW6sZd6TCdebk5hQEzDbKSnv8Ty1bSiAb0f4TLU5v7n5baGpOK05Z45oyj+C6H1v6WMA
         cDRIvB3PuNlkgxDdCrAfhOPXvZ6l+1JqL7Nnn4YkdHH1eGfM73xhqG7/1+rgaSfNSiRs
         vaA9KaExCnQK61bRUMHkZePcKSJNUPJmAiwh1n7sF+Z/Lp1A9FL2DnxfrFNFYkJWl8kw
         +GULqvlnbjPz3bMwbiOfR3DRmymFqnoZfQZbAT1FtK8l16l2GVrG6KcZHK6DVEdp1f7z
         wVGg==
X-Gm-Message-State: AOJu0Yx0VhuOOhSrUSh61tgKaAUfQVhoOB9joBED1DIhv5NHzlJuJ9zB
	HlMlEzFNpY5cKOcud8otpRHbuKk3PRJJIwObGRNsiJfZl/3iCC3aoO5VEUEt1FDutHDD+I+xy0W
	i+Wm6pUMNbSqlh5qv/0uMSvoerAusvMmPlVURN4kWqIVgSjhnnA==
X-Gm-Gg: AR+sD10Y4vfVIeQAV/TNxbGEbMfsPragYtU8+4pYg/ZnxtLpKMeJs98TxSYb7ONSpUn
	PT/+cb7cjrk9Zell9XshTB8yuG3rxCEoGkpMtTzwKuDdhfuuPL5bPZtiqsH/fIGM1xYIMEwbeIm
	4vittYOzcIJcZxZ5HLZAoKHg3Ek07zxkz9TVSZUnvXyWKFgTUPyJXWW1NoanwvpdjvTAuZhfaTq
	AJULdTc2V6ujkK5hXLm5I8waGCJX0T5huHoPn3PxrA0E4+qlyGDa49/6oKAQRnK+1A9LNWairX1
	nc8fhCM9S3J11LSmOMkNvYryrCCAZAR6YPWYRXaJYqcUJVmj5CZgfMrAoKUGc3X0ZEtUN8FVMQ=
	=
X-Received: by 2002:a05:600c:1906:b0:499:728c:a1c7 with SMTP id 5b1f17b1804b1-4997a7006dfmr9037915e9.5.1786461317184;
        Tue, 11 Aug 2026 08:15:17 -0700 (PDT)
X-Received: by 2002:a05:600c:1906:b0:499:728c:a1c7 with SMTP id 5b1f17b1804b1-4997a7006dfmr9037245e9.5.1786461316730;
        Tue, 11 Aug 2026 08:15:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:ca7f:54ff:fe01:374c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aabab6fsm77055e9.7.2026.08.11.08.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:15:16 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:15:15 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4 0.16.0 released
Message-ID: <20260811-honest-python-of-fame-c3ddbf@houat>
References: <20260805-alluring-arrogant-grouse-ece17a@meerkat>
 <20260810-urban-hamster-of-brotherhood-0b9bb2@houat>
 <20260810-amazing-woodoo-mink-af1cdf@meerkat>
 <20260810-magnificent-precious-frog-f3d1ca@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jzh24pbxildgn2tj"
Content-Disposition: inline
In-Reply-To: <20260810-magnificent-precious-frog-f3d1ca@meerkat>


--jzh24pbxildgn2tj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4 0.16.0 released
MIME-Version: 1.0

On Mon, Aug 10, 2026 at 03:08:28PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Aug 10, 2026 at 11:47:21AM -0400, Konstantin Ryabitsev wrote:
> > > > Full release notes available here:
> > > > https://b4.docs.kernel.org/en/latest/releases.html
> > >=20
> > > It looks like the tarball hasn't been published? Is it on purpose?
> >=20
> > Oh, sorry, I forgot about that step! I needed to first make sure that t=
he two
> > new libraries have tarballs, too, and then got busy with bot wars.
> >=20
> > I'll set it up today, thanks for the reminder.
>=20
> All tarballs should be in place now.

Thanks, I did the Fedora new package requests for the two new libraries:
https://bugzilla.redhat.com/show_bug.cgi?id=3D2513852
https://bugzilla.redhat.com/show_bug.cgi?id=3D2513973

I'll work on the 0.16.0 update next

Maxime

--jzh24pbxildgn2tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCans8ggAKCRAnX84Zoj2+
doZxAX4syzbY9PzE4NWiaLlMKHHpNX1gZS1GjQOw2KXMk0wuTVdx0ayqfHOJ6ydt
W168FxkBfR0u9hnrsB3P3pova//N1nLvhyobMs2L7ovmnybD7SXG5wFz5yW0EucA
hO5GaH8ptQ==
=Z7UL
-----END PGP SIGNATURE-----

--jzh24pbxildgn2tj--


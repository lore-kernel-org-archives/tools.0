Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF4C2AF1C
	for <tools@linux.kernel.org>; Thu, 26 Sep 2024 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360508; cv=none; b=mYyw+TVW3g6TRGgrmd2CLIy7chHd+ORzPvoWrENCjPb27g+1ws8ffGeIFhaRAxxpRrAyequlo3tox8VSESgGQByp/OiQM+v5JMI4nXbl6Gg8VVOvP/XTQJha7p5vnGHOFQKrx4rJGlDffDQsO4Mb+NhO43y519sQakrr3yFCb8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360508; c=relaxed/simple;
	bh=cSo/Zr3F9T1gp3mEOm1/FgY1i7Y6oRUXtvwgjmdSr+c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/zGSP5TS8ap0ngWjEUrm5cyQxA6gToqyNSqi4lkZJufcc6EZcXetdnvRPOxJT+33xxIz+5+noo4yv86LrINiPHZtF02qRYlTvY5udUk4ezK4P3R1iCOzKfMKKTU7fAehvCowe2yQjmmKJ0TvloiEweLI27DCGFKJJg3Q65otR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5euGUfq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5euGUfq"
Received: by smtp.kernel.org (Postfix)
	id 29FCDC4CEC5; Thu, 26 Sep 2024 14:21:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 472E1C4CECD
	for <tools@kernel.org>; Thu, 26 Sep 2024 14:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 472E1C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso11810366b.3
        for <tools@kernel.org>; Thu, 26 Sep 2024 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360505; x=1727965305; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cSo/Zr3F9T1gp3mEOm1/FgY1i7Y6oRUXtvwgjmdSr+c=;
        b=V5euGUfqZHfe/+no013URlA63ocLS0RxRTxxZyHTYGKO6RtI3Pwt+TNoiKBGw8vAiF
         JMh/c6o5e6WB6Nm+/O1lVBlDyR5Myxg/a6TtdcChOu0zWVQxCvu+O2JiIIBhqujt6r4C
         w8QEa47F7ixOtTC18GBOLaaPOdLdyY5if0dTS7WTNkidyNl7WiJItXKXkzVZ8DJaHIKO
         pyGCYrz08kROzu9gF1q2C/Et+hv0eG4ka32RX0ZO0OuJALAUP04dXpi8P+mI6GULECxl
         rYyQOWqYQpIcKjYUxnz2UoCELqqsBcVRxcrV6luefZedNF5oTSVlpyGlsStXg04smZkl
         4lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360505; x=1727965305;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSo/Zr3F9T1gp3mEOm1/FgY1i7Y6oRUXtvwgjmdSr+c=;
        b=woHlVuFXWJ+5xowUjvYCec2jxQH2Gc0Msa2MEwOfMaOGAamKSa/ib20kHiiEyUR5oj
         Di7i4G7XZ66859qQDnLEYo6r6akyVRY3n+HQXQZaOYdYsrim4uW2xDCU1Aq2TjOTpN58
         LNCsS6aqMIN+06hgNJx9k10itiuMVlThW0hAD1sqxyLK5rqsykteWlvF2N+S7jdiKIDR
         mG3nGKQEy+sHQGppXfLlbxmOoo9Fp7N+rna7TSaLZT1PsoPTe04OuLasYssvwNtOHciU
         dd+NHQ8caVcQuGcAjap0+xypvFvRjDFxrH0NnOuZkM5mkZtQkxxtI1lQ7FP2z6y+ThoH
         Xsng==
X-Gm-Message-State: AOJu0YxzhGUmkg6WScv62seeA/P2HN4Ot4f0dxLR+eU1dsYL+LxoMuHZ
	ejnFrVsIMiI++OkUVSV3Hwxagkh1/2OEvQBH9WpSOlzRpbM4qYUmFWpJ4Q==
X-Google-Smtp-Source: AGHT+IHU+wMTfzulDctTFnt3D194/KAUX85h5rMhPdVex/FcmsYDesCB0HV/oyap6y2/CjXUUyyb6Q==
X-Received: by 2002:a17:907:f199:b0:a90:348f:fad7 with SMTP id a640c23a62f3a-a93a03b45d1mr595368866b.38.1727360504957;
        Thu, 26 Sep 2024 07:21:44 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5af5sm3387966b.70.2024.09.26.07.21.44
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:21:44 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:21:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: tools@kernel.org
Subject: b4 tracking lost during conflict resolution
Message-ID: <nsewup2yha6322sharul7nlknvw24xk6urorp62v64plnoxjzj@zrkx77u4ztuv>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="joc46m4bkmv5groc"
Content-Disposition: inline


--joc46m4bkmv5groc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I often end up applying patches that end up with small conflicts. After
resolving and continuing application of the series using regular git am
--continue I see that b4 shazam looses context and no longer tracks the
series, so after successfully applying the series I end up having to
manually update patchwork and send out thank you emails.

It's not a huge deal, but I think it'd be a nice quality of life
improvement if b4 learned how to deal with this. If b4 shazam needs to
be run instead of git am for continuing after a conflict resolution,
that's certainly something I can adapt to.

Thanks,
Thierry

--joc46m4bkmv5groc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb1bfMACgkQ3SOs138+
s6GfSQ//cfCJchAyEh3Kanh26Fp7IA1e9MV69MkmVW/qU9DI/sq3/yyhp6ygwmNy
5VYsqjjeuio/fhGh5dqgbAWF5Oh/4/x8J2Vwn1vrCxppCQaGs/h3yq+dq1LbipDd
zHrrNQCSwhGIjUmdm8biowL2uP2wZQOJCRhm47ROdTTQR96qjb/bzmTdEqAnq/yQ
sd7HmzPoi/6XWHncwYRFrmAyLyv6XQk98kIGpQmVoM6Gf4wmwa69ruAIN8gANLg4
kO/9H3zc13OAxwzyDcaOsxeH1Tr3jwFM9dzszGu8BovrIlTSUpAsENBamRzfJBaR
jFKduRnU+Dk2lbm/wA8n7EfhENJ6hSuvMvcxarZlXLeKAWCXU5eCcfaVnSIg6ZiZ
B1RLAhOJ7H5UJIQ/6jglGDkO9cwelNSRKi5s3j7pBfZGiZmA4dWzPlNYezm5nrVe
W761XoOwqjK48T8hEKVui6HivonT59IXFdBILwTne2iT9QZkYXdsaeZuvsnrBHzT
yc/gr78Ni6Avgn1987C57WJqvnuTQDClMKBAjmFxXrvNWKS87peYZgYm8atkZtua
cpSKrNd5K/tKYygoCseqgLyVatD7m3ZrL805wq1BIuVBMZEImh1ZIgEVtzUnYb8M
yOZDUB4mKJX73ei/p8lraMylqs+jn8WX5GIdyRIgJiCJdzcIp30=
=Vb06
-----END PGP SIGNATURE-----

--joc46m4bkmv5groc--

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D31C151
	for <tools@linux.kernel.org>; Fri,  4 Aug 2023 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691157056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Zbcs8thIwj/ZC358d0rYtZlqicmQwgT4O+bTysAHFU4=;
	b=Qvmz67OoCq+0zXij6nUuIMfWkDyn188Ga7j1mz0KXyKm5EHtjH1dXtceKHcCZKSeFYIQxP
	EC4Td0zFfTw5Lfl29opF7GeF6YFCdO9GMUpthNdBaNC9s9qACzXxLeLViNCZOHNxvhNZLY
	v+cDYTWCmrQVmKDf3GstYVjzv75o1lA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-LBXLhlGdN7Cw_nAlFIN-Eg-1; Fri, 04 Aug 2023 09:50:55 -0400
X-MC-Unique: LBXLhlGdN7Cw_nAlFIN-Eg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3178532c6c8so1139400f8f.1
        for <tools@linux.kernel.org>; Fri, 04 Aug 2023 06:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691157054; x=1691761854;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zbcs8thIwj/ZC358d0rYtZlqicmQwgT4O+bTysAHFU4=;
        b=jD7gHg7zw86O836ImrbG12mbkraQz8eSOLkL+Ck7ZQGH8jtwCW3dio3cJ0//bkoj3q
         1rvjgNvssSYHTceUQETV/RpB6UEqoHi0Mzl0Ume5CyzTt97s95tqAWZWpT/bgbkGml9a
         X9Yd7SpvYhM6M3s25Rsf09MPEfHlIm005k60+A+lcE9BqQRxyPA00FvwZYBOnbpvRtXc
         jw6OtZ/HYHRe0qdHlePhlawCgXa1UaW6ySJrbPQZkgqysuo+cWPIN/U5yRfKXP6ihe2C
         +nZHFva1GwdN91RhfxWV748ap+mgqRP8tdRNg1ugwsivrGBu37i3nX/HB84s0/balj+W
         5XoQ==
X-Gm-Message-State: AOJu0YzifSYFiUHqswF7+xJ7yPwRPRUQ3eGLXoo5b1d4/sOAMXtyLYK4
	bO02MPh0ebybIGvpoPQp1A9YA3YZ/U2jTbcDAaS170arMeXpoPbmsjGEwfD8C25o4GcRgMgJAIu
	bOP4oujpOfyluOkZt
X-Received: by 2002:a5d:4578:0:b0:313:e57b:e96d with SMTP id a24-20020a5d4578000000b00313e57be96dmr1498370wrc.36.1691157053904;
        Fri, 04 Aug 2023 06:50:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErUD5AmOG6QHLb2GVzixRZyhV9oXC+ENr8v08nDYIx40tRqWCTFTbO5LWotfTLRo+GQBQ80g==
X-Received: by 2002:a5d:4578:0:b0:313:e57b:e96d with SMTP id a24-20020a5d4578000000b00313e57be96dmr1498356wrc.36.1691157053621;
        Fri, 04 Aug 2023 06:50:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::56b])
        by smtp.gmail.com with ESMTPSA id d10-20020adffd8a000000b003143ba62cf4sm2559927wrr.86.2023.08.04.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 06:50:53 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:50:52 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: End Date in August bug with lore?
Message-ID: <jbgsz57nc27lwdgfmhyoruvybzwa7dsphdhsiga2zkvnehj5cf@6atzulc4kpad>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nr3wxldyto7grff2"
Content-Disposition: inline


--nr3wxldyto7grff2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

(Sorry, sending the mail again with the ML)

Hi,

I've encountered a weird bug with lore, if I do a date search that
ends in august, it doesn't return any result:

https://lore.kernel.org/all/?q=f%3Amripard%40kernel.org+AND+d%3A30-07-2023..31-07-2023 -> Works

https://lore.kernel.org/all/?q=f%3Amripard%40kernel.org+AND+d%3A30-07-2023..01-08-2023 -> Doesn't Work

And if we have a search that doesn't cross a month boundary, it still doesn't work:
https://lore.kernel.org/all/?q=f%3Amripard%40kernel.org+AND+d%3A01-08-2023..04-08-2023

But not specifying the end date does:
https://lore.kernel.org/all/?q=f%3Amripard%40kernel.org+AND+d%3A01-08-2023..

So it looks to me that if we have an end date, which is in august, it's
broken for some reason?

Thanks,
Maxime

--nr3wxldyto7grff2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZM0CPAAKCRDj7w1vZxhR
xU6BAP0TSpHPXJPSTvKQw5sTtD8EUopOjvVBWo6aZmKl0VDDiAEAuUivWu5fU8ea
ggVFys7ekbhCyPCYMjGmJU4RMRl10ww=
=rA6x
-----END PGP SIGNATURE-----

--nr3wxldyto7grff2--


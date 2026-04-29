Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735EC36D517
	for <tools@linux.kernel.org>; Wed, 29 Apr 2026 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461904; cv=none; b=F31nqP/lPEtdn2wzcVA+3n/cTIzTxICf4AWNfIyrSkQI9TkPHJHCDFltMm+TpJTwKJeW95NnJJSKD2kh4IdrVXioNyiQuBvNQZQDaEG2ujOz4v0nO+12ViSlQeIqor9p7FQ8/FDihm0gwjOiJZI7MvV6ZEwFExgsb3B/X7Na14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461904; c=relaxed/simple;
	bh=n0dmDGvvUbajN1Pu8PUC4Ggo5WDz9VUqXkb64GgXJLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OmvwFoxrg3g1FmTt5m4+fJOidG8Jp0prR3LFwUljAkWiS2/1o5nHvBamUtzhi4cmGAAAPxWP2mvdChme/ynPFZvM+gcT82Vn50eFydLtBSfvbPQ3ZCKVOj69tMiUlszUnjvUTJpGq4hJ9mqx8TKpcFIL84KJbA0bMXRj4vc77mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=youbRjM6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="youbRjM6"
Received: by smtp.kernel.org (Postfix)
	id 18B20C2BCC6; Wed, 29 Apr 2026 11:25:04 +0000 (UTC)
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF778C2BCC4;
	Wed, 29 Apr 2026 11:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF778C2BCC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id C31B81FF0F;
	Wed, 29 Apr 2026 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1777461898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DB/FigGFsARfJ8AAAn/gyL/qxJXfd6q0ufqr8mkTjAc=;
	b=youbRjM6qJrV1lv38cBGONej4omMrtsTwXAcRkP04zpig/wNcgsrAnVjnMfR1cLY3iGpNc
	wbnsXOVaa7xOCNCs3DCzg31mqb8be4sBL+BI2T+emNaNkn0ajZz9LpxUHTOx5HoX1nQNmv
	6dT3SgpMPv5IuUezA3UEvFzmBXHO7a0=
From: Sven Eckelmann <sven@narfation.org>
To: "Kernel.org Tools" <tools@kernel.org>,
 Matthieu Baerts <matttbe@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4] review: Fix sashiko patchset URL format
Date: Wed, 29 Apr 2026 13:24:53 +0200
Message-ID: <3409149.aeNJFYEL58@ripper>
In-Reply-To: <3cd8a333-1724-45c0-b288-b82480781471@kernel.org>
References:
 <20260429-sashiko-patchset-url-v1-1-de8027029bca@narfation.org>
 <3cd8a333-1724-45c0-b288-b82480781471@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3415685.44csPzL39Z";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3415685.44csPzL39Z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4] review: Fix sashiko patchset URL format
Date: Wed, 29 Apr 2026 13:24:53 +0200
Message-ID: <3409149.aeNJFYEL58@ripper>
In-Reply-To: <3cd8a333-1724-45c0-b288-b82480781471@kernel.org>
MIME-Version: 1.0

On Wednesday, 29 April 2026 12:13:32 CEST Matthieu Baerts wrote:
> Hi Sven,
> 
> On 29/04/2026 11:54, Sven Eckelmann wrote:
> > The sashiko server does not expose a direct `/patch/{ps_id}` endpoint.
> > Requesting https://sashiko.dev/patch/93 returns a 404, because the frontend
> > is a JavaScript single page application (SPA) that relies on the API to
> > fetch and render content dynamically.
> > 
> > The correct approach is to load the root page and pass the resource as a
> > URL fragment (anchor), e.g. https://sashiko.dev/#/patchset/93, so the SPA
> > can query the API and display the patchset accordingly.
> 
> Thank you for sharing this. It looks like your patch is similar to this one:
> 
> https://lore.kernel.org/tools/20260428-sashiko-patchset-api-v1-2-24d4ac34b4ae@kernel.org/T/#u

Yes, your patch series looks better than my single patch.

Regards,
	Sven
--nextPart3415685.44csPzL39Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCafHqhQAKCRBND3cr0xT1
y6TpAP9kU+2a/Od8QrGNsfiYCn7sR0NZIEAJGO5F1vjUZklYFQEA96zULbvYLlmJ
iLHUOlHsLX2cUWYwcdBM4PJa2G5SoQ0=
=VF0j
-----END PGP SIGNATURE-----

--nextPart3415685.44csPzL39Z--




Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32F22EF0
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719469649; cv=none; b=RqwHvzUNmv/tdHIG4YYhT21Fp9bG1jv7PsbcJiYVSlkAxcuX4UASXXFxy/H5qAuyubr09kOfQ8s4UDDymp/zr9qbiK5eR63azHr94Me6JgBiU78PldiJbNFG/lapb7ZswErghWQmv2LYZVjE/HBriiSxECvO8iddFrzcpBvUsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719469649; c=relaxed/simple;
	bh=jx9xFR88fiyGOqfcAIojPcoXbGW8SCOC9Fe1BBWdRVo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/9GfAmievh4Ky3mul2kWuQ2suLzv2Tor4NRXS2T0QByPgCPteIoXeakPpOVunpQyRnjY7VUNejxS5/NYsziJit+1nwNMNfUsfgMFbidryNv1wzpP871UMcCAkIHUY3aMHb8dYBWrR79ixtmJXma8TM+N21m5TJjEb8S7e2MQB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eJuNDCn4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eJuNDCn4"
Received: by smtp.kernel.org (Postfix)
	id F0EE7C32786; Thu, 27 Jun 2024 06:27:28 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC297C2BBFC
	for <tools@kernel.org>; Thu, 27 Jun 2024 06:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC297C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a724598cfe3so648067066b.1
        for <tools@kernel.org>; Wed, 26 Jun 2024 23:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719469645; x=1720074445; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3q2x4n6Nq5cofykj4hO7B7xm15RmPPmHcfmB5ToVCU=;
        b=eJuNDCn4UPWnWloK8AXhfqDLelQCbKrUkEBWkbbqE2/953fouDX6jI4d/mKzVW8lOw
         iy54Ku7IrUPtPxCGeEcy/cwVL4D3fzx/mE6KISugsQqzkUF4T5ZBZWJvvGIXjzPYgrZL
         UU8ck47piFou6HGOBZ/HhhTnBSt0lO9Th/6wvnaN28cpzOMc3JIaKysZV0YgramdsojG
         2WeilMgzsv2B36eEORngg9otXvenuclFfwEAPhRjqz6JeORJSeXGHH4RocmmoNwVVw0A
         MisvMpVqjg6MMEuY9m2E47X8rSi0VMZfVF+moWEuDWM8kwLlyxJ1R8tEM5jWFbamC7os
         pUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469645; x=1720074445;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3q2x4n6Nq5cofykj4hO7B7xm15RmPPmHcfmB5ToVCU=;
        b=tHXeKune31/UIZHWx3Fzx5e5fJn6qyyz1cQ1G+jwxmtqmW8raSdiz9lEBsugxVYHUv
         u9orZBFhyuL57wHAs+rHdxLlw+RQlPlOCMxT61og+CTpyK+pxJ33fqLoE9BF+Gh1AiK7
         EJat9qnOmNpz8xDszHQkCt/BkjhNejgjB1LJkXxMXf62RG+1zndsmUv9wJex73gUu2Ak
         znU7gi2oJQgM3tJDuZEzSu0zd/8mm5hzGL0g7PYS9GwE+R41/u6LO+EFKq9j6HP2+hOU
         Jqd3SQ8XNoxNDCnPc2S+CyRFkglVEkx1qfUzPhWRv0M6SG7ZtWC91YxrbLwBF4F5URpt
         lvbw==
X-Gm-Message-State: AOJu0Yy9k4MASh39wzzX+jNUwQUzr6pwcIKG9ZlT0vrj/kMUKg0yuJgj
	4ogWeu4t+TISuh548WcUT2jBTNcqvCx0dfeA+vCWagBSLTSXmW4ge6qmc5d87ZdGB922fBWkUhq
	Mv5Q=
X-Google-Smtp-Source: AGHT+IEkx0BzWP38r4nVBobaWJ77/5reGKNUfhBIUo2Otud8Nnj8XKZIuFY1PdYFpKoKGBUfDpKf9g==
X-Received: by 2002:a17:907:a4c8:b0:a72:5fd5:ea02 with SMTP id a640c23a62f3a-a725fd5ec00mr917874166b.10.1719469645146;
        Wed, 26 Jun 2024 23:27:25 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7b525esm27660366b.158.2024.06.26.23.27.24
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:27:24 -0700 (PDT)
Date: Thu, 27 Jun 2024 08:27:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: b4 wish: differentiate between signature problems
Message-ID: <wxyjcpushnvpdrv42dijurk76oh3qny3y4mihnopof6fnwhwik@jk4tnftk6cds>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcyzwzpm5gw2jgze"
Content-Disposition: inline


--qcyzwzpm5gw2jgze
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

currently I experience:

	$ b4 am -s -l -t -3 20240604-pwm-gpio-v7-0-6b67cf60db92@linaro.org
	Grabbing thread from lore.kernel.org/all/20240604-pwm-gpio-v7-0-6b67cf60db=
92@linaro.org/t.mbox.gz
	Analyzing 5 messages in the thread
	Analyzing 0 code-review messages
	Checking attestation on all messages, may take a moment...
	---
	  =E2=9C=97 [PATCH v7 1/2] dt-bindings: pwm: Add pwm-gpio
	    + Link: https://lore.kernel.org/r/20240604-pwm-gpio-v7-1-6b67cf60db92@=
linaro.org
	    + Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
	  =E2=9C=97 [PATCH v7 2/2] pwm: Add GPIO PWM driver
	    + Reviewed-by: Dhruva Gole <d-gole@ti.com> (=E2=9C=93 DKIM/ti.com)
	    + Link: https://lore.kernel.org/r/20240604-pwm-gpio-v7-2-6b67cf60db92@=
linaro.org
	    + Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
	  ---
	  =E2=9C=97 BADSIG: DKIM/linaro.org
	---
	Total patches: 2
	Preared a fake commit range for 3-way merge (326b8ce7eace..35520e7a5eb9)
	---
	Cover: ./v7_20240604_linus_walleij_pwm_add_gpio_pwm_driver.cover
	 Link: https://lore.kernel.org/r/20240604-pwm-gpio-v7-0-6b67cf60db92@linar=
o.org
	 Base: base-commit cc97b8f37b097a1598410154ca472964a1d9b255 not known, ign=
oring
	 Base: not specified
	       git am -3 ./v7_20240604_linus_walleij_pwm_add_gpio_pwm_driver.mbx

After some debugging about "=E2=9C=97 BADSIG: DKIM/linaro.org" this is only
because the signature is expired. (It's only valid for one week. And yes
I know, I could fix that by picking up patches quicker :-)

I tried to improve that to emit

	=E2=8F=B0 EXPIREDSIG: DKIM/linaro.org

instead, which would IMHO greatly improve my user experience. But that
isn't easily determined using the dkim python module, so no patch here,
just a wishlist report.

Best regards
Uwe

--qcyzwzpm5gw2jgze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ9BkgACgkQj4D7WH0S
/k4JpQf+JbDrcYU5I4Vd0XVS+ht7aEotXLE998YZSLsxCTBiH0MkSvhhHWbnFFLm
2qpZv6xnzjbn+RfLYSAfSRzB3qXppz6FYtXkYPxgURbUtgMaK5MdkLb3uujLzwMr
IZNUKOMCRYieZbQGyXvrA13WJK7TXe+x4aC9H5SIHODl/2dIaOB+XWHVN1DK2CoQ
ATtxyVYkhtQ4g/08yt8LlVc6dYbqyLagtbm7OvhV7G0szu4KS70hcU8SpTHIbboC
5uUJk/BZqD4k8QWUAjMLkhkjpywio04fvOXLzYbEVtBKBGucCM7X6yX0SmJWSw6A
sAwE6UDkk1ClY0qlI+ULt7pZM0M4/w==
=H9Jl
-----END PGP SIGNATURE-----

--qcyzwzpm5gw2jgze--

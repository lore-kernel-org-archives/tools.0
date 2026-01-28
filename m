Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F2D301701
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597062; cv=none; b=EC41LYkkOuPZfhiQY9ODQzffIVcGrhfKQx8Km1tZmje7wEm9XFsjDFYikrRVJbgn06b7CqFOdB/Lk4Io0DQqirzXDDIxpJdVCbttSVjBL0T1Xdi/MHM0bUeugzLJ567eeSrQJGEL+qfpr1HwSRhORAy+aT+1j0m94DMiygBDs8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597062; c=relaxed/simple;
	bh=WP54E5Zozvp+1GAPNgjDcxymFAEsnkay7BW+MQRPQZQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WIG0N7MsCWnqHtTyCXjsejnWQMMfN92Oe7YATDsvh/LcvF9U5kOnuNG4u1RTA3wrBGeuen/MQyl1ezfQgq1mJEOadZuPIZeWRww0BsdjExYnwlj1Ptm0B7b6LnbixrWC5s8UKeLghzhU9LlYEtoIXUVQHiPNBBkeVp9APexWfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcoAuora; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcoAuora"
Received: by smtp.kernel.org (Postfix)
	id 933A8C4CEF1; Wed, 28 Jan 2026 10:44:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71CAFC19421
	for <tools@kernel.org>; Wed, 28 Jan 2026 10:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71CAFC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso68268715e9.2
        for <tools@kernel.org>; Wed, 28 Jan 2026 02:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769597059; x=1770201859; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WP54E5Zozvp+1GAPNgjDcxymFAEsnkay7BW+MQRPQZQ=;
        b=EcoAuorazqX4c7iaVYJ5kRlnatRrf54VFqWSQO4US7TKHT3Xz12960P0/7QBO05Nvs
         xmk6Wbz7/qMFaAc6340xTKULYrxwgWHG420AKgNQwnPQ9TqFiNVpvlxQuYjSphqJByGA
         Q1hPWqJM6NLQh0nWpVQDM7/ejB637cKBGyrhwc5uIK8AgIGF9zFSWkL7uRPGkr9+3lKp
         /25pmAv3lz+iS8nwKFPGYF2xqHJulXVFkyfDl3Bl8LQcIQfTEr/O1UypIouoA1WFb2TN
         us0UhRANRle76AozSwIrJYlD5vJaLm00/FVA5i0S/kllV37nUdDhmL+Lf9zOV4s8jndz
         O/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769597059; x=1770201859;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WP54E5Zozvp+1GAPNgjDcxymFAEsnkay7BW+MQRPQZQ=;
        b=q4mb2LxDiJ5KG88RaD71aQ6azVTqAEuw5RpE+wA7pEbJjALtPYN7mWMn+TiUSlCDU9
         Tziw+u3I/gt8qsWD+FffTH3wbg0RizwdBhyDV8jeRL7AHTaHFsjjvFiKCVCQg/57pN/z
         3YPhveuto4gbw9Q6PKP97nmkAb58TvicRRZ1UrMmaTB30oenwsVuBxx8rpXlB/N3nwMP
         jMDRcumvg1NLsc7glNHZlXmWpUP0qSK3qfyn4+fdKsU5fL6tv3U3/NG49qCIJpbdWWfb
         m4qW1vy3+cNq1Q8Wf5ScrwyRb3AWV+RWgcWpp9DOIIVb6G361XNOEUkOGEzgys7kgjft
         CX1g==
X-Forwarded-Encrypted: i=1; AJvYcCUIi+CE33FfwEfO99ZA2QRDOP1y27qo2iaH4TtnKHLy8syXt7Bk0Fa+pMVEjvJIsNWoRQedHA==@kernel.org
X-Gm-Message-State: AOJu0YxAD++XM16Y5ahvyXSuhnRIAX6yTNUOcBsi4847Dtbh/HaqHAF/
	Jw1Cm+7KNnJ0OMxXkcu4UQR5PI903DCUZaf8K3IRCAnDSqqTrGP8kmF7
X-Gm-Gg: AZuq6aKhUifK17oKh4Wo2+iMP35wh4br4a6Ewv3EMOAITq5FEygNPrFfWojSjcLIpB+
	Jcvl7ksMKgdiBC7EtCRoDa+Q+AX4hJKri4VMqrAoKmOs0eSIG4PStj9DEJIsOeXpgycRwQHJkIF
	Wn6uZ76KF6VLLo9FehwNR0lYR8oMgO2lJlM0kEHyTlV5AAMfmYMBMUgA6M31u1YGtwRVQdxjyBZ
	rCeNAXnWtLqrIA3UX7AkOfevX7QzbO8e0I3CO5GIT9Z/N/wLWQS+BSSyCCnE/4A4NHgGfyd8Jwd
	VVX849nt8zLyDSzmw8mA4mg3CCYmC+KcIvZ+Yxocj6p4SUADIEs07VenS9TaRsHEyOWu+zQyn0Z
	XVv7AsVqMB4XhkgPE2abHiBO8Gzp+hJCuF6FxXZVAj9qDkhyfa4Dzo9Zz4yKO5Gacmo9RNZ04AD
	D/CAkwdKhoT8tNhs8f/GqJnHPUjA/5tw==
X-Received: by 2002:a05:600c:4746:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-48069c5547amr64307945e9.30.1769597058510;
        Wed, 28 Jan 2026 02:44:18 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm57099265e9.14.2026.01.28.02.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:44:18 -0800 (PST)
Message-ID: <be27fa4404511cdf65a9a0f212653a7f1fcd86b6.camel@gmail.com>
Subject: Re: [PATCH 18/21] iio: Replace IRQF_ONESHOT with IRQF_NO_THREAD
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Konstantin Ryabitsev <mricon@kernel.org>, Andy Shevchenko
	 <andriy.shevchenko@intel.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, tools@kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, Thomas
 Gleixner	 <tglx@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich	 <Michael.Hennerich@analog.com>, Puranjay Mohan
 <puranjay@kernel.org>,  Jonathan Cameron	 <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Marcelo Schmitt	
 <marcelo.schmitt@analog.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>,  Kent Gustavsson	 <kent@minoris.se>, Gustavo
 Silva <gustavograzs@gmail.com>, Nishant Malpani	
 <nish.malpani25@gmail.com>, linux-iio@vger.kernel.org
Date: Wed, 28 Jan 2026 10:45:01 +0000
In-Reply-To: <20260126-cocky-sawfish-of-variation-c0cedd@lemur>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
	 <20260123113708.416727-19-bigeasy@linutronix.de>
	 <aXOKVqxyhQ10l9V4@smile.fi.intel.com>
	 <20260126081510.jr8Rp6R7@linutronix.de>
	 <aXc5Efu-PlLNCxkk@smile.fi.intel.com>
	 <20260126101034.lnGGQmUD@linutronix.de>
	 <aXdJbidb3DPyRaxB@smile.fi.intel.com>
	 <20260126-cocky-sawfish-of-variation-c0cedd@lemur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-26 at 09:29 -0500, Konstantin Ryabitsev wrote:
> On Mon, Jan 26, 2026 at 01:01:02PM +0200, Andy Shevchenko wrote:
> > > I lose it on the next if I update patches in tree and re-export them.=
=20
> >=20
> > I don't understand this, sorry. Can you provide a step-by-step example?
> > Do you mean that you are taking previous version from the list and reap=
plying
> > it via `git am`? But shouldn't `b4` take care of that as long as it kno=
ws the
> > Change-ID and it matches?
>=20
> That's not the intended workflow -- the series is kept as a branch in you=
r
> local tree and any updates happen to that branch, so any entries in a com=
mit
> falling under "---" will persist across revisions.
>=20

Hi Konstantin,

Since I have you here, I might ask about something that I'm not sure how to=
 handle. Might be dumb
but here it goes. One problem is when I send v1 based on a branch and when =
I'm starting to work on
v2 that branch was force-updated and I want to base my v2 on it. Is there a=
ny good way to handle
this?


What I currently do is more or less:

git cat-file -p $COVER_SHA
git reset --hard origin/branch
git commit --allow-empty (and past all the cover with b4 metadata)
// apply my series patches.

Thx!
- Nuno S=C3=A1
>=20

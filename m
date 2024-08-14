Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A55131E2D
	for <tools@linux.kernel.org>; Wed, 14 Aug 2024 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647753; cv=none; b=AhODqAEwu508/gmy51xj/y7nWeEOEGJRnrscGnNo6js2iaq8WB7kArseBmG3QhZQI26WKDCShDvx2CBrHFstwYNdK5aJtIa1lxJ+YYKnTIjVG5NT+mmM6VIFOZzUVtv4CfhdNyr0tTH6Cu6rWteNo6z7gtY6pAq3vlzAi7Cd7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647753; c=relaxed/simple;
	bh=lqkPjgIDOF4IozfmxBgRoAU914wmuWlBWm4sSXGKBPU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uf7vs+R6Op23weSLDINu576hkjaZQrl31eeFWYegZJJLxO/Y/e0rwoAWHTAdp0QuQIk+AfKJ92EsdxwsyAFjHg0hsJOQEI6PrdWHVRRy/uSwtZxfhs9yp5GGgliP9iS8mU7prTQg9zjJPo2eMK8i5hkKUsIYhNZJ0muzG7AyLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eGiftzOm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eGiftzOm"
Received: by smtp.kernel.org (Postfix)
	id 57681C4AF09; Wed, 14 Aug 2024 15:02:33 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A64CAC116B1
	for <tools@kernel.org>; Wed, 14 Aug 2024 15:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A64CAC116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70eae5896bcso5989186b3a.2
        for <tools@kernel.org>; Wed, 14 Aug 2024 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723647750; x=1724252550; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EupdcNHDfe8N2o3INjm/rMebtfH83KX0WeFItVwxo8c=;
        b=eGiftzOm+FBgfOEdPnGC/6QglcfWnWnEvfSB7OtjgN3d8gdBy6xa64hvzzkW84MCvX
         bfCfIRRhF6RxafVZp0936zbXVAwzc7nikDFKPwzxP9/GBx6moHxvNruhrLLehJKGXf94
         9PHWSbfj3ikzP+oVw2NBooOsxYy5cdnN5RxFl/chfTLS2Y/o8D4Hv086uEw5OdnM/BWn
         L2XwC0P87qad98ktpw21LK0kga7LHKSJ5f2o8R5uskjF9+RKV7hncRFAqWc/noqn3pzs
         78bSlXtzpJVHD02Fp0vnMJ8F+jfqW0rtbVhyGFZWi4RlizNHVvPW1YJ75Gs0XtZ2odJD
         3jrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647750; x=1724252550;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EupdcNHDfe8N2o3INjm/rMebtfH83KX0WeFItVwxo8c=;
        b=oOn8GL/nVlvZW/rerc4Lu3wnIsXkmEyYvAaXCaUldiEgs4hJQmHMy3RxNXSMdH2p/e
         N8OEwPMLmZ0jsFguNmVW8CzMDOlWBDlsgK1l3pbv/guU+yKYmoulkXu20xavtuU2LvAQ
         SFm3DJS7yhsSqafnIaS0Z7Sr53cVkG/YzTpylv7hk07nw1wFAHvm1Gb68OTaB+k0+sKs
         JP9jnaZUZNgL5Fj4PEGj40KVv/fMfmSdaXdwtbmeCQMBBsc5qsovPSImB6HwAqtUm2D7
         z1OjPJ43/4htBqtj9p82RpDOzki56MBBUMNzTPbc05jqJKkW5vh+LbcPHemMdNDOg9r3
         wdmw==
X-Gm-Message-State: AOJu0YymIuKmRaeVK4hk3kxsO6y0TeDSOpuInM9RidOYHYKoc86RZbR9
	HiZEDr4RSf0YYhEWwJxyDtHKFeSrBGZQuxFYb6XGqyKsyWP1aCfkOjV/CDkMSTDh16aU4Lfc0cF
	l
X-Google-Smtp-Source: AGHT+IGb/pRAt5XPmvDrgzcWtixNFAf2xAepLko0ILTKM/jP3P1/k14Vpx7qron5p8Kd4QHPquZuFw==
X-Received: by 2002:a05:6a00:a87:b0:710:bd4b:8b96 with SMTP id d2e1a72fcca58-712673e821emr3562270b3a.28.1723647749482;
        Wed, 14 Aug 2024 08:02:29 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a94675sm7422083b3a.182.2024.08.14.08.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:02:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 send: how to selectively suppress Cc?
In-Reply-To: <20240813-tunneling-caped-piculet-e34d08@lemur>
References: <7hmslgni7x.fsf@baylibre.com>
 <20240813-tunneling-caped-piculet-e34d08@lemur>
Date: Wed, 14 Aug 2024 08:02:28 -0700
Message-ID: <7hed6rno57.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Tue, Aug 13, 2024 at 03:58:10PM GMT, Kevin Hilman wrote:
>> How do I pursuade b4 send to selectively *not* send emails to some of
>> the emails it finds in to/from/sob etc?
>
> You should be able to accomplish this with b4.email-exclude:
>
>     A list of addresses to always exclude from the message recipients. Expects a
>     comma-separated list with shell-style globbing. E.g.:
>
>     email-exclude = *@codeaurora.org, *@obsolete.example.com
>
> Let me know if this doesn't work.

It works perfectly, thanks!

I guess I missed it because I didn't think to look at the `b4 ty` docs
for email settings while getting `b4 send` to work.  Maybe an item for
your TODO list is to add a pointer to those settings in the `b4 send`
doc?

Anyways, thanks for the tip and for the work on this really useful too.

Kevin

P.S. I just discovered the `b4 prep` feature of creating/tracking a
     branch from a sent series[1], and it's great!  Exactly what I
     needed for taking over a series from someone else.  Thanks!

[1] https://b4.docs.kernel.org/en/latest/contributor/prep.html#creating-a-branch-from-a-sent-series

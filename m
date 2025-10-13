Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D152E2EF9
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760377032; cv=none; b=cub29d3qPe3UxRZL3ij639UDSj1Jcx5Pzsu+jDyqHz9cHHvudozY+tufucAmOctH+4Z+utN+5ccc+BxfTeuwN/EQSb7iYEb0YwrnqBdpCducebGhmB2n3FpP8i3pDKpl9b2FRb7S2UzYBwuiKe9gKnw5kTrJyZjGNnRky/uELEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760377032; c=relaxed/simple;
	bh=InooQ9J+Lsqc9tNnpKQ2R8s2kFb2uA+CNE2yRK5JqQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0TrIJ7fo+Ofkwa96vsuSO5QKdscJz2YcmmCM62YfKKrUlwYt/GLfciadhCzWs8pFKo5fg0UepbrfJ9t7w8BEF3+Mks1oqlPEvPWZdicax4V4BNe6uq73q6nSWC+kMfvTTvl8DhM47aw8rRUVSOc1QR7flVDBFa4j82tPfT9DPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DylO9Ex0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DylO9Ex0"
Received: by smtp.kernel.org (Postfix)
	id DC05EC116C6; Mon, 13 Oct 2025 17:37:11 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADF69C116B1
	for <tools@kernel.org>; Mon, 13 Oct 2025 17:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADF69C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so9037082a12.3
        for <tools@kernel.org>; Mon, 13 Oct 2025 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760377029; x=1760981829; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cIlWDLM1HEIijukdH/UWg/UPHbarvpN0dzGO3plH+vo=;
        b=DylO9Ex0lMQgVneP0iqF27xpVl6HpWe6BlNTnfLguIggRyJ7+IYEjLJnEBMHGb7zBs
         adF9y45TIhBA7rppv04sutk7chdwEcCQzFE7rCIdZ6opDdCV2M5QNbkjqcLrnDUFv2rW
         jhhw8ooHlO3f0tz2yCSkUAEnNjSdljr/+g7+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760377029; x=1760981829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIlWDLM1HEIijukdH/UWg/UPHbarvpN0dzGO3plH+vo=;
        b=iEDQDKSpCgePJsuwDiR5Zx+Rz+4MTcBoGi/rcpc+uTAh0fmlCkk3X817K48mqs6CEE
         +IxMAUOUBUj2hWp5VEMeiWQ6qton+51+b87R0C2COY0+RsmPk3/GSA5CGk88akiP8lSU
         C5SwXUBKy6uIJBemGgZbn4ZeTmzlcEgKT9/ZNARecjLqZwSFz/ekU01tC7j0LVH+MczW
         000BywAx9lEp0WQVgMPsmwV16uwJwV37V2WpoS/k71vGegDQTPmJClar5LKTB3xKt3a5
         Ipz1BAtcxXJy9Z1CbP51i3ZtnNT3sAygr+5SXdjqfPru5FiymU2H9tH1loooEtWo3oT/
         Gf8w==
X-Forwarded-Encrypted: i=1; AJvYcCWzixN81euAjeASLWxxsUaaIpz1npHxV+nmi4rrKoE6cLYfj35J9xAangI3hU++I/bINd/Law==@kernel.org
X-Gm-Message-State: AOJu0YylQYZ/5eBNoK9m1uhz9XvNDIiQowX0sm+A+zowXFo3qYqdYkkq
	QELekbNfXGkZt2pMGY187nbytIerr8T0e7UO8ka7Jdia/xVHGA7eq4SL1CHXerzKiMZfNCK4uFW
	HzNLh6B0=
X-Gm-Gg: ASbGncsnPYZDBa7QAvW6Yi9Su4S7Y8odemysBtFt5J7q5d7byXR3qvTqdNhe8qxARs0
	n7/CE+OuwaJ18tQjPuONhLNh7RJZQu9OwcJLal32HOM9+kUwcYdufix6ZUGQkuAnjSVZc7GPY8n
	UZiRJ/ftpqoapUu1RWkvto8YIffGzSvSuMl4D+MLNsOUr7/fQrCneieG9820xyEt9qitsByBitM
	Y0VSABcEOetv0VMFFeMuG5YueOQ0Hwbt+jQFAzHkzxy11iNSnZDhhptoOg1sc10Jl4PnM7xf8iN
	lnIl4jQqKKm1oglSrtGHcqL545EY8VtYreRCGovy6ljgaxZGZ+NBD86QWBkl3Jhng34DxMMpQSh
	2kUSvFdCHDvifuXexNwAMVM8JLOvuKoaqh1EufnJtj8lZy7irVRwMNxVrDi/Q7c0Ikv8Ax+AP/K
	9ks14NTdihWxXYYQ==
X-Google-Smtp-Source: AGHT+IFUQFFR20xoIjeuhGpSnHT36nWWhD3a0+I7gkYVAdM0USgg3lvzCu+jYTsR2SZm7hU/l9Q4GA==
X-Received: by 2002:a17:907:3f9a:b0:b0f:4ae:c83 with SMTP id a640c23a62f3a-b50ac8e58a0mr2314858966b.63.1760377028760;
        Mon, 13 Oct 2025 10:37:08 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951cfe7sm978928666b.73.2025.10.13.10.37.07
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 10:37:08 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b50645ecfbbso895178066b.1
        for <tools@kernel.org>; Mon, 13 Oct 2025 10:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiKepUdapVnCaRnTiXTYAnj9RrdbpiNOdk67D+kEBtGKv+Z/E6+WXi7x/wKMAJlD9A285WgA==@kernel.org
X-Received: by 2002:a17:906:6a25:b0:b3c:717a:71fd with SMTP id
 a640c23a62f3a-b50ac5d07fdmr2482623966b.62.1760377027596; Mon, 13 Oct 2025
 10:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur> <59e87e88-356d-4913-979a-cdcd80882517@sirena.org.uk>
In-Reply-To: <59e87e88-356d-4913-979a-cdcd80882517@sirena.org.uk>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 13 Oct 2025 10:36:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNveeyKbMth9d9_vUer4P7=VYArLqqrfHH12WAtth-zQ@mail.gmail.com>
X-Gm-Features: AS18NWBixwXcEySD1ipRaEV4CWtgyzNLEOsg5AnN9fTX7Zd72YADndr9bGZb290
Message-ID: <CAHk-=wgNveeyKbMth9d9_vUer4P7=VYArLqqrfHH12WAtth-zQ@mail.gmail.com>
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 10:20, Mark Brown <broonie@kernel.org> wrote:
>
> If I specify:
>
>    b4 dig -c regulator-v6.18
>
> b4 complains:
>
>    Digging into commit b320fce86c04862ff5548ebdd84740e36e79e6ac
>    Merge commit detected, please specify a single-parent commit.
>
> but that's not a merge commit, it's a signed tag on a regular commit.

Ahh. b4 does

    commit = b4.git_revparse_obj(cmdargs.commit_id, topdir)

without actually ever asking for the thing to be converted to a commit.

So a tag will stay a tag, and then later when using "git show" to pick
out the commit info, it all goes to mush.

The trivial fix is likely something like

    commit = b4.git_revparse_obj(f'{cmdargs.commit_id}^0', topdir)

although the "proper" way is to use the obj^{commit} syntax, but for
f-strings you'd apparently need to double up on the curly braces and
it turns kind of messy.

            Linus

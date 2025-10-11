Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94E1BEF7E
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 23:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760226261; cv=none; b=eNC5j0NR6gKMifseS0/zqSLDFV5OPk5ag5nAqssXraPaSErSdj16mm/2IUc47PGzX89fIBDNi55dBEjMO5/8m875uv4Zl6SpPXRxUu2SIkKDTH5MHuELvB0ZLxBPBkC2I/cJu9saOZQabCAfYbeoXehj/boFOLC3RxMQPwOJ1F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760226261; c=relaxed/simple;
	bh=2fvbAgVc2h2ZaMo+3U8MszevfcnpsfWK71F3WlP5cR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EP+oD3l68Y+L1UiZ8M18Iln4gDxgNddt9NO7RleVhRk3mNKGJ+1oWoJNevTTM6ji4NVw/M38FVB1q6maIcgnQfTns9I3meX5LKjcnD29wCfJ0bUTy283J0vGGqP4fKUP2EkuLQIqy+IpPwjFsvu3jhyUrBrD0uFlaL3XDi6rv2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=az2LlwHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="az2LlwHz"
Received: by smtp.kernel.org (Postfix)
	id A2F2FC116C6; Sat, 11 Oct 2025 23:44:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F339C113D0
	for <tools@kernel.org>; Sat, 11 Oct 2025 23:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F339C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4736e043f9so480773766b.0
        for <tools@kernel.org>; Sat, 11 Oct 2025 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760226258; x=1760831058; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=shu7+Ma2NV0zPN2H8ql1YopbJ9GwoV4Rpz7tUoRcxdI=;
        b=az2LlwHzdGuoQFKpn0fYQL00BMrzAONN8b+ZquFYOEmN0JWJ3nsVBe7azPxjYlWUdz
         7Txlbz6vu2X1L81GraCDW0TqrXRzYDOVtMpvLvdyjU7BNAwatuOqnN+unlO3hnREMvd3
         61w2/oqOQQO5vecG4gJoAurg2RX5CgtyFORY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760226258; x=1760831058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shu7+Ma2NV0zPN2H8ql1YopbJ9GwoV4Rpz7tUoRcxdI=;
        b=IZHXWZv4ujnnbv+aaFomocmJorwk3DMTF09H4vqcQ+kluSJVbalFN2sqbA3Aupp142
         f1ozPTlo6s4jn3T3jFB7OCJ9sQqhe6x+O/W6ode6/9be9fM5LMfc/M9iRB/qkUwMcnFj
         GtF6da2s8RAniYgGRbqvPruUlnWyqIs0Kkks7J2Jae0A6K4NVHQTQiLf825kMgtTBNNt
         vI1lxaBT+6Oi7CVWVEYxw2/xBxYvKr8CANiicGQKHXrDV7WCSqrgROJfRIkatHwh2a2L
         sel7hTgM+1H5IDoGt1iJyXONR66EY1uwBT2kVu40mKZwUXamaczrQxA/YqN1FoolrHzS
         8YhA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ZjZCIHjaJysiIhWjv5ACnDwo1pMjA42wRUPbZm+pxVrHZgh+8VCgp6aM2KOfAy2qdbpYPA==@kernel.org
X-Gm-Message-State: AOJu0YzO7eOYNDzypf/Ggzwj3SG8IurP1/BWD989zb11yGoLFLQxI6vC
	d0ayGNdT/KCetYv3SAmau2dYQARbTXgyZVsJOnUyfo2qTWLuCD177UXH+0CuxYc3MG6br+f96S9
	bf/3hI/Y=
X-Gm-Gg: ASbGncshuvmcjz/UxrB29MKHz1R13P3gCUaVtI9jdpkP2rDVmOg+kjN/svZxj61mmx1
	nFA/4S8+OOM3hJD2nQSSYx8Mna+pyxXe0L0NuNI2lCGvIw8ik2DrSabGQC//yTmzf3OYig6F4FN
	jVE8KXBP3+bIhOuOD3FWaS3Im46pU34zdrshaaeVecY3W8ZX4f6boZoQfli1NL00JvTCZ0pgra2
	o2KDNMcW7CDKBOSf5Uy5JLmupt6sh/QCVggqB/58lBX0vkfTPdXFQo0EAuZLU4qPFDszD29mte6
	YbGQ/e32L5qVsk7BwEaaCd4mSgiBrdXsQjRzuzr9cqlk7bXM2nd+J675i1mzAqqhxWQAlVzd5/N
	o+9OcPg1A/EcTJgZediZLNPcsDrlo248yKzeVRBJgZ0ujtK0gdVrW1Phjkn74uM5qVp4Asq7J8e
	kkM/iSEgVaEcFkZA==
X-Google-Smtp-Source: AGHT+IGqm3UIHtJb/u9koCukUrTzR7xZ5Mw4IcYD8i/Rijm7zDgxTkAz1qaoHoQCzLP4+RJIhvZJUQ==
X-Received: by 2002:a17:906:c104:b0:b04:9ad9:5b29 with SMTP id a640c23a62f3a-b50ac5d1e3bmr1893003066b.54.1760226257588;
        Sat, 11 Oct 2025 16:44:17 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9113a67sm604088466b.70.2025.10.11.16.44.16
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 16:44:17 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so6402714a12.3
        for <tools@kernel.org>; Sat, 11 Oct 2025 16:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhQ1nQLGJXzjWe/ty9a8uTX1gGP9DpYVlPZdY/FHPR+LfxNFIVtCUeTuDUrW0+myNWEc/XWA==@kernel.org
X-Received: by 2002:a05:6402:27d0:b0:639:f0b9:5f4d with SMTP id
 4fb4d7f45d1cf-639f0b96433mr11694849a12.21.1760226256524; Sat, 11 Oct 2025
 16:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <CAHk-=wgNNVkgDco67tVceM87B7kkVZK=Oz8RZti1v6N2_+S+2w@mail.gmail.com> <aOrqZsBZemu6MkAd@laps>
In-Reply-To: <aOrqZsBZemu6MkAd@laps>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sat, 11 Oct 2025 16:44:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wismGKUUxSRmUr2x8_fXF+L4G1POSs=w+Duu6PVZz4R=w@mail.gmail.com>
X-Gm-Features: AS18NWCvNlvHyIOgtxGrCk6r4yzCEubgWzRelPpPWWTgY6UC19Zzv1z1oSVxp0k
Message-ID: <CAHk-=wismGKUUxSRmUr2x8_fXF+L4G1POSs=w+Duu6PVZz4R=w@mail.gmail.com>
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
To: Sasha Levin <sashal@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Oct 2025 at 16:38, Sasha Levin <sashal@kernel.org> wrote:
>
> We have plenty of headers in stable-related mails that you can filter by to
> avoid that noise. Something like the attached patch?

I was reacting to Konstantin not feeling like making it
kernel-specific, and I kind of agree. It's a generally usable feature
for any project that uses lore or something lore-like.

And the commit date seems like the obvious cut-off if you actually
want a "what led up to this commit?"

But it's not like having special cases for avoiding stable back-ports
is *wrong*, I just feel like "hey, you have the commit, you're asking
b4 to dig for the source of it, then the commit date should be your
*first* filter".

Of course, in other situations you don't want to ask for the source,
but for people talking about it after-the-fact, and then you obviously
don't want to filter by date, but that's a "command line switch and
default behavior" kind of question.

            Linus

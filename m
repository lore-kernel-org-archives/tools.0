Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF441A2C11
	for <tools@linux.kernel.org>; Thu, 16 Oct 2025 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760633291; cv=none; b=NdvWulXD8kGCeDncl4toVdrkjkoyCG0Rwttl6weq8/O/dmFm2kW1tjRja2oz7ez/8dBULHI9SXLxzj/4r9UnJxE6yghcxWrV7Zc3UVJobs012hEB4EaJeZttL6WOjkL37wWxDF+58paOsQQJPA+JSC/VVFYUNNKTgrUvwsx9+8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760633291; c=relaxed/simple;
	bh=0u6go5xkiv0o3YukfWRy8JGoRnvNgkzu0o/sLFJOfDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pa8+e43crtj0vRr9tHeeYiGHFAIs0rdZaOPSuMQQcGKfD+KaLP8z9JlRG8qR/O+dRx4QbDNxkVx4m+s1paTX6HP/MGXEbnzAJ6+1dhcwUdpVW6yA+OfrND77M+3uXc/bfuwjcfHhDSCftLxVSIKxIX+tkI7HfIdiQjSu/OK/isU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NFs9lIVj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NFs9lIVj"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b472842981fso126015466b.1
        for <tools@linux.kernel.org>; Thu, 16 Oct 2025 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760633287; x=1761238087; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B9RPIMMxmg8eBK836S+NcIZEDhAPwpKf49BE/lKvZjE=;
        b=NFs9lIVjpLd91Dt1yYOqPk4lu4wfQoUc2+TgvwcbA+LD9U39rrETxu1all9/8EVIcX
         4HpkqQ2ZtQwKADraSAwtIuEh6GMdqRo4Yr56q6zoGsaHmCNsSkhG10aEEe/jRoA2k791
         YSeldXI+zgEOQBXn82yH2kIPE/fgCQxYGpCs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760633287; x=1761238087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9RPIMMxmg8eBK836S+NcIZEDhAPwpKf49BE/lKvZjE=;
        b=bUSiiXBemeEkoSvyR02GR5oy/QL70R4HDaeiQh39dA3NfUhS4KXnLDtxInbK+09jAq
         IiVdAgG5WXlzRCD0gmjajkk8wsOfY2TweqiCHvTiWFDG5H14hjuvwBLBMcz4nUYk87nV
         T5R9CVUi1zq+iW9FcB0xu5SilUpiXCkzcQyyTYKoREZ4ACckj0pFLkCgHesuNvYnl2tq
         JIBcooiiDD4j4orZ3fSpMoprFOWIHOr6HQ25GGqjjav9V167Uy3MmnUO9nC6LB1n+Pp5
         glivv/Rdysyw42jTdizUXLDlce3hU6fNLbEbZcniGYPnSkwPoQfB7jy7MYrqhAoVe+NQ
         75lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXgjbtccAUKH3DbMPFdqB3at3t78vxJLLo8+hkugD0gBthjWOcyCfncw0o3pd9hUQZAG1Y7Q==@linux.kernel.org
X-Gm-Message-State: AOJu0YzgytA+rj8dkmCFOkIw23cZyQCojZvQwmWDQnIsPVPmr4Bw/HQq
	0HJw6unwU2yuoPesWg6JMSVV4PAbSsZ31w+rSWXh33XgTIbnPx/qZM/ocbBbdCITqCMvGiy4k3e
	lAvAw+yE=
X-Gm-Gg: ASbGnctEVAqyNoqMB0YiMRxuBS6GnVCgYJXeaEsh2a5VORKvR9H393De7tNf1qfMCiN
	OZOhpSuNWkA40e1IMzMsaK7gdIsZG1PeFuigNam914q9uqb4vhUnaB/KQsBQCr1Li4v2z1Xud5B
	mOxssD4BXzTNy/6Llox+rvpNyuNG75XqKKrViKSJNiQfWc3qLLNxN4/traZyJpaj6ajf1WFjQiC
	ZjxkdBqDg5xdCgy8dD/mHlMyPUruWrDvSM9zJwD3dsEbo5IPV2w0P04u9KpGX3vM7UStXLTaSMG
	Nncfzs5/YOREFYgva12IVRofwZvfFtRW9f0JNCugTH4/+v5tiyL80w3hwKvH7SXIbfp4PzmY21Z
	RSsikdOLfI7rBbk8+EJgIF1l31/bXgPIDYoYfFZR6CXuf0dNJrMaz4z+PMrY08Mmvh/KuxARbZt
	xIdjmI8aEGKu+Vv1pzxgMV181ZcBy486nQZ4QPzH33zZRs/UgnoBTeUDi7PyM=
X-Google-Smtp-Source: AGHT+IEu814iKiPa4HxL3IM3h6MYtYBluF2IQ98IGKFX6rI5yA+U/8C+oznlVZ3/kYWOaL0cjQdptg==
X-Received: by 2002:a17:907:6d02:b0:b63:2000:72c8 with SMTP id a640c23a62f3a-b6474543490mr58668966b.62.1760633287108;
        Thu, 16 Oct 2025 09:48:07 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm559701866b.56.2025.10.16.09.48.06
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 09:48:06 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c0eb94ac3so1385790a12.2
        for <tools@linux.kernel.org>; Thu, 16 Oct 2025 09:48:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXay3VKJZrCAaWgu7b/GJa5HXrxCn9XebqL/QOoAkcObhUCcF0nvRWCAhJPZN/AWNycbCn3Hg==@linux.kernel.org
X-Received: by 2002:a05:6402:604:b0:639:720d:743 with SMTP id
 4fb4d7f45d1cf-63c1f6d6ae0mr396499a12.31.1760633285942; Thu, 16 Oct 2025
 09:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
In-Reply-To: <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 16 Oct 2025 09:47:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyBSpTKR+=Vtw@mail.gmail.com>
X-Gm-Features: AS18NWDUuS16MGdWVyLilIeTf61Zc2_79o3aHz2puj6nvJJd4cimVSbz5fIrsVo
Message-ID: <CAHk-=wj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyBSpTKR+=Vtw@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Oct 2025 at 03:33, Mark Brown <broonie@kernel.org> wrote:
>
> There was an attempt to do that with the https://patch.msgid.link
> domain, that's basically the same idea just done with a domain instead
> of the name of the tag.  Linus wasn't any happier with that idea
> unfortunately.

Considering how many people really want to have the "Link" thing, I do
think that at least if people use the different domain, I won't
complain.

I'm still not convinced it's a great idea, but at least it means that
the "this is the source of the commit" is clearly separate from the
"this is actual background".

          Linus

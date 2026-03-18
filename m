Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B52371042
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773820632; cv=none; b=Tra6ubkuIIO3j6XPj2Q+xSuaJ12FT6ROxmCdeU26Im/gM6hg8dPRUBzXZluErOTH8FgU7W3AiNTVB0Vjb4ObC1GEUlA+oEIGiZmRrtf5WTZZpYoGYSuU/pyN2IhN8brrngOwWXyX490//7UD5D0u8q8zZQWbDRIKvDNiI6VLGNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773820632; c=relaxed/simple;
	bh=KL4fkua0zONoLHFqFYlmSIkV+AEtOce/sAqq4EW5+jI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ialru6+cAfYrw6CSu0C3hDblbi/DX9haPSIiaExtDcJ88NVVEF6Y1cX0hSybZPGxwyn9XpnPFTs2G7H43W1SsT/H8XM7gHUf4i3DTLJ4ZB/UVvg3nMj2eC4fZN/59YHmsq9UjhhBb3C4Vac2o3iFAo7HcaR42DDpl7cX8KIy1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C36B4C2BCB5; Wed, 18 Mar 2026 07:57:11 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CB80C2BC87
	for <tools@kernel.org>; Wed, 18 Mar 2026 07:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CB80C2BC87
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9076813bso197588e0c.3
        for <tools@kernel.org>; Wed, 18 Mar 2026 00:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773820629; x=1774425429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AzRXten5FxMim/HPPYelLqjuWjBj8O0pBVTnoSN70A=;
        b=l+sCg3gYqTZw/UtaVt61hWGecdoEzuRUw1QuX0z6YNRw8H1MvnyWNtE3/kTUn9boa0
         HCNx0XzrycoV87eNr8J+qfhVYwoNMokdWCKsUCxQC/oJmL3pQJrEhEHeKErHMrrM8jB+
         L1GasYzySgqiVKjWyXEP9s6ljC6TG1DPWxC3tIVl+Uula7gGIeqe1eJya1OiQ2SAA6+2
         G4xCvjMNV/l+aebmP4LPVi7x9Py0BWf8Osw/IIcMu1ZYlDd8UrhiXtEyQVuoF/2nhZeX
         azTE90b6R4mQRon04Y975tfwWYGP6tBbJXHOqVkhdC5kWovErZKBJGIWJe6knrBwzKMe
         4Q5A==
X-Forwarded-Encrypted: i=1; AJvYcCU4McvFCYnsz1XLc2Ybat9yk0Hrrru37ZMLMKun/5Pg1gm2RCaHMK5e5AiTPEVtntdIOpkKpA==@kernel.org
X-Gm-Message-State: AOJu0Ywp5BzplXGz+y7usAdsokxW+3/4NzaOCks5C6gb0r/NeEjM0yHT
	kyp/fFXFRTTTCgt2b2v6s3STzMCvwO4/E4Oeb6dAWYVLskZcJYSdjdR2mL9xzSAqaZ8=
X-Gm-Gg: ATEYQzx3WAT/5NPFdjIfwu2qVXD9rFL5rqs0/JjhyKNLMo2pRsLQKL2Kyfx3AJZ6VFN
	kpj/FkOUFIvpqx2nnJQg9RA2W5hF8006SZdi4DDF988UKRNnnNqKB+2UiMnu5Q2FmaoJWLuz+J0
	TPv0GswvLzOrxNcC9zpu+7rxXl0HhtCZPgs4WMLL09HJNf6SMybToaNVp0BxrwQaB9GHv15a2I1
	hCNEP8M4iE3MAEgy5rR0Q9On6rDNrirNOz0cYDB3KwCGsgwX6d2OO7uCdxxuQLiSX+sYje21Nf6
	pJuc0ML+xm+MJh4aC6x7DTlUsbeVJMcaWpXNSq8UFBfcuAK/Z91bTw2lk4AtNnNRM0hhq3ny/gb
	acPyYNbSrPbctHh+FUN5xl8d9S1SGtvAIHwBMcaGtY3AnVl92eVjt9udK3Nbn8C7AYXh4U0V7Ww
	SF9qUEXEL+wtWg3wB7uOwE/STWcl3oDe3vK7mOqcxR0f17F2zjeJiycQzTXhoZ
X-Received: by 2002:a05:6122:c8b:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56ba707736bmr1398157e0c.6.1773820629127;
        Wed, 18 Mar 2026 00:57:09 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e2f265sm1232595e0c.2.2026.03.18.00.57.08
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 00:57:08 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-950b77942deso90540241.1
        for <tools@kernel.org>; Wed, 18 Mar 2026 00:57:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyj5A8pujNxuDFQwqFIh/6nhTguFTO3R2EDfUpdMg9WdVgMjQYexZsc9hucxQlQyRPrXknFg==@kernel.org
X-Received: by 2002:a05:6102:c88:b0:5f1:b7b2:8929 with SMTP id
 ada2fe7eead31-6027d13eb53mr1139892137.15.1773820628195; Wed, 18 Mar 2026
 00:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net> <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur> <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur> <20260317-optimistic-impartial-kudu-deefac@lemur>
 <87o6km86zm.fsf@trenco.lwn.net> <20260317-crazy-belligerent-llama-a14ba6@lemur>
 <20260317-majestic-efficient-raptor-59f17a@lemur>
In-Reply-To: <20260317-majestic-efficient-raptor-59f17a@lemur>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 08:56:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTLdeNr3gk7aE33+Kgedw+j3fmdaZ6CO9iDnNGsUxcGg@mail.gmail.com>
X-Gm-Features: AaiRm531gan1tUm-dHLS2DOfJfDXvT8K5Av0wU_8-EnVl6lAquhGj3NLVNfYqas
Message-ID: <CAMuHMdVTLdeNr3gk7aE33+Kgedw+j3fmdaZ6CO9iDnNGsUxcGg@mail.gmail.com>
Subject: Re: b4 review available in master
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Wed, 18 Mar 2026 at 00:37, Konstantin Ryabitsev <mricon@kernel.org> wrote:
> On Tue, Mar 17, 2026 at 06:39:54PM -0400, Konstantin Ryabitsev wrote:
> > > So it's still behaving a bit strangely, at least that's how it seems to
> > > me.  I tried adding comments to a patch, doing my usual trick of
> > > trimming out stuff that is being skipped over.
> >
> > You don't need to do that. Just find the stuff you want commenting on. We'll
> > take care of the rest! :)
> >
> > But, I'm able to reproduce what you're seeing -- trimming content doesn't do
> > the right thing. Let me see if I can make this a lot more relaxed.
>
> The current master should be a lot more forgiving when parsing your comments.
>
> However, I am now curious to hear your feedback. The idea with the review app
> is that you are not really sending an email, you're adding comments to code
> and adding review trailers. The app will render and send that out for you,
> trimming and formatting things nicely so you don't have to do it on your own

I haven't tried b4 review yet, but how do you decide what (not) to trim?
It is not uncommon to explicitly not trim some parts, as they are important
to understand the comment on a seemingly unrelated part.

> (I've noticed that many maintainers don't bother anyway -- there are emails
> with a terse comment at the top and then a huge quoted bottom that is only
> followed by their sig.

IMHO this is very bad behavior: not trimming replies forces everyone
to skim the remainder for more comments.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA2274FC6;
	Tue, 29 Apr 2025 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908566; cv=none; b=CaCLHGs6aZdQSWVDTedgv41Q5WX0l8I1xSYvDLrSI8b7d71r/+PxInExaxCxSEKPftG0Av1rhuV2t7xcJrzRXceo4agK5ueSBZS1Q7X5xpqaxRn100XAIqVeLF/2MBdnyvhxfOWowT4RuhWRwnHNIyEfv52ZUGyfpyYEgqJNHRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908566; c=relaxed/simple;
	bh=s4IaOxAHIyjjLJcbgVK7QaadGlX9/UHfNvN1SYKx5Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKhf6owAY/wEOO42rcy0gcCsYcj0B1KYXYoESwubVpAUqgcAKTmYB0NdusSwIPdOZ+dxeNHRRtqaw38sImgFKrMfaXumQ+ZBUEY4I1MIirpDUKcs8OYDw3TX5NIRlEnUTccXFvbFMtzUEX6kSmWTvMpiXwrWNNqF7k44uyA925g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-524125f6cadso5156878e0c.2;
        Mon, 28 Apr 2025 23:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745908562; x=1746513362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaZbmP7Q1UljIc/1dz7DyUnhBSi9CjGiNTaatKT+jFU=;
        b=BphjhROrJ+Rm4xyrEPDY4w4WJEygBwwqIvUbf0CjWm1p4lpoSW1xwuIoILAjxFoaO0
         msF8NYhG9MI/ryF/KDm99LLBhyRDbLHfDZ9DxdE6HlTsIQO/kgWTOXwrNOKWgothULRb
         GmJJxMtoY+pNiG9O+UWRL4iQlzqSRnw7pimBYtIGUZLYkSkt4Diq/YTPSQgj2buwwHEi
         XqhxwrNT3yrLliTw5Fu/FnCUIlLm334SXhVQQsL9LiyBXn9Z3S5eWT0iPO96oOrim6nm
         3vezul8MJ94x5c5QMpTz8ZYqz11XS47sVDtg/M41OJLGdlgxJNjsq0lFJS1l5EzEdoEw
         8N8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhydDcW1Cck8ZMtbd6KQU+lt4r1nO3Pd+Cz1I62hDhgwOIKlhuTZ+CbDfCWhG9HJZW56YHow==@linux.kernel.org
X-Gm-Message-State: AOJu0Yz8Fj4AnSEsipt9h+ryuWcEThR30mizVs5qQ1ddo13gZDUN6YhB
	1sZ1p49e4IS3cA2P3UdnKxFApZIrnSPhEYKJ3rvSgCmPMjqDpN6dObeWwp9h
X-Gm-Gg: ASbGncsNDaoLCewRLpuPs8lQD6NGWfJMcKrLH9SG6ftEijQWKvTh0kaLwdzIKsl0NNb
	svvGUHKqSGYtWXIATmervU0ltE4j0zGhX9E1Dhf8+2TEstTHy76QxIlU5ywGK3GXIRlTyLaIGXW
	qMj3ifJkxNyWVRsxF1T3Wk1JvtX47Yga6OZD51HtOI9uvI4noO2OAynpWL0DRMG/Td36nxyHrEC
	jVZMcIlqRknjWdiwqJ82BTADkqSt+54wQqHF2ALvGWNJrip4eOfAKpsa8FDonTRCSBseyuDazBh
	EULZyWtkNey9dB858r+Ol3NrRg1PpisLzsXWghtrqiRAFxnBjWchLSHpkqE2ER4dmFdXOwMCwTg
	S/no=
X-Google-Smtp-Source: AGHT+IEC0atljricZqxhSopm134yeKmwT358+8MjsZ0oRAlZBnG72GSPe6XPSFpTHtJJe3bqbX4oXw==
X-Received: by 2002:a05:6122:1804:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-52abf010b25mr1560016e0c.2.1745908561923;
        Mon, 28 Apr 2025 23:36:01 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52a99279c2dsm1249847e0c.27.2025.04.28.23.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 23:36:01 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so5604525241.1;
        Mon, 28 Apr 2025 23:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXILWZMd4d7iVIO/VVTbLhUZyj7Gukte/rE9TEvhodZhqR3Ok0J8AUhfBqw+clrB6ZOkRuIiw==@linux.kernel.org
X-Received: by 2002:a05:6102:3f41:b0:4bb:cdc0:5dd9 with SMTP id
 ada2fe7eead31-4da7fb18016mr1755218137.12.1745908561538; Mon, 28 Apr 2025
 23:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdXSLeOcPxSg2yCeW4K+2dhmoDvmzP9_GdT1aFP0ZBkUZA@mail.gmail.com>
 <20250428-convivial-jaguarundi-of-revolution-7b2cef@lemur> <20250428-vegan-marvellous-bee-4c572d@lemur>
In-Reply-To: <20250428-vegan-marvellous-bee-4c572d@lemur>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Apr 2025 08:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoxzUBwT+9ok7FAQ1c7T0yz0hAG93Lq_mqX3p1iL=DnA@mail.gmail.com>
X-Gm-Features: ATxdqUHQYPM4wnsbdVAG6tn3q5GLOnMKZiZoWZC5VQagJ1CsCVykvppJ5alxYDA
Message-ID: <CAMuHMdUoxzUBwT+9ok7FAQ1c7T0yz0hAG93Lq_mqX3p1iL=DnA@mail.gmail.com>
Subject: Re: b4 adding bogus tags
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Mon, 28 Apr 2025 at 23:16, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Mon, Apr 28, 2025 at 04:25:51PM -0400, Konstantin Ryabitsev wrote:
> > Looks like it's the same bug as this:
> > https://lore.kernel.org/tools/20250408-b219993-d3df209dae6d@bugzilla.kernel.org/T/#t
> >
> > It's the same scenario -- there are shared patches between these two series,
> > but somehow one of the replies on the older series gets misapplied to the
> > cover letter instead of just the individual patch.
> >
> > Having two series to work with really helps -- I should be able to find where
> > things are going haywire now.
>
> Fixed it in the latest commit in master, thank you for the report.

Thank you, fix confirmed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8702112
	for <tools@linux.kernel.org>; Tue,  1 Nov 2022 15:16:48 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id k2so4183139qkk.7
        for <tools@linux.kernel.org>; Tue, 01 Nov 2022 08:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdCgoNIOCLrjJEAxFBcxqF43KwlKXZNll1NW/0wnzcM=;
        b=2/E9/Q1PZAu/arELLIB6JOau7rBi0Vv0LIZDGOpB1bszW6keYmJFS7t31JN56RypG1
         AtlSgnNDi0tQqMwACiba6/h4CMi678/vp2jcpizhKkdtKKoYL53MN1RHxh9NU1+/QYVC
         GnPke1dxWg/rOj9HymiIB2IC79LVgXo8CDFMc3+TxH7lLQs1fxHvxzKs0+Sv3xegv62j
         crg8a+XiLF3VyTvYUkxZdXuKOsNYz0xPLQf0B6S9RUGqLRjqbNm15DQvT/oi2cOAMbya
         KGTI2e6pkkZPita9GCm0ux6qRLxKJayhpajDgz6Y/3sU480D6nWFso1t7iGF6xQ3wkKi
         b39g==
X-Gm-Message-State: ACrzQf0QtAQAD+i5xhfunljoertEL2Q8lc5t/fe5Q0h5LqoSFJyWd3Yg
	sDMDmWX9tpHa1PT/hlq4mZP/s9Sdci5Y7A==
X-Google-Smtp-Source: AMsMyM6Gy7XxYsRfO5C5fN5MTJSwD86Scj+Bec7oEHNEgOvJT94+GKnHlOlKttH0DrEwfVyjTmWtQA==
X-Received: by 2002:a05:620a:cc7:b0:6fa:d7e:7b4 with SMTP id b7-20020a05620a0cc700b006fa0d7e07b4mr126684qkj.373.1667315806898;
        Tue, 01 Nov 2022 08:16:46 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a0c4500b006fa22f0494bsm5093383qki.117.2022.11.01.08.16.46
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 08:16:46 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id g127so9130608ybg.8
        for <tools@linux.kernel.org>; Tue, 01 Nov 2022 08:16:46 -0700 (PDT)
X-Received: by 2002:a05:6902:503:b0:6cf:c510:6a23 with SMTP id
 x3-20020a056902050300b006cfc5106a23mr1766786ybs.380.1667315806284; Tue, 01
 Nov 2022 08:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdUsfc-NNHswtS8jjhWFwk4fX2yvynKh4q0x_u01bnUQBA@mail.gmail.com>
 <20221101123035.xkytwxrhrkhjadc3@meerkat.local> <20221101151339.rhp6hys6vnxm4skj@nitro.local>
In-Reply-To: <20221101151339.rhp6hys6vnxm4skj@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Nov 2022 16:16:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS-uK63y1D1qGPOvUbrSuhUnAgiCW+RdChP4xKN67OmA@mail.gmail.com>
Message-ID: <CAMuHMdWS-uK63y1D1qGPOvUbrSuhUnAgiCW+RdChP4xKN67OmA@mail.gmail.com>
Subject: Re: b4 ignoring Reviewed-by: in quoted-printable email
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Tue, Nov 1, 2022 at 4:13 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Tue, Nov 01, 2022 at 08:30:35AM -0400, Konstantin Ryabitsev wrote:
> > It's actually because that message has a subject that doesn't indicate a
> > follow-up (doesn't have a Re:):
> >
> >     Subject: [PATCH v2] clk: renesas: r9a06g032: Repair grave increment error
> >
> > I'll see if we can recognize this situation, but it's definitely an odd
> > corner-case.
>
> There is a fix for this in master.

Thank you, confirmed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

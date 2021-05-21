Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9470;
	Fri, 21 May 2021 13:18:13 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id x1so6131595uau.1;
        Fri, 21 May 2021 06:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1tO4cjjabPe8A7WBMUid372l5eovYDW+0+lN51BRwk=;
        b=U6DFhifjG+7nlYKkX5RQcY5JusWvFC6VHTiMNPKWO26kXjqls+Plpk9EsH3ZkCRqdg
         n3i6u8b8fN8KCfy2kdB266/130je6H/aI5hgBwM3yOEbVtYuM06TVXxlmXCJTiMdc1r7
         ruCH0t3yM50cKCgvVJG7tKRQbqg9momvt6UHsZEwYfQI4tPOa1APGCVtpnax0/2H2UBc
         qU6p6mrGhIYKfZXJJrdzLbO+HtcQJRjMm4rq/wSJdXsecCoUYKXOwwqZtBxkP2X5YBCt
         eNhuCWkM8bZhwa947h2Yq3ENw7P6Vkdm0vArP51feppkspXpqUu4hJjPBc6tOGKD3Qh9
         1MDw==
X-Gm-Message-State: AOAM530Ewd7jzXIjbB9wds1UtKc4pQRhmSABwfA0zg4YrQf+j8GPlFUH
	x1lZzoXmKhqG0eY9DMYJ88tpAf/ck7h7SUaC9GRYEfBv
X-Google-Smtp-Source: ABdhPJzquQ30hT5tkrckHwfaD/g+7VPpc1o1hYcfGfQB3w3ECNt3aPrQqdxbPUvKNmWpuZB7kgHBValpwwABI9WJqHY=
X-Received: by 2002:a9f:24b4:: with SMTP id 49mr845325uar.100.1621603092968;
 Fri, 21 May 2021 06:18:12 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdV7gLtcuW6sCJh3HyWpgwr1rcCEEaDkN2L+chZgVMQTpw@mail.gmail.com>
 <20210520220605.6cnct2wdmjxlz52c@nitro.local> <CAMuHMdUstawScbrpwiQSMuH54YFXYzB0Dsm9BuXXvFZU77Nz5w@mail.gmail.com>
 <20210521122836.lifamz3ikutnc65e@nitro.local>
In-Reply-To: <20210521122836.lifamz3ikutnc65e@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 May 2021 15:18:01 +0200
Message-ID: <CAMuHMdWX0iyNFdUV3z8T2dswnczGeXSLLB+txP4thLua+=SiYw@mail.gmail.com>
Subject: Re: b4 not finding explicitly specified patch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "users@linux.kernel.org" <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Fri, May 21, 2021 at 2:28 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Fri, May 21, 2021 at 09:06:20AM +0200, Geert Uytterhoeven wrote:
> > Note that without "-P_", it still downloads the series not containing the patch
> > I specified.
>
> I'm not sure if I can fix that, because that thread is a bit wonky. You will
> notice that we have:
>
> [PATCH v1 0/5]
> ...
> [PATCH v1 5/5]
>  \- Re: [PATCH v1 5/5]
>   \- [TEST PATCH v1]
>
> b4 is really built around retrieving series, and here we can't figure out
> where in the series [TEST PATCH v1] belongs. I *believe* the intent here is to
> replace [PATCH v1 5/5], but it doesn't have any counters on it, so we end up
> ignoring it because we already have a [PATCH v1 1/5].

Yeah, it's a weird case ;-)

> I'm not sure what the *proper* way to deal with this case is -- at least in
> the absence of -P that specifies "I want *that* exact msgid".

Fair enough. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

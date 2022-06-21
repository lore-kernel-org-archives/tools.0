Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0C710E1;
	Tue, 21 Jun 2022 15:20:15 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x75so10323922qkb.12;
        Tue, 21 Jun 2022 08:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t4/qx0HU7STke1NhyT4BGBQxC3Z+wbb61OF+K/fXiDU=;
        b=HedXL9g6Zx6XSGI9nKs6r6FeEHBwvLzjul4p+AFYvdFKafjgdtz53zPO9aflfWWO7p
         P4FGgd9M9VhJj3BZRizZvWaKSOk4ZTOi8jfUgK0RDnda9YihTHhs/ACwylSKfxkNxw2F
         zw/7R8TnwezjpV1M3j7yjzkXQa0g55kr7cYppT94dGNMGzdJcVnqG7PJYzadJl89eymE
         OuLRR4KW6zzm8fmmjOBOBNJypCWJB7eN0Vv+faf9FxmO6Nb5KeBeNObHXuXqkZLX4+aA
         ux73jsiO5eyfhpvbbjLeSUEstTuR+4d124yy57gSaafJy7VDttlpTOtGKHvA9+7g7YqB
         IC7Q==
X-Gm-Message-State: AJIora/pJeXfdHB9xM7hG9QRlD0GZj9YLwiKG3AUw5fF/zsHR28yZYZf
	rtLYci4yJVlrKczb3eKtnf//5ix5AEm8Cw==
X-Google-Smtp-Source: AGRyM1vthryJB8MfSEewHekQHmr+pXGRBiHk9qiXJ2Gai5/H3TPET6YcQMjk5ZQtT3/tgBF7CTChHA==
X-Received: by 2002:a05:620a:24ce:b0:6a7:48c:f0d5 with SMTP id m14-20020a05620a24ce00b006a7048cf0d5mr20131117qkn.314.1655824814450;
        Tue, 21 Jun 2022 08:20:14 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id p13-20020a05622a048d00b00304dd83a9b1sm14218499qtx.82.2022.06.21.08.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:20:14 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3178ea840easo96368167b3.13;
        Tue, 21 Jun 2022 08:20:14 -0700 (PDT)
X-Received: by 2002:a0d:f801:0:b0:30f:f716:2950 with SMTP id
 i1-20020a0df801000000b0030ff7162950mr34719779ywf.358.1655824813935; Tue, 21
 Jun 2022 08:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
In-Reply-To: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2022 17:20:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
Message-ID: <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Fri, Jun 17, 2022 at 9:02 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> # new: b4 shazam
>
> This command is very similar to "b4 am", but it allows you to apply patches
> directly to the git repository without the need pipe the output of "b4 am" to
> "git am".
>
> The shazam command has three modes of operation:
>
> 1. default mode that applies patches directly to your git repository, just
>    like passing the .mbox file to git-am

I gave it a try, and noticed a difference: with b4 am + git am, the
Link tag is added first, followed by my SoB, while b4 shazam does
the reverse, and adds my SoB first.
I believe the b4 am + git am behavior is correct.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

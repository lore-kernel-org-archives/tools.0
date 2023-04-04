Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0B47F3
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 06:57:56 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5416698e889so597107267b3.2
        for <tools@linux.kernel.org>; Mon, 03 Apr 2023 23:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680591475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMUOBSmsf+P2tOaipYQIbA2HBuBLhKgLLhCNUMVXeeQ=;
        b=ASA4VOu2Zs2vB3II2KoInGrmwLDnVybiM346YgX+4aKwagj/u1bJwTukX+mP7HmMXG
         I2s1rRanZLRNFdNO8WvLoWI4k2ZZzV1cR43KyMqOWGjip//2MG+gyjnZy5FJthNHspCL
         moYLR4CSJJuXNKtYttqXPGtHENraA+SfHbENHawIVuXZcjCqbl2KHnxnhF4a7Ihd8Pjy
         OuhOc5WFcrYIkm7yZeqD5t35Jqc/Ots6iGI8eAmG20YqCvdE//2f/wa99Lvn7k4IssuT
         HRKZzY6onjagJCglt9QtzGGAbHWMy5rPk4ecTJ7KuEAKawe2oVSDYRSFk2kkuZARpKmp
         fb7g==
X-Gm-Message-State: AAQBX9fTOSoT2UBbezTUIhY6ihyUGzfBeCmqH6XQ0w2I003UDI5UFTJC
	EgTy3AyFFQKFCosx5qEUj5yUVpF4PsHsGajp
X-Google-Smtp-Source: AKy350ZluGBs2G1NBZRkpnzI2cxLYHrKZh001SG+vKYtuOEFQCgNbZ39yX/CqqBAMQbsF1TJfIDv8A==
X-Received: by 2002:a81:7206:0:b0:541:9f38:ff48 with SMTP id n6-20020a817206000000b005419f38ff48mr1358797ywc.47.1680591475517;
        Mon, 03 Apr 2023 23:57:55 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 85-20020a810b58000000b00545a08184c6sm3049691ywl.86.2023.04.03.23.57.55
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 23:57:55 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id p204so37497056ybc.12
        for <tools@linux.kernel.org>; Mon, 03 Apr 2023 23:57:55 -0700 (PDT)
X-Received: by 2002:a25:ca4b:0:b0:b77:d2db:5f8f with SMTP id
 a72-20020a25ca4b000000b00b77d2db5f8fmr1190961ybg.12.1680591474911; Mon, 03
 Apr 2023 23:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q> <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
In-Reply-To: <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 08:57:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6OOHXCB9pw-iO+ajHVP6eJwzK8mUTE5N4AKRXdNj66w@mail.gmail.com>
Message-ID: <CAMuHMdX6OOHXCB9pw-iO+ajHVP6eJwzK8mUTE5N4AKRXdNj66w@mail.gmail.com>
Subject: Re: Introducing bugbot
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, aros@gmx.com, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 8:03=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
> On 03.04.23 23:45, Konstantin Ryabitsev wrote:
> > Per our discussion last fall, I've been working on a bridge between bug=
zilla
> > and public-inbox, which went live in the past few days. It's still a ve=
ry
> > early release, but it can do the following:
>
> thx for working on this.

Thx indeed, looks nice!

> >    New bugs will be created in the Linux/Kernel component of Bugzilla, =
but
> >    they can then be reassigned to any other component. As long as they =
remain
> >    open, bugbot will continue tracking threads for new messages until e=
ither
> >    the bug is closed, or it has been over 30 days since any activity on=
 the
> >    bug.
>
> 30 days from my experience sounds too short for me (but I have no hard
> numbers to back this up). I would have gone for 90 days, but I guess
> that would create too much load?

30 < release cycle (9..10 weeks) < 90, so 90 days sounds better to me.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

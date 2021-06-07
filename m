Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056470;
	Mon,  7 Jun 2021 07:31:03 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id g34so9154524uah.8;
        Mon, 07 Jun 2021 00:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gisvBDH/GU9MTarl8DWwu2a7/XBdTyPPz0MrxA7MTb4=;
        b=D0jzC1F/bGy8JfZCkujkDYTDGwEOYVGk6n1xWqbnU+j4sR3WAmrqVac/C8JCUAU8vg
         FAaii7etItWPrbBFCGUOX4M+wD7SPheY9kuTCciBqMtvYIJbaQuS1/hnnaI+NP61U9fm
         ujtA2kqONXnpqQBrS3iYoq+qKaMbmAR9FVcVtXI3jp69lAc11GMHdxGXUemN6KPWDvn9
         fnQ+xevyiqt6aytjDUrLVqODfvNKxeBFBjxw2eFJQO7NesVMX0q8EZVyJOb/L5FeDkRO
         awXrzRsDqXWzubC1cwlH8QMuLN3clB6AlqOV+GSazpZtHNAVIY1N0NYxfkdHk1tLRRNt
         pCFg==
X-Gm-Message-State: AOAM530QNvN89y4mwpHW/a/mDI0mVk5XCedoXkotI6+Lp2UO9fqsFSlV
	OYQkifLSEhEa0L+g/HpEE0xzWNo2If9kONIrhXQ=
X-Google-Smtp-Source: ABdhPJxzX7NXXhFOqvleHtYbvpYLOBpr26E0s58DlUBH05I34qmEufLAaPOx/LA4GVJN2wFF7pHbD+Y/y8ZWa9KoSPA=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr7274041vkg.1.1623051062830;
 Mon, 07 Jun 2021 00:31:02 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdV7gLtcuW6sCJh3HyWpgwr1rcCEEaDkN2L+chZgVMQTpw@mail.gmail.com>
 <20210520220605.6cnct2wdmjxlz52c@nitro.local> <CAMuHMdUstawScbrpwiQSMuH54YFXYzB0Dsm9BuXXvFZU77Nz5w@mail.gmail.com>
 <20210521122836.lifamz3ikutnc65e@nitro.local> <CAMuHMdWX0iyNFdUV3z8T2dswnczGeXSLLB+txP4thLua+=SiYw@mail.gmail.com>
In-Reply-To: <CAMuHMdWX0iyNFdUV3z8T2dswnczGeXSLLB+txP4thLua+=SiYw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jun 2021 09:30:51 +0200
Message-ID: <CAMuHMdWFLeROkPnd6GtKsQ5O+cEBxB3YAmw=KkZzXSL9_2OG5g@mail.gmail.com>
Subject: Re: b4 not finding explicitly specified patch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "users@linux.kernel.org" <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Fri, May 21, 2021 at 3:18 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> On Fri, May 21, 2021 at 2:28 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > On Fri, May 21, 2021 at 09:06:20AM +0200, Geert Uytterhoeven wrote:
> > > Note that without "-P_", it still downloads the series not containing=
 the patch
> > > I specified.
> >
> > I'm not sure if I can fix that, because that thread is a bit wonky. You=
 will
> > notice that we have:
> >
> > [PATCH v1 0/5]
> > ...
> > [PATCH v1 5/5]
> >  \- Re: [PATCH v1 5/5]
> >   \- [TEST PATCH v1]
> >
> > b4 is really built around retrieving series, and here we can't figure o=
ut
> > where in the series [TEST PATCH v1] belongs. I *believe* the intent her=
e is to
> > replace [PATCH v1 5/5], but it doesn't have any counters on it, so we e=
nd up
> > ignoring it because we already have a [PATCH v1 1/5].
>
> Yeah, it's a weird case ;-)

Just ran into another weird case:

$ b4 am 1622957313-321-1-git-send-email-schmitzmic@gmail.com
Looking up https://lore.kernel.org/r/1622957313-321-1-git-send-email-schmit=
zmic%40gmail.com
Analyzing 28 messages in the thread
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH RFC 1/2] m68k: io_mm.h: conditionalize ISA address
translation on Atari
  =E2=9C=93 [PATCH RFC 2/2] m68k: setup_mm.c: set isa_sex for Atari if
ATARI_ROM_ISA not used
  ---
  =E2=9C=93 Signed: DKIM/gmail.com
---
Total patches: 2
---
Cover: ./20210602_schmitzmic_fix_m68k_multiplatform_isa_support.cover
 Link: https://lore.kernel.org/r/1622611267-15825-1-git-send-email-schmitzm=
ic@gmail.com
 Base: not found (applies clean to current tree)
       git am ./20210602_schmitzmic_fix_m68k_multiplatform_isa_support.mbx

No, that's the RFC.

$ b4 am -P_ 1622957313-321-1-git-send-email-schmitzmic@gmail.com
Looking up https://lore.kernel.org/r/1622957313-321-1-git-send-email-schmit=
zmic%40gmail.com
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH] m68k: Fix multiplatform ISA support
  ---
  =E2=9C=93 Signed: DKIM/gmail.com
---
Total patches: 1 (cherrypicked:
<1622957313-321-1-git-send-email-schmitzmic@gmail.com>)
---
 Link: https://lore.kernel.org/r/1622957313-321-1-git-send-email-schmitzmic=
@gmail.com
 Base: not found (applies clean to current tree)
       git am ./20210606_schmitzmic_m68k_fix_multiplatform_isa_support.mbx

Yeah, that's the one I want.

At least the chain "RFC" -> implicit v1 -> "v2" -> "v3" ... is less fuzzy
than "[PATCH v1 5/5]" -> "[TEST PATCH v1]"...

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

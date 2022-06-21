Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE9510E5;
	Tue, 21 Jun 2022 15:41:17 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id c144so10370678qkg.11;
        Tue, 21 Jun 2022 08:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TUfp/wqkKodQ7Xn5Bo1cNpc9liVrIa8zqWJjLg8IJhA=;
        b=MyX4jyfoPGQ90bJieuM41Dd694YW+s92P/B0YfHMdWw3iQCJCInPku6hksfWNy0P3p
         b/OTN0h81+ZEYxZAyXmMzi4YhB4N8e9TVscRa7N01OOGrdcmxIBpqMoQL83nX1idjQnv
         d/howuZslba8RnZWUCWngzUGC5PgQxDZbO0abR+OgYstR1yuGRYS6P9ZaN2AE/m6eE5X
         DY/k7eijCsf5TxudH9AbzkgSuqoEYdpXx+My3k/iIKabri9ubLYyYlGWD1BuS/Oxfjfw
         6yQRJpjfI4HodimxqFmg0TkF+VING5/g6mmqH54exK26ofo8rhjtVxfVlvW24EeivZUO
         MB4Q==
X-Gm-Message-State: AJIora8gTdqYgJC2nZ/gV4dRN7GR14gYtVHv2o+51unPOGk+fZ8liDVA
	lwVR8ea1ezcw3gmBhwTWwVveqDYgNCjn9g==
X-Google-Smtp-Source: AGRyM1sMirwGe/HVar0BKvTEFAOSs/QsjtrB+so340s+iIWZalU7XfN686jW8yBNCeFh5Bal1Yj15Q==
X-Received: by 2002:a37:5e46:0:b0:6ab:90dc:d9d6 with SMTP id s67-20020a375e46000000b006ab90dcd9d6mr15119198qkb.131.1655826076026;
        Tue, 21 Jun 2022 08:41:16 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id y3-20020a05620a44c300b006a75a8fd54asm15656679qkp.84.2022.06.21.08.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:41:15 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-317a66d62dfso74385857b3.7;
        Tue, 21 Jun 2022 08:41:15 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr28435133ywb.316.1655826075365; Tue, 21
 Jun 2022 08:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com> <20220621152903.czivp7fdn6me775i@meerkat.local>
In-Reply-To: <20220621152903.czivp7fdn6me775i@meerkat.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2022 17:41:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
Message-ID: <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Tue, Jun 21, 2022 at 5:29 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Tue, Jun 21, 2022 at 05:20:02PM +0200, Geert Uytterhoeven wrote:
> > > 1. default mode that applies patches directly to your git repository, just
> > >    like passing the .mbox file to git-am
> >
> > I gave it a try, and noticed a difference: with b4 am + git am, the
> > Link tag is added first, followed by my SoB, while b4 shazam does
> > the reverse, and adds my SoB first.
> > I believe the b4 am + git am behavior is correct.
>
> I'm guessing you were adding the SoB with "git am -s" as opposed to letting b4
> do it?

Exactly.

> I'm not sure there's an established "correct" behaviour here, as various
> maintainers either stick to arbitrary ordering, chain-of-custody ordering, or
> have a very strict "I like all my trailers sorted in a very particular order"
> approach.

FWIW, I follow the chain-of-custody ordering.

> I can swap the Link: and S-o-b: trailer order, or you can just turn off the
> Link: trailer, since the latest recommendation is to restrict them to merge
> commits.

I still find them useful, as they e.g. allow me to navigate easily to the cover
letter (which might link to the previous version(s), and to whatever else),
even if I applied only one or only a few patches from a series.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.5114.1611223562406465439
 for <tools@linux.kernel.org>;
 Thu, 21 Jan 2021 02:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: geert.uytterhoeven@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id v1so1059704ott.10;
        Thu, 21 Jan 2021 02:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=LpIjAaQHYgldEm36xZp8SnEQo02qtPSbnGUIGlOSJOk=;
        b=Z4Y5RLArs1JL7U6qD7sqz3dFEhDHn5vjVvcli44UVdPL8JQENZvJe1rUhz7P1Ij811
         Iw8XQPfSbsUNF5QpFAepBHE1rpuMbTuu6GAwHWX48VqhQi90JXxeSH/9Q/5NH/2kA8Hu
         zZYFkVOd9dlFZZs7FaeZErvXkzNRc+IeFDLmLJa2GbCMu7aZHQ+Jzv4wX/8j87pyDMPp
         XCI8RQhBOqdQml09LocFvD3RSmQqabpDpElAI7did044uiv/mfX3YE9kOfiJt0EUhKor
         eWZNiXWwybGWyH7H4qzPU0XBRXeDhOiy1hWWmSnWNSCH7x1Wrw9UA0SVEYtS/8ZaGvD+
         Ws1w==
X-Gm-Message-State: AOAM533y8aCOH8ema4jhjfvp59wyVw6J6YS0ip6NIfJnvXgTUPt+BML4
	C69JvTlDJa6M0GWWcZ3F1vFttjNPGXVBzlxtlkk=
X-Google-Smtp-Source: ABdhPJwvEn8qKc8b9waVcqgbybcnMscxRvcuSkOH0gE/eMV1zAbABalfm3aDgUcsaca9gLHNj5y5dPeeMOGvBRWvMeU=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr9883090otc.145.1611223561833;
 Thu, 21 Jan 2021 02:06:01 -0800 (PST)
MIME-Version: 1.0
From: "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>
Date: Thu, 21 Jan 2021 11:05:51 +0100
Message-ID: <CAMuHMdV7gLtcuW6sCJh3HyWpgwr1rcCEEaDkN2L+chZgVMQTpw@mail.gmail.com>
Subject: b4 not finding explicitly specified patch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "users@linux.kernel.org" <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

$ b4 am 20210121082248.883253-1-saravanak@google.com -P_
Looking up https://lore.kernel.org/r/20210121082248.883253-1-saravanak%40google.com
Grabbing thread from lore.kernel.org/lkml
Analyzing 63 messages in the thread
---
Specified msgid is not present in the series, cannot cherrypick
$

Without "-P_", it downloads a series not containing the patch I want.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

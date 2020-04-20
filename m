Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web12.2478.1587391335901969428
 for <tools@linux.kernel.org>;
 Mon, 20 Apr 2020 07:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.67, mailfrom: geert.uytterhoeven@gmail.com)
Received: by mail-ot1-f67.google.com with SMTP id z25so4683576otq.13;
        Mon, 20 Apr 2020 07:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=KGRiDRv/bjtcHXkiyGc0ZkdHAxLqjixw48TGDaOxfFE=;
        b=Cm6p58bIV928OjhZESrhwqyJr4AogQ/2Mbclhg7NFAqMgZLk+exvVDe5MIiPW7rfEt
         b1+NGcZWnKPUMnBs8OAiVArhuFHrgNXccSAEnsAem7qZHRjNF7hVHjPTvt4i5xnN93dA
         /V7wfiTeIY9OnvlSOo7aS6GHu4IGqfN6IgaAz/brIN/EYM5uNR0/sx+9LLwhkF/isdX/
         jrdrT4JrxcMv9U0NuNtBi0O7TPVwe2eAF9dTMjXPtxfbrC4P0a8m0+IeuOb+ao3ohVmo
         HeJAbGdYrO0G0vHdxLeojOUt2nnEFmLj0cTs+DKKhriZV/5Pcrs6YMqxvR/sqNyyUrTH
         ZfRQ==
X-Gm-Message-State: AGi0PuY6JYVpzRtkHWjHHCbPDH+H+4nAQ1RkEqsr+BLmPiQKC+McTxpy
	QJdp1MQOnE8pI2V/Dk0zmm/mfq9YYCmFj+CoOJg=
X-Google-Smtp-Source: APiQypL0uKiGUMuaff2M6cTd/DYHIVubBS0bKAukcxWuwRrCLx5wBtgSQyy2VgKJaX6Ct5wmIeubjI3hTUF/I4syHVc=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr6050991ots.250.1587391335147;
 Mon, 20 Apr 2020 07:02:15 -0700 (PDT)
MIME-Version: 1.0
From: "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>
Date: Mon, 20 Apr 2020 16:02:04 +0200
Message-ID: <CAMuHMdUEy-95tQExorPvTUjXzcOfJkp4BFtRYN10koDPmwMoZw@mail.gmail.com>
Subject: b4 am doesn't see patch 2/2
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, "users@linux.kernel.org" <users@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

While

     b4 mbox 20200420123844.3998746-2-arnd@arndb.de

fetches all files, "b4 am" only sees the first patch:

    $ b4 am 20200420123844.3998746-2-arnd@arndb.de
    Analyzing 2 messages in the thread
    ---
    Thread incomplete, attempting to backfill
    ---
    Writing ./20200420_arnd_sh_remove_sh5_support.mbx
      [PATCH 1/2] sh: remove sh5 support
      ERROR: missing [2/2]!
    ---
    Total patches: 1
    ---
    WARNING: Thread incomplete!
     Link: https://lore.kernel.org/r/20200420123844.3998746-1-arnd@arndb.de
     Base: not found, sorry
           git checkout -b 20200420_arnd_arndb_de master
           git am ./20200420_arnd_sh_remove_sh5_support.mbx

It doesn't matter whether I pass the Message-Id of the first or second patch.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

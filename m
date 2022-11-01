Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CD6631
	for <tools@linux.kernel.org>; Tue,  1 Nov 2022 09:15:05 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id x15so4350166qtv.9
        for <tools@linux.kernel.org>; Tue, 01 Nov 2022 02:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmJJgqvBpyrMUSHZDbpYR1KLY/ylEZoQf2la41iyXts=;
        b=MCDHb1iiQHNxsRFR/xsbzD5WEZYi5222iqA8IM6J8///MfSWSnCjsO+RRwoKEO3ASS
         vqqEYG1eInm6NchXDNzAeqN27nBbIDbKpR7hmMg/As6rOANBYsNAFA/275FxY+HX6TYP
         XPN6Vd1tY4lUXVlv5LRKoBFsd0gFteF0wW9GCABRyBnZ3pF5I0WRm2GKMzS22CRs21xf
         a5vuFIK6ePY8EeEwZqzcvu+nEPawtm1q/F+mWjWM/5GO7XHJenMvvIQkrWb2s5M+VFeI
         bwhc8eVcN7KSQNNJsusNEIaCAOVkDvqbWw5i7vWbwb1QOyExoDEVrHpSThQtK6HydJFM
         ri0w==
X-Gm-Message-State: ACrzQf13+BW/gruZEGMFTScnavHazgCKOsZzQyFhi86pzN3JycN5Lqlh
	+jgke7FY6CRWCmbYwRN9n7ZevU7G73kPBg==
X-Google-Smtp-Source: AMsMyM4DAbHA603ShX6oQ4FM7qnENxQZc0f526CHoqak1BysGKiZfh0bmjJDb0FQ21tu0z8gfacqLw==
X-Received: by 2002:ac8:5b92:0:b0:3a5:428:9210 with SMTP id a18-20020ac85b92000000b003a504289210mr14101600qta.3.1667294103827;
        Tue, 01 Nov 2022 02:15:03 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id de36-20020a05620a372400b006ce9e880c6fsm6109817qkb.111.2022.11.01.02.15.03
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 02:15:03 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id j2so3461628ybb.6
        for <tools@linux.kernel.org>; Tue, 01 Nov 2022 02:15:03 -0700 (PDT)
X-Received: by 2002:a05:6902:503:b0:6cf:c510:6a23 with SMTP id
 x3-20020a056902050300b006cfc5106a23mr390524ybs.380.1667294103174; Tue, 01 Nov
 2022 02:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Nov 2022 10:14:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsfc-NNHswtS8jjhWFwk4fX2yvynKh4q0x_u01bnUQBA@mail.gmail.com>
Message-ID: <CAMuHMdUsfc-NNHswtS8jjhWFwk4fX2yvynKh4q0x_u01bnUQBA@mail.gmail.com>
Subject: b4 ignoring Reviewed-by: in quoted-printable email
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

$ b4 am OS0PR01MB5571A141EC9159DB281867C8DF379@OS0PR01MB5571.jpnprd01.prod.=
outlook.com
Analyzing 2 messages in the thread
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v2] clk: renesas: r9a06g032: Repair grave increment erro=
r
  ---
  =E2=9C=93 Signed: DKIM/denx.de
---
Total patches: 1
---
 Link: https://lore.kernel.org/r/20221028113834.7496-1-marex@denx.de
 Base: not specified
       git am ./v2_20221028_marex_clk_renesas_r9a06g032_repair_grave_increm=
ent_error.mbx

The Reviewed-by tag given by Gareth is not picked up by b4.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

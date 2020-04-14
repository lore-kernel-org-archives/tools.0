Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.9961.1586866963134813281
 for <tools@linux.kernel.org>;
 Tue, 14 Apr 2020 05:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FPlkLfIr;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: linus.walleij@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id r24so12235011ljd.4
        for <tools@linux.kernel.org>; Tue, 14 Apr 2020 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=U0eU5F2NzONWTgFiHuyY3nEDjxau3uAumIa/5rJ5Mu8=;
        b=FPlkLfIrSY7qRNZj6visowVmK9u+VGyYR3rT7cEgTyGKAKwHlR6zhBj57RQDxktmig
         sAm1u61PF+aOs0jC8eX12Jue0LJ5E8a5ocmekb9LAco4sv9KhHtmE3D6Z8JNlQyOG4/N
         CJmwy8IZ08k3h1LyFdf8lkw9Z3ZE+W8XlpvqI13kZBpdBPBrhxqXhHJ3Uvd4tIcWmrnv
         vVFgmWFkCBmUDsBO6pj/A21HStK/7cr72lfv67p8wMY1JnktWQN1ZuTQ8Sc3xbEODYmL
         iBHlejAFh1MvL+q99bm0UDBZWsBz4PKQM4yEvXn3Au66RTHb13PXYwu2ZIKaHJZIwb3C
         d9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=U0eU5F2NzONWTgFiHuyY3nEDjxau3uAumIa/5rJ5Mu8=;
        b=ESKlyvPDsk4QMLFkYt5s6ctMTUBDAvloDJ9H4wPz4F0uJOwQzVB0BzF++U6Kh5W6tB
         py0HXPrlPdixNvFT+VAaXBV9YmkzVxgjWbFBThLMoCEMyBr981Rbs8pUZH2aOrgEM2tF
         hYWJUKKMRH/VNe6AX3DVqQeOZCXf0q+Wx+pM+l1//gSfUFeE5/5uf+qzFI6E2/XI0PIc
         QfTsvnI3zeRhrb/WcMkOl7lELUOMWJC77BSjwjEgoDhGnTv+rIYGhrKXWja96uN0kYiU
         MZPIElviRHuuTv2aAQpLDUMvZsFE+vhR06l8ZZMPtF0VWNSu+CzD43AYMzELptaX+IA9
         08cg==
X-Gm-Message-State: AGi0PuZ9xkj4W78A98zdsq1+mHeDjvA4U6XiiQv8Zp3zpyijxHElyxT8
	DDgf1EU90DmPFn2IlS5gWL//hncqpICRRtyduXWupg==
X-Google-Smtp-Source: APiQypISyk6uj/3JbENUuKGnjxckRpjqlLSr2BNdw84DI0n5tcjV5xl5QRxlT3wF8IHXFnG56tHb4Ivgq+Vda58nN54=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr13029309ljn.125.1586866961194;
 Tue, 14 Apr 2020 05:22:41 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Apr 2020 14:22:30 +0200
Message-ID: <CACRpkdadTD-6iYn1CAZJ_1js0fcpFZ5TGZsdWfXvcq7QtggzCA@mail.gmail.com>
Subject: Problem with b4
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sergey.Semin@baikalelectronics.ru, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

I'm trying to use b4 to download a series for application
of GPIO patches but run into this:

$ b4 am -t 20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru
Looking up https://lore.kernel.org/r/20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru
Grabbing thread from lore.kernel.org
Analyzing 14 messages in the thread
Found new series v2
Will use the latest revision: v3
You can pick other revisions using the -vN flag
---
Writing ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.mbx
  [PATCH v3 1/6] dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
    + Reviewed-by: Rob Herring <robh@kernel.org>
    + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
  [PATCH v3 2/6] dt-bindings: gpio: Add DW GPIO debounce clock property
    + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
  [PATCH v3 3/6] dt-bindings: gpio: Add Sergey Semin to DW APB GPIO
driver maintainers
    + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
    + Acked-by: Rob Herring <robh@kernel.org>
  ERROR: missing [4/6]!
  ERROR: missing [5/6]!
  ERROR: missing [6/6]!
---
Total patches: 3
---
WARNING: Thread incomplete!
Cover: ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.cover
 Link: https://lore.kernel.org/r/20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru
 Base: not found, sorry
       git checkout -b v3_20200323_sergey_semin_baikalelectronics_ru master
       git am ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.mbx

This is weird because I am looking at the v3 version
of patch [4/6] here for example:

https://lore.kernel.org/linux-gpio/20200323195401.30338-5-Sergey.Semin@baikalelectronics.ru/

It seems to be in-reply-to the right message and everything.

Can you tell me what I'm doing wrong?

I just installed b4 on this machine with pip3 install --user b4

BR
Linus Walleij

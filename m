Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.12253.1586875218352451937
 for <tools@linux.kernel.org>;
 Tue, 14 Apr 2020 07:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B32ttMgX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.67, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f67.google.com with SMTP id du18so5841609qvb.4
        for <tools@linux.kernel.org>; Tue, 14 Apr 2020 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NPXk/rsUHcfu+3kSr/to/grltfKqqSAO6scaS/IA71E=;
        b=B32ttMgXmvq/7j0yjGEsVvd4IztviFNMYZiEgNinprsWWH5TApNy9tZ9ayfiyYRCrJ
         k880zCaEJvNu3SaQcpFm/lJAF2KS1nVrPDx23KU6Pd4ZEJo70hzURrmQG6fmqIwMgiwJ
         Hvxe/l4ysAuTFIR2UWqeEzwo5WhDTP+r0N1mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NPXk/rsUHcfu+3kSr/to/grltfKqqSAO6scaS/IA71E=;
        b=jFHSLwGE8TbaEmIF7RBhdlo8mnYav4VTHoJmzKl2q1OciVEiFARROkoTUGcm52g6bZ
         WlpsoAGJCd6XW80qS4HUiyJNrNWoKNkEVp6CKpydILiZCS01C38jSijxKHwFszW0Whs+
         INVe+7sOKiMvA2HlC1EVG7OrjgPB3BlzFTVGWUj+7I0NvlkrPVKvC+4Dtj1X7pj1XBi2
         MKxNGMO76MKK6vNU6gmlSN5tNoHpHxx6fBZLMiuIuq3/Mkmoa0zQv/c+4h06hac9HBHW
         emOI6nhuS/+NBSG+5GVh2eRmtE5F7oK/B0E/rkl6ieMwqs5Xm4T7avKVG0LljobsBRGS
         k37w==
X-Gm-Message-State: AGi0PuYjOM3kINmOrIHzvSL07KWeibN89zoufJKYhRqEp6t4Z+sq4trI
	UwDUeX2TFxikOs3uPMp5YCUMKw==
X-Google-Smtp-Source: APiQypKCMYwPNLPVrFCXNtLW9XC7aOu6Zhs60gveweYl6hug3EzpquQItOUhMI5yBm3M7ihVIy2meg==
X-Received: by 2002:a0c:8326:: with SMTP id j35mr270489qva.205.1586875217495;
        Tue, 14 Apr 2020 07:40:17 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit-4.all.de. [212.21.66.6])
        by smtp.gmail.com with ESMTPSA id o94sm11000989qtd.34.2020.04.14.07.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:40:16 -0700 (PDT)
Date: Tue, 14 Apr 2020 10:40:10 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: tools@linux.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Sergey.Semin@baikalelectronics.ru,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Problem with b4
Message-ID: <20200414144010.njxgpwrj3dpd5z22@chatter.i7.local>
References: <CACRpkdadTD-6iYn1CAZJ_1js0fcpFZ5TGZsdWfXvcq7QtggzCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdadTD-6iYn1CAZJ_1js0fcpFZ5TGZsdWfXvcq7QtggzCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 14, 2020 at 02:22:30PM +0200, Linus Walleij wrote:
> WARNING: Thread incomplete!
> Cover: ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.cover
>  Link: https://lore.kernel.org/r/20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru
>  Base: not found, sorry
>        git checkout -b v3_20200323_sergey_semin_baikalelectronics_ru master
>        git am ./v3_20200323_sergey_semin_gpio_dwapb_fix_reference_clocks_usage.mbx
> 
> This is weird because I am looking at the v3 version
> of patch [4/6] here for example:
> 
> https://lore.kernel.org/linux-gpio/20200323195401.30338-5-Sergey.Semin@baikalelectronics.ru/
> 
> It seems to be in-reply-to the right message and everything.
> 
> Can you tell me what I'm doing wrong?

Nothing, really -- the problem is that when we look up that message-id 
across all the lists we have, the first hit is on the devicetree list, 
and apparently only *some* of the patches were sent there. I have a fix 
for this in b4 v0.4.0 (not yet released):

...
Looking up https://lore.kernel.org/r/20200323195401.30338-1-Sergey.Semin%40baikalelectronics.ru
Grabbing thread from lore.kernel.org/linux-devicetree
Analyzing 14 messages in the thread
---
Thread incomplete, attempting to backfill
Grabbing thread from lore.kernel.org/linux-gpio
Loaded 16 messages from https://lore.kernel.org/linux-gpio/
Successfully backfilled missing patches
...
 
> I just installed b4 on this machine with pip3 install --user b4

I am not quite ready to release 0.4.0, so if you don't want to use b4 
straight out of git, you can pass `-p lkml` to the version you have 
installed from pip, an most of the time it should do the right thing.

I hope to have 0.4.0 out in the next few days.

-K

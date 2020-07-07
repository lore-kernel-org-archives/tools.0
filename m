Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.20235.1594139525125024212
 for <tools@linux.kernel.org>;
 Tue, 07 Jul 2020 09:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Da83kAh9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.179, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f179.google.com with SMTP id k18so1888289qtm.10
        for <tools@linux.kernel.org>; Tue, 07 Jul 2020 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VBHIGdxx0NgqtmKoRU0ScGV4MQl/ShX00G4GMvAAqVk=;
        b=Da83kAh9R7savvvGG5s4ctpVdGCoJGKoQBK75FBPHgkYO0H20djm5jVi2Jz7fQDgRC
         QzJaMpwBaVZf1uQuuuBhsGzKFaNStnbEfjbUsSlyZUyx4i9fG5Y7nAieew0TMDZJQiA6
         n4DhcwgIj1MXhCJTiSIOVSaKHPVahDfJBy330=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VBHIGdxx0NgqtmKoRU0ScGV4MQl/ShX00G4GMvAAqVk=;
        b=NoyFjjXEF9wJggRW+9NbimCMEjBN7uGEv8YJlpVJXF2ALYPp7G/Q4PnA4bsi1YPFZF
         9di+832u9agAKd7P1OWBdk9gLQHskCdCEKpO03dpniOzmYOZN459dtfQeseN62HLCIFb
         0xrI/Bhw9SqCfYt++eGwyEZlkbVU+bM7FEgy+ek5VwqCCZm+7oPnfgFp7jdG7spKECyQ
         fuFps4DKm1+8Udmk5lhrS6zsuKPheub3/Ll5uFPPI/uhr93ETrTOrv7sxMQMdzZEAdG+
         4R/UGpxURxawhHaqk9CHZZlgS0ClUf950tNG8Laj1sQqsutDHwxPAyRWn5Yysg/uf2d1
         tJ2g==
X-Gm-Message-State: AOAM530lxZA0XWIyAJB5UT6edf86+sOdQyBQJ1hOf4TcA217xTHWieXy
	iTaAGpu0n29QPydafPAt+2+MCXX2wpQ=
X-Google-Smtp-Source: ABdhPJwDWxvL5r2GKDcLQL2FHGYZcPDwE5uCjDbsY/KLepi/HdCLKrgzmw6iiCQfSpHw6kYZHlSwwA==
X-Received: by 2002:ac8:5385:: with SMTP id x5mr57892241qtp.230.1594139523958;
        Tue, 07 Jul 2020 09:32:03 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([87.101.92.156])
        by smtp.gmail.com with ESMTPSA id t36sm27955033qtj.58.2020.07.07.09.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 09:32:03 -0700 (PDT)
Date: Tue, 7 Jul 2020 12:32:01 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [tools] Failure to grab a thread with b4
Message-ID: <20200707163201.fxkpq2raanvdt7bj@chatter.i7.local>
References: <20200703114559.05a0777d@oasis.local.home>
 <20200703165011.GF4781@hirez.programming.kicks-ass.net>
 <F9EA6942-7CF5-4D7D-A978-521FA0C8AA03@fb.com>
 <CAHk-=wjyyZxDUr8c_V+Pa9NEM4jvJa0Joy32ss7-Kb0W=rZyjA@mail.gmail.com>
 <CAMwyc-RVsOwbO93WLKB++KAwF5WasfiPkqSjkn3oPNZUMnWOcA@mail.gmail.com>
 <20200704204849.q7lfqbahtdxway44@wittgenstein>
 <20200704205140.3sztf4avevm635rt@wittgenstein>
 <20200706192733.zxulcyyzugugooze@chatter.i7.local>
 <20200707081724.rde6zb2iu43n3k52@wittgenstein>
 <161F83DE1134F205.6803@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <161F83DE1134F205.6803@linux.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 07, 2020 at 12:02:59PM -0400, Konstantin Ryabitsev via linux.kernel.org wrote:
> > Traceback (most recent call last):
> >   File "/home/brauner/.local/bin//b4", line 8, in <module>
> >     sys.exit(cmd())
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 222, in cmd
> >     cmdargs.func(cmdargs)
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 40, in cmd_am
> >     b4.mbox.main(cmdargs)
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 494, in main
> >     mbox_to_am(threadmbox, cmdargs)
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 110, in mbox_to_am
> >     am_mbx = lser.save_am_mbox(mbx, noaddtrailers=cmdargs.noaddtrailers,
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/__init__.py", line 532, in save_am_mbox
> >     failed.remove('commit metadata')
> > ValueError: list.remove(x): x not in list
> 
> I can't reproduce this one. Can you give me all command-line switches 
> you're using with "b4 am"?

I managed to recreate it based on the output you were seeing -- the 
latest 0.5.y should have the fix. I'll plan to release 0.5.2 by the end 
of the week.

Thanks,
-K

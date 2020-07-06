Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.511.1594063657368188321
 for <tools@linux.kernel.org>;
 Mon, 06 Jul 2020 12:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WtunEEWW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f195.google.com with SMTP id g13so29894903qtv.8
        for <tools@linux.kernel.org>; Mon, 06 Jul 2020 12:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8v+ttt9ZfAv9tE8SQ32uL21Y9Dem4nt8L8mlucV3NO4=;
        b=WtunEEWW7khvVH3cQcIZRiCqGXUpSgwuF7T2JLtTSxaYAzLSNXvuElpuDYfPiYCWQp
         gnleLajLQiAAo8ng8TN27KXl5a+bg2hZm2JNSLvqnV2Lywdle9nbkBdbPcF91/WjJT1i
         gY/LDBc1G6mv99nYsbxTsj9Q8ahMgDnnpvsHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8v+ttt9ZfAv9tE8SQ32uL21Y9Dem4nt8L8mlucV3NO4=;
        b=FgPIbr7YKvVBSsQr3NDuT0sp5w5YZR5gx29/Lr8T/8MqqLMswQtvbRNwqEzkez4Q+S
         X4WvWIKJVgKwqn5pvl9etBE4SDnjyPb+GCQ+esMODkAB/33LSxshalncTi5QPdi/5f5O
         qP9TVvKBmrl8CfYFPnOM4z9lxn7q3bN6F3K1Hx4r6jS4hyhxx6qh4C61SKBamBzgr0bI
         nWdH0S4pTSLv9Tut5MqN2jiASE54jvqbB9n0n2q+GON/LweCWATMGSdGLNd908oBEX7q
         rnWEBaVgNf2nD5w1fkVeyG8yvSZi/gvArkOhJZSCK2Oa8dVOzCs1bRrCPaS1i+mfPHYk
         G+YQ==
X-Gm-Message-State: AOAM530MqzvyOIP4f4HXGJQqyVYn5t17SabasCUQN0x+Aubv8uWzUg4L
	ihO1ZZLtgjVAfc6lejD00GDCbA==
X-Google-Smtp-Source: ABdhPJzlSR9xwmPZeWCkw34nuQ2wPuwtWiL1oFJGVGQZUu8E9cDx/X59c45BIQC/2LIBKZ6JOePIPg==
X-Received: by 2002:aed:32e5:: with SMTP id z92mr27362679qtd.328.1594063656437;
        Mon, 06 Jul 2020 12:27:36 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([87.101.92.156])
        by smtp.gmail.com with ESMTPSA id j45sm9466307qtk.31.2020.07.06.12.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 12:27:35 -0700 (PDT)
Date: Mon, 6 Jul 2020 15:27:33 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: tools@linux.kernel.org
Subject: Re: Failure to grab a thread with b4
Message-ID: <20200706192733.zxulcyyzugugooze@chatter.i7.local>
References: <20200703070600.GA2222124@kroah.com>
 <CABgObfZ4SXoXimBGVwL1uWNNvMJmJG5WoTQoBefysU6rS7EPaQ@mail.gmail.com>
 <20200703105754.GW4800@hirez.programming.kicks-ass.net>
 <20200703114559.05a0777d@oasis.local.home>
 <20200703165011.GF4781@hirez.programming.kicks-ass.net>
 <F9EA6942-7CF5-4D7D-A978-521FA0C8AA03@fb.com>
 <CAHk-=wjyyZxDUr8c_V+Pa9NEM4jvJa0Joy32ss7-Kb0W=rZyjA@mail.gmail.com>
 <CAMwyc-RVsOwbO93WLKB++KAwF5WasfiPkqSjkn3oPNZUMnWOcA@mail.gmail.com>
 <20200704204849.q7lfqbahtdxway44@wittgenstein>
 <20200704205140.3sztf4avevm635rt@wittgenstein>
MIME-Version: 1.0
In-Reply-To: <20200704205140.3sztf4avevm635rt@wittgenstein>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 04, 2020 at 10:51:40PM +0200, Christian Brauner wrote:
> On Sat, Jul 04, 2020 at 10:48:50PM +0200, Christian Brauner wrote:
> > Hey Konstantin,

Please remember to cc tools@linux.kernel.org as well.

> > 
> > I'm running:
> > 
> > brauner@wittgenstein|~
> > > b4 --version
> > 0.5.1
> > 
> > and it fails to grab two patches from a series I sent:
> > 
> > Looking up https://lore.kernel.org/r/20200622234326.906346-1-christian.brauner%40ubuntu.com
> > Grabbing thread from lore.kernel.org/lkml
> > Checking for newer revisions on https://lore.kernel.org/lkml/
> > Analyzing 20 messages in the thread
> > ---
> > Thread incomplete, attempting to backfill
> > ---
> > Writing ./20200623_christian_brauner_arch_remove_do_fork_and_have_copy_thread_tls.mbx
> >   [PATCH 01/17] fork: fold legacy_clone_args_valid() into _do_fork()
> >   [PATCH 02/17] sparc64: enable HAVE_COPY_THREAD_TLS
> >   [PATCH 03/17] sparc: share process creation helpers between sparc and sparc64
> >   [PATCH 04/17] sparc: unconditionally enable HAVE_COPY_THREAD_TLS
> >   [PATCH 05/17] ia64: enable HAVE_COPY_THREAD_TLS, switch to kernel_clone_args
> >   [PATCH 06/17] nios2: enable HAVE_COPY_THREAD_TLS, switch to kernel_clone_args
> >   [PATCH 07/17] h8300: select HAVE_COPY_THREAD_TLS, switch to kernel_clone_args
> >   [PATCH 08/17] fork: remove do_fork()
> >   [PATCH 09/17] alpha: switch to copy_thread_tls()
> >   [PATCH 10/17] c6x: switch to copy_thread_tls()
> >   [PATCH 11/17] hexagon: switch to copy_thread_tls()
> >     + Acked-by: Brian Cain <bcain@codeaurora.org>
> >   [PATCH 12/17] microblaze: switch to copy_thread_tls()
> >   [PATCH 13/17] nds32: switch to copy_thread_tls()
> >   [PATCH 14/17] sh: switch to copy_thread_tls()
> >   [PATCH 15/17] unicore: switch to copy_thread_tls()
> >   ERROR: missing [16/17]!
> >   ERROR: missing [17/17]!
> > 
> > Just in case you need to fix something.

Well, they are actually not on LKML as far as I can tell -- very likely 
due to vger having hiccups on the day you sent them. E.g. the following 
links return 404:

https://lore.kernel.org/lkml/20200622234326.906346-17-christian.brauner@ubuntu.com/
https://lore.kernel.org/lkml/20200622234326.906346-18-christian.brauner@ubuntu.com/

They do exist on linuxppc-dev, but not the rest of the series.  
Unfortunately, we are currently only able to backfill based on cc 
information present on the cover letter, so we don't try to backfill 
from linuxppc-dev because the cover letter doesn't have that list cc'd.

I don't want to do clever workaround fixes for this, as eventually 
public-inbox will gain ability to collate threads from all of the lists 
it is tracking, so this category of problems should go away entirely 
without needing to work in clever hacks.

> Looking up 
> https://lore.kernel.org/r/20200622234326.906346-18-christian.brauner%40ubuntu.com
> Grabbing thread from lore.kernel.org/linuxppc-dev
> Traceback (most recent call last):
>   File "/home/brauner/.local/bin//b4", line 8, in <module>
>     sys.exit(cmd())
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 222, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 40, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 491, in main
>     get_extra_series(threadmbox, direction=1)
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 369, in get_extra_series
>     lsub = b4.LoreSubject(base_msg['Subject'])
> TypeError: 'NoneType' object is not subscriptable
> Press any key to continue...

Got it -- the fix should be landing in master and stable-0.5.y soon.

-K

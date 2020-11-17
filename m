Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.14828.1605647319010252710
 for <tools@linux.kernel.org>;
 Tue, 17 Nov 2020 13:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hYagyai7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.176, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f176.google.com with SMTP id q5so22200825qkc.12
        for <tools@linux.kernel.org>; Tue, 17 Nov 2020 13:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lflh7RZ7LnxwaitfBAv9VnFZSoNVTNOEjASWBZR+Eq4=;
        b=hYagyai7UwbAc0zfM2p7Pr4WapD3t+5TxuVbvETt93Ut7Z747y+f0Vl/ONIeJr3Np1
         jsF2a2DslQEncRdEefE6SVEyuU/tfDJEGb/96m8v5y9CDWFOJclGtNuMDHG5pnFYU32U
         MQ6RvuRMIqQaGeLLyIwdwAm8toQAn4jLsyQfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lflh7RZ7LnxwaitfBAv9VnFZSoNVTNOEjASWBZR+Eq4=;
        b=BecmLZuYN4+cQQIjxLyWmCoxBOWW2+aY7vztUM4Vh5rgjFGvR3jc0vpjE0zcupaIBw
         ZrYtZTSICzXPmeAuiWEWw6FofpAgR1O3+43yG4Toh1EVY2LuxGxWahg5qhusenaIdwwo
         CLmO7zPoWeG+y+fd1Peb3VfbZtjrc4VfpC+idENVvm72XcYa6vucOB5ysVu5PdlzqsMH
         cb8E3oRwpyzWCnPXAtBc0b5M/Ix/geAZ7XYb748emCDxta8kYjuz82dGznwf01mIKUKM
         puCrU0J217pN5RXrf7wm4N0/2EeHASh8xUueJgrQM6chlufRAqHql1eK33XYv96vkA7W
         ZDdw==
X-Gm-Message-State: AOAM533e9SlW5jftK47rXfccFrgbb7PleOezNYAsyfXH6GhZS4RJEOZw
	4GPmwLmr9mnCtYSaFiS206vAiQ==
X-Google-Smtp-Source: ABdhPJyx+yfBObGhgL5ESjmixA+2Raq1pFY8soYtz4ibjUpTeG4/W6cG7k10adbcvTuUuw4UGwaEZw==
X-Received: by 2002:a37:4a4d:: with SMTP id x74mr1619428qka.55.1605647318058;
        Tue, 17 Nov 2020 13:08:38 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y3sm14135549qto.2.2020.11.17.13.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 13:08:37 -0800 (PST)
Date: Tue, 17 Nov 2020 16:08:35 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Exception with b4 am -3
Message-ID: <20201117210835.kfobfhbrpemy3yju@chatter.i7.local>
References: <20201117121447.GA5142@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201117121447.GA5142@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 17, 2020 at 12:14:47PM +0000, Mark Brown wrote:
> When running
> 
>    b4 am -t -g -3 20201116040721.8001-1-rdunlap@infradead.org
> 
> I get:
> 
> Looking up https://lore.kernel.org/r/20201116040721.8001-1-rdunlap%40infradead.org
> Grabbing thread from lore.kernel.org/linux-spi
> Analyzing 2 messages in the thread
> ---
> Writing /home/broonie/queue/spi/next/20201115_rdunlap_spi_dw_fix_build_error_by_selecting_multiplexer.mbx
>   [PATCH] spi: dw: fix build error by selecting MULTIPLEXER
>     + Acked-by: Serge Semin <fancer.lancer@gmail.com>
> ---
> Total patches: 1
> Preparing fake-am for v1: spi: dw: fix build error by selecting MULTIPLEXER
> Traceback (most recent call last):
>   File "/home/broonie/git/b4/b4/command.py", line 238, in <module>
>     cmd()
>   File "/home/broonie/git/b4/b4/command.py", line 221, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/broonie/git/b4/b4/command.py", line 40, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/home/broonie/git/b4/b4/mbox.py", line 511, in main
>     mbox_to_am(threadmbox, cmdargs)
>   File "/home/broonie/git/b4/b4/mbox.py", line 155, in mbox_to_am
>     rstart, rend = lser.make_fake_am_range(gitdir=None)
>   File "/home/broonie/git/b4/b4/__init__.py", line 681, in make_fake_am_range
>     if not len(lmsg.blob_indexes):
> TypeError: object of type 'NoneType' has no len()

Fixed in master and stable-0.5.y, thanks!

-K

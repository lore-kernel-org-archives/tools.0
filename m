Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.13497.1585148712882299203
 for <tools@linux.kernel.org>;
 Wed, 25 Mar 2020 08:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d4YHZPzo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d5so3587146wrn.2
        for <tools@linux.kernel.org>; Wed, 25 Mar 2020 08:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SsZ4Xx8yKznVHOT2lmahQ5jpxAtfPjFqkS0UxdtZlBQ=;
        b=d4YHZPzoYOte0RMIGl8gUIEsJMay1pDYr9Iisq7PlH4fK463J5fTP+5ulOyVmJEeto
         d4P2bpGnECmo25B01c22Mg4zZ8nlNe4l5i4vZEZ8j4oVVJyNY0kZMU4FFmEuCJP5dvc1
         VrZhuv0SrNH7AfQaplcTMpjhGvfikUnuMbsaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SsZ4Xx8yKznVHOT2lmahQ5jpxAtfPjFqkS0UxdtZlBQ=;
        b=r9mx417V2hmUxfKhzaNXswFIGbpYXt1xgq3OW+kFSiJsmzceQF9Qgo8OQJkHIZzwT3
         inOjqwhgoXn1UCZmcVVkQQUyUd27yYuuJYMOmoD86dIGfQWUJd/qH7jMuY3+BQmil884
         ZHOcSK0SxmW7AlJBoITmKqKG/+6VuaHB1nSiCo8wMX020tnGEWGkPuyjeZsbk85Uov5W
         8AzbbYz0WIusB9cXTep6QS+5/zD4x+K4Xv+gSGLijQ7W7S339wXYs4aSq/uADDaai++2
         i+PCCAKP1qSRYYBgFjzB/c+a3dCJsiy9TeVUspGHl7fc0RGwy6aUQjEkeLvDWD9z8zKt
         M8sQ==
X-Gm-Message-State: ANhLgQ1Qe2Twp+Xu/lVSoCXrr5qumKqchT9oM9LZaa7k7xquQ5YymEez
	fZ5r2UejktzNVMSwxFlVwOT87w==
X-Google-Smtp-Source: ADFU+vuk3yL9rhO4AFMF6BrseIScFAkx0UJFlzYivR4iTf8QdimBycVaHwzs89XVNNbHGQ7UD1j4lA==
X-Received: by 2002:adf:f386:: with SMTP id m6mr3976883wro.107.1585148711381;
        Wed, 25 Mar 2020 08:05:11 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (politkovskaja.torservers.net. [77.247.181.165])
        by smtp.gmail.com with ESMTPSA id c7sm23259636wrn.49.2020.03.25.08.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 08:05:09 -0700 (PDT)
Date: Wed, 25 Mar 2020 11:05:06 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.3.4 released
Message-ID: <20200325150506.dgbmavaqfdjxtjc4@chatter.i7.local>
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAHmME9os=HxxxqWHp9nM6ggDdkqwpa6gOpTTAG68gamR3NtWaA@mail.gmail.com>
 <CAHmME9o5UDKtrOJ_ffg=0avSx4poOpjbDS+rN2uZ3EBtv7_Miw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9o5UDKtrOJ_ffg=0avSx4poOpjbDS+rN2uZ3EBtv7_Miw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 24, 2020 at 08:19:00PM -0600, Jason A. Donenfeld wrote:
> I induced a crash:
> 
> $ b4 am -c 20200324153624.23109-1-jiaxun.yang@flygoat.com
> Looking up https://lore.kernel.org/r/20200324153624.23109-1-jiaxun.yang@flygoat.com
> Grabbing thread from lore.kernel.org
> Reduced thread to strict matches only (138->107)
> Checking for newer revisions on https://lore.kernel.org/linux-devicetree/
> Analyzing 107 messages in the thread
> Found new series v1
> Found new series v2
> Traceback (most recent call last):
>  File "/usr/lib/python-exec/python3.6/b4", line 11, in <module>
>    load_entry_point('b4==0.3.4', 'console_scripts', 'b4')()
>  File "/usr/lib64/python3.6/site-packages/b4/command.py", line 134, in cmd
>    cmdargs.func(cmdargs)
>  File "/usr/lib64/python3.6/site-packages/b4/command.py", line 40, in cmd_am
>    b4.mbox.main(cmdargs)
>  File "/usr/lib64/python3.6/site-packages/b4/mbox.py", line 407, in main
>    mbox_to_am(threadmbox, config, cmdargs)
>  File "/usr/lib64/python3.6/site-packages/b4/mbox.py", line 114, in mbox_to_am
>    lmbx.add_message(msg)
>  File "/usr/lib64/python3.6/site-packages/b4/__init__.py", line 232,
> in add_message
>    lmsg = LoreMessage(msg)
>  File "/usr/lib64/python3.6/site-packages/b4/__init__.py", line 572, in __init__
>    if diffstatre.search(self.body):
> TypeError: expected string or bytes-like object

Thanks for the report -- the latest commit no longer breaks on messages 
containing no usable text/plain parts (that message is html-only).

I'll release 0.3.5 in the near future to fix this and a few other bugs.

-K

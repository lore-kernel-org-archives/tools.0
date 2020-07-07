Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.19576.1594137782447619677
 for <tools@linux.kernel.org>;
 Tue, 07 Jul 2020 09:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bmJnU1eN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.196, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f196.google.com with SMTP id r22so38573436qke.13
        for <tools@linux.kernel.org>; Tue, 07 Jul 2020 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xEGmienSQJ07V6skAzgbE085FkWo7nceUkYHq4djbeg=;
        b=bmJnU1eNZj0zi0B2ThkZ5FnicpsjhtUgs7BClQYNdWIeo3Pcb9zqccT9op/uQVp0sp
         6hAY2v53Vk4F9UxhX2l+FSyg2Sjwcz3ZUGfuPClMiYYzkfAKV1oKMvJRc/dwFRfZtRtq
         QgUX7jUnNGdHzwBz82QchgPDLkzu0tRJ92wTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xEGmienSQJ07V6skAzgbE085FkWo7nceUkYHq4djbeg=;
        b=i6aeStI07M67zEpHVN7hBtV8zP25bq6rBAds1olktHkMVIxcmyeibS3gOe9bn3krRI
         kceKj4pt0gRCi025Z4rZIa+WdP1HaJl2h6e9OscHhDCnhejy5GglDLTWacs1LTMyFUIp
         rlgwQFhRxJqbKD3p/cbZsK+kOexz7BPnoKfSoIOBHWnKC1XoC2ezvzML2xMMmS0m58lM
         texZeyv4W0EIiNGT4W57zyXgonrtX7ugYtyPktDZTTGw5+TS176IR3am0DeYB7UzlQ1y
         4+vVeOwtQAgjDJPEjLKU3pKpMC+aoSxYOHXCsiISq+JhjPf6UFyMzw+Ser6OtciZTUg6
         a4lA==
X-Gm-Message-State: AOAM531+lbDEgaTPJaWRddBcq+X+9S/8ROlRo8rdIGWu0sLwq9s96MTW
	XEdnuXJkRQWTSx13Q+uv8iC5vA==
X-Google-Smtp-Source: ABdhPJwENot64KSTCOOdw248ytPq7at++wOZMYfauEQFkIY5Tjre3nyqu8TrEw/Y0/BpP6t4rrVkeQ==
X-Received: by 2002:a37:a785:: with SMTP id q127mr53493924qke.452.1594137781565;
        Tue, 07 Jul 2020 09:03:01 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([87.101.92.156])
        by smtp.gmail.com with ESMTPSA id x26sm24578911qtr.4.2020.07.07.09.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 09:03:00 -0700 (PDT)
Date: Tue, 7 Jul 2020 12:02:59 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: tools@linux.kernel.org
Subject: Re: Failure to grab a thread with b4
Message-ID: <20200707160259.66cjgjrm5c4lg2xb@chatter.i7.local>
References: <20200703105754.GW4800@hirez.programming.kicks-ass.net>
 <20200703114559.05a0777d@oasis.local.home>
 <20200703165011.GF4781@hirez.programming.kicks-ass.net>
 <F9EA6942-7CF5-4D7D-A978-521FA0C8AA03@fb.com>
 <CAHk-=wjyyZxDUr8c_V+Pa9NEM4jvJa0Joy32ss7-Kb0W=rZyjA@mail.gmail.com>
 <CAMwyc-RVsOwbO93WLKB++KAwF5WasfiPkqSjkn3oPNZUMnWOcA@mail.gmail.com>
 <20200704204849.q7lfqbahtdxway44@wittgenstein>
 <20200704205140.3sztf4avevm635rt@wittgenstein>
 <20200706192733.zxulcyyzugugooze@chatter.i7.local>
 <20200707081724.rde6zb2iu43n3k52@wittgenstein>
MIME-Version: 1.0
In-Reply-To: <20200707081724.rde6zb2iu43n3k52@wittgenstein>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 07, 2020 at 10:17:24AM +0200, Christian Brauner wrote:
> I've had another crash today. It might be related but I'm posting in
> case it is a separate bug:
> 
> Press any key to continue...
> Looking up https://lore.kernel.org/r/20200706201720.3482959-1-keescook%40chromium.org
> Grabbing thread from lore.kernel.org/linux-api
> Checking for newer revisions on https://lore.kernel.org/linux-api/
> Analyzing 10 messages in the thread
> ---
> Writing ./v6_20200706_keescook_add_seccomp_notifier_ioctl_that_enables_adding_fds.mbx
>   [✓] [PATCH v6 1/7] net/scm: Regularize compat handling of scm_detach_fds()
>     + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
>   [✗[0m] [PATCH v6 2/7] fs: Move __scm_install_fd() to __receive_fd()
>     + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
>   [✗[0m] [PATCH v6 3/7] fs: Add receive_fd() wrapper for __receive_fd()
>     + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
>   [✗[0m] [PATCH v6 4/7] pidfd: Replace open-coded partial receive_fd()
>     + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
>   [✗[0m] [PATCH v6 5/7] fs: Expand __receive_fd() to accept existing fd
>     + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
>   [✗[0m] [PATCH v6 6/7] seccomp: Introduce addfd ioctl to seccomp user notifier
> Traceback (most recent call last):
>   File "/home/brauner/.local/bin//b4", line 8, in <module>
>     sys.exit(cmd())
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 222, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 40, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 494, in main
>     mbox_to_am(threadmbox, cmdargs)
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 110, in mbox_to_am
>     am_mbx = lser.save_am_mbox(mbx, noaddtrailers=cmdargs.noaddtrailers,
>   File "/home/brauner/.local/lib/python3.8/site-packages/b4/__init__.py", line 532, in save_am_mbox
>     failed.remove('commit metadata')
> ValueError: list.remove(x): x not in list

I can't reproduce this one. Can you give me all command-line switches 
you're using with "b4 am"?

-K

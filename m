Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web09.2993.1603741782669927334
 for <tools@linux.kernel.org>;
 Mon, 26 Oct 2020 12:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a4/fy0Tg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.196, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f196.google.com with SMTP id q26so7655947qtb.5
        for <tools@linux.kernel.org>; Mon, 26 Oct 2020 12:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qZtPTMd38C8KR7F950x8mbRI7jKweNJv65a9ASI/adI=;
        b=a4/fy0TgruP2yLzrWeQRB57mwbK/407D8wJaxc8jFh7uDK8yueCstwRU7UOWa5TcS+
         6cINwLbx83Y8Go2xId/4qfT6jfTMTngj0kpjy4gu0Dr5UZaAj4L9BOKkSQ1O+uH+UtUP
         IcSy8ml8ACOmKPdequpY3TuP03DzQJTl2lS8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qZtPTMd38C8KR7F950x8mbRI7jKweNJv65a9ASI/adI=;
        b=AYx9hJOwXtmkiuet/pN31v+15U6qG4S8LMqJESF4XeaejfgrnHCWi+iMkTfvNUj9N1
         tbmbSY4UqAqCeWfr5ySJhRlkUR19UrBl0ic4iIVXFNijXdaHeMhYVFVkqhzYgBm+ZPJo
         1iCq5JTUj6QQ7pmCnZp3dfGz2eJzaHmd4jRPfPJwKgqAcAY5V4Gbbhd1ZZlp0wP5+fX6
         9nsX5hqEtNzrDWWbOuS6YrhlYs9dsCYg4w05j65XqGzVGxNlUg7IpmhPvd4EuVUWD5PI
         /Kaj4TVxbqwgq+XYeYpoDwp7hei9E4DxjApTwBWxG30xzLN12PL4ca/vlUw9fM5b1EUK
         PPLA==
X-Gm-Message-State: AOAM531bZaB9yRYbm06gtFa5WoL1YX0jlfKiBVsYwIAB45yw4wZkFGy6
	3NjsSccOaSmfQXrBK8ioYcNZrg==
X-Google-Smtp-Source: ABdhPJzYiwQQCcjkXbhoM9K033zl7MYgw1sdJa3umN0TuVZDt0C0yVai3afaGAHFEVfnQM8QWoiAOQ==
X-Received: by 2002:ac8:5a82:: with SMTP id c2mr19620886qtc.378.1603741781412;
        Mon, 26 Oct 2020 12:49:41 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id n2sm7362161qtr.6.2020.10.26.12.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 12:49:40 -0700 (PDT)
Date: Mon, 26 Oct 2020 15:49:39 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [BUG] b4: AttributeError: 'LoreAttestation' object has no attribute 'attid'
Message-ID: <20201026194939.r7dsx43zhd5xjebj@chatter.i7.local>
References: <20201026175618.GB2449445@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201026175618.GB2449445@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Oct 26, 2020 at 02:56:18PM -0300, Arnaldo Carvalho de Melo wrote:
> 
> [acme@five perf]$ b4 am -tcsl 20201024025918.453431-1-namhyung@kernel.org
> Looking up https://lore.kernel.org/r/20201024025918.453431-1-namhyung%40kernel.org

Note -- that thread is kinda broken because there is a [PATCH 1/2] with 
no [PATCH 2/2], and we don't count [PATCH v2 2/2], as it's a different 
series.

> Grabbing thread from lore.kernel.org/lkml
> Checking for newer revisions on https://lore.kernel.org/lkml/
> Analyzing 8 messages in the thread
> ---
> Thread incomplete, attempting to backfill
> Traceback (most recent call last):
>   File "/home/acme/git/b4/b4/command.py", line 238, in <module>
>     cmd()
>   File "/home/acme/git/b4/b4/command.py", line 221, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/acme/git/b4/b4/command.py", line 40, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/home/acme/git/b4/b4/mbox.py", line 509, in main
>     mbox_to_am(threadmbox, cmdargs)
>   File "/home/acme/git/b4/b4/mbox.py", line 49, in mbox_to_am
>     lser = lmbx.get_series(revision=wantver, sloppytrailers=cmdargs.sloppytrailers)
>   File "/home/acme/git/b4/b4/__init__.py", line 307, in get_series
>     attid = pmsg.attestation.attid
> AttributeError: 'LoreAttestation' object has no attribute 'attid'

There is a fix for this in the current master, though new attestation 
code is a bit mid-flight and may cause occasional further problems until 
I complete it.

Thanks for the report!

-K

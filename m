Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F4C29CA
	for <tools@linux.kernel.org>; Wed,  9 Jun 2021 15:45:00 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id z4so15323782qts.4
        for <tools@linux.kernel.org>; Wed, 09 Jun 2021 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FADrq7CkBKZ6MUQRpjDEOgtZekDD4CKe64imzXyl440=;
        b=AC/JTUO/fZIhqoEmg1JH5CjGKCtbPT2hnN9JyjUy631Z/9YmHq9jfBHFfH+x+6B7t0
         wS+F4HB82S+00xD9/zKVvNC46pLlmqLglqdszSt9QWQllXgLh7VAG0/atV4ewm/bncuw
         s1wWHXhclmLjGG7nLWXWcUnRIUNFWIXMFh68A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FADrq7CkBKZ6MUQRpjDEOgtZekDD4CKe64imzXyl440=;
        b=c/x7kjfh00NTZI3onlYQsXdZ6omZ5ShMD/vtK90OVoITbrXtjpF9hVvAC3uj6krVv/
         30N/5RPOemPUXqCagvCOKfzNMgFwspfYugBIYuMbe4BxijMYL3D89Cl/mHXpe71dEN8B
         TAeYkzzHlhQk/KASjM7FsPmbh+Qv79WUE7P3G5nI0D08p0TVjl/59IrND5WZPYjOwLDL
         Wn4KJ6ffEVIP6Cdz58Fkish5Z8gyL+Eb2AyzPj5UzG2JQfc1vwtb7RiGBGutV4qplBUi
         9JYoD7gdMHU51WOq0rATY+3DZAYE6zF4wboH0SXXSjMJcxh2PR8P5xpL6qKZpHY+QgH1
         FySg==
X-Gm-Message-State: AOAM533axmIDGWVasHE1k9q/ekfMP+O2j/K4RplCYjDE67D6DWNtEwVw
	Qf32rFwkTSBNwOXw+mzKKe98Kk1GOu4h+wlj
X-Google-Smtp-Source: ABdhPJxs4TUHefwKyD7M9NlSAcAQ2k2AT74F2zmVig92YgNw4Z/3teaHAKzO91MlKyIm1iWg4+Jl4A==
X-Received: by 2002:ac8:4e95:: with SMTP id 21mr560354qtp.44.1623253500001;
        Wed, 09 Jun 2021 08:45:00 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id w4sm217125qtv.79.2021.06.09.08.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 08:44:59 -0700 (PDT)
Date: Wed, 9 Jun 2021 11:44:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <greg@kroah.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 crash when trying to apply patches with latest version from
 git
Message-ID: <20210609154457.argnpxaxy6fj6mzr@nitro.local>
References: <YMB3XJ/NgtCO+YCx@kroah.com>
 <YMC4yWAT3Ubux2gQ@kroah.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMC4yWAT3Ubux2gQ@kroah.com>

On Wed, Jun 09, 2021 at 02:49:13PM +0200, Greg KH wrote:
> $ b4 am -t -S https://lore.kernel.org/r/20210607101634.4948-1-ricky_wu@realtek.com
> Looking up https://lore.kernel.org/r/20210607101634.4948-1-ricky_wu%40realtek.com
> Analyzing 6 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v2] misc: rtsx: separate aspm mode into MODE_REG and MODE_CFG
> Traceback (most recent call last):
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 254, in <module>
>     cmd()
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 237, in cmd
>     cmdargs.func(cmdargs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 51, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 622, in main
>     make_am(msgs, cmdargs, msgid)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 92, in make_am
>     am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers,
>   File "/mnt/fast_disk/linux/tools/b4/b4/__init__.py", line 600, in get_am_ready
>     msg = lmsg.get_am_message(add_trailers=add_trailers, trailer_order=trailer_order, copyccs=copyccs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/__init__.py", line 1476, in get_am_message
>     self.fix_trailers(trailer_order=trailer_order, copyccs=copyccs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/__init__.py", line 1412, in fix_trailers
>     if trailer[3] is not None:
> IndexError: list index out of range
> 
> 
> I guess it's a different error, but I hate reading python tracebacks so
> I can't really tell...

Different bug -- fixed now as well and backported to stable-0.7.y.

Thanks!

(I swear, I'm going to add a test suite soon -- it's just not very exciting
work. :))

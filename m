Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.2721.1608570230880542200
 for <tools@linux.kernel.org>;
 Mon, 21 Dec 2020 09:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SbTdq0bY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.172, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f172.google.com with SMTP id c7so9396133qke.1
        for <tools@linux.kernel.org>; Mon, 21 Dec 2020 09:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qxngqXPi/66QMWoTkB/BTfpOjxtZAZSzyriYHJpeCx8=;
        b=SbTdq0bYp/OdTGDP7csAKFLiGS/1bNV3/puzzNX5JUe0dZ+Q6cQeBWLmJNllg85MD7
         iCK8e6CUpqvPJOcl5+TKHnyBQCjysoY+Pp3VaWOmGYNIHrcIQ92B1PoIo80yAg8GMWM/
         S/QzTElijWSp5Ym9y7jxcjNUGG3ojLof9F3vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qxngqXPi/66QMWoTkB/BTfpOjxtZAZSzyriYHJpeCx8=;
        b=p+qu7QqDh3xXTwCpOYr1qr244t6aAtYivnmV+4o0m70YKwWfq1yAg8Ac+ODxJdxbpZ
         DeOoOc1zCtxWr+sz9RKiNbqCtkJ1NOgPFIrvzyDP2OyhDOcDrr/go1Z9SrPqWkaZZB5N
         7y9CpFOsYZxIZUJO961QWFiCblu+0wmZfSostfdIo82e504TaaowMulp85aztCnMXlv+
         QphqvWM/P1pJGPSvMGXJ9VnM6mJ8mKV5dKZ+3zNfnE/kob3FU8eUd1XBtTlXJdqeSrSY
         CKt6IRTz+3OyHfAfV5CpmLiHFzwSynLNGQHqKTnCrWTDHghwwPisL5XMl/zlUwxl22aq
         hkqA==
X-Gm-Message-State: AOAM5321rPEhZ8H+W+OF92liEw+cKp3ygzzdpNz5oujMqoQxCJJN3QLn
	ZTZgM8ndly0qN5ox2Itw1t36nQ==
X-Google-Smtp-Source: ABdhPJw+sz9jEhEjLww1Mfdlhqx5s6Y70EcT3uc3mFITHZnXYMhfR9FIeR1Xe4mMz1Ll2I+QzsK9ug==
X-Received: by 2002:a37:71c7:: with SMTP id m190mr18191576qkc.95.1608570229928;
        Mon, 21 Dec 2020 09:03:49 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id c2sm11598644qke.109.2020.12.21.09.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 09:03:49 -0800 (PST)
Date: Mon, 21 Dec 2020 12:03:47 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [b4] make 'b4 mbox' reorder headers so piping to 'git imap-send' works
Message-ID: <20201221170347.agxrsnalgvinjisj@chatter.i7.local>
References: <7e6329fa-e5fa-c5af-002d-a8fbb60e0724@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7e6329fa-e5fa-c5af-002d-a8fbb60e0724@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Dec 20, 2020 at 07:21:43PM -0500, Philippe Blain wrote:
> Hi,
> 
> I'm using 'b4 mbox -o- <url> | git imap-send' to quickly import
> threads to my email account when I see an interesting thread that
> I'd like to reply to (I contribute to Git but I'm not subscribed to the
> Git mailing list).
> 
> This only works if the emails in the threads have the 'From', 'Date'
> and 'Subject' headers in exactly that order, because that order is
> hard-coded in 'git imap-send' [1]. I wrote a small script [2] that
> just reads the headers and reorders them accordingly but I'd like to
> just use 'b4 mbox' instead as it has more features. However I discovered
> that such reordering is not done by b4. For example, this fails as 'git imap-send'
> reports 'nothing to send':
> 
> b4 mbox -o- https://lore.kernel.org/git/op.0vvmwohypvqxoc@damia/T/#u | git imap-send
> 
> It would be nice if b4 would take care of the reordering.

I'm not sure that's a great solution, as you may be hitting other weird
corner-cases with git-imap-send. I suggest using isync/mbsync for this
purpose. I just added a tweak to b4 mbox that will recognize when -o receives
a maildir, in which case instead of saving an .mbox file, it will add messages
to the maildir instead, e.g.:

  b4 mbox -o ~/Mail [msgid]

This will add all messages from the retrieved thread to the mail spool in
~/Mail (assuming it has the expected {new,cur,tmp} subdirs).

Regards,
-K

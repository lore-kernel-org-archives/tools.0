Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.22281.1606066744258757276
 for <tools@linux.kernel.org>;
 Sun, 22 Nov 2020 09:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iYffYXNX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f170.google.com with SMTP id e10so3828807qte.4
        for <tools@linux.kernel.org>; Sun, 22 Nov 2020 09:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3bvmazpZtIFrjqaTkY9q6tICGsR+N6ps2GUYNj5o+c8=;
        b=iYffYXNX8iVsoqvLVPzRVMzkVN8Yp73aLx971DPrMgfZdR62qtpJ62470jDzU0rIN1
         8cw1Z6URptaaqd3qOPSJfQ+ZFbNDq8sv2NnWMqKs+oyZrgFD4YgaZ4KTIHuw3bjQQqAb
         25cVsQmVooE0U9EvFLgZHmhirxsd0bdvnkm+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3bvmazpZtIFrjqaTkY9q6tICGsR+N6ps2GUYNj5o+c8=;
        b=B7NQ51f2xI2SlH0BERm9SD/ld2xYrq2/fWUF9nXDja40I0ryelzDxyr1NxdUkNky4z
         RxHpl70At1yrnTOdZeflms4MvWy3X6CHzZ0Ny7zHoYqkVPz0uBQEjRkmB/NcxJP5/WMV
         OzKFjs5t5BdthDNvLrWz+lBq8yrI4aDMYHjLVfZrQztu54PMgh+yOGkU97xvRw9bxSMg
         TPIlxT1JMwKnMt35k5b6fnf7hiVkwdL84HpO9OGs17gcBUTBCoiWHLtaBoBs5b7N6A8H
         py4hr2OlFtt/HWVsL8Q7U0HV759uhtNu+OU2Se7m9y2BaMpw59hgEDq7JLkcyq0Sol9A
         EDSg==
X-Gm-Message-State: AOAM530ZBuXHB2C5fC9+iCZKptqUXnE3eUff6t8TlPV0wql/41+dV5Zc
	zuYp/JzzwSYA+rAe1xbN5YLpCKMD4MY/4Hy/
X-Google-Smtp-Source: ABdhPJyv8QVlQNxzEHKZVrU7kHGJHtKUiP9Z97EyNetXAD3COoYOUG0Xkw9kaCauNLg7+atGBx4kMw==
X-Received: by 2002:ac8:44a4:: with SMTP id a4mr25372017qto.64.1606066743249;
        Sun, 22 Nov 2020 09:39:03 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t126sm7216917qkh.133.2020.11.22.09.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 09:39:02 -0800 (PST)
Date: Sun, 22 Nov 2020 12:38:59 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Kees Cook <kees@outflux.net>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4: DKIM verification available
Message-ID: <20201122173859.mueoi5o7p4x53cx5@chatter.i7.local>
References: <20201120221530.mfwn72nr6lqr2qqs@chatter.i7.local>
 <20201122002808.GA20499@outflux.net>
MIME-Version: 1.0
In-Reply-To: <20201122002808.GA20499@outflux.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Nov 21, 2020 at 04:28:08PM -0800, Kees Cook wrote:
> On Fri, Nov 20, 2020 at 05:15:30PM -0500, Konstantin Ryabitsev wrote:
> > I'm gearing up for b4 0.6.0, which adds a handful of new features around 
> > attestation. Specifically, it enables DKIM verification if the required 
> > library is available. It used to be a futile exercise due to almost 
> > every mailing list breaking it in terrible ways, but vger now properly 
> > preserves headers so that DKIM signatures verify nearly all the time.  
> 
> Nice! This works for me.
> 
> I wanted to look at X-Patch-Sig verification too, but realized I couldn't
> actually search lore for an arbitrary header to find an example. And so
> I went to the lore git, and from a worktree, I found no one using the
> new b4 GPG attestation yet ("git log -S X-Patch-Sig").

Well, it's not in any released version yet, so it's not surprising. :) 
You can test it on some of my bogus series posts:

b4 am -o/tmp 20201120212731.1645654-1-konstantin@linuxfoundation.org

The 0.6 release will only support mode=pgp in addition to plain DKIM.

> (I was hoping to have my own series up to use as an example, but I
> mucked up the order of operations. Next one should include it, 
> though!)

Basically, you just run "b4 attest *.patch" before running "git 
send-email". You can actually do this via adding the following to 
.git/hooks/sendemail-validate:

#!/bin/sh
/path/to/your/b4/b4.sh attest $1

I'll add documentation for this before 0.6 is out.

Thanks for willing to be my test subject. :)

-K

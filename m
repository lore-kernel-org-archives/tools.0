Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.54838.1584976420413090709
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 08:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JfnxEPVM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.177, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-lj1-f177.google.com with SMTP id 19so14956582ljj.7
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v9iyL6tvpIOj0M83swbsXTdp8D15UzJMDDvz3IEPtbo=;
        b=JfnxEPVMFU6eqG3L2dV1HWse7o7nY3ZhWrB3LucMhIiMIeOMjrDKUaPBmR+m+DTyyD
         ZHDVukHS4M/gV1r2nvybJGf46Hf8VK7T5cRFjqO5BsNP13UnnySkwq2VVL6SxFMPwpI/
         s39zMvIDxWeejWy2G4gweRweL2+ufvGqRQh2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v9iyL6tvpIOj0M83swbsXTdp8D15UzJMDDvz3IEPtbo=;
        b=CJify5PNie8CK+79u9rseQLHIgltrkxpnkYEXblZN044lL1iZI5p8FL4F76upJS2/p
         BgVIkpd0/0JHo3nwYosKt18QRlM+sPQaDu+kfrDq4tRmNHW4MioN7YZjKVlN97Sc0Afi
         acTkyvrXy3e5q58/nG8MITSAmOGiwWHCHCgsMRSPR6Oo//Wj1mvKy9t2O1j+mp53ERRM
         KRqcUikHAld7MER5rlEPK28pPEzp3en4XoHG2HGovYG81spst8yKFwgZkUnc5tvWYgUM
         3BbwoOp7RfxW31IyJHEo5gd+56E8vNyF+aGcRYJl2PSBIaM6eSK6NsZOsKEUrLAPm0zc
         /EbQ==
X-Gm-Message-State: ANhLgQ0hqRFqWBeKMEftAZPyOr7lzDZpBrsWHjBiFSHTm5vAFRxhYoxO
	eo1m/eRmjCVcSElToblquvBs9g==
X-Google-Smtp-Source: ADFU+vuZtxdbIrM3e+L0kMZg1k5C/5K1ZA5fJQSJ3dYDZn8BdQ8UHLw+VvJxhaYjpKnK1FxEldIspQ==
X-Received: by 2002:a2e:8513:: with SMTP id j19mr7621383lji.27.1584976418405;
        Mon, 23 Mar 2020 08:13:38 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit0-readme.dfri.se. [171.25.193.20])
        by smtp.gmail.com with ESMTPSA id i7sm9849474ljg.99.2020.03.23.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 08:13:37 -0700 (PDT)
Date: Mon, 23 Mar 2020 11:13:33 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] Pip dependency problem with b4
Message-ID: <20200323151333.samun53vkbsj7fzt@chatter.i7.local>
References: <1584974859.3780.10.camel@HansenPartnership.com>
 <20200323150003.owxg3xhwtgc7pzap@chatter.i7.local>
 <1584975825.3780.15.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <1584975825.3780.15.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 08:03:45AM -0700, James Bottomley wrote:
> > > jejb@amdmilan1:~/git/linux-build$ b4 --help
> > > Traceback (most recent call last):
> > >   File "/home/jejb/.local/bin/b4", line 6, in <module>
> > >     from b4.command import cmd
> > >   File "/home/jejb/.local/lib/python2.7/site-
> > > packages/b4/__init__.py",
> > 
> >                                 ^^^^^^^^^
> > Sorry, please use python 3.
> 
> I can fix it manually, but pip should have said ... it does for most
> other packages.

I've added python_requires='>=3.6' to the proper place, so 0.3.4 will do 
the right thing.

Best regards,
-K

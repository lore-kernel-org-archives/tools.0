Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.58032.1584982615112181859
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 09:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=SnsfItfC;
 spf=pass (domain: ziepe.ca, ip: 209.85.160.173, mailfrom: jgg@ziepe.ca)
Received: by mail-qt1-f173.google.com with SMTP id a5so5083364qtw.10
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qb8SzL6Jq1gQsdpTzh75kbaw2MQ9G6WkAbD+MYpXf5A=;
        b=SnsfItfCmp3fhB6vz6PIV0rR6Xftz97LF3ykrgOHiiaLRrJLGrHz7p5MhqBb0WoRSL
         wmnahPlAXGtj/8/Drs1AtMBvgG7FfhugxvlCkfXWk0KxuFcp+AfdPnYKR9KZ5p0lKQkY
         8M3LydjZr9t8qODkWZRLQ4Cp0jmOg24nf8OWt0nI4m2RAkN8rMRqAzhEvVufSV9eVmEg
         S3fiPA6E3ZdaY6jMsZpgMljd44MyjxP8AvQwEnzla/qLfkguENjh4AgTpj0GacXZBO7x
         2090YCiOpQ6QkGHCzbCMXUtjgxYzqv6mbmaheVZgZfHKXia3HRvhsOprLTJ/A7OhO026
         ZoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qb8SzL6Jq1gQsdpTzh75kbaw2MQ9G6WkAbD+MYpXf5A=;
        b=AiUHgj6yimpnErJAjf+oM0T0hcu+xlKxiCKdKUPT0nIQ/OLX6EYsUx85uYDFIFKjeL
         H7gUIasoDQzZQQpLWt8mMyR/u4Xg54F2K8m6/rr3gzmfSWcAr9xsH4y3LYsHcBOmzgvt
         7S6oo6GTWR3F8FOzsWI1TDY0iq5VDhWpGdPrePr7ZzF0NPDgQX2bgpTe3LGed1KkS3aP
         DpMVNOMoWMePuXZ9fyPa3+KIsu0XvG69u+qXgh6+wVSAoxoSBdErHlxPDRVLSDboTWeg
         FExrkViZ9EMv3CLuYwqyXC8t31hTE2UyhKV3izlv29UnrLBDowkj301jxaDR24SZPrvW
         J2XA==
X-Gm-Message-State: ANhLgQ1abOXA1OzfckvwBLuTIFnr0JCdRZ85WmfCbufsbFlBrWOLAk++
	eCR/8ouSgUSmw+feWhaS6COt/g==
X-Google-Smtp-Source: ADFU+vuIK/lMyA8fMsZKYvDsa8lBA+y7vFcRcE3/aPlShcKyD9+Iq/KgIcQokFNrb7Ah7rAPem7rYA==
X-Received: by 2002:aed:3c10:: with SMTP id t16mr21988383qte.45.1584982613979;
        Mon, 23 Mar 2020 09:56:53 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id 199sm11445976qkm.7.2020.03.23.09.56.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 09:56:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jGQNg-0005zX-Rt; Mon, 23 Mar 2020 13:56:52 -0300
Date: Mon, 23 Mar 2020 13:56:52 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] Pip dependency problem with b4
Message-ID: <20200323165652.GA20941@ziepe.ca>
References: <1584974859.3780.10.camel@HansenPartnership.com>
 <20200323150003.owxg3xhwtgc7pzap@chatter.i7.local>
 <1584975825.3780.15.camel@HansenPartnership.com>
 <20200323151333.samun53vkbsj7fzt@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200323151333.samun53vkbsj7fzt@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2020 at 11:13:33AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Mar 23, 2020 at 08:03:45AM -0700, James Bottomley wrote:
> > > > jejb@amdmilan1:~/git/linux-build$ b4 --help
> > > > Traceback (most recent call last):
> > > >   File "/home/jejb/.local/bin/b4", line 6, in <module>
> > > >     from b4.command import cmd
> > > >   File "/home/jejb/.local/lib/python2.7/site-
> > > > packages/b4/__init__.py",
> > > 
> > >                                 ^^^^^^^^^
> > > Sorry, please use python 3.
> > 
> > I can fix it manually, but pip should have said ... it does for most
> > other packages.
> 
> I've added python_requires='>=3.6' to the proper place, so 0.3.4 will do 
> the right thing.

Unrelated, but when using pip to install b4 into a virtual env
directly from git (not via some pip cloud) it blows up as setup.py
imports b4, and b4 imports all kinds of stuff..

Jason

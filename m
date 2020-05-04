Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.17968.1588633128911053247
 for <tools@linux.kernel.org>;
 Mon, 04 May 2020 15:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=edbMhYYO;
 spf=pass (domain: ziepe.ca, ip: 209.85.160.194, mailfrom: jgg@ziepe.ca)
Received: by mail-qt1-f194.google.com with SMTP id j2so184651qtr.12
        for <tools@linux.kernel.org>; Mon, 04 May 2020 15:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mr9UD3Tit5W+cv9fw204V/IB8XO2CLROD/PfX7+ltP4=;
        b=edbMhYYOK5DDfQw/41jqPLci/EJOPxJRz3CARZSMNzT9X+44SKXG7pXkxGNB/Ums6e
         d5M/egLFk1/JbadecV2BNRuKD4SeUsUi4785cTA9zJFunLHh6636eX6SuNQBVOjpvhDs
         H0W9XxdIGeJfWQ197gvvmHvozB0QbaTdqFEFknoeYNiq4OvIZmmA5flgcHx1NxtzvIn+
         sy4Q8TxmQzenqu9FJgvTgIecGS4nFv2zHHbCI0kxtrsLEDapF+5x8k9cpO/V/b5PVG3y
         J+g7fQXbWd0yvA+amF81UmksH/gRXiYadbbz2+DZ1e3R6IYXPl65Tswvx2AYUs1INQsV
         kasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mr9UD3Tit5W+cv9fw204V/IB8XO2CLROD/PfX7+ltP4=;
        b=n9CK+8BDeQyfOwBrw0EXejVSdTilfpfPNMQTTKuub1XexbA5C4no1Ps4R997Y/bxmy
         hrbD2ySIZDJfWT7ygBaAmURTEpUN4Kw0m2Evp2hMKgfqz9jQ1m9G9Tvk5n2xQSA40dVV
         +B5aXUV0tHMySI03dkVlPeXRXXRDnXRkilbv3UzeGK6LKGcUgb5czQ7ApBekaj9y+jg8
         D+sBK+qDyaNBnmCI3q1DwZq6r/RkiGtkrCzHvVbYRPrndoGckBNe2+N01fH2D1vq+pVM
         f3c7/H885s5IjB7iMOf0jUQmo1l5JTt3+i+479J1xAJSVv0YgJw54Pzt2TPPRZFXUGfe
         LSjQ==
X-Gm-Message-State: AGi0PuYU20tTNMQUuWYshEmqxcfEnwGXlIeYLp/lMx3+XVIM1I7GoSka
	nF4HDJvjC2L6+gbvlfivrMey4A==
X-Google-Smtp-Source: APiQypJeHBScxMWYq78CDBfhdIdUEOhE6spgoEock2Q9QFBQNP6O/6ekgABfq8xsNPIvSCMT1yGU5w==
X-Received: by 2002:aed:2744:: with SMTP id n62mr15231qtd.112.1588633127575;
        Mon, 04 May 2020 15:58:47 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id p25sm411471qkk.18.2020.05.04.15.58.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 15:58:47 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jVk2w-0004yK-Dm; Mon, 04 May 2020 19:58:46 -0300
Date: Mon, 4 May 2020 19:58:46 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
Message-ID: <20200504225846.GB26002@ziepe.ca>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
 <20200504200321.lk72ymlmluu2tsgt@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200504200321.lk72ymlmluu2tsgt@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2020 at 04:03:21PM -0400, Konstantin Ryabitsev wrote:
> On Mon, May 04, 2020 at 12:09:49PM -0500, Rob Herring wrote:
> > >
> > > - When a series is missing patches, b4 is now able to backfill them from
> > >   other mailing lists tracked on lore.kernel.org. This feature will be
> > >   improved when public-inbox is able to collect a thread from across all
> > >   sources.
> > > - If both patch and metadata are identical between rerolls (v1 -> v2),
> > >   b4 will automatically carry over trailers from v1 to v2. This is handy
> > >   if there is an sob on [PATCH v2 7/15] from a maintainer that is
> > >   missing from an identical [PATCH v3 7/15]. In my observation, this
> > >   happens very rarely, though.
> > 
> > This is pretty common actually. At least common enough that I do a
> > check for this and have a semi-automated reply for it.
> 
> All three things have to be exactly the same:
> 
> - subject
> - commit message
> - patch contents (to the last bit)
> 
> The series must also be within the same thread, so if v2 is posted as a 
> separate thread to v1, then this won't trigger.

Are we supposed to thread v2 under v1 ? I though no?

Jason

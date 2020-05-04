Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.10962.1588612680071608654
 for <tools@linux.kernel.org>;
 Mon, 04 May 2020 10:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=QXSy8GrC;
 spf=pass (domain: ziepe.ca, ip: 209.85.219.66, mailfrom: jgg@ziepe.ca)
Received: by mail-qv1-f66.google.com with SMTP id t7so25615qvz.6
        for <tools@linux.kernel.org>; Mon, 04 May 2020 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z3Al6cdQMqbw5Kv3FCDdGYkcNJyTbROTwctdThp2V8M=;
        b=QXSy8GrCDHJEmZUh878I/0ZVh7jbiRLSVXhSkaQm2PXTaeO/r2Wr8EG9vLOAQxj4ok
         A7j9S/7V3kek4VYkrzU7zFSElcqpt+/K2+wSbOkhReLbgdegj7s3XeJGr1XV38jiH8N3
         KQhYhLbREU30KTTdIrUXf8tAyMWrEfsOhTLCZf5mDcfSzzUUpUP51wDAAUuKsD4aHU3x
         p3Kmbq7TBHbwP082/sYp7JAr0lOrKAvwQk9S2nQvqMCOjwOP4pC5hac2V5jYbBedziA2
         Nou2RncZ3PEpj14sTZBXhZWqm8121QU6eMTaby10nhrcaoZzA2+QGsIx8SuXwnQGMJDR
         heUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z3Al6cdQMqbw5Kv3FCDdGYkcNJyTbROTwctdThp2V8M=;
        b=POfbSQVN8JSUhnHlVRYJpxL/VzP45r7Mtnsu5JXHwjFG6DGrARGDk8doqL56KruLG5
         UnBFDJRBfxpP8qkqB4B7LY16d/U0a8SiqKqMafloegh+f31ldPb+lUJXbYn95zIYGr5+
         uJdmCDjRpzsnoyA2O0bUYj7cW1Nc91L36DoX9meOcvoeyoMBE0a0ESUxA/i1wnvGwecd
         Y/HLOhNNMiV9WkyPq+jdIuAJ4i4GqcdV/Itvz9vmXLWQZpuKQ4NDuVPAJnL0jKXdf7eR
         x2CJy2r6Tx9vWFEln+pMVmWXRwiRJ9zD1HFs8e0YG8/8JYl1C/wtc/GGNm+mjiJ6nXb3
         Jxmg==
X-Gm-Message-State: AGi0Publ8BGWDh5Z18JW8r7ZSxwnbXbwKoAvo4yguKQIGwdi2v64bL3R
	OMcvttbF0Y3bpQB2uUb8rI70wA==
X-Google-Smtp-Source: APiQypKDd1U93HkgxajIEA76FKChhCeHeM/IxkhoC5UkOgAH+iC7T9Uai6wKOQP4o49u+Aso1d1FiQ==
X-Received: by 2002:a05:6214:ab2:: with SMTP id ew18mr99106qvb.159.1588612679220;
        Mon, 04 May 2020 10:17:59 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id t6sm10422728qkf.27.2020.05.04.10.17.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:17:58 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jVej8-0002re-5D; Mon, 04 May 2020 14:17:58 -0300
Date: Mon, 4 May 2020 14:17:58 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
Message-ID: <20200504171758.GY26002@ziepe.ca>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2020 at 12:09:49PM -0500, Rob Herring wrote:
> On Fri, Apr 24, 2020 at 12:04 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Hi, all:
> >
> > I am happy to release b4 version 0.4.0 that contains a set of
> > improvements and new features. To upgrade from pypi, run:
> 
> Thanks Konstantin! A couple of requests below.
> 
> > pip install --upgrade --user b4
> >
> > Or you can clone the repository directly:
> > git clone https://git.kernel.org/pub/scm/utils/b4/b4.git -b stable-0.4.y b4
> >
> > You can run ./b4.sh from the repository or set an alias/symlink to that
> > wrapper.
> >
> > # Improvements
> >
> > - When a series is missing patches, b4 is now able to backfill them from
> >   other mailing lists tracked on lore.kernel.org. This feature will be
> >   improved when public-inbox is able to collect a thread from across all
> >   sources.
> > - If both patch and metadata are identical between rerolls (v1 -> v2),
> >   b4 will automatically carry over trailers from v1 to v2. This is handy
> >   if there is an sob on [PATCH v2 7/15] from a maintainer that is
> >   missing from an identical [PATCH v3 7/15]. In my observation, this
> >   happens very rarely, though.
> 
> This is pretty common actually. At least common enough that I do a
> check for this and have a semi-automated reply for it.
> 
> I worry that automatically fixing it silently will create yet another
> case of tribal knowledge of maintainer practices/requirements for
> submitters. Maintainer A using b4 doesn't care if tags are added, but
> Maintainer B does care and gets grumpy. We need the tooling to promote
> that submitters should add these tags as that is what works in either
> case. It would be useful if b4 provided just the check as a separate
> command/option for integrating into maintainers tools or maybe
> submitter tools like checkpatch.pl.

It would be helpful if b4 had a submitter focused command that would
sync the tags from the mailing list with the current series in git (or
whatever)

Jason

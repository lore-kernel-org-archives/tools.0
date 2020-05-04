Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.18379.1588633643086629285
 for <tools@linux.kernel.org>;
 Mon, 04 May 2020 16:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=VKcxjVRT;
 spf=pass (domain: ziepe.ca, ip: 209.85.222.195, mailfrom: jgg@ziepe.ca)
Received: by mail-qk1-f195.google.com with SMTP id g185so502666qke.7
        for <tools@linux.kernel.org>; Mon, 04 May 2020 16:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=twMrNUGiAK1itPOsIzKZrg9KDGcSPaq21a5LnXEUPeI=;
        b=VKcxjVRT5/m4uCWi39LXizvpBJwwdDU14A3JxMymlJmex0ZDNjupM+UDvR3ET6zVNn
         Kk/0a6r1amtY6lGqLd/j6+l3+9qxUgMdoec/ieuSIrgeeSGVjv4J7l4Hg9XLv3mpuVwS
         kcth7g7FvIJfxsRwBPwFgSY0bSWqAbo3QpD1tYjHxwJXVXoz+Os6CsRiuZnZfwFnlUb4
         w4Hrm0CWrVK/u4hBtwF5EloY4Och5YnR3lIf0dlhpzwFIwTXXSSB8JKpFX+Rvjj9O/KE
         721AXfgsmRoXvzjLY8SzpPUYkjgl51rxkL56nDNVW953ZpDGdrsn570HafCzLanKwpMV
         d+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=twMrNUGiAK1itPOsIzKZrg9KDGcSPaq21a5LnXEUPeI=;
        b=XaDJq/HOv0Nc33l33MtybstaGZi9NTRMNMDqWgJZUOwAR0xusVevrOOQSG0vAjDOAz
         mwkcz7qs+QDz2pqopROw0P51FjEoXHhy3plG9jeGhUFpZCV4cbrtsN/n62pG4BfbOnF/
         RCAtwJQnpe5UK1SzwgbsJW2djtaCV98I5OyrStCySgcgOSt2Ehms/nzNwCJYSvDpS5p3
         YEuIS0Vy6DKPxgDJbjmumQ/7diLXoQA57kFLUIFPjmJnM/GZafVYqddLRGFTbTFEU+E+
         ts11IndVSu0TQL6FOjuoCVeWbGpwR0mnqd5qSh6U1rupONuFk/4eu08XmAL6/uHbqhDn
         GSHA==
X-Gm-Message-State: AGi0PuYjus0ICb4M8Z9YbaTNNOOY6OUNQ/LOi0Y07eDXZLy3eJzLbcja
	Hul4NAhZNM596iqKpkp6Uf+m9Q==
X-Google-Smtp-Source: APiQypJo7YMfa8FIx7FsWSaIAzpTXrzDtW9kzF4XOi0NP1YD7KP1gTHGV/FGmoq4hEHcVDO7ntz/Mg==
X-Received: by 2002:a05:620a:12dc:: with SMTP id e28mr829657qkl.38.1588633642239;
        Mon, 04 May 2020 16:07:22 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id a194sm410765qkb.21.2020.05.04.16.07.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 16:07:21 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jVkBF-0005B9-5o; Mon, 04 May 2020 20:07:21 -0300
Date: Mon, 4 May 2020 20:07:21 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
Message-ID: <20200504230721.GC26002@ziepe.ca>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
 <20200504171758.GY26002@ziepe.ca>
 <20200504200915.6yb6mo2rdcn6xjqg@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200504200915.6yb6mo2rdcn6xjqg@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2020 at 04:09:15PM -0400, Konstantin Ryabitsev wrote:
> On Mon, May 04, 2020 at 02:17:58PM -0300, Jason Gunthorpe wrote:
> > > I worry that automatically fixing it silently will create yet 
> > > another
> > > case of tribal knowledge of maintainer practices/requirements for
> > > submitters. Maintainer A using b4 doesn't care if tags are added, but
> > > Maintainer B does care and gets grumpy. We need the tooling to promote
> > > that submitters should add these tags as that is what works in either
> > > case. It would be useful if b4 provided just the check as a separate
> > > command/option for integrating into maintainers tools or maybe
> > > submitter tools like checkpatch.pl.
> > 
> > It would be helpful if b4 had a submitter focused command that would
> > sync the tags from the mailing list with the current series in git (or
> > whatever)
> 
> Something like "auto-amend committed series with any newer
> trailers"?

Yes.

> the net result Maintainers are subtle and quick to anger, so 
> I'm not sure I'm confident enough with my git skills to start rewriting 
> history. :)

Ah! I have something for this:

https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_gerrit.py#L98

It directly rewrites history, specifically the commit message ..

> I think providing a Link: tag is sufficient in this case anyway. Even if 
> some trailers were sent to the list after a series was committed, the 
> record of that trailer still exists, just external to the git repo.

Many maintainers will be unhappy if someone submits v2 of a series and
does not carry forwards the tags from v1.

Jason

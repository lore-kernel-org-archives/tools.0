Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.13.1588103757231708376
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 12:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=kLKLd8e7;
 spf=pass (domain: ziepe.ca, ip: 209.85.160.194, mailfrom: jgg@ziepe.ca)
Received: by mail-qt1-f194.google.com with SMTP id w29so18409267qtv.3
        for <tools@linux.kernel.org>; Tue, 28 Apr 2020 12:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9r2bPwlEbIC5v2o3sfh1gLYiRhYc3psmh4L2EO8NBnE=;
        b=kLKLd8e7aDDXVR/ce/lg7w03bLfPeDTJj74iiUrHeszfYXIt6juFnvlqxxqCZ1tlf9
         3kVM+AJKQENGWHlbtC/zIf44oaARhyKI3nKIc8EhSx4r3voxCsPS3l2TC+HI9IDr1me8
         QdBNyW+1LBfNnafyols0els9p5pSNAgjylZIB3wfSBp+VHt/ovPsTO1HMShm/S4Xysw6
         eK6WDH2wIWobN11YH+U2R7L8r9BFqrcsboaPRuSZ9vYG0ot9D7AiiiV5U8NojUtnO1ja
         O5ZgFybAe9lcL5dFFgsvWQeXSG/sbJGXGLTfQf86bGwVLxaqWFH0G37k40RCq+JPWIu0
         PSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9r2bPwlEbIC5v2o3sfh1gLYiRhYc3psmh4L2EO8NBnE=;
        b=ozVnXLcWQDb/qWHCNVs/4d/DnRE5T7nhNreuPq8TKd+5pEC2aAWCVCYL8xYBQlJR6v
         jiK/1XQD9u2EoHIZUwkl5nxVzAMiI/S7gtyngiPCviyxTGFBnMoZ6mVibsO/J/qkyyn1
         lzyEUkHZ3HFMACII7oSn5V1RCrBEZI9X2mvZD86ZwEV0itoRFWfoQzML4ht9Fzml9GaO
         X124ApJ82dO2DU8rsOlCPh522JG5zJlbT6jPxqA/rG0kmGYJUANg1EPZjjflmETO2Ct0
         BFZNXjYARgFnxiEvx+aZ7uuNAHI2ErSScZmrCapm99+ru3mPm+KfsIRZvBH3sdiwGIgW
         wxTg==
X-Gm-Message-State: AGi0PuaKUmnXGQ/RhrdI093WIZJO7UEYn/QeRjba12gG+DewSyAS/8p7
	7P0kXBf8wuGLykIM16HusNShxQ==
X-Google-Smtp-Source: APiQypKEcrtsHj+yPygcnBIuxmgm/c+GJyriNG/z07Lihy6A08+TSx3/Af3PwRCTojpnQJgpTwh8Ig==
X-Received: by 2002:ac8:22ad:: with SMTP id f42mr29998985qta.292.1588103756246;
        Tue, 28 Apr 2020 12:55:56 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id p80sm14327514qka.134.2020.04.28.12.55.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 12:55:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jTWKh-0006EO-9o; Tue, 28 Apr 2020 16:55:55 -0300
Date: Tue, 28 Apr 2020 16:55:55 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200428195555.GY26002@ziepe.ca>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2020 at 03:44:19PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Apr 28, 2020 at 04:35:50PM -0300, Jason Gunthorpe wrote:
> > > - there may be a different number of patches in the series
> > > - new revisions will likely be based on newer trees
> > > - subjects/commit messages/trailers may be vastly different between two 
> > >   series, even if the code is very similar (e.g. someone broke down a 
> > >   single large commit into several smaller ones or vice-versa)
> > >
> > > In my mind, the best way to approach this would be:
> > > 
> > > 1. Create a single unified diff file from all patches in each series 
> > >    (using combinediff)
> > > 2. Remove all context, leaving only -/+ lines (using interdiff -U0)
> > > 3. Remove all line numbers from @@ @@ hunks (replacing them with 0)
> > > 4. Add commit information on top of the diff
> > 
> > git range-diff is not so bad at visualizing this
> 
> Right, but that only works from a tree, correct? Unfortunately, very few 
> people are providing base-commit information still, so I'm not sure how 
> reliably we could generate a range-diff between series if we don't know 
> where in the tree they belong, which is why I was looking at easy ways 
> of accomplishing something like this before touching git at all.

In this case the absolute tree isn't important, if you have the blobs
referenced in the diffs you can build commits from a dummy base and
run git-range-diff over that.

Alternatively you could try to duplicate the visualization it uses
without git commits?

Actually, come to think of it, I wrote some part of this once to solve
some other problem, look here:

https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_expand_am.py

> If everyone is already using range-diff for this purpose and I'm 
> attempting to solve a problem that already has a widely used solution, 
> then please also let me know. :)

It is what I usually reach for in the few cases I want to do this..

Jason

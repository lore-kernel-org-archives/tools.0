Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.4459.1586906402045374075
 for <tools@linux.kernel.org>;
 Tue, 14 Apr 2020 16:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=BP1kHOiu;
 spf=pass (domain: ziepe.ca, ip: 209.85.219.66, mailfrom: jgg@ziepe.ca)
Received: by mail-qv1-f66.google.com with SMTP id 37so816187qvc.8
        for <tools@linux.kernel.org>; Tue, 14 Apr 2020 16:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=UesYFiyR3deLwTscMxW0CZbqgQII4X8iIZSMHUQawOg=;
        b=BP1kHOiu3897oW1ucAsgOxlp81/0jSJgLrO6MgrLC4merDAPXrBilVb3cUU4VQb6yA
         1xMBQ9k9Ogc+PZLGrB9vWQBKpOR40TqHcb/ftdPUrEqasaHfxlKAkz86PwEKoNthyltW
         /Zd05To41MXNTC4Yl+2XvxptdUJ5NPyt07Igjcqq79fNJYIXQ6Yx8WMT8yALfvrV2e53
         dA/fCLKXkDMBygQDqjo4+nugZvXIiSj4hOsdohMwyaNMqhcbgS5S0m9aj4sJHzFctvHQ
         Lf9ZXOS476cmDRbrYyzHmlG0Jc4hwM+HVrxDnEaUgf1mcnmxKz7z+oIPpssyE19/IKJJ
         Q+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=UesYFiyR3deLwTscMxW0CZbqgQII4X8iIZSMHUQawOg=;
        b=g87gO69z6vsXl3uSPU6xm6JLB1KD/MwOMolAu5Ali0i3XcWrpQjyfNstBsuRVpNcwQ
         j4BgJ0qE4Lm/CyT+N5dVbyCNkwgJuY6kX8yP7KsWItmk0ynJGHfdJB6BPP20/7hdC0jT
         TIYlDl9kZHJ8eW5Yg8YO2briu+bKwZHDFl4czRgZiGDzmPzIcCvGNh2XvbGsLRN17m2/
         NnP1VMZnDrrbS3rhA7N7z2Ozyne3oGl/eF46MnP3yiGCRLMPbs9YQTSGiy2XCO3zIOig
         8ATrlhbxEOAw9QY6naCV3ZrZ3M8R1X+lhrJOwiej0CpOEal9mBaD9GhXbrdBEmTPUNFF
         +j9A==
X-Gm-Message-State: AGi0Pubge/7VQFhWiEHIqu4rvK/hckOtEbuujUYHFU5UwoCHHrlD4Kf4
	251x4o0uNBvJhAi8IYSHuHh0Lgit7f8w+w==
X-Google-Smtp-Source: APiQypKLLrVLis+bkXvZbew+EElOHEYiufzy9b95eMgvlWtVAwwrhYxt1glAUs5gxpPADwQFsHeCJw==
X-Received: by 2002:a05:6214:46:: with SMTP id c6mr2523719qvr.126.1586906400988;
        Tue, 14 Apr 2020 16:20:00 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id w2sm5486683qtv.42.2020.04.14.16.20.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 16:20:00 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jOUqW-0003IH-4T; Tue, 14 Apr 2020 20:20:00 -0300
Date: Tue, 14 Apr 2020 20:20:00 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Link: headers and %?
Message-ID: <20200414232000.GA10393@ziepe.ca>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm not quite sure where to post this, but since it intersects with
lore.kernel.org, this seems like a reasonable place.

Many people have been using the Link: headers lately, yay, but I've
noticed that some message ID's have a % in them, and people who have
scripts generating Link happily create commits like this:

commit 3baf89abca196f6dcb7038fd5342fd6e82f3260c
[..]
    Link: https://lore.kernel.org/r/20200324022505.UiPPJZVXX%akpm@linux-foundation.org

But the URLs don't work. They give a 404 because the % is the URL
escape character. To make the URL work it should be changed to %25:

https://lore.kernel.org/r/20200324022505.UiPPJZVXX%25akpm@linux-foundation.org

This situation seems sub-optimal.

It actually seems we have a mixture as some people must already be
using scripts that solve this:

commit 060dc911501f6ee222569304f50962172a52b1d6
    Link: https://lore.kernel.org/lkml/201912212139.yptX8CsV%25lkp@intel.com/

Should we URL encode the Link headers when creating the commits, or
should lore somehow not un-escape /r/ paths? They seem like exclusive
options.

Maybe checkpatch should be complaining?

Jason

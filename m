Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.5396.1588178471270134585
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 09:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H9KccLTh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.68, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f68.google.com with SMTP id v10so1474068qvr.2
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d+fKOyXCvtLbrBegmHPHbf+WvZSVeauJoHPx6kFB390=;
        b=H9KccLThZ0JUe5DnDepaRBX9/IMM3Tgo40qMw7bFPVbrocAzNjde6rEjlxYL2jckzf
         Q8mciTWHU/xnPp221vNPzxyam5U122ta7qs+C4yERFBX2VyfnEQaqe7dzVthd6FcVk35
         9/2NROrb4JBF9XQMqjp2w+NQGhMpZE6E+lHRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d+fKOyXCvtLbrBegmHPHbf+WvZSVeauJoHPx6kFB390=;
        b=bDE2Me/tvZ+HKT0dGorcOlbZtG6wGwio9T2obcq2vu7rfB/qzkbWU5kfm/HsgGRwo6
         Px8XJUntL4MjTE6i9cdCFI4grFUOAnyj0kbh+g5e+Bt7toQy+vMAV7Rd4O6ZVTlgcPm4
         wkNGkBf/4MaIn4iTmYMStfMZjm2E5z8sAheU+JEUi66lea6Txeb1rXSmwVaMOp05GCh7
         dPVnaZIBcMQwapJ5RnXsg5ZEtVuFI1eXRBCszB1AWik5ma0wc1zuS/RzHpEwsmptlxUh
         WcWYzFDt4HzeSw5nHthl/NWLE4n5BkNPtQgoo9dBvXMlh+3lDudj9yb8Jn+qDY7K7WaV
         TCng==
X-Gm-Message-State: AGi0PuZ4bc3dO+Kl8JSsHW3SNNzDj+RKkU9/Jle260ujHHTa4/yZOzBF
	L0TL39/WERb84mF7aRKIBEKBrQ==
X-Google-Smtp-Source: APiQypKe+oRiWGvmbmCd77qbmisNWo+aah1J9uG48zWaT0NGUYja95M31xqhCy1P16f5l9WujBjiow==
X-Received: by 2002:a0c:e992:: with SMTP id z18mr34975997qvn.25.1588178469441;
        Wed, 29 Apr 2020 09:41:09 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id e186sm16577440qkb.40.2020.04.29.09.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:41:08 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Wed, 29 Apr 2020 12:41:07 -0400
Date: Wed, 29 Apr 2020 12:41:07 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org
Subject: Re: [tools] jg expand-am (Was: What is a useful way to show changes between series?)
Message-ID: <20200429164107.lc4sezzibjocwxgo@chatter.i7.local>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200428195555.GY26002@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200428195555.GY26002@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 28, 2020 at 04:55:55PM -0300, Jason Gunthorpe wrote:
> > Right, but that only works from a tree, correct? Unfortunately, very 
> > few people are providing base-commit information still, so I'm not 
> > sure how reliably we could generate a range-diff between series if 
> > we don't know where in the tree they belong, which is why I was 
> > looking at easy ways of accomplishing something like this before 
> > touching git at all.
> 
> In this case the absolute tree isn't important, if you have the blobs
> referenced in the diffs you can build commits from a dummy base and
> run git-range-diff over that.
> 
> Alternatively you could try to duplicate the visualization it uses
> without git commits?
> 
> Actually, come to think of it, I wrote some part of this once to solve
> some other problem, look here:
> 
> https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_expand_am.py

(Dropping users from this follow-up)

I'm trying to wrap my head around what `jg expand-am` does, and I need a 
bit of your help to figure out what happens after it completes. So, when 
you expand-am, you:

- grab a list of files and their index info
- create a temporary detached-head worktree without any files in it
- populate it with the exact files as in the patch, using the index info 
  to grab the blobs at the exact state they were when the patches were 
  created
- git am the patch/series
- display the tip commit of the "git am" operation
- destroy the temporary worktree

So, you now have these commits as loose objects in the original tree.
What happens next in your workflow? How do these objects help you during 
the actual "git am"?

(My git experience is pretty much entirely branch/merge based, so I'm in 
the dark about a lot of this -- thanks for helping me understand your 
perspective.)

-K

Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.14845.1588622958947187677
 for <tools@linux.kernel.org>;
 Mon, 04 May 2020 13:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AoGOZkfi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.180, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f180.google.com with SMTP id q7so24534qkf.3
        for <tools@linux.kernel.org>; Mon, 04 May 2020 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nJgTVzO7zi74xLedi63JFXel+KohyiCMQKNqtuwbmWE=;
        b=AoGOZkfim5Vv8ByTh2vbYDtUdHZQJFVHvuUFQm845yfbDrVe0tbFDKyeWRaMsUSkdd
         Ua6PjUEmztayBXBi4kWTVOVVAjymYlueodyrRT+MTmVhUVfm96zSQa9PTYOKmfds4jDW
         jMLxW/AyZ26XP/vSW3CumrxO4nDmqYSSddmfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nJgTVzO7zi74xLedi63JFXel+KohyiCMQKNqtuwbmWE=;
        b=nGoZmFVtYrnaXb2QjmG3PNzRUlfdxmsdtqumVAL+tr/brN4Mudabi4NxN5T/Yy/K5v
         LHTD3KLfPpdBqi8+Xc80V2OAp/IemmoNz1yDyk3ZwYXeclSbEpo1JAndGCVhAElOs6Vm
         7/6FNN8JQ19QjIIzz90zkVyT0c+MFRhXmlObBxfytiErg07dUlVvmX/14kIFrVOEGL8t
         UMOPjwdlv2OaN7Fl1tEvd1bxwpZ753QS1AEmNdzehaNU4iwc1X43lqSWMH4U5C4fRR5C
         jVfpawIcwVH9QA4suzKfceNEhG2TZo0UfrKPy+LxW4mSlWHP6cRPC8UDxcAtcaiISzl5
         3zSA==
X-Gm-Message-State: AGi0PuZKULpKtU3fcAfhs/VdB0vnT7eEFfNU79p3BfOpWEr4FvMPKoj5
	4KVHGmp17d2fRGoc2s7J97A8WA==
X-Google-Smtp-Source: APiQypJmE95AWZeR0ACqG5gEYwYqclfr4cpnbvYtilnop8OvcLjpYrRR7hvQfd5Uy/8+FUQaKcS+HA==
X-Received: by 2002:a37:e50b:: with SMTP id e11mr83969qkg.224.1588622958064;
        Mon, 04 May 2020 13:09:18 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id x124sm77430qkd.32.2020.05.04.13.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 13:09:17 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 04 May 2020 16:09:15 -0400
Date: Mon, 4 May 2020 16:09:15 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
Message-ID: <20200504200915.6yb6mo2rdcn6xjqg@chatter.i7.local>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
 <20200504171758.GY26002@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200504171758.GY26002@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 04, 2020 at 02:17:58PM -0300, Jason Gunthorpe wrote:
> > I worry that automatically fixing it silently will create yet 
> > another
> > case of tribal knowledge of maintainer practices/requirements for
> > submitters. Maintainer A using b4 doesn't care if tags are added, but
> > Maintainer B does care and gets grumpy. We need the tooling to promote
> > that submitters should add these tags as that is what works in either
> > case. It would be useful if b4 provided just the check as a separate
> > command/option for integrating into maintainers tools or maybe
> > submitter tools like checkpatch.pl.
> 
> It would be helpful if b4 had a submitter focused command that would
> sync the tags from the mailing list with the current series in git (or
> whatever)

Something like "auto-amend committed series with any newer trailers"?  
Not sure I'd be comfortable with that -- I am currently deliberately not 
performing any operations that directly modify git trees (beyond 
creating new branches). Maintainers are subtle and quick to anger, so 
I'm not sure I'm confident enough with my git skills to start rewriting 
history. :)

I think providing a Link: tag is sufficient in this case anyway. Even if 
some trailers were sent to the list after a series was committed, the 
record of that trailer still exists, just external to the git repo.

-K

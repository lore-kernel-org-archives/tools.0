Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.332.1588105469049003802
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 13:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RjNVIWl0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.194, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f194.google.com with SMTP id s63so23204916qke.4
        for <tools@linux.kernel.org>; Tue, 28 Apr 2020 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=inBjv4+P+LgqZHCmMflkgFpWNnMy147eEGT7sbh5+dA=;
        b=RjNVIWl0f3OOj/G0ZFQMiqantjHTsc3C7g9+a88oykBfy52odQ+SvkeoWjN7kQkl4J
         7AI75aduPCgrcO6mG0Eq1UQeXqOSRuIX4x4J9cZLSAt2rvIxZFvBGFmrwdZIOTETUISa
         3GChp2dtdC+VQFJkN8TUfSrxe1uXxl3jHGcZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=inBjv4+P+LgqZHCmMflkgFpWNnMy147eEGT7sbh5+dA=;
        b=kpUP/ytEZ1LUK9kALrNLNmbVEQxb8Ok/kGwCqSb4gc8SeGK0PtbZJ3+by/ssRYHQXX
         f8NtKaEHHrPZrMDunosP8AH7UhN49InONlZdpV1uOeM4zvK+tVG4IQDybgX7tnngXx2w
         R2EQE6FtvH+BWzmHIIPN8EB4RvIdUwyq545MFU1lkkXpcD0bD8nRqIKcGy3+OZBSQSq1
         kr4WcAlNwEtxU8Y54B66zw/mVoyUC6gQpU4GJ1xF779NE/HgU1mpWyypyGid14axmSsJ
         e9toelm9V5HgNb0iu05jN3Z/dJSjKMF/wLBHIWQPObUTjv6NI8MjsxKVhyrs+bz/wFH9
         H+DA==
X-Gm-Message-State: AGi0PuZPJnpQbd+r0ooz1jXwfgkfQc4WjmYpUnO+CnsfOni6ECpNHNyA
	aJoVoKjairSeLYdrYWNGm4i8eA==
X-Google-Smtp-Source: APiQypL2VJRH1Qs+OPAcn9iWKb/p6CdUVXm2RWFCE80s3+IRH6OBBw++buhZh9K9W4HEjxS7Kx80jg==
X-Received: by 2002:a05:620a:688:: with SMTP id f8mr9682240qkh.431.1588105468059;
        Tue, 28 Apr 2020 13:24:28 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id v188sm14395670qkh.47.2020.04.28.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 13:24:27 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 28 Apr 2020 16:24:25 -0400
Date: Tue, 28 Apr 2020 16:24:25 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200428202425.nntxblupwbomcd7x@chatter.i7.local>
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

Interesting. Let me poke at this and see if I can do auto-range-diff 
between patch series even when we don't have base-commit info.

-K

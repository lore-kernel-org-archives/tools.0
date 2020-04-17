Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.2167.1587150415679206096
 for <tools@linux.kernel.org>;
 Fri, 17 Apr 2020 12:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YAkPRwZi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f195.google.com with SMTP id b10so2877918qtt.9
        for <tools@linux.kernel.org>; Fri, 17 Apr 2020 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q5mkKVZoldpRd4KFy5TfpzbXb6mTvCySFVF5O7fwybA=;
        b=YAkPRwZisKqLFctOgRbsam44sxjEoj5tdpuJFFsW1od3WIG0SZG1uQEN4TRvjTd/kA
         QW+eDJnAnEXL9GTq3EuyrtAShyI3RBLq/XsEuouURAjvGlZBVvVYMOqFjCqHGWdJ8wtd
         +VwmGw1KS8uypi2HU9bdRnoPT+YcseAuc+Rm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q5mkKVZoldpRd4KFy5TfpzbXb6mTvCySFVF5O7fwybA=;
        b=Al+iS2iFEjF92trOwoTINYWzQYDqYdgPMmVGz6LMgQHBr8t7ysBkTT0PVStXc5MOob
         NbgCQr9ypXxqCxRNzh/bFCldo2N/CyR5kCFZAvOYlE40t7+8giRUNy55kVkNG+KO7sz4
         ro3o5j85FO9t8HbOwXzM4Kh03ea6qsbdNAXG1YiCxp8z6DLbjfrqplui1EQLiEENSW48
         8/LxUe5Ae7A+C6IkPPvh6rZmFaJwUzKcKkg0VlgMYt72liufNsn4uyGjqCSuKCz/mjqI
         C1GB3hLnn8He7uS7MuBtY4Lp44/teJYm3H0uobc57pSg2nIC5yVDmUiLNtpHpUrNMvJ3
         ZGtQ==
X-Gm-Message-State: AGi0PuadVgkxlEcLBdlkuF9QjVWNqGHaky0uDrO1F+hhgFDzY904lbx8
	Bz4xw4YsQgmGVnJShFfMZBuRnA==
X-Google-Smtp-Source: APiQypLdqEeaj4vAfK1klmOst8ZdBfkVDKqXXGARkBrBov26tP991Vi0QWfRwQpMRt6y9xADgm6qBA==
X-Received: by 2002:ac8:342d:: with SMTP id u42mr4505029qtb.255.1587150414683;
        Fri, 17 Apr 2020 12:06:54 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id e9sm17389263qtq.82.2020.04.17.12.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 12:06:53 -0700 (PDT)
Date: Fri, 17 Apr 2020 15:06:52 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty feature requests
Message-ID: <20200417190652.yur6z53naj7dlqwr@chatter.i7.local>
References: <20200417154430.GG5315@sirena.org.uk>
 <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
 <20200417163939.GH5315@sirena.org.uk>
 <20200417165537.4xgdj537vw26fai6@chatter.i7.local>
 <20200417170904.GI5315@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200417170904.GI5315@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 17, 2020 at 06:09:04PM +0100, Mark Brown wrote:
> > [remote "foo"]
> >   url = git@gitolite.kernel.org:pub/scm/linux/kernel/git/foo/linux
> >   fetch = +refs/heads/*:refs/remotes/foo/*
> >   b4-treename = "foo/linux.git"
> >   b4-commit-url-mask = "https://git.kernel.org/foo/c/%.8s"
> 
> > Would that work?
> 
> I think so, yes - the treename could even default to either url or the
> remote name so a lot of the time it'd not even need to be set.
> 
> One thing to watch out for is that you can name branches foo/bar without
> them being remotes so just because there's a / that doesn't mean the
> branch is a remote branch.

I committed a change that should do the above (with proper precautions).  
Please try it out (see .example files for ${branch} and ${treename} 
usage examples).

-K

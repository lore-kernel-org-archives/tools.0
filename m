Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.6611.1587402232047967281
 for <tools@linux.kernel.org>;
 Mon, 20 Apr 2020 10:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I/X6Ls8T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.53, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-lf1-f53.google.com with SMTP id 198so8610572lfo.7
        for <tools@linux.kernel.org>; Mon, 20 Apr 2020 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7ErKAl7JQymBpe6Jo10hpq6nwronUF+lAxc+gDnAAIA=;
        b=I/X6Ls8T+hUDTOLVGFh7H3/6bEhBixNlc12jJRsPDqmcxi1+50WWzdBWYEnGdN1UfH
         iv2PQTG5tHT9B2aqquy2pkcFwxLNhlkSsFYqTysZTAjxM9cEp74891oJBwqHqPY1l2Dt
         fumBydo4UbM8tZpv9n15hQ2m+CQ6SdZqnNGbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ErKAl7JQymBpe6Jo10hpq6nwronUF+lAxc+gDnAAIA=;
        b=D0sij6BvNFUArDgksFD/ruwrKnFIXFzmY/GtxuvXeph5u4FS0F73kRZnsaxIEosB1D
         yoqwRkq9PVap75ZabNOZnpIyyH+P5xYzjl+VEOvt/cJnEOblZtCdGc2vBALrg8sKufqz
         rxXc1FrIDZ3VvwB6o3mNSoAoNgQuhyp0JajwDafQUVZ/KAz+2kcmN3PhHyVJ6ZXJb1M2
         PWkFPm5cKWA2Fi71kZw8dySQtTJp0OhdtG6z7rmRCExzh+oNyUmroYSaVW9f8tzOVnUF
         FfjnuyPsqdZlg8HD5sycim38ue7pTrTkgds4/OrLHMuMzRylVGUGN07aPeWB612S1Tpr
         33iA==
X-Gm-Message-State: AGi0PuYVlS42mwKwUQvGliEl3xv7nQt55v0IpIh6eNcAptVR8P2N0WWv
	w/fbxuElyFsmVupIhp/bTVqUrQ==
X-Google-Smtp-Source: APiQypJMibkQOMi0I7HiZmRCvDtz7/PWTshkaaPuH80YYnjho54lnlLtj9blW3wOmbUmyxNoN7J4hw==
X-Received: by 2002:a19:e041:: with SMTP id g1mr10963826lfj.70.1587402230177;
        Mon, 20 Apr 2020 10:03:50 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit1-readme.dfri.se. [171.25.193.77])
        by smtp.gmail.com with ESMTPSA id q6sm21963ljg.67.2020.04.20.10.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:03:49 -0700 (PDT)
Date: Mon, 20 Apr 2020 13:03:46 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty feature requests
Message-ID: <20200420170346.skra7tq3v4ecs7jm@chatter.i7.local>
References: <20200417154430.GG5315@sirena.org.uk>
 <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
 <20200417163939.GH5315@sirena.org.uk>
 <20200417165537.4xgdj537vw26fai6@chatter.i7.local>
 <20200417170904.GI5315@sirena.org.uk>
 <20200417190652.yur6z53naj7dlqwr@chatter.i7.local>
 <20200420154609.GF10045@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200420154609.GF10045@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 20, 2020 at 04:46:09PM +0100, Mark Brown wrote:
> > > One thing to watch out for is that you can name branches foo/bar 
> > > without
> > > them being remotes so just because there's a / that doesn't mean the
> > > branch is a remote branch.
> 
> > I committed a change that should do the above (with proper precautions).  
> > Please try it out (see .example files for ${branch} and ${treename} 
> > usage examples).
> 
> This all seems to be working great, thanks!

Good to hear. I'll probably release 0.4.0 with this set of features some 
time mid-week.

-K

Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.22530.1586978902894856587
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 12:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O0kYwq4y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id j4so18656610qkc.11
        for <tools@linux.kernel.org>; Wed, 15 Apr 2020 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VbYxf9E+JrHh2gvfZQDxVSI459QGiCBDpAlB5rutcbc=;
        b=O0kYwq4y/0W+zjKiaQrZGSMWBeNkTkarId6KhIKrAfhRi7yiSw9naASP9iKFwpkGh6
         uYVBOXn2UlTwlFJDnVhnwqPM/NnS0y/FoDytl5ufrajbmI+QAw6p5TR8IYXncu9NcAmd
         CoavuPPg77Vhjeo2AcKMTnGhoo/PzvL+Bl7Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VbYxf9E+JrHh2gvfZQDxVSI459QGiCBDpAlB5rutcbc=;
        b=pWo6A6nzzuo6t3qg5CUa165/ZTVF/AHBCwDBIOoPtplPhyJWdxuvpd//3XdzfvOk+N
         lhaG22dwG1jBTnuIFpD0rmvujQVALvMfU/QxQhdq52+K8/W+xiKMuYIcW72xBviyAE3q
         0YMqPmeWEHDJuOatreoL+aovNAE1NTpPuDuWbtq9P0RrdVzq4o3/24442L2zMckNPGi9
         pYXProfm4zKJJKF4ki++mCqfE35KujxJifNo58xIY3Kb3f+ihIxFZp5mAHxvVKiWHQFz
         msrGaRwdin0tG0Aw0L3kGF6mlVH2DOjblQMvi4MuP3coeGhQezaeKWdqN4GBD9cgzbUv
         /A2A==
X-Gm-Message-State: AGi0Pub5pBpuBs+TAjL377x6vQZvAoAMR7oiYwZ9fTQDegQTYOtCcslK
	8cWuKwtCkvbTdxCI1DibLT8Lqg==
X-Google-Smtp-Source: APiQypJjCLVLoGdYkgjC4cxtPbd8j4YPpa90jM/+fQHHs5IY83z+XhbCxjFeXhNiOuBIolFmI9Slfw==
X-Received: by 2002:ae9:c319:: with SMTP id n25mr25237975qkg.79.1586978901988;
        Wed, 15 Apr 2020 12:28:21 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id i5sm13414377qtw.97.2020.04.15.12.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:28:21 -0700 (PDT)
Date: Wed, 15 Apr 2020 15:28:19 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415192819.l4osqt6sxdlydbso@chatter.i7.local>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
 <20200415172324.GH5265@sirena.org.uk>
 <20200415175548.h4tyddairbltmri3@chatter.i7.local>
 <20200415183248.GK5265@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200415183248.GK5265@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:32:48PM +0100, Mark Brown wrote:
> > I'd be very interested to see the diff that is produced by running 
> > that command (specifically, the @@ @@ lines). That code currently 
> > expects to always have lines added and lines removed, but that 
> > appears to be the wrong expectation and I need to fix that.
> 
> Running git --no-pager diff d2a66a4f85813d53fa5618f95e365a4f3beb2aa3~..d2a66a4f85813d53fa5618f95e365a4f3beb2aa3
> 
> is the one immediately before it explodes.  That's a local commit in my
> tree which I'm reluctant to share but playing about a bit I'm pretty
> sure that the issue is that the only thing it does is add a file - the
> one @@ line is:
> 
> @@ -0,0 +1 @@
> 
> and I can reproduce similar behaviour with other random one line
> additions.  Does that help you see the issue?

Yes, we always expect there to be a N,N in that output, which isn't true 
in a number of scenarios (like a commit that creates a new file with 
only one line).

The latest master should properly deal with this situation (as well as 
when a patch deletes all lines from a file).

Glad you ran across this, as this affects attestation as well. Looks 
like I'll need to backport that to 0.3.y.

Thanks,
-K

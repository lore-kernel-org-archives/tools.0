Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.18861.1586969835476539615
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 09:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LANyTNDo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id x66so17969091qkd.9
        for <tools@linux.kernel.org>; Wed, 15 Apr 2020 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VjOitJNew3pdBKv4u05ChGJuCkPEutO4mgc1ckaYP/w=;
        b=LANyTNDoADyfe7ioJDTjWhI2XPR2oI8Y31t4kw5Kw6NdhjJZZUYpJe86jaOlTJcQn9
         OAc07PKEeVJLfwg//8lI7/PHTn/lMe9aNs1nVdCWteVEhlPjM4EIPM49/Ll1ABZKdgXF
         DRPwHxs6qvbz47fdVXfiO/PBkI+c9R/etjfSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VjOitJNew3pdBKv4u05ChGJuCkPEutO4mgc1ckaYP/w=;
        b=pdlvX37ft8s0n4RQWIKiI2Iy6vhmDT4to86SA+0Cm/GteUGOEWFD3SsOueTvgJFC8G
         jK6MUSCAp2bktX/XT0kltZ+stZyvk5YplhiK4NdYECAuylOg1MSJmfTkazwbiWGJFxA/
         gyKWxusOGr9eaytcBX+dOQPQt/f9oMkd6g6snxwZpcvsNx8mu47lDj2wW2cq7NEl1S9v
         Puoex7mcmhIHscc0wiDQT8EUCHxPF7lVDv02cQhbhRLyyePb+C9uWvWWmXEUaSoCKTSq
         nvW2zQZMYctj51mHrv9O2V+ZJV76+aIAX3eNW9bEWvjFqRnznmqRDCq6JgfrsvO6/OWi
         0zqg==
X-Gm-Message-State: AGi0PuY+It9VTySMXazjZhBatC9+/M46NgtrOg66UKDQnxwFHWsbq5++
	zME+MREUtTaZhZEgp249+uC4rQ==
X-Google-Smtp-Source: APiQypI+lMPmF8ePya6y8/DMj/gTBDPCTlK9QxL+6vtIsMabf6qQeb0CrZwaIwxDpVN3Ljbl7Wj+1g==
X-Received: by 2002:a05:620a:22ab:: with SMTP id p11mr14976561qkh.373.1586969834482;
        Wed, 15 Apr 2020 09:57:14 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id v76sm13480619qka.32.2020.04.15.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:57:13 -0700 (PDT)
Date: Wed, 15 Apr 2020 12:57:12 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415165712.swekibu2xg453sqa@chatter.i7.local>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200415150000.GE5265@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 15, 2020 at 04:00:00PM +0100, Mark Brown wrote:
> On Fri, Apr 10, 2020 at 05:00:56PM -0400, Konstantin Ryabitsev wrote:
> 
> > Based on your feedback, I added an "auto-thankanator" mode to b4, which 
> > will track your use of "b4 am" and "b4 pr" and create convenient 
> > templated thank-you replies when you run "b4 ty".
> 
> Nice, this solves some problems I've been having with my scripts since
> converting to b4!

Thanks for testing it out! I'm sure there will be quite a few iterations 
before I get the b4 ty workflow to the stage that is useful to most 
maintainers.

> It seems like this relies on git branch --show-current which isn't
> supported by the git in Debian stable, 2.20.1. 

Bah, I should check manpages more carefully. I switched to a more 
generic alternative:

git rev-parse --abbrev-ref HEAD

> The documentation also says that
> 
>    b4 ty -s all
> 
> will send everything but it looks like that just lists all the tracked
> patches instead (possibly because of the above, I didn't check). 

I think I just forgot to add "all" handling to -s. :) It's fixed now.

> I'm
> not sure what it's looking at the current branch for but if it's doing
> that it'd be good to be able to tell it to look at a specific branch
> instead - 

You can already do this by passing -b to "b4 ty":

b4 ty -b branchname

> > Since it's an experimental feature, we just save a .thanks file instead
> > of sending it outright -- at least until there's a lot more testing.
> 
> It would be good if there was an explicit command for this, it'd be
> useful when scripting stuff I think and also when testing things out.

Eventually, the plan is to look into gitconfig for "sendemail" 
configuration and use that for sending out email directly. For the 
moment, you can achieve similar results by passing "--confirm=never" to 
git send-email, which should just send the emails out.

I found a few more problems while testing things out, which highlighted 
the need to use more forgiving patch hashing routines. Since I was 
planning on integrating b4 with some of the patchwork automation 
functionality in the near future anyway, I switched the tracking 
routines to use patchwork-compatible patch hashes. Unfortunately, this 
means that --auto will fail to properly work (since we changed the 
hashes we use to track them). Things should still work with "b4 ty -s", 
as we do matching by subject there when exact patch hashes fail.

Please update to the latest master and see if you have an easier time 
with this feature.

Thanks again,
-K

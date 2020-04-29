Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.306.1588187563361064463
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 12:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=mZEhK5yN;
 spf=pass (domain: ziepe.ca, ip: 209.85.222.196, mailfrom: jgg@ziepe.ca)
Received: by mail-qk1-f196.google.com with SMTP id k81so503402qke.5
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JXYJ2TEs/v0D9T2mbDryFNRks2yVXZfWDsMTd2jLIFI=;
        b=mZEhK5yNVD0wVYC177HZxx3GvQgLf9zREWZ3/Ds5RJtPjOAEtBHiMHkNGGrIefITpu
         /b6FoOVu1TESz2u/P6j77M8v0kLTCUphSm3iXCetH9SH7QKT2rIcWS29Nfi6ylczN5Lk
         Wlsop6W1d++2fYeTu4goViViAfJMjBXuNO0qCN+YTg81Dsj4jHavC8Sn/yFpgUTESfxP
         F4VZad496GclpvyoE+SrUf7QygsEL2Z+w/yAKMI2P7h8zqKAQDyOW5jYTh2LjQTXp3Zl
         2rW5XNYP0JNNU2YXUKQP4vB2rF1PK5tUJtxoL1Aa+EqXWBgoephmA+VvlP+YWJWjK85x
         HKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JXYJ2TEs/v0D9T2mbDryFNRks2yVXZfWDsMTd2jLIFI=;
        b=PoGRjepiOG8f3se/4TjtLr/HV3N3bPpjzQZNV+lozN9GbpZKDrIkRmtDrB6QRoBvF0
         8ShVKm5IZN+cwz7VySXn9qmFxcZUskP4x7R3Q4yDiOJOnvoFYOOe5Zt04ymcN7prFoS9
         gIhVnl7zQQHoBE7RI3NP7+/unpPFd8sGfJckyWU2vvRZ/GshKQjrh2ovjDOOHq/QkeNk
         cLf11a9Kqo70N/uEUZQLueegEO5y4suFTut1ITbmmkVABJhRW0+vtUnbg+vcGhxOJ3ry
         DnC9JI7/gVaFh0gAG0kShJbOq9UQIANyTlvFSm3a3YSOSMxVxKYaA1u1YLb4m/GeTcN3
         nUMA==
X-Gm-Message-State: AGi0PuZrRrgMZDnSTJS8yH3RlSi9rt9PZOGBiWzC+OwCGrN93bczxQIN
	eTJJv7pEijXvIXbbbYuSNcCyTA==
X-Google-Smtp-Source: APiQypJNKPd779tHNfsbsJep4EzVo5ycud592eT39uX6jGkRWnIoNDP/34MBYCMH6sFQh3pR+WW9PQ==
X-Received: by 2002:a37:9e4a:: with SMTP id h71mr34144029qke.341.1588187562514;
        Wed, 29 Apr 2020 12:12:42 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id x55sm120120qtk.3.2020.04.29.12.12.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 12:12:41 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jTs8P-0002Cf-6W; Wed, 29 Apr 2020 16:12:41 -0300
Date: Wed, 29 Apr 2020 16:12:41 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Junio C Hamano <gitster@pobox.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429191241.GJ26002@ziepe.ca>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
 <CAPc5daUXCRv5CN9cVdGTgAWinTEFB0RnMF27MA5D4dOMiCCk1A@mail.gmail.com>
 <20200429175049.GP4201@sirena.org.uk>
 <20200429175844.GH26002@ziepe.ca>
 <20200429180941.GQ4201@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200429180941.GQ4201@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 07:09:41PM +0100, Mark Brown wrote:
> On Wed, Apr 29, 2020 at 02:58:44PM -0300, Jason Gunthorpe wrote:
> > On Wed, Apr 29, 2020 at 06:50:49PM +0100, Mark Brown wrote:
> > > On Wed, Apr 29, 2020 at 10:42:01AM -0700, Junio C Hamano wrote:
> 
> > > Ah, indeed I think that is exactly what I'm looking for!  Sadly it is
> > > not documented in the git format-patch man page so I hadn't seen it,
> 
> > So if we use this, should we set the --base to be a linux-next tag?
> 
> > Is that reliable enough?
> 
> > Can't relly use Linus's tree, and if people randomly choose their
> > upstream's then it defeats the whole point :(
> 
> Personally I'd just not bother specifying a base if it's -next or
> there's platform enablement stuff in there - I do send a bunch of stuff
> that's based off directly off a rc or something in a maintainer's tree
> so for me it's quite useful.

I mean, if I use --base to be linux-next then git format-patch will
find some common near commit that is easy for tooling to access.

eg if my series has netdev as my base then --base=linux-next will pull
out the latest netdev tree (I assume it usese git merge-base
internally?). Same for basically all the subsystem trees in the
kernel..

I'm not suggesting to send patches against linux-next

Jason

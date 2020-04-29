Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.759.1588180543405400198
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 10:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=EaXQflud;
 spf=pass (domain: ziepe.ca, ip: 209.85.222.173, mailfrom: jgg@ziepe.ca)
Received: by mail-qk1-f173.google.com with SMTP id k81so69290qke.5
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bK18agtrPesp5rp+9ahU5OZr/riIfvrWWCtpvumHzpc=;
        b=EaXQfludP0TzXfF3IEd5joJ+byYKRgOVB+2lf+n/1LxHRoz6d9/fIn/zxxx1G9xYca
         9/FA9QI5AO2fB/hQQLJmGCrPtmaAlTArJOPHKzggcuMp5O/1I2FaTjea0uJRuScPKMib
         QHeh+NOG7i/SxHwv/B63tVAGuTORzFkC3s164JD7iIkjNN4SDc5dRtkq/jfxNpV0YFBo
         V/sL2UF2K+XiG0pfOfHXfd63IIsZMuPKyMbNjQXYMuKJQt4jSVzPNLa5WkmDCiSjKtJx
         3pYkj0ErtvxpGCV8SAyO/l8r9/BxLE0iYx6PI0/vIeJcrcfaATqhogqC6Q1umAAA1Ds7
         RHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bK18agtrPesp5rp+9ahU5OZr/riIfvrWWCtpvumHzpc=;
        b=A5BruefXQegEGtIn4DEHJfWN+2zN4vwYDSzV3Z8isuOvdMRWFLwNgUrWuHSvdXu34b
         OD/TLxKwG20Yd+nPzxQgr5pqP9KT9wPWbJLOMyb8fDXeBGJWjhVAwQCGgivuNsqIb0dZ
         U2BoJz/SsK0w2+/4v5NlhvJKxO0uGohIVLQrA39BfujZ59Hr8kfWUWPCWdQmQH+VH2uq
         /HyHtoYjBmNXAXtBd7vDH9Uk90OizlltDrun9PRQ/gRzbUuNvuWFYDHPwQXHk8ABTx2R
         QIkwvQGCxDG0htpJsmyOvddRFat9fNXBpS0OgsPWlAAyAXROjISaG43ipuPCfBQnV5K6
         0xdQ==
X-Gm-Message-State: AGi0PuY30ve2tCH0HZlDgmmfFsuPQLIwXLsIfgW7fRsLXzAx0FoC8Ruo
	et8UYh7YbbACgpxzCyOyv0bv/w==
X-Google-Smtp-Source: APiQypK+0Lq1DOgowzmvfn4XfjrYYCw3tF3CrNK8mDJGz3gOhk4zYZqMiRu+sjk+ql3yvabQ5DYUIw==
X-Received: by 2002:ae9:ed89:: with SMTP id c131mr31475697qkg.447.1588180542548;
        Wed, 29 Apr 2020 10:15:42 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id v16sm15691240qkf.80.2020.04.29.10.15.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 10:15:41 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jTqJA-0000Hw-Qi; Wed, 29 Apr 2020 14:15:40 -0300
Date: Wed, 29 Apr 2020 14:15:40 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [tools] jg expand-am (Was: What is a useful way to show changes between series?)
Message-ID: <20200429171540.GD26002@ziepe.ca>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200428195555.GY26002@ziepe.ca>
 <20200429164107.lc4sezzibjocwxgo@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200429164107.lc4sezzibjocwxgo@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 12:41:07PM -0400, Konstantin Ryabitsev wrote:
> So, you now have these commits as loose objects in the original tree.
> What happens next in your workflow? How do these objects help you during 
> the actual "git am"?

The commits are not the goal. The purpose is to populate the object
store with evey file blob mentioned in every diff header:

index a1f053cd30b990..49775cda83dc18 100644

ie the goal is to create blob 49775cda83dc18

This effects 'git am -3'. If it has the source blob then it does
standard 3 way git merge - otherwise it tries less hard and drops .rej
files.

The problem comes when a series of patches change the same file
multiple times. The file might go through blobs A->B->C->D over 4
patches.

I probably have the starting blob A, however, my top of tree has that
file as W. So my git am will produce blobs W->X->Y->Z

The key thing is that when am applies A->B on top of W it gets W->X. 
am never creates B.

Thus when am goes to do B->C it can't find B, and now it can't do 3
way. If there are conflicts you get .rej files.

This comes up from time to time and rather than asking to resend I can
use this script.

About half the time git 3 way merge will resolve things automatically,
the rest I prefer to use the conflict markers to fix up rather than
.rej files.

Jason

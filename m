Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.147.1586990200637304142
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 15:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ffvT4W8O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.45, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f45.google.com with SMTP id y19so883340qvv.4
        for <tools@linux.kernel.org>; Wed, 15 Apr 2020 15:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=95UcoLbdz5F1LnaeIN5fIT64Gpq7SyFdsHpR6+P5hyo=;
        b=ffvT4W8ObHV7FYXw5viNJlU3xfNmcR5i4G+Dyd9BXlKVFIXWdJsTg4sNSsk7R4xK5z
         KeL7Kn1h79b1LOva0LwPOd5AV+y8hmfIASJzZ/HAfeKGVGlemPalFA0tds3pXwMnk87t
         wGjC35MRO0hUvUbZwO7GWv5FVW3mTzCmn1NZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=95UcoLbdz5F1LnaeIN5fIT64Gpq7SyFdsHpR6+P5hyo=;
        b=hfuIloMhRiyAUxPOsiT5uUrusC9IfThZFDjYK/0lUiAUDaBRoBHGADfmoL/bkB3Z4Z
         KI9hKx9Lw23acPkaeEhOectRc2eaViX/s7KzBsI2ssjVyYA5RsVKZRU1ymUYcAl3b9JL
         hh+5I9j/lqHPWj3f9zuSYBYM85ePqnr1Kib2Z5LuedbRh1tiRrFlegZQZqOPrDPIbkNT
         h9mibuRbMNmquHQbwYXhIU55uF8MJMIkjiGoOYZTDq38Qop50LauR9Lbid8WKPG5uSrD
         qAwf5J4blEJDt1CsvrIwpYUadUbE6PZ5qST6yjMUA81QUXJ+7kS+Fm6XjA3iA0mNUOQE
         a3OA==
X-Gm-Message-State: AGi0PuYqQJprtiPI4KGAUMLOEpLIrFncy5f1TJEWPOyfmTsjxqrd13N/
	tS4katToNh3DkFdeVXBxhwv9VQ==
X-Google-Smtp-Source: APiQypLvUPYlWpdFuJarY8OcFKFWPVeAIgFq2fNXDm1m6Vu2D0JVDqedOLIgGzzcvawcazJfn7WBkA==
X-Received: by 2002:ad4:562e:: with SMTP id cb14mr557424qvb.249.1586990199699;
        Wed, 15 Apr 2020 15:36:39 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id z18sm14819009qtz.77.2020.04.15.15.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 15:36:39 -0700 (PDT)
Date: Wed, 15 Apr 2020 18:36:37 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415223637.withkxrpo3fuul37@chatter.i7.local>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
 <20200415172324.GH5265@sirena.org.uk>
 <20200415175548.h4tyddairbltmri3@chatter.i7.local>
 <20200415183248.GK5265@sirena.org.uk>
 <20200415192819.l4osqt6sxdlydbso@chatter.i7.local>
 <20200415201222.GM5265@sirena.org.uk>
 <20200415212102.22zfvequfcvprgbj@chatter.i7.local>
 <20200415214001.GO5265@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200415214001.GO5265@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 15, 2020 at 10:40:01PM +0100, Mark Brown wrote:
> > I think we can do --partial. Let me ponder how that can be done 
> > best.
> 
> That should work for me, and be able to replace my own thanks generating
> scripts which will make some of the people who get those mails happy!
> 
> One more issue - if I set b4.thanks-XX-template with a path based off ~
> then b4 won't expand the ~, it needs a fully qualified (or I guess
> relative, didn't check) path.

I implemented most of your feedback in the latest commit to master. We 
now always allow partial matching, but will give a warning that the 
message should be reviewed. You should also be able to pass remote 
branches to -b (remotename/branchname).

Please try it out and keep all the suggestions coming. :)

Best,
-K

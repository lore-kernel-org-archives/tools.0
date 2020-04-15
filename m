Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.24306.1586985665513057543
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 14:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FBWAei8l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id y3so19114719qky.8
        for <tools@linux.kernel.org>; Wed, 15 Apr 2020 14:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aeKYv8Shh4YO2Tb+jAtWen5WbKjackzsBedovjDAENw=;
        b=FBWAei8lNFnV7XcaOfOHJn40ianD5xw4Ud10sEyKL6PIZgX1j3U/hny3xfzk9/WayN
         JmLJIgW4APmFhu3ugYctBACxs4xyp5uqfBjjpL3p4Ov2ceexsWVi/S5KwD9y42F9mi2Y
         SDCokQaO8TGEOQ1Dd7Y6X+eqcEO9xKXRNUJGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aeKYv8Shh4YO2Tb+jAtWen5WbKjackzsBedovjDAENw=;
        b=RwPzOJNrPQ2vBJ6pE5X6gtiYHA2No6E/I0Xt3W95v1fv1vyir5+KLMLZUVcU+uSlui
         bXCaGWuhThutiI5OY8pw8DanafNoTe/H+CACFTThAaOtEn9QGlbIVaobS63UDiOCtC+a
         JGhWyNJPDtq+KTDfpa58FKtch5/A6mC6fczMhXl3QyjxcmPB1XLaNri55vT6AvuzORj6
         7YAm/B9mnBkS3OR8PJCV9uy9Kzfn3/QYWIjTqeAzR3ghtWt46geaOG75QdfmX8Tgza4D
         ocSRBCBvb5Nfs+/UU0Ojq+isubdGg6sVBNS2/BX7MfiLgXV0vSuKmxak+jDzzZcbZDjU
         RoUA==
X-Gm-Message-State: AGi0PuYUZx3S+Ay0bOhV7hf2dWjA10UwqODWgHOmAT5q6JMwlHDgZfX6
	EKNUoAndRdG7ActDBT9qhv0+Rw==
X-Google-Smtp-Source: APiQypJmuCP+o9ldSfIQkZqwIozlFxafmZqDFN00v2vjQOzSl/rVmpWPF1LIGvfT5LMj2Ep0b36LKw==
X-Received: by 2002:a05:620a:15ba:: with SMTP id f26mr13147895qkk.273.1586985664568;
        Wed, 15 Apr 2020 14:21:04 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id m7sm5388016qke.124.2020.04.15.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 14:21:03 -0700 (PDT)
Date: Wed, 15 Apr 2020 17:21:02 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415212102.22zfvequfcvprgbj@chatter.i7.local>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
 <20200415172324.GH5265@sirena.org.uk>
 <20200415175548.h4tyddairbltmri3@chatter.i7.local>
 <20200415183248.GK5265@sirena.org.uk>
 <20200415192819.l4osqt6sxdlydbso@chatter.i7.local>
 <20200415201222.GM5265@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200415201222.GM5265@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 15, 2020 at 09:12:22PM +0100, Mark Brown wrote:
> > Yes, we always expect there to be a N,N in that output, which isn't 
> > true in a number of scenarios (like a commit that creates a new file 
> > with only one line).
> 
> > The latest master should properly deal with this situation (as well as 
> > when a patch deletes all lines from a file).
> 
> Did you forget to push...

Haha, classic. Yes, it should be there now.

> I also noticed a couple of other issues.
> 
> One is that if I try to specify a remote branch with 'b4 ty -s all -b
> remote/foo' or whatever b4 doesn't think the branch exists.  I'm doing
> this because I want to be sure I only send out thank you mails for
> things that actually got pushed successfully (in the past I've found
> people get confused if the thanks arrives and they can't see the
> published commit).  It needs a --remote on the git branch command line.

Right, we're only paying attention to local branches right now. I'll 
poke to see what needs to happen to work for remotes.

> The other is that if I don't apply all of a series then b4 ty will
> refuse to generate anything with no way I can see to override. 

I think the master has a change for that as well -- try that out.

> This
> happens a fair amount when people do things like send a new driver along
> with a DT update.  Perhaps an option to allow partial lists (though I
> think that might need more complex templating), or one to generate
> per-patch thanks messages?

I think we can do --partial. Let me ponder how that can be done best.

Thanks,
-K



Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.20101.1586973352650139641
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 10:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fa/k7U3Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.53, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f53.google.com with SMTP id da9so550025qvb.3
        for <tools@linux.kernel.org>; Wed, 15 Apr 2020 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HAQq9qpbzJYyWnAhEfhYgHxlcdcx2KVloSoLmYn6yOo=;
        b=fa/k7U3QWE4L2JbQPvrgdcJOSEX2jC7lM7fZwEMMgf86H94K0exUVCz01Ja6Xr51Vc
         IbS7JwcTGx/gphxXHqJl5914eWLpXCKCUzlse+2sP58ilhZY6NGgtAjpCihnPbqr5yy+
         SfVaHrXGedIjKGW0R3M28AgKOwbuRItweBcHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HAQq9qpbzJYyWnAhEfhYgHxlcdcx2KVloSoLmYn6yOo=;
        b=Bo/P/NPAeeCtfhYA7j+xtvrYHfZwpTWvGhVO5bkZQcjKJVsvpWXG4hRWWD4RqJXyOG
         pJScKTBEr8nYMhaTdq2/b1RSQ0fl/6wFeeF/r2aj5HkeCEkd6jxyE3WDx1XPe36Zpeuy
         jNyhmZhFSa4aYDnKue7wxFrL6KMLb9eR9Q1MaKBxEbjbaMi8eFuaeOGDmmKJbBaMUgvU
         nLPg+5ce4DURWAmzppFxBMBgv5mrTP8w4K+yu5GqV1DHZgn4WuwAU9RK5BeQuyeLi0mN
         acfcW3eYMZaBxMoVdD4jNm3hr+w9nm+20V5PWF9A/sF3yo1g6cRpbWQWAouG8jLTgKXU
         0Cfg==
X-Gm-Message-State: AGi0PuYcMvN9H7ywTxwWYV76uW0uORX6YIT5pr4Y3A6TVO2bmd6LivV7
	s4lCg+G9sdz45fn2DFwn35niOw==
X-Google-Smtp-Source: APiQypJmS3A59soqCccWdBwbkzxPNLf51PmCTk+jxO0azxcwNWOiWy7jMR9Lfa/aMA9qpmBE8RbJUw==
X-Received: by 2002:ad4:4507:: with SMTP id k7mr6080341qvu.40.1586973351098;
        Wed, 15 Apr 2020 10:55:51 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id c27sm13909926qte.49.2020.04.15.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:55:50 -0700 (PDT)
Date: Wed, 15 Apr 2020 13:55:48 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415175548.h4tyddairbltmri3@chatter.i7.local>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
 <20200415172324.GH5265@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200415172324.GH5265@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 15, 2020 at 06:23:24PM +0100, Mark Brown wrote:
> > I think I just forgot to add "all" handling to -s. :) It's fixed 
> > now.
> 
> That seemed to work however I immediately ran into:
> 
> Generating 1 thank-you letters
> Traceback (most recent call last):
>   File "/home/broonie/git/b4/b4/command.py", line 198, in <module>
>     cmd()
>   File "/home/broonie/git/b4/b4/command.py", line 182, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/broonie/git/b4/b4/command.py", line 60, in cmd_ty
>     b4.ty.main(cmdargs)
>   File "/home/broonie/git/b4/b4/ty.py", line 501, in main
>     send_selected(cmdargs)
>   File "/home/broonie/git/b4/b4/ty.py", line 411, in send_selected
>     send_messages(listing, cmdargs.gitdir, cmdargs.outdir, wantbranch, cmdargs.since)
>   File "/home/broonie/git/b4/b4/ty.py", line 321, in send_messages
>     signature = '%s <%s>' % (usercfg['name'], usercfg['email'])
> KeyError: 'name'
> 
> git itself manages to figure out my name from passwd.

Good to know. I committed a change that will do the same.

> 
> > > It would be good if there was an explicit command for this, it'd be
> > > useful when scripting stuff I think and also when testing things out.
> 
> > Eventually, the plan is to look into gitconfig for "sendemail" 
> > configuration and use that for sending out email directly. For the 
> > moment, you can achieve similar results by passing "--confirm=never" to 
> > git send-email, which should just send the emails out.
> 
> That's the opposite of what I'm asking for - what I meant to say was
> that I find the current behaviour useful and it'd be good to keep it
> around even when b4 can send directly.

Ah, right, we'll probably always default to just writing out the thanks 
files and will only send when specifically told to do so -- i.e. exactly 
what you're looking for.

> > I found a few more problems while testing things out, which 
> > highlighted the need to use more forgiving patch hashing routines. 
> > Since I was planning on integrating b4 with some of the patchwork 
> > automation functionality in the near future anyway, I switched the 
> > tracking routines to use patchwork-compatible patch hashes. 
> > Unfortunately, this means that --auto will fail to properly work 
> > (since we changed the hashes we use to track them). Things should 
> > still work with "b4 ty -s", as we do matching by subject there when 
> > exact patch hashes fail.
> 
> I think there's still some issue, not sure what triggers it but it seems
> to happen with explicitly specified messages too.  Do I need to clear
> out some local database?

No, this means we're getting an output that I'm not expecting. Could you 
please rerun that as "b4 -d" to enable debug output? Right before it 
crashes, it should print out a line like this:

Running git --no-pager diff ...

I'd be very interested to see the diff that is produced by running that 
command (specifically, the @@ @@ lines). That code currently expects to 
always have lines added and lines removed, but that appears to be the 
wrong expectation and I need to fix that.

-K

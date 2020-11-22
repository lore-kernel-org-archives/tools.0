Received: from smtp.outflux.net (smtp.outflux.net [198.145.64.163])
 by mx.groups.io with SMTP id smtpd.web08.22433.1606067486170534038
 for <tools@linux.kernel.org>;
 Sun, 22 Nov 2020 09:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outflux.net header.s=2016010 header.b=JoZ0YkVp;
 spf=pass (domain: outflux.net, ip: 198.145.64.163, mailfrom: kees@outflux.net)
Received: from www.outflux.net (serenity.outflux.net [10.2.0.2])
	by vinyl.outflux.net (8.15.2/8.15.2/Debian-10) with ESMTP id 0AMHpO2t001819;
	Sun, 22 Nov 2020 09:51:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=outflux.net;
	s=2016010; t=1606067485;
	bh=gUxwE6miSOvbVEUW0mEkFx2Zt9nBNwikB0aFSV6XAog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoZ0YkVpySklYvXBp0to1Hr+iI3DzLLem304xnB3+HfzPyGGSMoPb0zNZJJXOTSZb
	 V5rw4jnc2x0vg9AfHjTv+06hCh32ZKTaJptPvvtGi6XgPfhN2jYvhK6mn2x4vgIKi3
	 KTAYbzpJSXQc+npuqQsyEppZCh1qEBeJaNCNOWO0=
Received: by www.outflux.net (Postfix, from userid 501)
	id ABECC62716; Sun, 22 Nov 2020 09:51:24 -0800 (PST)
Date: Sun, 22 Nov 2020 09:51:24 -0800
From: Kees Cook <kees@outflux.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4: DKIM verification available
Message-ID: <20201122175124.GA5416@outflux.net>
References: <20201120221530.mfwn72nr6lqr2qqs@chatter.i7.local>
 <20201122002808.GA20499@outflux.net>
 <20201122173859.mueoi5o7p4x53cx5@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201122173859.mueoi5o7p4x53cx5@chatter.i7.local>
Organization: Outflux
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MIMEDefang-Filter: outflux$Revision: 1.316 $
X-HELO: www.outflux.net
X-Scanned-By: MIMEDefang 2.83
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 22, 2020 at 12:38:59PM -0500, Konstantin Ryabitsev wrote:
> On Sat, Nov 21, 2020 at 04:28:08PM -0800, Kees Cook wrote:
> > On Fri, Nov 20, 2020 at 05:15:30PM -0500, Konstantin Ryabitsev wrote:
> > > I'm gearing up for b4 0.6.0, which adds a handful of new features around 
> > > attestation. Specifically, it enables DKIM verification if the required 
> > > library is available. It used to be a futile exercise due to almost 
> > > every mailing list breaking it in terrible ways, but vger now properly 
> > > preserves headers so that DKIM signatures verify nearly all the time.  
> > 
> > Nice! This works for me.
> > 
> > I wanted to look at X-Patch-Sig verification too, but realized I couldn't
> > actually search lore for an arbitrary header to find an example. And so
> > I went to the lore git, and from a worktree, I found no one using the
> > new b4 GPG attestation yet ("git log -S X-Patch-Sig").
> 
> Well, it's not in any released version yet, so it's not surprising. :) 
> You can test it on some of my bogus series posts:
> 
> b4 am -o/tmp 20201120212731.1645654-1-konstantin@linuxfoundation.org
> 
> The 0.6 release will only support mode=pgp in addition to plain DKIM.

Excellent!

> 
> > (I was hoping to have my own series up to use as an example, but I
> > mucked up the order of operations. Next one should include it, 
> > though!)
> 
> Basically, you just run "b4 attest *.patch" before running "git 
> send-email". You can actually do this via adding the following to 

Yeah, that's what I discovered (I hadn't realized it had switch to using
injected headers).

> .git/hooks/sendemail-validate:
> 
> #!/bin/sh
> /path/to/your/b4/b4.sh attest $1
> 
> I'll add documentation for this before 0.6 is out.

Ah, nice; that's cleaner than what I was doing.

> Thanks for willing to be my test subject. :)

Thanks for writing all this! :)

-- 
Kees Cook                                            @outflux.net

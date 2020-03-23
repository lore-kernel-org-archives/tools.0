Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [66.63.167.143])
 by mx.groups.io with SMTP id smtpd.web10.54834.1584975837064212246
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 08:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=R0iXnIIr;
 spf=pass (domain: hansenpartnership.com, ip: 66.63.167.143, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id EF7EE8EE15F;
	Mon, 23 Mar 2020 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1584975836;
	bh=0KE7dtl+lQnwHzF+zfDLHseW6WsmlAO73xRSeT+mVRE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=R0iXnIIri6I6/eGAPeX4NAt5L2gUPyzHSadhwK/eoMXKeqi1qnsnbcL2TCeynPKtr
	 PGb0154BZ1YUzmV8YR+qpbb7JFC9TUNzJRUjvznz95bp9GBwWlnRI+42R5v2076fd+
	 FnCDPJlu9Qx/xLlXRfCXIuVLgEGcqShJwM41uquw=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpB2sFv6h0Ns; Mon, 23 Mar 2020 08:03:54 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A8CF38EE0FC;
	Mon, 23 Mar 2020 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1584975834;
	bh=0KE7dtl+lQnwHzF+zfDLHseW6WsmlAO73xRSeT+mVRE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Wll7XX46qGu4suzb/0S9PkyduWN6Lb6E9pNpIr3/jnv9cVK+j8hOvXS/S/9XVP3SF
	 1Ci5a6RYHFShoexm4R9ozcOoUFKle5d8U1+gsvxocCcHmn7+rt9lNeJVtOYj/J7msl
	 ToeXGqJ3RniCymsEH7I2yrSIG66UEis3KGfCMwCs=
Message-ID: <1584975825.3780.15.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] Pip dependency problem with b4
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Date: Mon, 23 Mar 2020 08:03:45 -0700
In-Reply-To: <20200323150003.owxg3xhwtgc7pzap@chatter.i7.local>
References: <1584974859.3780.10.camel@HansenPartnership.com>
	 <20200323150003.owxg3xhwtgc7pzap@chatter.i7.local>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-23 at 11:00 -0400, Konstantin Ryabitsev wrote:
> On Mon, Mar 23, 2020 at 07:47:39AM -0700, James Bottomley wrote:
> > This is on a vanilla ubuntu 19.10 system with a fresh
> > install.  After
> > doing
> > 
> > apt-get install python-pip
> > pip-install b4
> > 
> > I get this
> > 
> > jejb@amdmilan1:~/git/linux-build$ b4 --help
> > Traceback (most recent call last):
> >   File "/home/jejb/.local/bin/b4", line 6, in <module>
> >     from b4.command import cmd
> >   File "/home/jejb/.local/lib/python2.7/site-
> > packages/b4/__init__.py",
> 
>                                 ^^^^^^^^^
> Sorry, please use python 3.

I can fix it manually, but pip should have said ... it does for most
other packages.

james


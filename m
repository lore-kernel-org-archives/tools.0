Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD53FC3
	for <tools@linux.kernel.org>; Fri, 10 Sep 2021 16:06:57 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso2892110otp.1
        for <tools@linux.kernel.org>; Fri, 10 Sep 2021 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pKkYWyPmUbQUTkBEajZxM0HZG/egd2PIcpavfQtjsqM=;
        b=D+4zuoV55F9vgp6yJP/xSH8Kod1/KS50YrR2GAds0M1NoTkrE1XjLk+ver8UXBiigv
         xyPhN8cAwtQPTYM8BsYgkT8N6vgsNUgEpdnQVxfc2B8jdVZZ8R0r3/HFSEHLiT5Yg9JX
         Tq0aPHCDQc4/vmQtTdPeATZxQICAu4HgJhob3Q/mnyifMLm+u3gAyeTWQuBEi0YG1tuy
         d5tlaeKBS+vQbbiBGQOwJZRCZ6lVXI2H1Nclb9+0A0H67aspl+kWwVGUPr3793FmqYRQ
         TUIXZ9Y0mXXXUU13wPLC3JYO99L5JVaaVmtE1FiCqVw9XPXvTY25HqX8DbZCQLlxf9ef
         lOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pKkYWyPmUbQUTkBEajZxM0HZG/egd2PIcpavfQtjsqM=;
        b=s4nIRP+SwPr4QPwHHsRn2mk+VK7Lw728F9MO2OhX1ImY0vmRVSH7fBs5gWincLmQ4E
         +kz4zuf9K+J+WGwMco+fLsafa2iBiNpX50K+rkRhnON+Axzs2GSOr+FF6B3v9itufGvn
         +xwpRvo/eIJsAIA9r3X2yARXJbCsxyoJsd/h91WKAaexiZxcZNs9eGUhQWenFAodbsTI
         V0VB5lBd5wfNMokmh16dC9nNxK3n0j9FaAtxTekPmdhFIXmEW7G/iN9V/w5iMKCOdiK6
         CmlyiNoDvXrlK2z0lYl6nWnzRCTQjh8L0HIbgBAAgW/M8ArvOVGt59ReMoyafN9onkuP
         Wt2A==
X-Gm-Message-State: AOAM532a3CqzSZ9HOocMOokc7jTOB/bz6/XFg/F/HJgDyuR//XfOr3oD
	v69fTmyYlOo4PM2fIqDg5DnGxw==
X-Google-Smtp-Source: ABdhPJyMSX2WldWYQN8FZbkK/MYZNTAkQBmTD+ReAhZO4JkS9w/PTl3BAKOe6hZILRvOJpglEbEmcw==
X-Received: by 2002:a9d:7c97:: with SMTP id q23mr5327595otn.136.1631290016163;
        Fri, 10 Sep 2021 09:06:56 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a13sm1252936ooi.3.2021.09.10.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 09:06:55 -0700 (PDT)
Date: Fri, 10 Sep 2021 09:07:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Greg KH <greg@kroah.com>
Cc: Lee Jones <lee.jones@linaro.org>, Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YTuC2Og65gtLxsQ/@ripper>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <YToPeUhL+Ro3zlnq@kroah.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YToPeUhL+Ro3zlnq@kroah.com>

On Thu 09 Sep 06:43 PDT 2021, Greg KH wrote:

> On Thu, Sep 09, 2021 at 02:32:25PM +0100, Lee Jones wrote:
> > On Thu, 09 Sep 2021, Steven Rostedt wrote:
> > > On Wed, 8 Sep 2021 14:37:46 -0400
> > > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > > 
> > > > > Can we represent LKML on Patchwork as a reasonable alternative?  
> > > > 
> > > > No. That said, what I'm currently working on is a way to provide query-defined
> > > > public-inbox sources. If you can define what kind of patches you are
> > > > interested in as a lore.kernel.org query, we can save that search and feed
> > > > *that* into patchwork. So, instead of feeding all of LKML into patchwork just
> > > > for the few patches you're interested in, we can just feed the subset of
> > > > patches that you actually want.
> > > 
> > > This is basically what I have done locally. I set up a local instance of
> > > patchwork. Added a procmail filter to copy all my emails with "PATCH" in the
> > > subject into its own folder. Then I have a cron job that runs the following
> > > script to add "List-ID: <rostedt.inbox.com>" to these emails, as my local
> > > patchwork "listens" to the "mailing list" called "rostedt.inbox.com". And
> > > then send them off to my local patchwork instance.
> > > 
> > > #!/usr/bin/perl -w
> > > 
> > > my $state = "none";
> > > my $patch = 0;
> > > 
> > > while (<>) {
> > >         if (/^From /) {
> > >                 $state = "head";
> > >                 $patch = 0;
> > >         } elsif ($state eq "head") {
> > >                 if (/^\s*$/) {
> > >                         print "List-ID: <rostedt.inbox.com>\n" if ($patch);
> > >                         $state = "body";
> > >                 } else {
> > >                         if (/list-id/i) {
> > >                                 next;
> > >                         } elsif (/^Subject.*patch/i) {
> > >                                 $patch = 1;
> > >                         }
> > >                 }
> > >         }
> > >         print;
> > > }
> > > 
> > > 
> > > This works great for me, but I can imagine if people have their own public
> > > inboxes, where we can just create a patchwork instance that feeds off of
> > > these inboxes, I believe you will get the same functionality that I have.
> > > 
> > > Note, I also have filters to read patches that have "[for-next]" and
> > > "[for-linus]" which converts the patches in patchwork from "New" to "Under
> > > Review". Then I have a subscription to all commits that go into Linus's
> > > tree, and I process all of them to go through and "Approve" any patch that
> > > it finds.
> > > 
> > > I still would love a way to download patchwork offline, where it loads
> > > locally all pending patches, and lets you review / apply them locally
> > > without needing to be connected online, as this would be useful during
> > > flights. Then when you land, you can upload your changes.
> > 
> > Well, as beautifully inefficient as that all sounds, it might be
> > slightly less time consuming if I just succumb to peer pressure and
> > switch pwclient out for b4.
> > 
> > Thankfully, my use-case is much simpler than Steven's.
> > 
> > In my current implementation, I have pwclient pull down the patch,
> > apply my SoB and apply the it, all in one foul swoop:
> > 
> >   pwclient git-am -p ${project} -3 -s ${pwid}
> > 
> > Does b4 provide this functionality too, or do I have to script around
> > it?  How have other's chosen to automatically apply the downloaded
> > mboxes?
> 
> I do it from my mail client by piping the message to this:
> 	b4 am -t -o - | git am -s
> 

The integration directly in the mail client is a really nice trick.

> which will download the whole series of patches, and acks and
> reviewed-by and apply them, and then apply them with git.
> 

Unfortunately when it comes to hardware platform enablement we do get a
lot of series that spans across multiple subsystems and we've seen
several examples where applying the whole series causes merge conflicts
down the road.

As this is very common in my inbox I've yet to migrate to b4.

Is this (pick a single msg) supported in b4, am I just missing something
in the documentation?

Regards,
Bjorn

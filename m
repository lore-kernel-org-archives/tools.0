Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211C02FAF
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 13:54:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i3so1422302wmq.3
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ezSFah1fhFETSylyByAef/+jDQhFzF0JAt9RlKyNx50=;
        b=nnVwuEFaZ9a/LqV40UKpYSgXT+db6dsZ/r0OCYCwbUpcE76K60gYfUHTQAAo6Cg68n
         9uZpvKe57ERaVW1Hq40wPB8AqNRDQL1MUfixMsoFun72tgmjJEHqGRx3y7qymsZKpHx1
         AwBOZ+4PAZjPuYiXxlN2bdW/RU57K7sr5COk4+gUR49lqybgIbMFR/D3kvJ64btqOhfJ
         4rOcq75Y5YTHeZVNdX73jP6rh8OQGeddWMGl8bkE4NXgG3ztOZW00rQ2W33Z+f7ylcCG
         +XF0WrcPXRZQJoX+hZuCh9XuyLle/0ibK1uH4pfHpGkoDx4xwSWQbnPSbj2rZXTBEJ2P
         40MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ezSFah1fhFETSylyByAef/+jDQhFzF0JAt9RlKyNx50=;
        b=JO9tb5Kn98ha3jgeALKkNGWrMdQmxFY5GaA1mO37qy9zXEOFDc6+biS8EIN+hTO/N/
         pb1zZ5hIPzrcxljBteAzcfOCGV6lYFlfYxOBLJaUerf4P6JFGKMStqix4BZnyepa7XzR
         llFFQH+GnSLIH6fsg9eLLi9nZ/VyM7+htzNqOqhf0KuQEPoOGLR3PsMlh6hDCrQSyYjl
         bHF4ObUOJWspJEfOlxwfh9S9UJlWb/sq/brfjBT7bvr3CSPCO9Uj9ZDe6SVoi60TJ5YR
         rsJHUiuWScuq7cKy/xh9e1scDWq59wQMRGzAbR+9eFGFzzzZft4+MV5rwSMSH7vtjvnk
         L63w==
X-Gm-Message-State: AOAM532mwoPoKhgEy7sqi9ry0A3grDjNprCDfdm+IIIdJJ9cHhZGS6F0
	bakEXTZDdC+CkuqWtZoeXuL9CA==
X-Google-Smtp-Source: ABdhPJwTNOxalthrXk8BEOG5Nucs4YKchvXn9IbE+k9rTh4mSiMRKjKCMq8+r/+WnSfNO423wviT9A==
X-Received: by 2002:a05:600c:35c4:: with SMTP id r4mr3250048wmq.194.1631195645339;
        Thu, 09 Sep 2021 06:54:05 -0700 (PDT)
Received: from google.com ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id t17sm1804479wra.95.2021.09.09.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 06:54:04 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:54:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Greg KH <greg@kroah.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YToR+jmD1TgdQjXJ@google.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YToPeUhL+Ro3zlnq@kroah.com>

On Thu, 09 Sep 2021, Greg KH wrote:

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

Not sure what -t does:

  Apply trailers sent to the cover letter to all patches

> which will download the whole series of patches, and acks and
> reviewed-by and apply them, and then apply them with git.
> 
> I'm sure your email client can do much the same thing.

Right, but I don't want it to do that.

I operate using worktrees and have different Mutt keys apply patches
where required.  It's also very unusual for me to apply wholes sets of
patches, thus plucking patches one at a time make more sense as part
of my flow.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

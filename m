Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836802FB1
	for <tools@linux.kernel.org>; Fri, 28 May 2021 20:34:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E0D161248
	for <tools@linux.kernel.org>; Fri, 28 May 2021 20:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622234056;
	bh=5/MIjtch8neUgH/kDv/G9gUnoTDp7jvTpoHVYBqXYPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rCt37jbuKDBmZJlOLzubgVLqK0cz2remgc0uRo42dhaC5POVVKgoCMr20lady8cfa
	 K9j4sVEp9LDLXYOFeYeTmXAUeyY04NUXDdBtl+jTP8yaaRjYQGD+T2/BhvZBwUNmKQ
	 alnKzP0zJ6LA5RCE8kejdEiGH+8xKhC9a5nAuY4GmO+egXsyn2Abq3OPeGI9Wssmvi
	 o2o5UG1GsYvD6NqCkwNhFs8Mkvs1RygOt+ncPezqXtjm8OZhq+rhVGTMSzuruca17I
	 Q/ZoUdnxCjhS1Kx+N29XsV0ItpNH7wRcFHLH1+7qiZbBwIQp5+Xgvxyrg5Xucya3kR
	 YR1cdXkU6KRew==
Received: by mail-qk1-f177.google.com with SMTP id o3so5375373qke.7
        for <tools@linux.kernel.org>; Fri, 28 May 2021 13:34:16 -0700 (PDT)
X-Gm-Message-State: AOAM533R9rDnK6DEdpQNwL6nLkKU6ok+xtNGubUAfT8bOUGfmEgRtzSS
	bm5eIY7rhfM9K9zM3VtbdbMkXSHu3Q9JwfoSuQ0=
X-Google-Smtp-Source: ABdhPJwHQ/A8RCvVsXY6EO09oNVK61BSOCAaXLTwMK79LNsGN+Q/njeJOcoY9BKCRvH5RNOdIQLz+S7Po/N/1le9WYk=
X-Received: by 2002:a05:620a:22f3:: with SMTP id p19mr5748303qki.281.1622234055292;
 Fri, 28 May 2021 13:34:15 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
 <20210528193834.mwf6qvuw6wng7yoz@nitro.local> <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>
 <20210528195320.c2vbhfg3zj365ebw@nitro.local>
In-Reply-To: <20210528195320.c2vbhfg3zj365ebw@nitro.local>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Fri, 28 May 2021 13:34:03 -0700
X-Gmail-Original-Message-ID: <CAB=NE6WTiopsyy=yGrpaGECqP_m7ANhpCjDEtE+C1x-Jz1pqpA@mail.gmail.com>
Message-ID: <CAB=NE6WTiopsyy=yGrpaGECqP_m7ANhpCjDEtE+C1x-Jz1pqpA@mail.gmail.com>
Subject: Re: grokmirror and pi-piper for all emails on a list
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, May 28, 2021 at 12:53 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, May 28, 2021 at 12:46:03PM -0700, Luis Chamberlain wrote:
> > > Note, that if you
> > > configured pi-piper to reshallow the repository, you will need to unshallow it
> > > first (see the article you linked above).
> >
> > OK so do you mean that if I'm starting from scratch I should use the
> > shallow setting or make sure to not use it?
>
> If you're starting from scratch, make sure you don't use it, or set it after
> you're done passing everything through pi-piper.

OK so if starting from scratch, I should have:

shallow = no
Then I do a run of:

grok-pull -c ~/.config/lore.conf

Then in so far as the pi-piper.latest files I see the following. I'm
being verbose in case it helps others:

$ find .local/ -name pi-piper.latest
.local/share/grokmirror/lore/lkml/git/3.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/6.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/0.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/8.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/7.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/10.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/9.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/1.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/5.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/2.git/pi-piper.latest
.local/share/grokmirror/lore/lkml/git/4.git/pi-piper.latest

.local/share/grokmirror/lore/linux-fsdevel/git/0.git/pi-piper.latest
.local/share/grokmirror/lore/linux-block/git/0.git/pi-piper.latest
.local/share/grokmirror/lore/linux-btrfs/git/0.git/pi-piper.latest
.local/share/grokmirror/lore/linux-xfs/git/0.git/pi-piper.latest

To not bother with epocs 0-9 of lkml, I just only edit then
.local/share/grokmirror/lore/lkml/git/10.git/pi-piper.latest to say
the first commit in that repository which is commit
82004facc255acc1b43a1d76ff6d6b7109ae64c8 ("Re: [PATCH -next]
dmaengine: sprd: Add missing MODULE_DEVICE_TABLE"), dated Mon May 10
19:46:24 2021.

Respectively I also set:

.local/share/grokmirror/lore/linux-fsdevel/git/0.git/pi-piper.latest
to commit 410a6ae1bea0eb6f1f932f5777ea5bb38d7fc953 ("2 messages
0621DbFD0--9") dated Wed Jun 12 15:56:20 2002 +0400

.local/share/grokmirror/lore/linux-block/git/0.git/pi-piper.latest to
commit 6f9146953e5e451dadd9bf0d926a44a088120528 ("[PATCH 25/47] nvme:
don't take the I/O queue q_lock in nvme_timeout") dated Fri Nov 20
17:35:20 2015 +0100

.local/share/grokmirror/lore/linux-btrfs/git/0.git/pi-piper.latest to
commit 7b8de12fa160a681c63e6572f1884b2cbc541260 ("Re: Checksums and
self-healing roadmap") Tue Apr 1 13:41:15 2008 -0400

.local/share/grokmirror/lore/linux-xfs/git/0.git/pi-piper.latest to
commit to commit e13ad025a1b542993b0b2f2e4e4125aeb13e6717 ("TAKE
954366 - prep for i_blksize removal") dated Mon Jul 17 20:46:51 2006
+1000.

I finally now do a second run:

time grok-pull -c ~/.config/lore.conf

And, indeed I see it now chugging on procmail doing all the emails.
Indeed, I can see this is going to take a while. If only mail
processing was parallelized :) Thanks for all this!

> > > Also of note is that the upcoming "lei" tool from public-inbox is going to be
> > > a much more robust approach to doing what pi-piper does. I really wrote it
> > > mostly so we could feed lore lists into patchwork. :)
> >
> > Whoa, ok so, before I go on raving about this, I should wait instead
> > and rave about lei later?
>
> You can use lei right now if you like -- I believe it is fairly stable.

Where do I find such a treasure?

> I believe the docs are still pretty thin, though, and may require newer sever
> deployments than what is currently running on lore.kernel.org.
>
> I'm supposed to be giving a talk on lei, lore and b4 at the plumbers
> conference this September, so I'm hoping that everything will be in a better
> position to "just work out of the box" closer to that time.

Neat! I'll look forward to the recordings!

 Luis

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1F56D0E
	for <tools@linux.kernel.org>; Fri, 28 May 2021 19:46:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A649E61358
	for <tools@linux.kernel.org>; Fri, 28 May 2021 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622231175;
	bh=Smg69+5nYaG8QwWNEUPrB+T9EfIGSylQqBouNWUQ0hs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HPKQylgmTktREAn8pGDuV+kF4qbX0Cdfkm5PjpFit4NBl0LNHtbs8uiQ3TmjX0cWG
	 O+ghx9HoLu7ZLgwsJuM6nEuYu66+E9VQRm0OPQ2RvD5Hj7/iEenrZQ7Her5p4k63Ed
	 9ByyDDiG71JAG1uwl1BN61JHXkRptgoBZMkj4mS/2KHbl9Nf8ObJdurAWBuRr6/uMq
	 0bKxR+oGrHMXSddsZW93pcIlCkH5vdfkzVWosH+nkcQ2GuO7jIgJxqumWIsoJAlr8V
	 /hAkbkXCAhY7CuO096QKxMt9MAW8M9j0ZLeFJyHCcDOhmeASPMtWwbAHU4lKvbJKZj
	 CUJrAjc56K0Pw==
Received: by mail-qk1-f169.google.com with SMTP id 124so5230372qkh.10
        for <tools@linux.kernel.org>; Fri, 28 May 2021 12:46:15 -0700 (PDT)
X-Gm-Message-State: AOAM532ltn2NcmWVgzTf7l3ndb9gDS/FXZPJEpMhP5KrqafKEWl3dd2r
	zhq9VHoei5TNCfTYLGBNrckBJDLEWasycSKNAvY=
X-Google-Smtp-Source: ABdhPJzePjmaQLAXFdbfF3AEg/nzsEL8yK6hkins3LisldaL4puAqWYbr+WJbTuW4iPuceqXa3to3R26ju32enIO7nQ=
X-Received: by 2002:a37:ef17:: with SMTP id j23mr5602963qkk.392.1622231174901;
 Fri, 28 May 2021 12:46:14 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
 <20210528193834.mwf6qvuw6wng7yoz@nitro.local>
In-Reply-To: <20210528193834.mwf6qvuw6wng7yoz@nitro.local>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Fri, 28 May 2021 12:46:03 -0700
X-Gmail-Original-Message-ID: <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>
Message-ID: <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>
Subject: Re: grokmirror and pi-piper for all emails on a list
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, May 28, 2021 at 12:38 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, May 28, 2021 at 12:14:56PM -0700, Luis Chamberlain wrote:
> > Dearly super-duper admins,
> >
> > I just read for the first time:
> >
> > https://people.kernel.org/monsieuricon/subscribing-to-lore-lists-with-grokmirror
> >
> > And I am extremely excited. After trying it, it seems to work great!
> > Just one thing, say I want to actually get all emails on the archive
> > to be run through .procmail, how do I do that? So that it would seem I
> > subscribed to a mailing list from the very beginning? It would be cool
> > if I could do that per mailing list. For instance, I want to enable
> > that for all my mailing lists except lkml.
>
> In each repository, you will find a file called pi-piper.latest. If you set it
> to the hash of the very first commit, the next run of pi-piper will replay all
> of the messages (may take ages, you've been warned).

Groovyness!

> Note, that if you
> configured pi-piper to reshallow the repository, you will need to unshallow it
> first (see the article you linked above).

OK so do you mean that if I'm starting from scratch I should use the
shallow setting or make sure to not use it?

> Also of note is that the upcoming "lei" tool from public-inbox is going to be
> a much more robust approach to doing what pi-piper does. I really wrote it
> mostly so we could feed lore lists into patchwork. :)

Whoa, ok so, before I go on raving about this, I should wait instead
and rave about lei later?

  Luis

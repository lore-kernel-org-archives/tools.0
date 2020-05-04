Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.18326.1588633482541916393
 for <tools@linux.kernel.org>;
 Mon, 04 May 2020 16:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=sTp0D5Ze;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 01E752075B;
	Mon,  4 May 2020 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588633482;
	bh=HE3a/Awq0cKJQQd2+l2ktIP4TYXkD+ZE5kHWJOTCplM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sTp0D5ZeVHdAzN3X8zLcD/Cae49F6C+8i85HkkUNdDGLAcFKREecdgzXWq6YmsoWq
	 pbCFK/zrnMFHWZHCkYUtNLrSSzVPwThMIDkTf5WazlWgSdByN2xfdjIHWKtuLqM0z3
	 VnAUef0G+bfXj8JXBhdkhttbaFRfX1ioLJkUH6+M=
Received: by mail-ot1-f50.google.com with SMTP id g19so62639otk.5;
        Mon, 04 May 2020 16:04:41 -0700 (PDT)
X-Gm-Message-State: AGi0PuYR84r10dHNRmDDe/zspPGFFKNoCbhRmc4qBRH0P3gkl3DSdq0u
	43Rl1P1eNMHCz6HjmmSHUmvqWl9z5E7FH/9iNQ==
X-Google-Smtp-Source: APiQypKxmEzY5nOmVok9fPDcva/CjWzmo5BnWKkOS2MoA4VeTLRhSEbZAyxn5CJUkFE0/LsaKQ2muihml4tK4VrkgOo=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr15266058otn.107.1588633481211;
 Mon, 04 May 2020 16:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com> <20200504200321.lk72ymlmluu2tsgt@chatter.i7.local>
In-Reply-To: <20200504200321.lk72ymlmluu2tsgt@chatter.i7.local>
From: "Rob Herring" <robh@kernel.org>
Date: Mon, 4 May 2020 18:04:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKDF8w9EEPKxMtyysEK9Ow=CEx6yH=LcWpk+LHK=EkwvA@mail.gmail.com>
Message-ID: <CAL_JsqKDF8w9EEPKxMtyysEK9Ow=CEx6yH=LcWpk+LHK=EkwvA@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, May 4, 2020 at 3:03 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, May 04, 2020 at 12:09:49PM -0500, Rob Herring wrote:
> > >
> > > - When a series is missing patches, b4 is now able to backfill them from
> > >   other mailing lists tracked on lore.kernel.org. This feature will be
> > >   improved when public-inbox is able to collect a thread from across all
> > >   sources.
> > > - If both patch and metadata are identical between rerolls (v1 -> v2),
> > >   b4 will automatically carry over trailers from v1 to v2. This is handy
> > >   if there is an sob on [PATCH v2 7/15] from a maintainer that is
> > >   missing from an identical [PATCH v3 7/15]. In my observation, this
> > >   happens very rarely, though.
> >
> > This is pretty common actually. At least common enough that I do a
> > check for this and have a semi-automated reply for it.
>
> All three things have to be exactly the same:
>
> - subject
> - commit message
> - patch contents (to the last bit)
>
> The series must also be within the same thread, so if v2 is posted as a
> separate thread to v1, then this won't trigger.

Ah, that's why you don't see much. I think that's the exception at
least for what I see. I know I've seen maintainers asking for new
versions to *not* be threaded. I don't recall any asking for
threading. I'd guess a majority don't care. To quote
submitting-patches.rst:

"However, for a multi-patch series, it is generally best to avoid
using In-Reply-To: to link to older versions of the series."

My current check just looks for matching $subject and my tag. Adding a
PW diff hash check would be a good addition because my current
checking is manual.

> I ran quite a few tests on series being posted to LKML, and there was
> maybe one instance where the trailer to a single patch ended up carried
> over between revisions.
>
> > I worry that automatically fixing it silently will create yet another
> > case of tribal knowledge of maintainer practices/requirements for
> > submitters. Maintainer A using b4 doesn't care if tags are added, but
> > Maintainer B does care and gets grumpy. We need the tooling to promote
> > that submitters should add these tags as that is what works in either
> > case. It would be useful if b4 provided just the check as a separate
> > command/option for integrating into maintainers tools or maybe
> > submitter tools like checkpatch.pl.
>
> I see it as a case of "what you get is what was meant" -- if someone
> sends a trailer to a specific patch, and that patch didn't change at all
> between revisions, then we can safely assume that the author's trailer
> can be carried over to the new series revision. In your example,
> "Maintainer B" shouldn't get grumpy, because they should be doing the
> exact same thing anyway -- the reviewer has already sent their feedback
> about that patch, so it's the maintainer's duty to carry it over across
> revisions. In fact, many submitters already include previously received
> trailers with the new series revision, so I would argue that b4 isn't
> doing anything the maintainer wouldn't be doing in the first place.

If the previous version is sitting right in front of me in the same
thread, then yes I might remember tags on prior versions. Otherwise, I
don't remember what happened last week.

The accepted rule is the submitter should apply the tags when
submitting a new version. That's why many times they are already
included, but the question is what to do when not included. The
tooling for submitters should tell and/or help them to do things
correctly, and maintainer tools should verify and educate.

> > More generally, as I've started to integrate b4 into my workflow,
> > there's a couple of useful pieces of functionality already in b4, but
> > not exposed directly on their own. It would be nice to have both
> > porcelain and low-level commands.
> >
> > It would help for scripting if 'mbox' stdout was just the mbox file
> > name similar to git-format-patch output and send the rest to stderr.
> > While I have message-id and can construct the mbox name, there can be
> > some transformation on it.
> >
> > It would help if the old versions of a series could optionally be
> > included in the mbox output.
> >
> > Can the lore search code in get_newest_series be exposed as a command
> > taking a search string and outputting an mbox? Essentially, what the
> > lore web interface does with a search box and 'mbox.gz' button (I
> > tried and gave up doing that with curl).
>
> A lot of search stuff is currently very kludgy in b4 (e.g. we're abusing
> RSS search feeds for it). The situation will be very much improved once
> some of the necessary changes are implemented on the public-inbox side
> of things:
>
> - unified search across all mailing lists
> - ability to reconstitute a thread from multiple lists/sources
> - proper query and subscription API
>
> Looks like these features will be landing in public-inbox some time in
> the near future and that would vastly expand what we can do with
> search-based queries. I'd rather wait for that to happen instead of
> creating more kludgy RSS abuse.

Okay. I can identify with wanting to push features into an upstream
dependency. ;)


Rob

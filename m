Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.14715.1588622605279786041
 for <tools@linux.kernel.org>;
 Mon, 04 May 2020 13:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IyYa5hGZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f193.google.com with SMTP id t3so18757qkg.1
        for <tools@linux.kernel.org>; Mon, 04 May 2020 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tF5vdkQdQghPvOtDTSgp5jdFH4gePCxmgC5JA4ls4n4=;
        b=IyYa5hGZpqF6lAQFOhCL/jN84/XzJEwZrDwtnCUz8+1pI7dnGuSrKFWmZt1qI2DvoN
         Egt8muUqXvTgqTnYhUgHorCMoh7K0jqMyVtXPQ6oxve9gV7g3OPZ2DDrbeziqCbjZNXz
         mMhDLR3hS5qMySNmyp8M5v03U7bHO+yI8idMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tF5vdkQdQghPvOtDTSgp5jdFH4gePCxmgC5JA4ls4n4=;
        b=eCck3mnhrmjCw6hZaAWoMD084aRVPMPXBC3VMI1EfIL428MgN464550FJPnzQjcyC0
         NsLqOk8kEys5Qs2hac39B2UR5f8CQpBsOe/SOPwGmZcLvr+MMyjlQ1yB/AycBATFxC6Z
         t7r0tje14FgrJhb/c0A7V0JiUNW3QqHWXL9orU/Wq+5wMSmqDNbCHgNIYWuSpnNUonXz
         asaWIXMfITysWJKz8PoVjMJBfm9NjFUaeheKKR4i3ma+DNjBPm+bd3XEqX4OpdhEAYWU
         BgDWS1g/evpAnnD6q9OaYuocIjagAbRNYx87+qQ68QCgThaT5VHJeymqMGg5zF3yiZR5
         Z8sQ==
X-Gm-Message-State: AGi0PuYLYb/pAlFhGDZqlEZ7FBdxz4z0vV8mn8Y3VDHE+G6srqZonYhm
	607grTbrOvIoLUmBUZDJH7AONA==
X-Google-Smtp-Source: APiQypKHfyTE76j009lcpnRcOQ2xrk6fCJcmproZj7VT5A6yVUYxl+ZC6vO9CbOmt9sY08JvmDYrTA==
X-Received: by 2002:a05:620a:2143:: with SMTP id m3mr57412qkm.140.1588622604303;
        Mon, 04 May 2020 13:03:24 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id s14sm12198175qts.70.2020.05.04.13.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 13:03:23 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 04 May 2020 16:03:21 -0400
Date: Mon, 4 May 2020 16:03:21 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
Message-ID: <20200504200321.lk72ymlmluu2tsgt@chatter.i7.local>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 04, 2020 at 12:09:49PM -0500, Rob Herring wrote:
> >
> > - When a series is missing patches, b4 is now able to backfill them from
> >   other mailing lists tracked on lore.kernel.org. This feature will be
> >   improved when public-inbox is able to collect a thread from across all
> >   sources.
> > - If both patch and metadata are identical between rerolls (v1 -> v2),
> >   b4 will automatically carry over trailers from v1 to v2. This is handy
> >   if there is an sob on [PATCH v2 7/15] from a maintainer that is
> >   missing from an identical [PATCH v3 7/15]. In my observation, this
> >   happens very rarely, though.
> 
> This is pretty common actually. At least common enough that I do a
> check for this and have a semi-automated reply for it.

All three things have to be exactly the same:

- subject
- commit message
- patch contents (to the last bit)

The series must also be within the same thread, so if v2 is posted as a 
separate thread to v1, then this won't trigger.

I ran quite a few tests on series being posted to LKML, and there was 
maybe one instance where the trailer to a single patch ended up carried 
over between revisions.

> I worry that automatically fixing it silently will create yet another
> case of tribal knowledge of maintainer practices/requirements for
> submitters. Maintainer A using b4 doesn't care if tags are added, but
> Maintainer B does care and gets grumpy. We need the tooling to promote
> that submitters should add these tags as that is what works in either
> case. It would be useful if b4 provided just the check as a separate
> command/option for integrating into maintainers tools or maybe
> submitter tools like checkpatch.pl.

I see it as a case of "what you get is what was meant" -- if someone 
sends a trailer to a specific patch, and that patch didn't change at all 
between revisions, then we can safely assume that the author's trailer 
can be carried over to the new series revision. In your example, 
"Maintainer B" shouldn't get grumpy, because they should be doing the 
exact same thing anyway -- the reviewer has already sent their feedback 
about that patch, so it's the maintainer's duty to carry it over across 
revisions. In fact, many submitters already include previously received 
trailers with the new series revision, so I would argue that b4 isn't 
doing anything the maintainer wouldn't be doing in the first place.

> More generally, as I've started to integrate b4 into my workflow,
> there's a couple of useful pieces of functionality already in b4, but
> not exposed directly on their own. It would be nice to have both
> porcelain and low-level commands.
> 
> It would help for scripting if 'mbox' stdout was just the mbox file
> name similar to git-format-patch output and send the rest to stderr.
> While I have message-id and can construct the mbox name, there can be
> some transformation on it.
> 
> It would help if the old versions of a series could optionally be
> included in the mbox output.
> 
> Can the lore search code in get_newest_series be exposed as a command
> taking a search string and outputting an mbox? Essentially, what the
> lore web interface does with a search box and 'mbox.gz' button (I
> tried and gave up doing that with curl).

A lot of search stuff is currently very kludgy in b4 (e.g. we're abusing 
RSS search feeds for it). The situation will be very much improved once 
some of the necessary changes are implemented on the public-inbox side 
of things:

- unified search across all mailing lists
- ability to reconstitute a thread from multiple lists/sources
- proper query and subscription API

Looks like these features will be landing in public-inbox some time in 
the near future and that would vastly expand what we can do with 
search-based queries. I'd rather wait for that to happen instead of 
creating more kludgy RSS abuse.

I'll see what I can do about making b4 more pipe-friendly for some 
operations.

-K

Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DB2FAF
	for <tools@linux.kernel.org>; Wed, 29 Sep 2021 21:18:30 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id r16so3666700qtw.11
        for <tools@linux.kernel.org>; Wed, 29 Sep 2021 14:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sVnekUEKW8CfrQiq7YdNrytmkDUQ7dT0m7nv5NqbiWY=;
        b=hTHlNraSL1atg3o6gEW/tf1xt82+skwqPp84m6KDTgfGTf3WqJu/PPQg6qcYAzrKpd
         x9JqywIb4GPsnhn02kxA+mF92vQe6KLqqjVWC2d+XJUObhAjiwUPeRcXEPP2iL/fz30f
         P6wo6wGnNnobiR3HLCHiMyLUeTShIEehbc/Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sVnekUEKW8CfrQiq7YdNrytmkDUQ7dT0m7nv5NqbiWY=;
        b=juTbvanM+7Z1wBdV61bdufyaL2UW0nBV70CD9AybwPjiQ+4j5hqogwEQP2wK9TNBwM
         H83zGJvjnJOOCLfsOAC9raqeUYBDUtqEpOtEYeeOxF2rAiM/VFuzCe7h4MiPv3XEFM8Z
         wQgdZi5JFpzHLkNjR/l3X7s1asfpHC84ogyOJqVWepOm5Lo0u25WEn75o/E8ec9MB9Op
         c9uk+H9rjmtA/TlHVKBPTabBGTj3V2tclQ97XYOIT9VpUEvDxrIRaoaXYyzAdQzZ4Hhq
         4nMQwMEhQj9vWAVbRChsJs2WaxpUBBzMwXyE14/PrnD5J7MJNLNFOEjsEouZIGxzEo55
         hMww==
X-Gm-Message-State: AOAM532+ya2YwiZ0JkWpOF7bsaTtDxnJ+wNrqW7ZEygQrJSjEEPAIPYm
	ZeJP3U31Od3W1ZeesB9L2naWVQ==
X-Google-Smtp-Source: ABdhPJybBX8NqUcurLiJz0KbLN+vzXPmfoWRwgpTW2tP/H7P3f3RwZLdqhhcSCiF7nQaIr7hCuRozQ==
X-Received: by 2002:ac8:4149:: with SMTP id e9mr2428826qtm.106.1632950309439;
        Wed, 29 Sep 2021 14:18:29 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id l195sm517751qke.98.2021.09.29.14.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 14:18:28 -0700 (PDT)
Date: Wed, 29 Sep 2021 17:18:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210929211827.5yvedlfq3bia2pk7@meerkat.local>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <20210922173803.GV3544071@ziepe.ca>
 <20210922182154.zqtuvmcsjd4ivfgp@meerkat.local>
 <20210928174653.GH3544071@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210928174653.GH3544071@ziepe.ca>

On Tue, Sep 28, 2021 at 02:46:53PM -0300, Jason Gunthorpe wrote:
> > We could, theoretically, do that, but you'd have to remember to pass the -F
> > much free-form and there isn't a sane approach we can take to automatically
> > generate good merge commit messages from them, short of quoting them fully,
> > which will be overkill 9 times out of 10.
> 
> Since the user would be expected to revise it, I think that is
> fine. Just make the template and push in the raw text and let people
> edit. It would still save a bunch of time

Okay, I implemented something that should be handy. When we find a cover
letter, we will prepare it as a template merge message in .git/b4-cover, so
you can do stuff like:

git merge -F .git/b4-cover --edit FETCH_HEAD

I will eventually make the template configurable, but for now it's hardcoded
to the following format (using a sample I've been working with):

    Merge patches from https://lore.kernel.org/r/20210929143600.49379-1-david@redhat.com

    Accept 6 patches from David Hildenbrand <david@redhat.com>

    mm/memory_hotplug: Kconfig and 32 bit cleanups
    ==============================================
    Some cleanups around CONFIG_MEMORY_HOTPLUG, including removing 32 bit
    leftovers of memory hotplug support.

    Compile-tested on various architectures, quickly tested memory hotplug
    on x86-64.
    ==============================================
    Link: https://lore.kernel.org/r/20210929143600.49379-1-david@redhat.com

Note, that this is after deleting a bunch of stuff during the --edit stage, as
we reuse everything that's not a signature.

This change is in the latest master.

> Linus has been repeatedly against working on random git history
> points, so I think the unreliable auto-base is not something people
> should be using.

I see. But if they do send a base-commit: line from some place random, is that
okay to accept it?

> It should only check a set of safe commits (like rc releases and the
> maintainer's work-in-progress) and everything else should be a
> failure..

I'll see if I can have a --tags-only mode for guessing base.

-K

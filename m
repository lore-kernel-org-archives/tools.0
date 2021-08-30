Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857683FCD
	for <tools@linux.kernel.org>; Mon, 30 Aug 2021 18:04:28 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id r21so12416019qtw.11
        for <tools@linux.kernel.org>; Mon, 30 Aug 2021 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LRBLnMc6VxjHUStGCxf7dBTEAa5BKEEVIQSBcqhR8fA=;
        b=DiOsrRYlKrROvgAHU4rBOS4ic7CavYv0epz56W+z9Ghg5XbnKbpYrI849F21BcMryf
         z2lyWD5x99k4iyIyMDmSEIA06DEjbt/Aw/FnpvjyoLJsLnDxQ+wVkxf/dmuGA5Ezg9vd
         NuhNZKju6e5XsqyNA59xJrbu/nIVfQsOdfFHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LRBLnMc6VxjHUStGCxf7dBTEAa5BKEEVIQSBcqhR8fA=;
        b=SrH5MKnKrI23vhaAePxMSmegqcitTYt7FRO+yIFdgZC8Wqrp8jByQ5zBBMBt4zs1Tu
         NAgKYM4Cl/zUQsqZv659zRi1BrH2728wzAbAimuAUiQQ2OrSTWDFo/oa1JE+nU5PdBK9
         cQoT5djU0NgFfmd5wqWBbwCS48fxiU8kfuY6i+hudbZUa6PE1d0mokoUJTP8IMdgXAYK
         sE7LoDaw9fahO2pXVzcO9/9pqA3rbbFkzEgmxp5u76j8BhOqg4H1ZNVXEk4P2ZWo1utn
         36VQ1HguyLxFug+hIY4fOuGtOMGWZFJDfQ0uRDrLPoZJ9ZrGG4YqXIugoZ1ITRG8mHvJ
         JBSw==
X-Gm-Message-State: AOAM532Gt07Y58ilgEQ6Bsks1WatNDjZ0GqWvmk2V9CGuCpBoAdgmUQ1
	5+q4WU8LZBYBR/nq2IMmWfyzTA==
X-Google-Smtp-Source: ABdhPJzv1WYziC4YJr7yL8fuId6vu/C50pV0W5pq+SDUyixWDTyAJHmjDLszQzyCJWqSQgk5M3lHyg==
X-Received: by 2002:ac8:5a13:: with SMTP id n19mr21318328qta.380.1630346665198;
        Mon, 30 Aug 2021 11:04:25 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id bl36sm11626810qkb.37.2021.08.30.11.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:04:24 -0700 (PDT)
Date: Mon, 30 Aug 2021 14:04:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210830180423.przc3a63vhseefne@nitro.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <CAL_JsqL3+HmAReo9PTLW4Y1o_NiR6oZrV+FC+msGu+epkAJ02g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqL3+HmAReo9PTLW4Y1o_NiR6oZrV+FC+msGu+epkAJ02g@mail.gmail.com>

On Mon, Aug 30, 2021 at 12:47:33PM -0500, Rob Herring wrote:
> > My tests of the new lore.kernel.org service (currently running on
> > x-lore.kernel.org) are looking good, so I will be putting that into production
> > on Wednesday, September 1, 2021.
> 
> One thing I've noticed doing some searches[1] is I get a bunch of hits
> on post-receive-hook mails dominating the results which doesn't seem
> too useful. Do those need to be in the 'all' index? The purpose of
> them is pretty orthogonal to development patches and discussions. Or
> is it possible to have an 'almost-all' index? Or other flavors of
> indexes in general? Perhaps a patches only index for example (the best
> I found for a query is 'dfn:/', but that has some false positives).

I do agree that adding the gitolite feed there was a bad choice -- I'll
probably eject it from lore and let it just live on git.kernel.org.

Regarding custom combined indexes, this is something that I will be
working on in the near future. One of the new features in public-inbox is the
"lei" (local email interface) command, which lets you collect email from
multiple sources (your local inbox, lore.kernel.org feeds, nntp group, an imap
connection, etc) based on specific search criteria. I've not yet decided how
we're going to provide this for others, but the goal is to make it easy for
maintainers to define their own custom feeds and share it with co-maintainers
(or anyone else). Once I have a clearer picture on how I want to go ahead,
I'll follow up with others here.

-K

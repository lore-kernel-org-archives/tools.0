Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BDD7465
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 19:40:18 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id l11so14249432qvu.13
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pSr8DxepD85jtMBx0GUCkgo/78Rhha5W5uf3yEbaUeA=;
        b=gKXAiOfpo+hFNoiR+YqLeCg5T6gs+nUR+sS6+XYnSXq4WgyJdF/WR7TSC5lox5YaPl
         i/jw61Smiry1ULB+vbKcUuBUNsnuNwTz8eu1JZJZhYkKESYB0Uj8LmbGRwslwj0LJQVj
         u865Oyi2btKTbT+MAGTOftoHMK2TzncXgjJno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pSr8DxepD85jtMBx0GUCkgo/78Rhha5W5uf3yEbaUeA=;
        b=eT7X0sBxyV4KtVL9MzYjmf6EiROx7trMpZ8WW4dWfr1k6bGQ3IzcM7Ul0Ma2zW4crE
         M/QKqcy71j/4EqgYTYUiqcDIlL8u5IiZbhkbvVfNTiX2KTBOCwQ97nC8is2xS93UBD7P
         C2XooYOYShphofze+tMtK9uF35rkPkTRIWa3V0TwHKC5jrAhBbSTtCFBanpinSHiserD
         qzl/9IuvBkz09z/RaCQtqi5znTYSlexTduD4wDXUrVXumEYtwquKXmN7+TAYT++G5dWE
         H5pAWMLJb6JxfvkyWkZm4MsS+oatoag6PuQgmzoI9MDLi/IDztNxJ7fWB1hUNclxXU3R
         AdIg==
X-Gm-Message-State: AJIora9E6DEQ8eq/1a/EA+r5pZ5v1Dck9AtnmPG2GbfREnAW6TwEEEU7
	8RS5d+w++brSka7aZ0PSgR0yEvDacYLH4g==
X-Google-Smtp-Source: AGRyM1u7NBd43yjIgnYIulI8SdpSvrcoHlMfiMbLSYUyGDHYrXsEuFKq5kvn2FN6WwBrje+01jUNLA==
X-Received: by 2002:a05:6214:4113:b0:473:74dd:de77 with SMTP id kc19-20020a056214411300b0047374ddde77mr31414420qvb.84.1658346017468;
        Wed, 20 Jul 2022 12:40:17 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id g25-20020ac842d9000000b0031ede43512bsm18935qtm.44.2022.07.20.12.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:40:16 -0700 (PDT)
Date: Wed, 20 Jul 2022 15:40:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220720194014.uvuij422zypbjxrf@nitro.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220720192456.GM5049@ziepe.ca>

On Wed, Jul 20, 2022 at 04:24:56PM -0300, Jason Gunthorpe wrote:
> > 1. Pluggable cover letter strategies
> >    The goal is to support 3 different cover-letter strategies:
> > 
> >    "commit": same as first implementation with the cover letter stored in an
> >    empty commit at the beginning of the series.
> 
> How about an 'end of the series' option if we are doing lots of
> choices?

Like, in a tip commit? Wouldn't that make it super awkward to add more
commits?

With the "empty commit at start" approach I solve two important problems:

1. I clearly mark where the series starts, which is super non-trivial with
   git. With other strategies like branch-description we use the "base branch"
   to find the fork-point, but even there are common situations that can mess
   things up, e.g.:

   git remote update origin
   git rebase origin/master

   If we have the local "master" branch as our tracked base branch, and we
   didn't actually fast-forward it to match origin/master, then what we
   consider "our series" has suddenly grown by a bunch of commits.

2. I have a place to store tracking information (the json bits) from the
   moment the branch is created, which is handy.

I guess we can add a "tip-commit" cover letter strategy that we can use when
enrolling existing branches, but then I'd have to consider the situation where
there are commits past the cover letter tip commit and what to do with those.
Overall, it's doable, but only as an additional strategy to the "commit at the
start of the series."

-K

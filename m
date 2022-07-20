Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03248746F
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 20:06:45 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id kh20so14312420qvb.5
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+ubH5g4u4+bDRt6kfQ2ryFKUCJzJZxILJPc2xeWw7wA=;
        b=d6z/XQVKIKNscHbBYEigGQ9xbW5xq6jyxP+OOkQFGr+l38025JN61i/FgnA4VHQPaO
         oE5MD5rWCc0NZlbd9Sj35w92kKlY/UCe7sDPFOSBX9+3t94UiTj8BQEF0Ob7GmxK38aj
         9UQJiMbEiOpAyVnAviRYAfxoPza6i4/6JTgqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ubH5g4u4+bDRt6kfQ2ryFKUCJzJZxILJPc2xeWw7wA=;
        b=V5p1uBru1LrXxD7eYqTSlJeRqyiHonSIuqK2oYdSLbwbSsjMbZeUQ2zv0ohHqcz0zy
         wT4Mt4EiU8sGRXK/M7WweoCppEWCZNuJz2fn33Fe8E5sAU/74lmz95dt9x/bxgya0NQg
         lNBwlQ/V70A9exZlSvojPA7+w7SUcJxLXpRWOwygF157D/IvxcG5iLMTlOnwNJVneOm+
         X5B9rg92BZNCxofLYmuj50h/k1Z71XpG6MIjkWe9DdEOoDpD6/itrNlBrN6y8mk87Acl
         Wvhyoc2pa5FRzcJBxAuR1CNRx5LQR6Gf1aL1mhyzxJxa5faLwW3COfLGDh3L2iTJxfBT
         BsDw==
X-Gm-Message-State: AJIora+x873sFEelK8HKpk+eieb3CQ1aF6ORBV4Oj8yvb15u++Ot53N+
	1tcFBmDxu7zmjoedz3icYeF5jA==
X-Google-Smtp-Source: AGRyM1vrEo1TEslRAR9lWVI8OvAFthGD7duOvGHznrnniFMPwcGRl+I07OgGdmmkbSTmKTRwJ51iOQ==
X-Received: by 2002:ad4:5bee:0:b0:473:10b5:e767 with SMTP id k14-20020ad45bee000000b0047310b5e767mr31801194qvc.39.1658347604847;
        Wed, 20 Jul 2022 13:06:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id h4-20020a05620a400400b006b5652edb93sm73626qko.48.2022.07.20.13.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 13:06:44 -0700 (PDT)
Date: Wed, 20 Jul 2022 16:06:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220720200642.gdcbdpkctmsrfehj@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <20220720194014.uvuij422zypbjxrf@nitro.local>
 <20220720195531.GN5049@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220720195531.GN5049@ziepe.ca>

On Wed, Jul 20, 2022 at 04:55:31PM -0300, Jason Gunthorpe wrote:
> > Like, in a tip commit? Wouldn't that make it super awkward to add more
> > commits?
> 
> No more difficult than amending a commit lower down in the stack. Just
> use rebase and fix all sins. If you are using a git commit based
> workflow then you are going to be rebasing *constantly* before the
> series is ready to send.
>  
> > 1. I clearly mark where the series starts, which is super non-trivial with
> >    git. With other strategies like branch-description we use the "base branch"
> >    to find the fork-point, but even there are common situations that can mess
> >    things up, e.g.:
> 
> So you intend to keep the first commit in the other strategies too?

No-no, just the default "commit" strategy that I reserve for newbies. I expect
everyone who opts to use any other strategy to know how to recognize and deal
with odd rebase situations so they don't actually end up sending unintended
500-patch series. :)

I will consider adding "tip-commit" as another strategy, since it's fairly
straighforward.

-K

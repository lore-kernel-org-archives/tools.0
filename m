Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59E6457
	for <tools@linux.kernel.org>; Mon, 21 Mar 2022 21:59:55 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id r1so12466031qvr.12
        for <tools@linux.kernel.org>; Mon, 21 Mar 2022 14:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ah4w6OoRUPZxip9VwA5wtxcHEimFrP1bI+tEzjJbshc=;
        b=Rt+eR7o175BK7C00p2grlao5QSW1Y0ZBBQys3HPci5c12IqNOOhytsh8o4gcKah5Rl
         jMKAT3b0d71BHApy9rJDKMr7BpveAVGMfrvkBLq0ldR762cWDI0GJCwXC0q2j9wXFuxh
         FGmo4DidP8gwRHay/+xlolmVIdKmcixbqf8uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ah4w6OoRUPZxip9VwA5wtxcHEimFrP1bI+tEzjJbshc=;
        b=dOxfg1R9oIkafgDqdnjGPA4ghcUPP/38okcsfH1G5p9Bo6x0iw5Ub1UI+NN+w41F/3
         pVgm5CcDjdXx7RhMumON8GuoCCthFiLqE1rF2mYyk3SheXDuA4CHAWVyZe8V0rWD9yZb
         PADIeehOOyMvh3cMi9xhEO6S+Lzbt2p3/mPZ5UXBTXimqs11Et8+7TYtlgJRvSsFyLLd
         RHOnJNaFu4FeiXJTCNVF40zEO2K9OYwbm6mULWV6NEHpObWL8raNtbS98CE2JIT0ENpJ
         6d9nz8FVBQ+Ek8ZtosBvVJ+E228bwSr+5gxnYcx+zDf0Y3OIcVlTMZXzsFV3bJOA5v8S
         hULA==
X-Gm-Message-State: AOAM532Jtrtxhmjp/Av8xMn7kc3YfOdZfF4ZNQ/UecOXwNKs/txSoCwc
	yf5vPWrOUqQzwh4tB1zVJkskF1T6ryKfPg==
X-Google-Smtp-Source: ABdhPJzKQ3MXS8vpQJyr2kl5E/QXICAvIa9HMP8sLVHjJGpvGWAugtkhBn8Q4c+gcEa3lLbSyrD+Rg==
X-Received: by 2002:ad4:5d6b:0:b0:441:bad:b469 with SMTP id fn11-20020ad45d6b000000b004410badb469mr9759921qvb.101.1647899994192;
        Mon, 21 Mar 2022 14:59:54 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id u17-20020ac858d1000000b002e1cdbb50besm12463901qta.78.2022.03.21.14.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 14:59:53 -0700 (PDT)
Date: Mon, 21 Mar 2022 17:59:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] Remove URL redirect project lookup
Message-ID: <20220321215952.p3ywzfr4waq5klmv@meerkat.local>
References: <20220225031135.4136158-1-robh@kernel.org>
 <CAL_JsqJrXXtGG52s6nzwLaCi48OutGbyGxEQEdmPZCZofNShfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJrXXtGG52s6nzwLaCi48OutGbyGxEQEdmPZCZofNShfA@mail.gmail.com>

On Mon, Mar 21, 2022 at 11:41:20AM -0500, Rob Herring wrote:
> > My usecase is twofold. First I want to speed up opening a thread by
> > having it fetched in the background and cached. Second, I want to be
> > able to work offline by fetching a list of threads (my PW queue) in
> > advance and using the offline copy. With a sufficiently long cache
> > timeout, the cache works perfectly for this use. Though maybe a 'use the
> > cache if there's a network failure' mode is needed instead of always
> > timing out the cache.
> >
> > I also have this working using b4 to fetch my queue to an mbox and
> > then using the 'use local mbox' option. This mostly works except for
> > the handling of 'From ' in message bodies which is problematic for mbox
> > format. The cache manages to avoid this problem.
> >
> > Rob
> >
> >  b4/__init__.py | 23 +++++++----------------
> >  1 file changed, 7 insertions(+), 16 deletions(-)
> 
> Ping!

Sorry, I've been a bit verklempt about things over the past few weeks. I'll
try to get to outstanding patches in very short order.

Best regards,
-K

Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3372
	for <tools@linux.kernel.org>; Wed,  1 Sep 2021 18:02:24 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id s32so425533qtc.12
        for <tools@linux.kernel.org>; Wed, 01 Sep 2021 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qg8uQ6TvXfn53g94T0u7RpeVRCs9pQuuZsRhPMTVS7c=;
        b=Oa56KyAhSJAGxQyhy18vCsk19nyFHLdMgR5Dp2fqJ3YUL1OEuJZVPQtvbxBiN39xFj
         BnhN8vhJoxCakawXB4Z9bMpaoj/hRUDZSHHdF+WLBCuCzJvyMOC+kdDxEronIJpaKwJJ
         dX2iFM3cPPxebzzN/sDMQ/H6X/HkZIqpr0p/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qg8uQ6TvXfn53g94T0u7RpeVRCs9pQuuZsRhPMTVS7c=;
        b=fYh0jgL/AHxWkbuYcb6GO5wV4Y+aqjb9K+zMm/SGlBP56Y4ZDmmLBcCFSnXHKGbzID
         840OHJix8C0p2PqxJ0swIab6eoXdiKbdqOorM4ly4Y0Imzbl/82//5qQhCj9Kv538Th7
         yAHDA5woeLpjsr7k8BPlCraB7pB2upG4igqFNfBOlDk6f5c2a18PxJQ8PJZ9grgiHPvj
         H+e7nL3zM0kLZBtjRFy/zOq1EW5Zpb55w4pARR516dB6K6jL3D/XmmnggswplmIeMTZF
         iiLuxjtyiEyiGQ1+7nebQjmV97wj60S66xWzxoN/n3tlV2g2iNTAP5b3xWILrGiM4iKv
         iNIQ==
X-Gm-Message-State: AOAM532cfz4G+yUxpCl3po/wOVT5fdzohIyLc7VWw0P5hib3l9niNHmM
	02BI65n5GmJS8AnnR/oROE+aZbP1BDNe6/XK
X-Google-Smtp-Source: ABdhPJx3Wx8oDUQ0R4Sv6XLRhQNkG5KnKE6oYjQT7lraD9tIufC340JrjngXMR03uejGRNoi9fF2Vw==
X-Received: by 2002:ac8:4b6c:: with SMTP id g12mr677499qts.170.1630519342997;
        Wed, 01 Sep 2021 11:02:22 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id u7sm337242qtc.75.2021.09.01.11.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 11:02:22 -0700 (PDT)
Date: Wed, 1 Sep 2021 14:02:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: tools@linux.kernel.org
Subject: Re: b4 v0.8.0 is available
Message-ID: <20210901180221.x2admzr4d3lymf3b@meerkat.local>
References: <20210901141637.fmvgs4hnk6m4ym7x@meerkat.local>
 <582896df-8791-43f5-1422-db00e92b8291@suse.cz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <582896df-8791-43f5-1422-db00e92b8291@suse.cz>

On Wed, Sep 01, 2021 at 04:48:05PM +0200, Vlastimil Babka wrote:
> > https://lore.kernel.org/lkml/20210617101910.13228-1-song.bao.hua@hisilicon.com/T/#t
> > 
> > 	Link: https://lore.kernel.org/r/20210617101910.13228-1-song.bao.hua@hisilicon.com
> > 		   attempting to guess base-commit...
> > 	 Base: tags/v5.13-rc1-284-gc485f7e9863c (exact match)
> 
> I don't know how exactly it works, but looks like it could
> still try a bit harder?

It's better, but it's not perfect. :)

>  Base: tags/v5.14-rc1-55-g00c85b6576d3 (best guess, 3/8 blobs matched)
>        git checkout -b 20210819_hannes_cmpxchg_org tags/v5.14-rc1-55-g00c85b6576d3
>        git am ./20210819_hannes_mm_kconfig_move_swap_and_slab_config_options_to_the_mm_section.mbx
> 
> 3/8 blobs matched means "git am" fails
> 
> The earliest commit where it succeeds isn't that far away, actually:
> git describe 2a03085ce887^
> v5.13-257-gf356aeacf7bb

It may apply to that tree, but the patch series in question is showing
different index values for the files being modified.  E.g., from the patch:

    diff --git a/mm/vmstat.c b/mm/vmstat.c
    index cccee36b289c..31aada15c571 100644

If we look at the mm/vmstat.c blob hash at the commit you listed
(v5.13-257-gf356aeacf7bb), we'll see that the file has a different index
there:

    $ git ls-tree v5.13-257-gf356aeacf7bb mm/vmstat.c
    100644 blob b0534e068166c4d4df5995a2830fe548f48886b7    mm/vmstat.c

If we look for the object with index cccee36b289c, we'll find that it last
existed on June 28:

    $ git log --pretty=oneline --since 2021-06-01 --until 2021-09-01 --find-object cccee36b289c --all
    28f836b6777b6f42dce068a40d83a891deaaca37 mm/page_alloc: split per cpu page lists and zone stats

June 28th is over 2 months ago, while by default we only look within 2 weeks
of the patch's sending date (otherwise it could be really, really slow). And,
in fact, if we widen the search to 60 days (2 months before the patch was sent
makes it June 19), we indeed find the exact match for this series:

	$ b4 am -o/tmp 20210819195533.211756-1-hannes@cmpxchg.org --guess-base --guess-lookback 60
    [...]

	 Link: https://lore.kernel.org/r/20210819195533.211756-1-hannes@cmpxchg.org
		   attempting to guess base-commit...
	 Base: tags/v5.13-11-g296e421767f3 (exact match)
		   git checkout -b 20210819_hannes_cmpxchg_org tags/v5.13-11-g296e421767f3
		   git am /tmp/20210819_hannes_mm_kconfig_move_swap_and_slab_config_options_to_the_mm_section.mbx

So, the tree with the perfect blob match is v5.13-11-g296e421767f3, and "git
am" indeed applies cleanly there.

I think the real question is why is someone sending a patch series that is
based on a 2-month old tree? :)

-K

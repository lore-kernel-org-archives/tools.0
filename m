Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBB10E9
	for <tools@linux.kernel.org>; Wed, 28 Dec 2022 09:39:17 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bj12so37151501ejb.13
        for <tools@linux.kernel.org>; Wed, 28 Dec 2022 01:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aUFhv5hkE3CQRXeQSwc434et11Ild5gUe6l3YYUDPHQ=;
        b=2v6l+9dLcxIPTHpyzCACa1hhnQDAex7zxN0FgTs2SsbIoJayHwdfsKZI6lViwruBeY
         elXBYLVh7K2xL9bxKuQsu6M3BNVQNs6zk39+ekgru6ZdrivQB1uRoVd6MoMaFnWqwlrY
         RvNgAa0+f0DbY55uofuXxGv9G+UG9aZ7nX0eyfekOaU3oNhRmOZdPPIIhTLN2VwUMLsj
         FVmsVjVdeS1T/ahJVfy2UEVCmiWBw+NsFitNMhTt0esUZNHyHhpeferYScnFbL5H4j3s
         XFnJZQP8nr5L2xbxARAwSZDpSWMPG6torqU+aga/vpzMG6HehhKmRS9PlyQeqY8cgdpV
         pEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUFhv5hkE3CQRXeQSwc434et11Ild5gUe6l3YYUDPHQ=;
        b=yoRBxgreSqx2VTE6DPVFFmv+8fqocAHCgV+V0o/ON0B2EMHtB982sjxWdX2GRMj2pr
         +L6FWZaysD6Wx9RBo041UD3w3nh/fSbwQHMPAs9ejCoUm0p18EHh+NDiUB5qBZVMw/+1
         NnMljUply1x2D2zxApUWY8UlWMqyhaqa2LMF/d5xp4T9hO8Q8eWlQvJ04bvSqkY6uNOB
         WTpz/sgLmEEF2FUj8D3YaBJ42zlp//4eTShH0YQgneYANKAVxcu9C9RYUoHlQjmMQW9n
         Yr49dXKJOYf+a0chNGfOvCMygdW0wtuU4yFq/bCwhro+8/U9vKvuEbjtu/AceH2J/SoD
         +yrQ==
X-Gm-Message-State: AFqh2kogXgpDWQf6XZYko6hl5V75FuQ0asiwVY8LbluoikuCg1zLqq2X
	Slg0WhBw6CAvuprA4wo87QIo9g==
X-Google-Smtp-Source: AMrXdXvt7yAzIHAlEaRqtAaZBxKYgUeA/8lP4acPN4ZwyjpswwEBebvCQ5X0UG9mSEjukMn4TYQKnQ==
X-Received: by 2002:a17:907:c28f:b0:83f:5f77:8ff9 with SMTP id tk15-20020a170907c28f00b0083f5f778ff9mr20607287ejc.12.1672220355435;
        Wed, 28 Dec 2022 01:39:15 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b007bf24b8f80csm5035777ejf.63.2022.12.28.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 01:39:14 -0800 (PST)
Date: Wed, 28 Dec 2022 10:39:14 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep from detached HEAD
Message-ID: <20221228093914.dntejnwnrz2mdyxs@blmsp>
References: <20221223101539.xlacupmglv2dw4oz@blmsp>
 <20221227151433.tg4yldmlyyubqpgu@nitro.local>
 <20221227160633.7cnhyote4xgk7agp@blmsp>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221227160633.7cnhyote4xgk7agp@blmsp>

Hi Konstantin,

On Tue, Dec 27, 2022 at 05:06:33PM +0100, Markus Schneider-Pargmann wrote:
> Hi Konstantin,
> 
> On Tue, Dec 27, 2022 at 10:14:33AM -0500, Konstantin Ryabitsev wrote:
> > On Fri, Dec 23, 2022 at 11:15:39AM +0100, Markus Schneider-Pargmann wrote:
> > > Unfortunately it seems that b4 prep is not able to handle not being on a
> > > branch:
> > > 
> > > 	git checkout v6.1
> > > 	b4 prep -n up/test -f v6.1
> > > 		Not able to get current branch (git symbolic-ref HEAD)
> > > 		Not able to get current branch (git symbolic-ref HEAD)
> > > 		Not able to get current branch (git symbolic-ref HEAD)
> > > 		Not able to get current branch (git symbolic-ref HEAD)
> > > 		CRITICAL: fork-point v6.1 is not on the current branch.
> > > 		          Switch to the branch you want to use as base and try again.
> > 
> > Yes, we currently use "what branch you're currently on" as our base tracking
> > branch. Knowing the base branch is less important with the default commit
> > strategy, but it will come in handy when I add the "prep --cleanup" feature
> > that will remove prep-tracked branches if we find that they have been merged
> > into the base branch (e.g. master).
> > 
> > I will probably add a --base-branch flag to go with "prep -n", though, so
> > eventually it will be possible to create new prep-tracked branches from
> > arbitrary locations in the tree.
> > 
> > In your particular case, you don't need to checkout v6.1 before running prep.
> > You can just start in master and rerun "b4 prep -n [name] -f v6.1".
> 
> Thanks for explaining. The checkout of v6.1 was just an example. I often
> use detached HEAD on remote branches and tags to not pollute the
> branches that I have. I thought b4 prep would ignore the current state
> of my work directory so I used it similarly to a 'git checkout -b'.
> I may be creating a git helper for me which does a git checkout -b and a
> b4 prep -e afterwards.

A short follow-up. Using
	git checkout -b BRANCH BASETAG
	b4 prep -e BASETAG

unfortunately doesn't work as the code requires another branch to exist
that contains the tag (not a remote branch only local branches are
accepted).

I am not really sure how the normal workflow for non commit strategies
is supposed to work? Do I need to keep a local master branch that tracks
linus/master? (I usually don't have that at all and always start new
branches from remote branches)

Thanks,
Markus

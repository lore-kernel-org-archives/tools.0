Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF863FCD
	for <tools@linux.kernel.org>; Wed, 22 Sep 2021 17:38:05 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id cf2so2436630qvb.10
        for <tools@linux.kernel.org>; Wed, 22 Sep 2021 10:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U/D99T8JCMk5z+A+HyrDw0XlToh/CpCL7PdT0pFhYy0=;
        b=XA1uNwd/4fsmLhZkBvX2Sp4yIynQW7n10IaJoInbUtLWTNDrmUu40LowYltHAVw2Da
         IigSF3K3L+FrqwWU3E4+kh3xeYEpWkVS4DF0QYf4Vg7RPOd3HF48dy30IVs0cjieAik0
         CFjXZJj51HHTdOj8zjVygXoomLYRp2X85p/WvIGdup7pLXjTV3Hct7zgoMyVjoEWTNjg
         23aVQkmi4bTELwaWUNhGEDoBb0QHDB95zI2wOnuLQgGxgxdYOVubOcNkL3W6q5+LW8H3
         AtoBPG090vrzIeiViP1+IeiCG0Uedz719Y1xQ9n3XLNVM81isA2SsrD+yBT/QkiQFk92
         2qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U/D99T8JCMk5z+A+HyrDw0XlToh/CpCL7PdT0pFhYy0=;
        b=xFRvjtFFfj0Cu3n5RX+RY9Z454Roo6idEiftExAO0p7uDLMUS5JCrw7VShc1pMqhI/
         F0E09LOh5hB7lr+QMhz4FOJDHNFqIA8kl1nnBav184bOczi7YpfamNtUCdR8vz1uE4Sg
         EYllro7sE1QnCGui0z99IOFuVT6NJswu0dkZ/9Da7LAQgM5drIyhcK2nFdjoMhnuA6Ft
         QSB6R7UP/H+/OyWRQ+zJOwO5ffVFvRobKX9jfZwg5VDnTx+TgRFALWGmVq6z406rNuz2
         FL3ro3ERtaVmE6SDdf8Eo+wUbs73P32RHbUOQQa5nrnmB6Gb4eBh9o3YsyRRg2XnJu4v
         hV9g==
X-Gm-Message-State: AOAM53174XLMHIZBBB9e/1GSzU/G/oHDjTy7brjU2Yyjj7nv2S5wizVl
	cWP37R/I3KgSIJRP4k1C5xaEjtze+BLXKA==
X-Google-Smtp-Source: ABdhPJyQMeisvFI53pYOWU4d9zekWb35KlLGCUlUexfELwD3RR6FtQBuz4BNveEUKsIymeLfomBGvA==
X-Received: by 2002:ad4:4a01:: with SMTP id m1mr296810qvz.29.1632332284923;
        Wed, 22 Sep 2021 10:38:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id v3sm1698767qtx.11.2021.09.22.10.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:38:04 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1mT6C3-0043x8-N4; Wed, 22 Sep 2021 14:38:03 -0300
Date: Wed, 22 Sep 2021 14:38:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210922173803.GV3544071@ziepe.ca>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921202526.mk2meetobbtl3tvi@meerkat.local>

On Tue, Sep 21, 2021 at 04:25:26PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> The current master branch landed a new feature that implements a new
> subcommand "shazam". It is the functional equivalent of piping "b4 am" to "git
> am", with some extra safety padding.
> 
> See "b4 shazam --help" to see the available options. You will notice that many
> of them are exactly the same as for "b4 am".
> 
> The default operation still tries to be the safest possible:
> 
> - we'll create a temporary sparse worktree that will only contain the files
>   being modified
> - we'll use the base-commit sha, if we find it, or we'll try to guess the base
>   commit from git index info
> - we'll run "git am" against that temporary worktree
> - if successful, we'll fetch from the worktree into your current repo and
>   delete the temporary sparse checkout
> - you can then "git checkout -b foo FETCH_HEAD" or "git merge FETCH_HEAD"
>   or "git rebase" as necessary

Does it prep the merge message too? ie pull in the text from the cover
letter, make the ==== markers/etc? (ie look what davem does:
d1bf73387b5adbc12c6a59c1fbaa69e05ee265ed)

> Alternatively, if you run "git shazam -A", we'll just run "git am" on the
> current HEAD, which is the exact equivalent of "b4 am -o- | git am".

It might be interesting to detect which to do based on what the
submitter has done.. No useful base-commit = no merge?

I'm generally of the feeling that git is a VCS and it is completely
fine for a tool to do whatever to the tree because I can quickly undo
it. So I think b4 is possibly overly cautious here :)

> If the default operation with getting things ready in FETCH_HEAD is not
> useful, please let me know how you would prefer to see things work instead.

I would be nice to have some process guidance when maintainers should
be using merges and when am'd patches..

Jason

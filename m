Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC229CA
	for <tools@linux.kernel.org>; Wed, 29 Sep 2021 14:27:19 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id f15so2427788qtv.9
        for <tools@linux.kernel.org>; Wed, 29 Sep 2021 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u6kflom4eiBeWcbE+aPgb2mBwNMOPPQP6S1w+0Y/G0U=;
        b=VvNYBJeV5LLOLcjXLbKsZ2raf4U2vg7g7vRL+wgrlbyjE0zlpqvmIDpzMJDIOnLZCQ
         +22Z8EFFUQ+bP0rgTJg57zTF1StNzt6W5gythaH3IIT5Fda+1d2NdD1AO+w07el8AsFV
         GkvbaP1n4FUQ53IuzY8D68nLtqkKVKepr1ks0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u6kflom4eiBeWcbE+aPgb2mBwNMOPPQP6S1w+0Y/G0U=;
        b=h+etz9KP+HM9uEK++uY3nIgEKoykzHSf1GPmqtoDijwZbzhFNyNpZ8laA5RQbpm4DM
         LMVmQ8sEhC6ABEpclT9I6OcUF60IEqQSZpOpttdyE9EpapLX2tEfF3azwATNyOe5Fm3p
         //7NCv7h84quDwUk3Rq/dWIC0UwfQ4bvU6kupOxgiBA4KUFTdMr6+v14b8PtfnVhhZ0n
         p0cT5L9TJeZ7xY84hZQ2j+qdRL8PxZ/QF+rhcmg7pgbH3NhfOtlkSBhdPhiyW453EOCs
         cin05P2MeY6Be9GikmGToGxLBqLDa0FQo0Ag2nCn8W1czQSUK/rz1oBxwxHsgy0XskhN
         xnaQ==
X-Gm-Message-State: AOAM530E4SKEQHsGsRcjDfqu5UKK5qZ2I3B+e5Qlgm3dTiONvq9Pbu54
	eaBepSISDJH9zZBuSEeqAmAFWwAHd1UcrQ==
X-Google-Smtp-Source: ABdhPJzXi3voHWxXjeXvxg2sf821W6zKtxwyFELTu2r9u7AvyPjc1T8jSH75WKb7sk2KuFETY+NRtw==
X-Received: by 2002:a05:622a:1212:: with SMTP id y18mr91562qtx.395.1632925638374;
        Wed, 29 Sep 2021 07:27:18 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id x5sm576491qkf.135.2021.09.29.07.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:27:17 -0700 (PDT)
Date: Wed, 29 Sep 2021 10:27:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210929142716.nuqczhzd7xjcb7kb@meerkat.local>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com>
 <20210924210826.ebi3ljjdfiuie2pr@nitro.local>
 <CAMuHMdUubqhqyDwkO_x98-M_i1tXsA5KfxhM1RDhrbhby8QT5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUubqhqyDwkO_x98-M_i1tXsA5KfxhM1RDhrbhby8QT5w@mail.gmail.com>

On Tue, Sep 28, 2021 at 08:22:59PM +0200, Geert Uytterhoeven wrote:
> > I suggest you repeat the following manually:
> >
> >     git worktree add --detach --no-checkout /tmp/foofoo
> >     pushd /tmp/foofoo
> >     git sparse-checkout ini
> 
> s/ini/init/
> 
> Fails with:
> 
>     fatal: Unable to create
> '/path/to/repo/.git/worktrees/foofoo/info/sparse-checkout.lock': No
> such file or directory
> 
> The info dir is missing:
> 
>     $ ls -l /path/to/repo/.git/worktrees/foofoo/
>     total 20
>     -rw-rw-r-- 1 geert geert    6 sep 28 20:14 commondir
>     -rw-rw-r-- 1 geert geert   30 sep 28 20:14 config.worktree
>     -rw-rw-r-- 1 geert geert   17 sep 28 20:14 gitdir
>     -rw-rw-r-- 1 geert geert   41 sep 28 20:14 HEAD
>     drwxrwsr-x 2 geert geert 4096 sep 28 20:14 logs/

This should work, so my guess is that sparse-checkout functionality has
changed/improved in versions > 2.25. It's still marked as "EXPERIMENTAL" so it
is not entirely unexpected.

It's too bad that I can't reliably expect it to work, because it helps to
dramatically speed things up when we don't need to checkout the entire tree to
try to apply the patch.

I think I'm going to change the default shazam behaviour to do --apply-here by
default, and do FETCH_HEAD/merge magic when requested.

Would that make more sense?

-K

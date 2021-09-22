Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC13FCD
	for <tools@linux.kernel.org>; Wed, 22 Sep 2021 18:21:57 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id c20so3648985qtb.2
        for <tools@linux.kernel.org>; Wed, 22 Sep 2021 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7eWu1aQC6jwysklGRQ9J87QWMVXvhvbf5dKjpF1VMqk=;
        b=C+zR3YvpWY1gpFoS/OZoxMy98k3PMmVGYHVSVYpGOVsha7lhOo8C+5rV9GBCju1L6F
         fC16HIbXQ4mOr7x5R7Fs1Fgp3YPDUeT/wYAChhBZulW5RmKKPYdCGyczek7JGrTlnreS
         QQk4MUmSxSMK7EqK1Hk6R9NsTFmRLPojhaZtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7eWu1aQC6jwysklGRQ9J87QWMVXvhvbf5dKjpF1VMqk=;
        b=GXzhtWab7PUP3LAJ7COmr5w+HNkL63icf+NHdL8zGwM7fJGk3Nvia91FWeXNKt+gpw
         ZvszVOXd90M4Uev7C2dGMfwj6zVzRNFk7/M/veEDGec/pQI5XaBsPcBETf3Ue+RzQXSi
         wtxeJaDb42g/+xyK+9RTOsReGGLRSiprQoKd6Bgn/g4qOdAwZX8uQpNmO6OXAASePwdB
         ZHrJ7xzhawmcOcxdhPqgX3Tzd58MdK6+5PEfZ3kV2C7F28GghK3l8Otlh9chN68gjLoU
         gXQCSD7vGzaVYbdfB3ON8qFWbw8nKhy2XKe48w3tDNiav3LopZiNcs/RYq6LoAgHvlen
         dYhg==
X-Gm-Message-State: AOAM532Gkzxae8HN7STADPr7boDD5vkoyFXsMhdQaKAZwejlk6eEBPGc
	okxTmMnqPLaA//J063TPXg907W+VdY4xwQ==
X-Google-Smtp-Source: ABdhPJxzmKsteBwo7IwR7znQFw+9rEAiKB2obN2mQRwyljPKOkfiGoBueqg/YsF1zv4eG9Mh1LrQow==
X-Received: by 2002:ac8:4583:: with SMTP id l3mr706856qtn.188.1632334916513;
        Wed, 22 Sep 2021 11:21:56 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id t5sm2402119qkj.61.2021.09.22.11.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 11:21:56 -0700 (PDT)
Date: Wed, 22 Sep 2021 14:21:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210922182154.zqtuvmcsjd4ivfgp@meerkat.local>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <20210922173803.GV3544071@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210922173803.GV3544071@ziepe.ca>

On Wed, Sep 22, 2021 at 02:38:03PM -0300, Jason Gunthorpe wrote:
> > - you can then "git checkout -b foo FETCH_HEAD" or "git merge FETCH_HEAD"
> >   or "git rebase" as necessary
> 
> Does it prep the merge message too? ie pull in the text from the cover
> letter, make the ==== markers/etc? (ie look what davem does:
> d1bf73387b5adbc12c6a59c1fbaa69e05ee265ed)

We could, theoretically, do that, but you'd have to remember to pass the -F
--edit flags to "git merge". My concern is mostly that cover letters are very
much free-form and there isn't a sane approach we can take to automatically
generate good merge commit messages from them, short of quoting them fully,
which will be overkill 9 times out of 10.

One thing I will probably do is edit .git/FETCH_HEAD to change the unhelpful
/tmp/tmpfoobar to say something like:

    [sha]\t\tpatch series from https://lore.kernel.org/r/msgid

This way the default "git merge" message will contain a clickable link for the
person doing the merge where they can see the cover letter and maybe
copy-paste from it.

> > Alternatively, if you run "git shazam -A", we'll just run "git am" on the
> > current HEAD, which is the exact equivalent of "b4 am -o- | git am".
> 
> It might be interesting to detect which to do based on what the
> submitter has done.. No useful base-commit = no merge?

This is where I have to defer to feedback. I expect it would depend on the
size of the series -- for smaller ones people will probably want to rebase and
not merge?

> I'm generally of the feeling that git is a VCS and it is completely
> fine for a tool to do whatever to the tree because I can quickly undo
> it. So I think b4 is possibly overly cautious here :)

Well, doing it via FETCH_HEAD was also an easy way to use base-commit info
(whether real or deduced) without asking for things like "what would you like
the branch to be named" etc.

> > If the default operation with getting things ready in FETCH_HEAD is not
> > useful, please let me know how you would prefer to see things work instead.
> 
> I would be nice to have some process guidance when maintainers should
> be using merges and when am'd patches..

I'll be happy to consider any feedback here.

-K

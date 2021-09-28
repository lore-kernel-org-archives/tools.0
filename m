Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55D29CA
	for <tools@linux.kernel.org>; Tue, 28 Sep 2021 17:46:56 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id a14so13946265qvb.6
        for <tools@linux.kernel.org>; Tue, 28 Sep 2021 10:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uWT+Rt0uNxqvDBJoMeIfyEqIpbatWLV9mJnzTlSyta4=;
        b=SWauZmVnisVOB6R2t69GTWPzQs77u1DifFopdBniyQOERCyunHPncfhOGppgJvd1Uw
         GmVwD98kLkbIip+1x9ln505hkLlvwQT0+qj5H09CHvg3JRqCa0I8HRo7RXD/GvEMk/zv
         POd8+svtxgqy0plCA2E4IAadfGUJO5Pnrz7U7KNSSoQADIexy3Sl4FqtkknnISkPI+6s
         zzFGbKuRLt4vnD9zNqhJHrzt3mjEFzUpvSkt/RdFS2YDREMrkhcqtGR/EuEV5/OJ8Jdc
         NV89Qk0YWvYmOz9JjtxxFYuGDi3m6rAzmOhdEQRJerucIdcczVCR9U3XrqWDeu2vsm2V
         W91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uWT+Rt0uNxqvDBJoMeIfyEqIpbatWLV9mJnzTlSyta4=;
        b=PcYVRb2wkdyOeGtQI3zYusVn2TMucYKNEjONJnQZNG7J9fNgC6k4dXhqtOgVa9Dg7m
         +EeHSOyJjN35wVdaEowZJV46pnuUSsn8nzEnxv7n3uGdR+LrWoYD8NqI3LbDU+Er+eUI
         gXxVGl/DLIXuxIfroAePYCVfve+f7TT9/w2qqzngJCQCQxcSnjCjp8jBOpwrlAC4wuEv
         28W6fOmR2VyiOpfKDkF20Xh1gfVqOpJrps2bmz715AQrWVNSaQkCzo2VKMhSPQTvu0pB
         uE3UVczkySLqdqaQG/HYNpSiuMisHKKy7MMoIVaDodtuPs8URgMPV5Gc5PJJTISJWXgh
         diIw==
X-Gm-Message-State: AOAM530HisFfRStdCsKLt+NUnfmJajOkCKf8mnAe1+CizUO+J5LFoGSH
	eVB+RsDBx+A01fKOzeARHlhICg==
X-Google-Smtp-Source: ABdhPJy973N10jWvqRGs/Z93af/kASt1/P4U5YX7rA2dJ455zD6Osnct4Bp7JH9d3WzZJS38OnU8+A==
X-Received: by 2002:a05:6214:689:: with SMTP id r9mr6927459qvz.37.1632851215243;
        Tue, 28 Sep 2021 10:46:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id o4sm14017068qti.24.2021.09.28.10.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 10:46:54 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1mVHBt-007EVe-Um; Tue, 28 Sep 2021 14:46:53 -0300
Date: Tue, 28 Sep 2021 14:46:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210928174653.GH3544071@ziepe.ca>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <20210922173803.GV3544071@ziepe.ca>
 <20210922182154.zqtuvmcsjd4ivfgp@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922182154.zqtuvmcsjd4ivfgp@meerkat.local>

On Wed, Sep 22, 2021 at 02:21:54PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Sep 22, 2021 at 02:38:03PM -0300, Jason Gunthorpe wrote:
> > > - you can then "git checkout -b foo FETCH_HEAD" or "git merge FETCH_HEAD"
> > >   or "git rebase" as necessary
> > 
> > Does it prep the merge message too? ie pull in the text from the cover
> > letter, make the ==== markers/etc? (ie look what davem does:
> > d1bf73387b5adbc12c6a59c1fbaa69e05ee265ed)
> 
> We could, theoretically, do that, but you'd have to remember to pass the -F
> much free-form and there isn't a sane approach we can take to automatically
> generate good merge commit messages from them, short of quoting them fully,
> which will be overkill 9 times out of 10.

Since the user would be expected to revise it, I think that is
fine. Just make the template and push in the raw text and let people
edit. It would still save a bunch of time

> > It might be interesting to detect which to do based on what the
> > submitter has done.. No useful base-commit = no merge?
> 
> This is where I have to defer to feedback. I expect it would depend on the
> size of the series -- for smaller ones people will probably want to rebase and
> not merge?

Linus has been repeatedly against working on random git history
points, so I think the unreliable auto-base is not something people
should be using.

It should only check a set of safe commits (like rc releases and the
maintainer's work-in-progress) and everything else should be a
failure..

> > > If the default operation with getting things ready in FETCH_HEAD is not
> > > useful, please let me know how you would prefer to see things work instead.
> > 
> > I would be nice to have some process guidance when maintainers should
> > be using merges and when am'd patches..
> 
> I'll be happy to consider any feedback here.

Me too :)

I feel that if b4 could maintain with high fidelity "what the
submitter tested" then a merge would be the appropriate thing,
otherwise a rolling 'am'..

Jason

Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA783C28
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 15:47:32 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id n2so10118001qkk.8
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v8o3nCHivm3UWWK50pnioXV6DcEarDt8dYHQ+U5M6FA=;
        b=WykPPOvwOLeROmOgcG6yJH1ntjRUTGpmHTFCQoIl4wWLR3ATS3CrSyLNGbW/kKKul2
         bQb0U61e1KcnqZ1SF7/DyPpg1PCy3zLMz+O9Yyyt8+E3v506UuUECyzYJIwHFHuhN0tk
         nNK9tdFfUoW7TNc5G0qJpplj73vdqD9AlRlkeMjJ+ui+LXV4K3xum0C+ZZdxH3s/hybN
         +Z0ZTyq7+rjp/fHHSBkVAlrqemZu/73mIUnybyslaTA1e6hvwWjb1g9945iUgSOw7qhI
         tleKTIldY7xi/LllHzVjURo2+UT0vri+Z89fBfYtZMZ13fswT+LzQWV1bGQUOUoCRkW5
         Dwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v8o3nCHivm3UWWK50pnioXV6DcEarDt8dYHQ+U5M6FA=;
        b=eIsQT7Bg4Z+Kiab/uIR1l1ekzG9dPV3tzIXDXdyJkGSfBXUSWQcy1puLCoKu/lXhFe
         LiZL70moUdVpdXdIxjvPsjsTVetCLXpMlEu5LtYrT4JUIqAmf74kF0Z+nbAp1z2R0q6r
         7KDQFMm7j60Qhvgom5+gAaYRuvB0CWLUowWTVAy63KHlr+vwDW1ygRJ8NtDzbnY7kreK
         wrX1IszbIL9fh5S+3xIMe/wMEjtrR8BeoVr5CSwgifuqk6hhE1be8FP4Mee29O9YsHEK
         Fow713r2IbgcfnlrFtOVWChc3V6wBO+1Fe6P2Dt2YF3ntJrA03BLG0fH8oJ9iCLCM6rv
         oO7g==
X-Gm-Message-State: AJIora/poiERqzNUcPQYEKg2VIOAFRkF3s5OmNpt+VgYI0Ur6KyGW9qM
	DA+vMYVYeXPWcDmlNkm/V9yY+g==
X-Google-Smtp-Source: AGRyM1tS4goiUVppUl3pLC+WTdc+9FDfL6TZg2D/2dbRQiCpyGa6OGO0j3rrTCrlU3Qs5Q2U4EUBww==
X-Received: by 2002:a05:620a:2682:b0:67e:1a58:c947 with SMTP id c2-20020a05620a268200b0067e1a58c947mr22374075qkp.650.1658245651522;
        Tue, 19 Jul 2022 08:47:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id q9-20020ac84509000000b0031eb3af3ffesm11049203qtn.52.2022.07.19.08.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:47:30 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDpRa-000msx-10; Tue, 19 Jul 2022 12:47:30 -0300
Date: Tue, 19 Jul 2022 12:47:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719154730.GL5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <d99a81d4f725eda056722b17c8749e8b96735e75.camel@HansenPartnership.com>
 <20220719153402.GJ5049@ziepe.ca>
 <3c86badd79c61bb71beb707f7bc2ea682ac9ae48.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c86badd79c61bb71beb707f7bc2ea682ac9ae48.camel@HansenPartnership.com>

On Tue, Jul 19, 2022 at 11:38:25AM -0400, James Bottomley wrote:
> On Tue, 2022-07-19 at 12:34 -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 19, 2022 at 09:01:36AM -0400, James Bottomley wrote:
> > > On Mon, 2022-07-18 at 15:17 -0300, Jason Gunthorpe wrote:
> > > > On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev
> > > > wrote:
> > > > 
> > > > > Perhaps, but I also have other reasons to like using an empty
> > > > > commit for this. For example, it makes it very easy to mark
> > > > > where exactly our series starts.
> > > > 
> > > > It is a good point, but it is backwards to how alot of people
> > > > have been doing things already for a long time..
> > > > 
> > > > Putting the commit last makes it work a lot more like the usual
> > > > merge-commit approach to preserve the cover letter. Particularly
> > > > if you open the branch in any of the web viewers for git, or gitk
> > > > you get a very nice view of the cover letter explaining the
> > > > branch followed by the usual code in reverse patch order.
> > > > 
> > > > It would be nice to use merge commits to mark the series
> > > > boundary,
> > > > but IMHO, the tooling is poor for this.
> > > 
> > > The problem with empty commit is that a lot of the projects I
> > > contribute to can be pains about only taking one or two commits in
> > > a series, which means I use rebase to figure out the exactness of
> > > what they've done and drop included commits.  I can't keep this
> > > behaviour and work with empty commits.
> > 
> > Why not? rebase works fine with empty commits.
> 
> Because I don't want a load of non-cover letter empty commits in my
> repo.  The problem is the current behaviour is all or nothing and I
> want elimination of commits that did have code but now don't but not
> elimination of the empty commit for the cover letter.

I still don't get it. Today git rebase will preserve a empty commit
cover letter with no special option. So are you unhappy with how git
rebase is working?

I've done the workflow you describe and have not ended up with empty
commits. In the first pass git rebase will remove commits that are
already applied by using the patch-id, these commits don't even show
up in the todo you can see with 'git rebase -i'

If rebase does apply a commit and the merge resolution leaves it
empty, I'm pretty sure it goes ahead and discards it.

Jason

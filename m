Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040B74A20
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 23:10:15 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id r2so9965720qta.0
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 16:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L19jrNRZqv+ydeOiZqO3MY6PDhuIuEag04Z3IQiPMyA=;
        b=bGGg+WETS6dgYnUNR93qr9irCFtFJqL2hjUZa77yvsmnPajfVFeMZSQCjpt3eKDWhf
         Mh+IOwcxiVg6W6os5qHTqva3VHR+RMs6lOW1KE5G0fSExWiYSyTzwyLN3XdOmMvmAWIr
         y9hJLiI/MLBvGOOnqw8H0iXmQ6B87ksJViqD3X6FkdL32h714l6C3cU2pml/onXmMMft
         rfbFajT0MUGKpzoqHhLQPJ5gtNRJMoX/UU74MtvjXwMD+TturoPwaC1RqciI+JhzvbPD
         /2Wu09XotdUx9LBsrceAf7Pg/N63+eQoP8GRImh2l/5urqN3+I1R7Rin/HVavls0iA6W
         +q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L19jrNRZqv+ydeOiZqO3MY6PDhuIuEag04Z3IQiPMyA=;
        b=UKqBztOLljbI0hELObg3ff46fVyx8rDTIV1CjNmGXJeV2xcy2x3FxDmpe80BwePbp/
         5UwTpEqqqIbmLtBRov1oypiH9/XfyzE0pyyomtm+5dnuZt7B2Iq70avON9D89130YoFv
         IeAZtXBYMWjFJhSNjm13z3sBoqjupXTcHxdByDZEaRwO49Ev4upBQs40C7w2GFPLmt3n
         HyBVrV8y9NZ7dTjwFuBdGlaPJXDf0Hq03tS30aBv6YBR3vN57yoUABgft4/BL9pByP0j
         +pmKbJYInh2IhGOOdBasW88kjF6VydP2GjX2zE4IDQlQyAkl0uCp2tOb+Q0J3oBE/C58
         9Y0g==
X-Gm-Message-State: AJIora8i9RulqBdyDfPME6MFARvaQ7tfA8WzMwwUgoeEqORzuYrH2OFa
	PVTCO6WlXgNq1od2Je1Nh8IENQ==
X-Google-Smtp-Source: AGRyM1vniGapBUdd5vEmHO3UL4dVLSNXtR63Ih9Pz+TGxc6YQG6EtfYfy8QtxPyJxo061ol8J4Oqdg==
X-Received: by 2002:ac8:594b:0:b0:31e:c570:d2b5 with SMTP id 11-20020ac8594b000000b0031ec570d2b5mr23326229qtz.96.1658185814410;
        Mon, 18 Jul 2022 16:10:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id u19-20020a05620a455300b0069c72b41b59sm13737153qkp.2.2022.07.18.16.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 16:10:13 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDZsS-000bBI-Ho; Mon, 18 Jul 2022 20:10:12 -0300
Date: Mon, 18 Jul 2022 20:10:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718231012.GE5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>

On Mon, Jul 18, 2022 at 10:28:13PM +0200, Geert Uytterhoeven wrote:
> Hi Jason,
> 
> On Mon, Jul 18, 2022 at 8:17 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev wrote:
> > > Perhaps, but I also have other reasons to like using an empty commit for this.
> > > For example, it makes it very easy to mark where exactly our series
> > > starts.
> >
> > It is a good point, but it is backwards to how alot of people have
> > been doing things already for a long time..
> >
> > Putting the commit last makes it work a lot more like the usual
> > merge-commit approach to preserve the cover letter. Particularly if
> > you open the branch in any of the web viewers for git, or gitk you get
> > a very nice view of the cover letter explaining the branch followed by
> > the usual code in reverse patch order.
> 
> So a tag does sound like a logical place to store the cover letter,
> as merging the tag already pulls in the tag description into the
> merge commit?

See 'git-tag(1)' "On Re-tagging" for a discussion on why changing tags
that have been pushed is a bad idea. There are many troublesome
behaviors here.

Tags are not a solution to store the cover letter during development..

> > It would be nice to use merge commits to mark the series boundary, but
> > IMHO, the tooling is poor for this.
> 
> Tou can use "git tag --points-at" to find out if you already have a tag
> pointing to a commit.

tags are also bad because they don't auto track - when I rebase a
series with an empty cover commit everything stays in order
automatically. I can even shuffle around where patches are in a
multi-series work and break up a series with new cover letters rather
trivially with git rebase.

If I use a tag I have to remember to update the tag after every
rebase. It is much more likely to break down.

Jason

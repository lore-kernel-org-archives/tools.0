Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB213C38;
	Tue, 19 Jul 2022 16:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0A1C341CB;
	Tue, 19 Jul 2022 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658247539;
	bh=ulysqD7q9OE76dhWjXP4/JvefYK5OWa20dZqxNd7arA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=akW2HMtkoYrdL9pec6LrM49NMyt753Qp69oAJVynKaA8hKLBbl952JfuC7lcjy+0A
	 YztZEJ6b4USPXEuo4QUJp4omDnNt91kHsQmC1+0bR14jyledsqBYIBL5ip9wmc8449
	 lZYro/5Jlcn0FvAMWUIf7xeY820wDQHBEfksmFocRSyLzONeOTUr1SKnxD7FIAW1b1
	 6Mz/vjqZfZep9x1GBCcqJ2Ow4CnMKT0YOqH6gb8RstWv8D93ZVvvKBQWqgoKt7tlz5
	 QmbP0HJn+rHwcphs5xSFQhkC9s4tC7mCsjXsZEx/N8nlrUSgSrSdjxxapSWAJiQeuO
	 hXUNH3itpD/sQ==
Received: by mail-vs1-f54.google.com with SMTP id t127so13867255vsb.8;
        Tue, 19 Jul 2022 09:18:59 -0700 (PDT)
X-Gm-Message-State: AJIora+ySJjnCIt7/EIAo025KiUsDkg92mUL8DbcjwMBl+gvhFyLRh/R
	oMFycIZGWBDiGnq40rQdBwvU6doEbWqk4ht1kA==
X-Google-Smtp-Source: AGRyM1s6z5JvavS6Tf/ht9humoRphKlFj9DX6tJ0nW0EVMO325IkrnzQ/03rUuBMeWUmi9RBIz5NW+OmYcKz0r8vdUw=
X-Received: by 2002:a67:c088:0:b0:358:bb1:fdf7 with SMTP id
 x8-20020a67c088000000b003580bb1fdf7mr984510vsi.85.1658247538563; Tue, 19 Jul
 2022 09:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local> <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca> <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <20220719123434.GF5049@ziepe.ca> <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
 <20220719130039.GH5049@ziepe.ca> <20220719135949.jlw3pfe3qz7xk53h@houat> <20220719153247.GI5049@ziepe.ca>
In-Reply-To: <20220719153247.GI5049@ziepe.ca>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Jul 2022 10:18:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ-niArbWtn8SpvYSn4oAmkttV3tzGEx01x5A0BtmPCnw@mail.gmail.com>
Message-ID: <CAL_JsqJ-niArbWtn8SpvYSn4oAmkttV3tzGEx01x5A0BtmPCnw@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Maxime Ripard <maxime@cerno.tech>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 9:33 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jul 19, 2022 at 03:59:49PM +0200, Maxime Ripard wrote:
>
> > > I'm puzzled why people are saying this is non-standard, it is well
> > > supported by git and works well with all the review and web tools. The
> > > only missing bit in git is a git format-patch flag to process it
> > > automatically into to the cover letter email.
> >
> > So, I definitely haven't been around for as long as you, but I still
> > have been using git daily for the last 15 years. It's literally the
> > first time I'm hearing about someone using that workflow.
>
> To be fair, I didn't encounter this until I started to have to work
> with gerrit, maybe 5 years ago.
>
> It seems common enough, eg I can find other communities using gerrit
> documenting this methodology:
>
> https://fabric-documentations.readthedocs.io/en/latest/Gerrit/best-practices.html#creating-a-cover-letter-for-a-topic
>
> If you are working alone you can get by with tags or the branch
> description, but as we discussed it really doesn't scale into a team
> environment because the data falls outside the natural source control.
>
> > I'm sure that it works great for you and others using that workflow, but
> > it's far from widely used still. I wouldn't call it non-standard
> > because, well, there's pretty much no standard when it comes to how you
> > should use git, but if we're targeting outsiders we shouldn't go too far
> > off the typical workflow.
>
> I think this thread shows exactly that there is no typical workflow
> here.
>
> IMHO Konstantin shoul decide if the goal if this b4 feature is to
> support everyone's unique idea of a work flow, or to implement a
> reasonable broadly useful workflow that is simple to use and
> understand.
>
> And I think it is a legitimate point that it would be nice if 'git
> format-email' could be taught to natively handle whatever cover-letter
> storage b4 wants to use.

git-format-patch already handles using the branch description with
--cover-from-description. Not sure if that means the git community
thinks that is the 'right' workflow, or just that empty commits for
cover letters hasn't been discussed. If git did learn to use empty
commits or tags for cover letters, then we are back to the question of
which one does the kernel community (or at least the subset that cares
about 'b4 submit') use.

Rob

Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828DA7B;
	Tue, 19 Jul 2022 07:02:54 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id c24so5011421qkm.4;
        Tue, 19 Jul 2022 00:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XN1pBj94wvj0kz7Pf17iyCadXjtwNJ5ECVblDOChJg8=;
        b=Wc3nUEhZQ8nXgn5/lrcJsG7mmEtNFwVlbZvnHUzSk0iUpKc2293808aCBYNTw3nUcU
         NY9PeiuID+mcUyVdkIbyVro+/NMvcM8fCejm/yxwgpMF3xHJQmEoZRw/l2ipTa7jJnvy
         RWVqXRSRFFg7y8oaEqRDRE7U3q67bls5S1bC/CzJRFiQhEvFwfN7V7UWUAdna6tnx+cz
         519X5abZKK3xLq1kCPaiDYwbTQWT92yzP863xoXgYu6lCEZbYinTHp5AnCm7S8prd4Fz
         XUajdwy16TjZdXXhFRHJLDMVEF95ndV7RtQKWLqGnTV4RlBNizIZ2VLnuLQK0sMc+LGp
         bkvA==
X-Gm-Message-State: AJIora/ZsyQzjmTVfgoE7XgwRm1IlP38mJV0qVR5zQ+vVaP0X3zUG1ja
	To7nfOGgKXKN4yFhC9gup2acbMKKGCQKmQ==
X-Google-Smtp-Source: AGRyM1tIKBroilPAGPtlsrxYOvWcNBCHOv8oGIkvgRCW7NlZs07vUAg0gt4ttQj+JUBtoyFhiMN7rQ==
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id v16-20020a05620a0f1000b006aa318e55a9mr19778104qkl.559.1658214173187;
        Tue, 19 Jul 2022 00:02:53 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id w13-20020a05620a424d00b006a79d8c8198sm12976558qko.135.2022.07.19.00.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 00:02:53 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 75so24937650ybf.4;
        Tue, 19 Jul 2022 00:02:52 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr29305038ybt.604.1658214172640; Tue, 19
 Jul 2022 00:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local> <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local> <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com> <20220718231012.GE5049@ziepe.ca>
In-Reply-To: <20220718231012.GE5049@ziepe.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 09:02:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
Message-ID: <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On Tue, Jul 19, 2022 at 1:10 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Mon, Jul 18, 2022 at 10:28:13PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jul 18, 2022 at 8:17 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev wrote:
> > > > Perhaps, but I also have other reasons to like using an empty commit for this.
> > > > For example, it makes it very easy to mark where exactly our series
> > > > starts.
> > >
> > > It is a good point, but it is backwards to how alot of people have
> > > been doing things already for a long time..
> > >
> > > Putting the commit last makes it work a lot more like the usual
> > > merge-commit approach to preserve the cover letter. Particularly if
> > > you open the branch in any of the web viewers for git, or gitk you get
> > > a very nice view of the cover letter explaining the branch followed by
> > > the usual code in reverse patch order.
> >
> > So a tag does sound like a logical place to store the cover letter,
> > as merging the tag already pulls in the tag description into the
> > merge commit?
>
> See 'git-tag(1)' "On Re-tagging" for a discussion on why changing tags
> that have been pushed is a bad idea. There are many troublesome
> behaviors here.
>
> Tags are not a solution to store the cover letter during development..

Oh, I always write my cover letters _after_ development, just before
sending out my series.

> > > It would be nice to use merge commits to mark the series boundary, but
> > > IMHO, the tooling is poor for this.
> >
> > Tou can use "git tag --points-at" to find out if you already have a tag
> > pointing to a commit.
>
> tags are also bad because they don't auto track - when I rebase a
> series with an empty cover commit everything stays in order
> automatically. I can even shuffle around where patches are in a
> multi-series work and break up a series with new cover letters rather
> trivially with git rebase.

True. But see above.

> If I use a tag I have to remember to update the tag after every
> rebase. It is much more likely to break down.

Why would you have to update the tag? The tag would represent what
was sent out, i.e. the tag name would include the revision number.
After rebase, you have to recreate the cover letter (with an
increased revision number), using the previous tag description as
a template.

It would be great if this could auto-insert a lore link to the previous
revision ("Changes since v${n-1} [https://lore...]").  Git can store
the commit hash into the Message-Id, but it also contains a timestamp,
so you can't go easily from tag to Message-Id.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

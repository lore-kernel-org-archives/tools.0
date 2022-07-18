Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC3F3C0A;
	Mon, 18 Jul 2022 20:28:26 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id v5so9680587qvq.8;
        Mon, 18 Jul 2022 13:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slTdVQZuBd+lxF6gag0ZwPCDwNy7/pooHLU0sOo6sTs=;
        b=aO80xnGJKz7ZEwBRDhB6k5t9ws76ga36QG+pIrdsXHoH5akfjmJsgjr5r1i35dOk87
         1zyAcJlCwUJ+UOkW+VHGWpeyizM+EA2hLKLzCXKTYrDhZAQvN9GfbrOzThdtDqj6Zm25
         d2lWGtDy9czocCq/CDbisLaxI/cC4dXOH/oUEexqq0byVSR1xELxjO2Q8CrrQQRdYrku
         OR+U/7WFdDYh75RCvS7rD3MV+HyTBQvLwuL2xTWQ1lZJmZLPQ8NxkZUK856+rR5xYg0R
         FrbG//sVHGPOFys7nvsn4aZTAli3vG9dLC5fwA7WS4FeSHr+RRmEYdbl1DVcisPNzXdo
         w9pg==
X-Gm-Message-State: AJIora+68bTbGw3LSVN8IJX7VMWoXiRMGCGT/hCEiTsgwl+HXahXo4Bi
	11N894xlx79xWD0YJa9Yx+fAAxnFkq5y4A==
X-Google-Smtp-Source: AGRyM1vjJ2fVpISI/OD5AaNzGZfdSZjb+ILELqTSrtzCdaT5iwAFtUrKjWvpjOuFVVVPwwpcj0f72Q==
X-Received: by 2002:a05:6214:5194:b0:473:cb8:f664 with SMTP id kl20-20020a056214519400b004730cb8f664mr22966038qvb.28.1658176105489;
        Mon, 18 Jul 2022 13:28:25 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id cc12-20020a05622a410c00b00316a384447fsm7113216qtb.16.2022.07.18.13.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 13:28:25 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 7so5396840ybw.0;
        Mon, 18 Jul 2022 13:28:25 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr27598834ybq.543.1658176104807; Mon, 18
 Jul 2022 13:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local> <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local> <20220718181732.GC5049@ziepe.ca>
In-Reply-To: <20220718181732.GC5049@ziepe.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jul 2022 22:28:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
Message-ID: <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On Mon, Jul 18, 2022 at 8:17 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev wrote:
> > Perhaps, but I also have other reasons to like using an empty commit for this.
> > For example, it makes it very easy to mark where exactly our series
> > starts.
>
> It is a good point, but it is backwards to how alot of people have
> been doing things already for a long time..
>
> Putting the commit last makes it work a lot more like the usual
> merge-commit approach to preserve the cover letter. Particularly if
> you open the branch in any of the web viewers for git, or gitk you get
> a very nice view of the cover letter explaining the branch followed by
> the usual code in reverse patch order.

So a tag does sound like a logical place to store the cover letter,
as merging the tag already pulls in the tag description into the
merge commit?

> It would be nice to use merge commits to mark the series boundary, but
> IMHO, the tooling is poor for this.

Tou can use "git tag --points-at" to find out if you already have a tag
pointing to a commit.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

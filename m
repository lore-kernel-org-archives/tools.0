Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF341C04;
	Tue, 19 Jul 2022 13:16:45 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id u3so1722443qvm.9;
        Tue, 19 Jul 2022 06:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wuNKQlUOFrMxudF30E3n+snP9gAc/WaoBccmWNLEPJs=;
        b=bDVH28ep3kmVitjsRLRcBBq/y/bkWfGqIoaESXXAO21eyYNqHn8+uEOg9cgo3DLW0v
         kasMnSqm/1BSWsPCtF5P22q4rWtvpK7cXj1A79JaQJ+jb7NnTgYmA3Dyotuf4hrVvnRt
         sUzZBjAyCB2Bbt5JOG69XLCvWWRb1ADJ1wmIlb/TqrmN1UJd7Y3M2lQlcnrv1hZ2lLcJ
         HbLFLHokqgRY5wxLcjRZ0rVxnHR4WPbAKGMJjjyW8Eyfwu9QOA/cMOMEr8qVsEEBFxj9
         D5qZIaVXDSyJbEjHHAlDEryeha1Lp9gpv4mBNckdVLQl/YUOnfp352Xk4jBg23vro7fL
         qFiw==
X-Gm-Message-State: AJIora9JEkyn2lRNIKbBy7CjHdJm2xRvpqxtXUH+zfOzQcaM7l+zozgb
	FQXS2Bxa+DRRg/+ha2IZF/Dpl4FwYWeIsw==
X-Google-Smtp-Source: AGRyM1tJXfQKjnyT+7mgJe5iAdcywg8Z2hbkUsJHph30xcm/5LvQ5/VH9Yx4gioXhUG7cAXcNkXobg==
X-Received: by 2002:a0c:b2cc:0:b0:473:e2d5:e6b6 with SMTP id d12-20020a0cb2cc000000b00473e2d5e6b6mr4944549qvf.29.1658236603728;
        Tue, 19 Jul 2022 06:16:43 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b006b53fe19c41sm14056771qkf.14.2022.07.19.06.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 06:16:43 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id h62so26294605ybb.11;
        Tue, 19 Jul 2022 06:16:43 -0700 (PDT)
X-Received: by 2002:a25:aacc:0:b0:66f:f1ca:409c with SMTP id
 t70-20020a25aacc000000b0066ff1ca409cmr21042748ybi.36.1658236603077; Tue, 19
 Jul 2022 06:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local> <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local> <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca> <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <20220719123434.GF5049@ziepe.ca> <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
 <20220719130039.GH5049@ziepe.ca>
In-Reply-To: <20220719130039.GH5049@ziepe.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 15:16:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk+d6qqZA_GHDofpPC--AUKmhNqPQKxEXdW7M0qUGwnQ@mail.gmail.com>
Message-ID: <CAMuHMdXk+d6qqZA_GHDofpPC--AUKmhNqPQKxEXdW7M0qUGwnQ@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On Tue, Jul 19, 2022 at 3:00 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Tue, Jul 19, 2022 at 02:47:09PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jul 19, 2022 at 2:34 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > > > > If I use a tag I have to remember to update the tag after every
> > > > > rebase. It is much more likely to break down.
> > > >
> > > > Why would you have to update the tag? The tag would represent what
> > > > was sent out, i.e. the tag name would include the revision number.
> > > > After rebase, you have to recreate the cover letter (with an
> > > > increased revision number), using the previous tag description as
> > > > a template.
> > >
> > > Using a tag as 'what was sent out' might make sense - but that is a
> > > different problem.
> > >
> > > In many cases the cover letter is part of the series, and complex
> > > series often have very big cover letters explaining what is going on
> > > that take alot of effort to make and review in a "team based" flow.
> > >
> > > Fundamentally, the cover letter needs to be source controlled while it
> > > is being authored just like anything else.
> >
> > Makes sense.
> >
> > So during development, you want the cover letter to be a real file,
> > using a specific file naming convention.
> > When sending out the series, you need some machinery to detect the
> > cover letter file, and turn it into the 0000-cover-letter.txt file instead?
>
> Here we've always used empty commits for this, for years and years
> now.

OK, seems like I understood something different by "source
controlled"...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

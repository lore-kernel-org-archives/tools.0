Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7AB1871;
	Tue, 19 Jul 2022 12:47:23 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f14so11063391qkm.0;
        Tue, 19 Jul 2022 05:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+CUHp7c/SxmufPNszqT/FiWskRqVz9G9WHMjiuxcYVA=;
        b=o8FxTaeTG+pSQvung7gzYnS5PxIlb2XfF3sAkRdwG40Klm4DwjzkotxdK8XSTfkg/i
         O59WrNoVwl2aM6ntuAiCvEdcld2ZNwQ0EPdopC/KoAj7dNlWdAMxnxyMEN5Bj0lpdihY
         lHvyy0Jf6sY98KFdn34iMuYWfwLgEEgWl6BG+SDP3gHqWWTHQQUb200bM79USHXtLTx1
         kxbl1s1mLDHqIxfkN701pic5gNyUDllgHBIhWb/+QcuIyVxqEVslDvx0EL1rxQJTMhE0
         t2iql58n4Mp4XZbfBJesQp/uMdijlFQylK1/CEwTtZLfBWGHbedxOQqvhBr4OPEZae9s
         UIHg==
X-Gm-Message-State: AJIora+2WIuHnkbx240r5cfo2TcH72hoJYT3IKbmQjFuCT7YGSTDabRF
	IpRNp6z2iEeTxQ2FZPu+o8d5Ufr1HEh06A==
X-Google-Smtp-Source: AGRyM1uVDdsYagCNPi08xyHkuC6GP7/KjbpA+cDbwj4f3KToMUz+mSEB4P+HPoLkVNLnEn2WYoDb8g==
X-Received: by 2002:a05:620a:25c6:b0:6ae:2408:6e05 with SMTP id y6-20020a05620a25c600b006ae24086e05mr19910803qko.240.1658234842566;
        Tue, 19 Jul 2022 05:47:22 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id br38-20020a05620a462600b006b5f06186aesm3928659qkb.65.2022.07.19.05.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 05:47:22 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-31d85f82f0bso139181877b3.7;
        Tue, 19 Jul 2022 05:47:21 -0700 (PDT)
X-Received: by 2002:a81:af27:0:b0:31c:833f:eda5 with SMTP id
 n39-20020a81af27000000b0031c833feda5mr35576537ywh.358.1658234841736; Tue, 19
 Jul 2022 05:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local> <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local> <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca> <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <20220719123434.GF5049@ziepe.ca>
In-Reply-To: <20220719123434.GF5049@ziepe.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 14:47:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
Message-ID: <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On Tue, Jul 19, 2022 at 2:34 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > > If I use a tag I have to remember to update the tag after every
> > > rebase. It is much more likely to break down.
> >
> > Why would you have to update the tag? The tag would represent what
> > was sent out, i.e. the tag name would include the revision number.
> > After rebase, you have to recreate the cover letter (with an
> > increased revision number), using the previous tag description as
> > a template.
>
> Using a tag as 'what was sent out' might make sense - but that is a
> different problem.
>
> In many cases the cover letter is part of the series, and complex
> series often have very big cover letters explaining what is going on
> that take alot of effort to make and review in a "team based" flow.
>
> Fundamentally, the cover letter needs to be source controlled while it
> is being authored just like anything else.

Makes sense.

So during development, you want the cover letter to be a real file,
using a specific file naming convention.
When sending out the series, you need some machinery to detect the
cover letter file, and turn it into the 0000-cover-letter.txt file instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

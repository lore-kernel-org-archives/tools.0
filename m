Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81A186D;
	Tue, 19 Jul 2022 12:28:16 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id w29so10101180qtv.9;
        Tue, 19 Jul 2022 05:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FpVsv6tMCckxRlTBj8W+MoIlM3JAg4xaEyc4hsvKFsg=;
        b=bl+C66EBMtp+ZVFDZD81eSPRjny4vjY8PAqymUrbJ5FZOitqexFM6mMsLSyLaVNbp0
         zK+q0/SkrDRokSwQxFdobUzuqXbaoUD+U7WCN3WuuXRi/dHXFw1uY8bW+covW/aZvA81
         vSXTAUE+qNJoEifX3TcnkHxM6Tmj0YmcfCbu/4V7LNqL3kWg/bUY+bCH7qDau1uBgkiq
         ANfQpMGl4rFYfAyw6dOwn/5Y5lnwa1BGwdqrkZoO4jWui2F/a0wSWvDGuBLlzxHWeWRm
         eNj0hTpOU0JukW4idfj2TuUUo9rW50zxrEWv0JrvF5hMZpKt1y98O0TwBnxiOJ9N5UGx
         OwKw==
X-Gm-Message-State: AJIora/509BcG2oiujysZo6TK+3nhOe3F7EAVurTzlz2/FnIFvqrhM/7
	9glkBR0MrUSY8I6pN91md9pNzBeXTTNTug==
X-Google-Smtp-Source: AGRyM1uXf1qO/jPx+9ln4u3LsiID+pxocpAwK++zKcomTfWCLaLd5ihgtaztrVPGy7v6is6gejqWuQ==
X-Received: by 2002:a05:622a:14d3:b0:31e:9bd3:9caa with SMTP id u19-20020a05622a14d300b0031e9bd39caamr24227371qtx.666.1658233695279;
        Tue, 19 Jul 2022 05:28:15 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id t23-20020a37ea17000000b006b5840f3eefsm13195852qkj.130.2022.07.19.05.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 05:28:14 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id l11so26106844ybu.13;
        Tue, 19 Jul 2022 05:28:14 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr30386532ybt.604.1658233694509; Tue, 19
 Jul 2022 05:28:14 -0700 (PDT)
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
 <Ytae3XK2uA5z93rV@sirena.org.uk>
In-Reply-To: <Ytae3XK2uA5z93rV@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 14:28:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY1XSVabvkVfXqWUqWLwnp4K0gA36fAR_O0NRiUHx=XQ@mail.gmail.com>
Message-ID: <CAMuHMdWY1XSVabvkVfXqWUqWLwnp4K0gA36fAR_O0NRiUHx=XQ@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Mark Brown <broonie@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Tue, Jul 19, 2022 at 2:09 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jul 19, 2022 at 1:10 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > See 'git-tag(1)' "On Re-tagging" for a discussion on why changing tags
> > > that have been pushed is a bad idea. There are many troublesome
> > > behaviors here.
>
> > > Tags are not a solution to store the cover letter during development..
>
> > Oh, I always write my cover letters _after_ development, just before
> > sending out my series.
>
> I tend to find that's less true for followup versions - when revising a
> series I tend to add to the inter version changelog as I go through
> making changes.

You don't add per-patch inter-version changelogs below the "---",
and collect them all in the cover letter (plus optional rewriting)
just before sending the new version?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

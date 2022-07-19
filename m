Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF471C04;
	Tue, 19 Jul 2022 12:51:55 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id r12so10975175qvm.3;
        Tue, 19 Jul 2022 05:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0FKoInhSVATt/BFm54xSgRvNlpkG270Bc3v3SExRB0=;
        b=ccPsnJClibYl5vZVB/SfcjvHxSJ5C8lQkl7HgPZwqBU0KT0UM77MJec+aVF6qESnGb
         D4gt1240E1JWihjhdMM8y7ezXehn3DaCAkjq5q4rF59M66LlbFKiLHzEoMTzrTJhsrQ2
         CjD2ZAiibcTrfAkMrTyqvd87TSjEvExvdeUUwPh5WrDY0EG0Zl3bfDGtTMKdvd4urOIt
         XJGdVpE+hr8fvE8WHIougmIYxg/1oXcqBtmopiYV9WeJjgnGw0eq+HWrRVLqVFiQW+L0
         wp2g5jaH7H7tIhGERIA5xQTjaHW/236x7j0dvn2YQS3qzstjw0iHpeU7YggUkD0SlnWC
         ZKYw==
X-Gm-Message-State: AJIora+zBgGZHWvTiyYNdJdcWrdDNKKpIOoLUgc/xeZsa0n+yNl4dL6x
	X1+qn65DaBnrIspfmObVUHiXLSfBbl5HuA==
X-Google-Smtp-Source: AGRyM1sHpFFP+mkUdapxRuPrFtE/7YtK0ABNGlgiqgKALf5K0xmi/3lyAMuum3YunVbKM0QxMDZzuQ==
X-Received: by 2002:a05:6214:544a:b0:473:5ada:7360 with SMTP id kz10-20020a056214544a00b004735ada7360mr24924415qvb.103.1658235114009;
        Tue, 19 Jul 2022 05:51:54 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id m6-20020a05620a290600b006b5c492aafesm12724151qkp.86.2022.07.19.05.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 05:51:53 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31caffa4a45so139569507b3.3;
        Tue, 19 Jul 2022 05:51:53 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr34775749ywd.283.1658235113412; Tue, 19
 Jul 2022 05:51:53 -0700 (PDT)
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
 <Ytae3XK2uA5z93rV@sirena.org.uk> <ede046d59801ff43038f4d59e711c1f3fdb72211.camel@HansenPartnership.com>
In-Reply-To: <ede046d59801ff43038f4d59e711c1f3fdb72211.camel@HansenPartnership.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 14:51:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8T9piN9i7_DtNJ5kbr4h5tDdRNuGi03UNFwYjYR1O=w@mail.gmail.com>
Message-ID: <CAMuHMdV8T9piN9i7_DtNJ5kbr4h5tDdRNuGi03UNFwYjYR1O=w@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Tue, Jul 19, 2022 at 2:44 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Tue, 2022-07-19 at 13:09 +0100, Mark Brown wrote:
> > On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Jul 19, 2022 at 1:10 AM Jason Gunthorpe <jgg@ziepe.ca>
> > > wrote:
> > > > See 'git-tag(1)' "On Re-tagging" for a discussion on why changing
> > > > tags that have been pushed is a bad idea. There are many
> > > > troublesome behaviors here.
> > > > Tags are not a solution to store the cover letter during
> > > > development..
> > > Oh, I always write my cover letters _after_ development, just
> > > before sending out my series.
> >
> > I tend to find that's less true for followup versions - when revising
> > a series I tend to add to the inter version changelog as I go through
> > making changes.
>
> I tend to put it history into all commits, so the v<n> version after '-
> --' in all patch trailers as well.  This means my patch series has to
> go via email to get rid of that information in the final tree.

Exactly.  Patches go out through git format-patch/send-email,
patches (even my own) go in through b4/git am.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

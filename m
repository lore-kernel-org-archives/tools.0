Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387D6D18
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 11:49:52 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id c6so15162270qtc.1
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k6chhoUnf7Vu6xgUQJyJy/H6U+3QiesZK3OvxS9ingw=;
        b=NHQD44NhlPvLaxcfReFR9vTKPBOP7dR6o8Kij5UKHNYOaSstAZ5Q8wzPv09XbsgUiC
         FuYtucilXpyRh4bBAPV32Cgk0wCh30wWWN3s2Pn3SZTG32xGK/RgXD4/JT6QSoaGVJda
         rh+6SSj1iwAmoPA52g6SraWhgGphgpEHEfY8GoEwGFJkrv2ephnlqKy+x4/+JcYRd8+p
         5m5n2HRaFxv9FgzpYzHXbzwkVqY3oa/jud6ObV/y2+F11jaMxrvdeCaXeRvosJEcaLaK
         oa7rWu1Q5B+6dc0+VcouozyAQu4Scp+YKkkvJMyAZN02Qxr4rTRWp/oGofAe5pyOcal0
         /qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k6chhoUnf7Vu6xgUQJyJy/H6U+3QiesZK3OvxS9ingw=;
        b=OAbi4PFA0uhb9ElL+nSszIL+VPgztpFFF+hoMDcvZ43EmljS02TvAVaMlVb02p5idP
         LbARKp42QY11aHb9O27M7USpovd8ctF+b72A88HFVMl9vdEx8zA9N6J1FKy0aOKiDObW
         9nDg6HipsZK9d5Vnj4FIvqIbYEJQMu6rBK+NyJSWp9ilsRQAZiYFrzcjIHnUXQSot0Ac
         1lFi1nvcyeUDiJUuIHbUnsuTnjpWWw5p6a4D2Q+gJ71KH7aJvSZiqFpQfxd+PBg+zwMZ
         X7IrSdC3hZd24AQDZBH2nXAZPn4wd4TMP4/zBRsXqHy4kZ6/iBOHq1i2avOfbGlD5zjT
         qFvg==
X-Gm-Message-State: AOAM530DxVSePTTchH1fCnlMyrelr3sSkHHjzod+Aw7B11Bf56IsMu8D
	kCquQpdwJVkXySKoF6fx8yHdyw==
X-Google-Smtp-Source: ABdhPJxdLNw+Uy/P4FlUteOivtDZM+vp89t6gxku5NIPmKiJNifh9wbQZ7gmosyjy+YqYnBXpo5brA==
X-Received: by 2002:ac8:5054:: with SMTP id h20mr8450981qtm.34.1618400991673;
        Wed, 14 Apr 2021 04:49:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id z6sm11943390qkc.73.2021.04.14.04.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 04:49:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1lWe1m-0065BV-4k; Wed, 14 Apr 2021 08:49:50 -0300
Date: Wed, 14 Apr 2021 08:49:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414114950.GM227011@ziepe.ca>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>

On Wed, Apr 14, 2021 at 09:30:57AM +0200, Peter Zijlstra wrote:
> On Tue, Apr 13, 2021 at 05:40:31PM -0400, Konstantin Ryabitsev wrote:
> > On Tue, Apr 13, 2021 at 05:29:01PM -0400, Steven Rostedt wrote:
> > > Now, I would really like the Supercedes: tag, as its just a link you need,
> > > and not a email sent. Ideally this would be in all the patches (with a
> > > direct link to what it Supercedes. I may update my scripts to do exactly
> > > this, as I always add a "Link: " to the last version, and that's in my
> > > repo. Or perhaps b4 could add this too!
> > 
> > I'd rather folks used the following notation in the cover letter/patch
> > basement:
> > 
> >     Previous versions:
> > 
> >     Link: https://lore.kernel.org/r/foo # v2
> >     Link: https://lore.kernel.org/r/bar # v1
> > 
> > This is much more succinct, indicates the version number in the trailer, and
> > removes the need to remember how to spell "Superseded", as there seems to be
> > little consensus. :)
> 
> How would you handle the difference between the above and:
> 
> Depends on:
> 
> Link: https://lkml.kernel.org/r/foo
> 
> Which is also a semi common thing to do with larger work that comes in
> multiple dependent series.
> 
> That is; I supppse; a long winded way of saying that for parsing (both
> human and machine) it might be useful to have distinct tag names. Now I
> agree with you that Supersedes is a crap word to spell, but it has the
> distinction of being clear on intent.

Most people I see already providing the above links in their cover
letters are integrating it in the change log, something like:

v3:
  - blah blah
v2: https://lore.kernel.org/r/foo
  - blah blah
v1: https://lore.kernel.org/r/bar

Which is pleasingly readable but probably not precise enough to
mechanically parse.

As getting the links back is somewhat annoying I don't see people do
it so often :(

b4 does a nice job helping the maintainer, but the submitter has no
helpful common tooling currently.

Jason

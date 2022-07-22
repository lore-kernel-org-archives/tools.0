Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F80515A6;
	Fri, 22 Jul 2022 09:10:56 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id i7so3049902qvr.8;
        Fri, 22 Jul 2022 02:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z6Rl9RbvtcYuoiLK1dPFIIOlgMj9vpaa2k/JM8xPGgg=;
        b=sdHDs36ex5Xq/ysKb2PD2iZTN9mXn0EfwZyYP6oC3C3gx5CiQkL7nJ7rbVyyBFzgOl
         w6NtKsfbTpCiv+2gj07tNeedSEprGO2JqwCHEBxG9UUBiFScGfPW54Zayo69q3SC4yA1
         pWqvwmSaR/q+oYWiEerhJYrWXAFU7jviR1IYbxlTMzNcO284X92RrIWGeruXaa5X/77q
         rWymwPXCVWkval24mhMd21YCsz++bAfoVyMdu9c/pXAo4RPBO+i6KyePMziWI6/mLFk5
         xXLmiQQBLBgLyDjh4Eren4kFqnt9h/brz/hL3FU5H+h2CNN+drk8w/RQ5UoS1xkmId+Q
         9CaA==
X-Gm-Message-State: AJIora8qGmjz5G9kL1uANE1Lrsk0tUuB99FrhT6J287ltReUnliNJMk2
	2ULOtRt++4bMaFt3F1iYtLF6kI4aWGgWpA==
X-Google-Smtp-Source: AGRyM1u5qNHDdaSd2x24DmgI8j1yOGBpnRx7D51tce3Mdn7q98VXK/oMW3aDY/nUKafegyBEEpO/rw==
X-Received: by 2002:a0c:e1c2:0:b0:473:9f3b:a3c with SMTP id v2-20020a0ce1c2000000b004739f3b0a3cmr2128500qvl.93.1658481054920;
        Fri, 22 Jul 2022 02:10:54 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bw12-20020a05622a098c00b0031ec9f9e3b1sm2665009qtb.24.2022.07.22.02.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 02:10:54 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-31d85f82f0bso41150437b3.7;
        Fri, 22 Jul 2022 02:10:54 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr2173253ywb.502.1658481053810; Fri, 22
 Jul 2022 02:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220720192456.GM5049@ziepe.ca> <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca> <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
 <20220721000256.GS5049@ziepe.ca> <Ytijr4YQn1OB88P8@mit.edu>
 <20220721023113.GO3600936@dread.disaster.area> <20220721130718.GT5049@ziepe.ca>
 <20220721224912.GQ3600936@dread.disaster.area>
In-Reply-To: <20220721224912.GQ3600936@dread.disaster.area>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Jul 2022 11:10:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPApC2-EeOrsM9PjQjMCwBcsOH1QyzMWErQ8R2u5yqbw@mail.gmail.com>
Message-ID: <CAMuHMdVPApC2-EeOrsM9PjQjMCwBcsOH1QyzMWErQ8R2u5yqbw@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Dave Chinner <david@fromorbit.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, "Theodore Ts'o" <tytso@mit.edu>, Junio C Hamano <gitster@pobox.com>, 
	Linus Torvalds <torvalds@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

On Fri, Jul 22, 2022 at 1:19 AM Dave Chinner <david@fromorbit.com> wrote:
> On Thu, Jul 21, 2022 at 10:07:18AM -0300, Jason Gunthorpe wrote:
> > On Thu, Jul 21, 2022 at 12:31:13PM +1000, Dave Chinner wrote:
> >
> > > However, I don't use that anymore, because updating the cover letter
> > > as I work on the series turned out to be a PITA.
> >
> > Can you detail how it was painful?
>
> Take a 20 patch series in a topic branch and work through the review
> comments one patch at a time, updating the changelog in the
> description commit as you go. Change first patch, commit. Update
> changelog, rebase series. Change second patch, commit. Update
> changelog, rebase series...

I use "git commit --squash" for each change I make, adding the
vN+1 changelog to the description.

When ready to submit, I run "rebase -i" to fold all updates into
the original commits, and update their descriptions.

> Now do that a couple of times a week for a dozen topic branches that
> contain 100+ patches across different lines of development with
> various inter-dependencies. Upstream tree changes trigger this
> update pain, as does testing finding bugs in random patches
> somewhere in the middle of the combined stack of topic branches.

Unless you start sharing topic branches, it might be easier to have
just a single branch to rebase, containing all WIP series.

> It's far simpler to have the topic branch description and changelog
> in a file/context that is completely independent of the commit chain
> that represents the series - it can remain open in an editor in a
> separate terminal as the rebase/rework/bug fix is performed and only
> needs to be saved once when the update/rework of the patch series is
> completed.

I only update the cover letter just before resubmission, based on the
"vN1+" descriptions in the individual commits.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

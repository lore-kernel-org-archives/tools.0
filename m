Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2463A6D28
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 14:35:08 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id j3so9963806qvs.1
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=uf76gkG9N8B+3jOgTGvRdsdZfbE6vIWdDzJYnS/0dZ0=;
        b=IxVJAA8D0LKjqb9XoAwen52WnmBwU8Ji3G2JA4HRg5RnvRnr81oArJpTAyrf1e8VD/
         odV3HViBVjajPbsiAQnImeAByO6/4H7p+JT31T2vKLc/9po4C2mj89GlLziSBy/1tJDc
         NWCgRebT1gC2p/y9vbGdGlIzSsas9zDdnu/D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=uf76gkG9N8B+3jOgTGvRdsdZfbE6vIWdDzJYnS/0dZ0=;
        b=hjS+N7Q75Q9tISriKTScddg9R33hIUQiXa3KnfdECNzuwJyi5h41pq75Ldvw7TlVqn
         ttHOc0FwNgfLAJQVrHqOdGOHq36JZUf5r9WJlBua7aWFDgnMif9a4syuJRh1nDYx4x1h
         joNGivt6Uha2dT+WX0c0p3NAJLgHkKNY5NyyokRB5OliT5Q8xqwsOxlLTFxeEOts9qUY
         omzByD+luDtTcLchYSMOB5B9A+wclfEchLu66Rn5gpz9bI9oKm1+cip0z7oWyQFBGIel
         3VwCrqdxHfAYdTSIaHeZeheoPjjjkLJNopF+MaEaf8O3hXyCzy1goJsqoXc/7bO2nHak
         beSQ==
X-Gm-Message-State: AOAM5302kL4rRPFMBuuukCa77to4YlgcsQDpuaG2L1KRCh4NBlHsWAa1
	QiIOmI0CuB11qXjebZ92WDHDTA==
X-Google-Smtp-Source: ABdhPJwTFLXES2sv84VwV5gAunUC1Lr7vDi8eguyFRe1RhDdPWX5/FBI6M7XoHBLtxmeMnO/+7zxJQ==
X-Received: by 2002:a0c:a9c5:: with SMTP id c5mr38826559qvb.6.1618410907023;
        Wed, 14 Apr 2021 07:35:07 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 132sm8231175qkn.52.2021.04.14.07.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:35:06 -0700 (PDT)
Date: Wed, 14 Apr 2021 10:35:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414143504.l3txdpd6xbcf6qh5@nitro.local>
Mail-Followup-To: Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>

On Wed, Apr 14, 2021 at 09:30:57AM +0200, Peter Zijlstra wrote:
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

It's the "# vX" at the end that we'd be looking for. There's no other reason
to put it there if you aren't linking to a previous revision of the series, so
it's a very unambiguous pattern. However, read below.

> That is; I supppse; a long winded way of saying that for parsing (both
> human and machine) it might be useful to have distinct tag names. Now I
> agree with you that Supersedes is a crap word to spell, but it has the
> distinction of being clear on intent.
> 
> So my 2ct go to adding Supercedes: and Depends-on:

Hmm... there is an officially sanctioned way to indicate patch
interdependencies using "prerequisite-patch-id:" footers (see
https://git-scm.com/docs/git-format-patch#_base_tree_information).

That said, I've never seen anyone actually use them, I guess for two reasons:

1. it's per-patch, not per-series
2. it requires running "git patch-id" on each patch in the dependencies

We could build upon that using "prerequisite-series-link", but I find that
unwieldy, especially if it will be followed by a long URL.

How about we borrow RPM-spec lingo, for stuff to go into the cover letter or
below ---, e.g.:

    Subject: [PATCH v3] frobdrv: improve frob latency

    Commit message here

    Signed-off-by: Dave Elloper <dave@example.net>
    ---
    Requires: https://link.to/required-patch
    Obsoletes: https://link.to/v1 # v1
    Obsoletes: https://link.to/v2 # v2
    ---
    Changes in v3:
    Style tweaks.

    [diffstat, patch, etc]

or:

    Subject: [PATCH v3 0/2] frobdrv: improve frob latency

    This series improves frob latency by 20%.

    Requires: https://link.to/required-patch
    Obsoletes: https://link.to/v1 # v1
    Obsoletes: https://link.to/v2 # v2

    [diffstat, etc]

Then I can add automation that will send "Obsoleted-by:" and maybe
"Required-by:" follow-ups to the linked series when it encounters these tags.

Does this work for others?

-K

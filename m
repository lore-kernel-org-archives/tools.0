Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.12611.1607449608039756405
 for <tools@linux.kernel.org>;
 Tue, 08 Dec 2020 09:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qSutCwnw;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
X-Gm-Message-State: AOAM530KnUzVlVagOff/Xa6BZ5tji565lE1A51826z9MbYiOPuAAw+fu
	dc/SpErNhbPyU0xD9YQ13iuwnFhUNQ2TGnF02w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607449607;
	bh=d7LYYsN6///ks70tTG54i3ftd1ZZWIacCIN5ZeQRReo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qSutCwnwF5xywPjtvTK1rkb/+FoCvwxn5rWI0NpkLIKqDyU655siI5bFYOebjTuAr
	 FNuqFAktFljHlVWSvZl2kUp2Zz6wJH0BzkD9eaHYsRQxYhzvprLP35wpUmei0Q9/Mi
	 tQUmzNk1h8RazVAVbbQoTVYAZg2qN80c0ZH6i7lXpSInyng/58mTDorQQyhLqm10zl
	 y09aIlX/EJqUVRfQt6zKTa69gfiK60JZaou/w52hQSnZMhY5I6DzJ4rFCzqMkP1acA
	 jVb6StIcZJ0cwKJUw1/1D68SGoxEWHdnjKvlt78feIsANbm2GSkHCx3H2i55W3m35E
	 Mhfk+QyzkuxIg==
X-Google-Smtp-Source: ABdhPJyVPHTsnXiJxt+XxTooYJQ4yJgM1uOrNlRAfhS1nzFhLJ2qxPmf1Ce7U8fChpyZBpdIz4+KsexSFIK3C/isk7g=
X-Received: by 2002:a17:906:1197:: with SMTP id n23mr12108012eja.359.1607449605832;
 Tue, 08 Dec 2020 09:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20201030173744.GA995986@piout.net> <1642D74B05A23708.27950@linux.kernel.org>
 <20201124182241.sojck3t76qjm5a2s@chatter.i7.local> <CAL_JsqJ8s6ry-nkSujEO1Pvxre=rW4p72U-_aadkQ-2Zc93sWA@mail.gmail.com>
 <20201208135926.fax4p7zqxpqgq3wo@chatter.i7.local>
In-Reply-To: <20201208135926.fax4p7zqxpqgq3wo@chatter.i7.local>
From: "Rob Herring" <robh@kernel.org>
Date: Tue, 8 Dec 2020 11:46:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMaA4X77PwvF3uHMZVMf8uvxEa5Dg_or_RaT9hbD92JA@mail.gmail.com>
Message-ID: <CAL_JsqJMaA4X77PwvF3uHMZVMf8uvxEa5Dg_or_RaT9hbD92JA@mail.gmail.com>
Subject: Re: [kernel.org users] [tools] b4 ty : wrong patch number when cherrypicking
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 8, 2020 at 7:59 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Dec 03, 2020 at 08:03:33AM -0700, Rob Herring wrote:
> > > > It shouldn't be -- I have a similar request in the following
> > > > thread:
> > > > https://lore.kernel.org/r/20201003193137.z2bpwzlz5a66kkex@chatter.i7.local
> > >
> > > There is a fix in the latest master that more properly handles these
> > > situations:
> > >
> > > - we record actual patch prefixes when we start tracking a series, so
> > >   when we send a thank you report, the actual counters will be shown
> > > - when we send a reply for a subset of the series, we will now insert a
> > >   "(subset)" into the subject to more clearly indicate to the submitter
> > >   that the series only got applied partially
> >
> > Could we not modify subjects as that breaks gmail 'threading'. Yes,
> > gmail is broken, but there's more than a few users...
>
> Well, the goal is to make it extremely obvious for the submitter that
> only a subset of their patch series got applied -- so I would argue that
> Gmail thread-breaking only helps here.

If you manually label things in gmail (or just look at 'Sent'),
replies don't get the label (and in turn aren't in the corresponding
IMAP folder). But they will still show up the gmail thread unless the
subject is changed. So the reply could just be missed completely
rather than be unclear to people that don't read the body.

> Overall, this would be an very rare situation, so I doubt anyone would
> care enough to get annoyed.

I'm annoyed, hence why I raised it. But if no one else cares, then
fine. I'm using mutt now in most situations I care about. I was more
concerned with less active submitters only using gmail.

Rob

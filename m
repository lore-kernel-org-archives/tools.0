Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.11243.1607007827888063841
 for <tools@linux.kernel.org>;
 Thu, 03 Dec 2020 07:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=skpYztB6;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
X-Gm-Message-State: AOAM532PeWh0dduvYi/ed34nvQ6c1BqBv3U1pGgRz43wE5s2Qe/mTsjX
	/ZBzbPO1rHw1/7yMoCrGK0Sv8BL5BGYmsu6cvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607007827;
	bh=OLobY8kinVEsZTJo7ZJzz7tUhQb6bw+BMZG5wqPn1YE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=skpYztB6cD1rpOWUjxHkqGkM+BQGuhgK5dBKpjt95LHzIRpwAy0Tmhapt9+aMWY1i
	 zpSKdkOmgqEPTVJIU17ZWGoZ7M/QiGkgzqyu00WYouUgSSbm6mxllYbQlCviZgSqJL
	 IRM+539tKWQa2bAuLF3UXuNvcKrRcXPZb+9qNmd8OxZzlBE+vqqcexfyLcaJUsjNaC
	 gKbHxqm7u7FXJxgcq6n1jhHiFKLKPFMNg6HR8Jag9bYv+w9x9Wb5xrI9BbzAenMWTP
	 hF3p2ZZVjyqXrqg/drTAfrdzYUrsbS6E23GmJXzMKyKcjQu0Bk/FSh8VL3YMkqdiqa
	 totBQ0qcnAcDQ==
X-Google-Smtp-Source: ABdhPJwoxTir4fcMz1gX+Nc1US9ZkV/YGq47b8lf5JnxAq7HhWbeJpEypjFUuyuzEfqQ5nje5Zcr/eS46vwnXEzKU7g=
X-Received: by 2002:a17:906:6713:: with SMTP id a19mr2986640ejp.468.1607007825151;
 Thu, 03 Dec 2020 07:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20201030173744.GA995986@piout.net> <1642D74B05A23708.27950@linux.kernel.org>
 <20201124182241.sojck3t76qjm5a2s@chatter.i7.local>
In-Reply-To: <20201124182241.sojck3t76qjm5a2s@chatter.i7.local>
From: "Rob Herring" <robh@kernel.org>
Date: Thu, 3 Dec 2020 08:03:33 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJ8s6ry-nkSujEO1Pvxre=rW4p72U-_aadkQ-2Zc93sWA@mail.gmail.com>
Message-ID: <CAL_JsqJ8s6ry-nkSujEO1Pvxre=rW4p72U-_aadkQ-2Zc93sWA@mail.gmail.com>
Subject: Re: [kernel.org users] [tools] b4 ty : wrong patch number when cherrypicking
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 11:23 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Oct 30, 2020 at 02:05:30PM -0400, Konstantin Ryabitsev via linux.kernel.org wrote:
> > On Fri, Oct 30, 2020 at 06:37:44PM +0100, Alexandre Belloni wrote:
> > > I cherrypicked patch 4 and 5 of
> > > https://lore.kernel.org/linux-amlogic/20201005203451.9985-1-post@lespocky.de/
> > > using:
> > >
> > > b4 am -p linux-arm-kernel -c -t -s -l -P 4-5 -o - 20201005203451.9985-5-post@lespocky.de
> > >
> > > After applying to my tree, b4 ty generated the message I sent (without
> > > checking, my bad):
> > >
> > > https://lore.kernel.org/linux-amlogic/160391135997.385141.5554228268638639718.b4-ty@bootlin.com/
> > >
> > > Where it had 1/2 and 2/2 instead of 04/12 and 05/12.
> > >
> > > Is this too awful to fix? :)
> >
> > It shouldn't be -- I have a similar request in the following thread:
> > https://lore.kernel.org/r/20201003193137.z2bpwzlz5a66kkex@chatter.i7.local
>
> There is a fix in the latest master that more properly handles these
> situations:
>
> - we record actual patch prefixes when we start tracking a series, so
>   when we send a thank you report, the actual counters will be shown
> - when we send a reply for a subset of the series, we will now insert a
>   "(subset)" into the subject to more clearly indicate to the submitter
>   that the series only got applied partially

Could we not modify subjects as that breaks gmail 'threading'. Yes,
gmail is broken, but there's more than a few users...

Rob

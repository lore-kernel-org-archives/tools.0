Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CF1FA8;
	Wed, 19 Oct 2022 02:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A49BC433B5;
	Wed, 19 Oct 2022 02:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666145122;
	bh=myNbiRh9MKR0eACVIm5NrnCePXKBsmap/yqJMdJ8RsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TAEYnWL8X0XWR+L4gNOMR0ql8y8M5+y8IPN8w/f4/IaZZKX4XiejnFBmwgmNh3Bd3
	 SWE708b5hZU8eQFBamnMklRgjzxNww29ZTXbN7V70WtSOo/Bfvan0UK9c7qV1hyqGB
	 9P6vuQuG1UFNDkk76kJGHJJhE+Ewv2Oxg1+h4Tty9g3ocHTFtTwai01KwTclcJ1ERf
	 gL0NFQ1LkclT1wY9+foExcPiYIcGU5eJTC+hHeghHuffjJ6zvahOhivm6G4EmjNCXJ
	 1dtbbKlN9KaM+ifviCklD5krEfDcXh1IaGGigsDJC8FtD9fhnkbsG8+EQ378GY1FRp
	 AAm+ryICj9jxQ==
Received: by mail-vs1-f44.google.com with SMTP id 1so12224490vsx.1;
        Tue, 18 Oct 2022 19:05:22 -0700 (PDT)
X-Gm-Message-State: ACrzQf1DXW/yIBJny+YMPHPSoFa5tV0MMTv9wREbj0GXJQX4F8VdmYE1
	QytfNp8m9f8kLUL+wZKNCuTEBvDxv1nSUD9mhw==
X-Google-Smtp-Source: AMsMyM7tCDPrJ6qXB4HcjjxVL71aid1J/rMpTUQuHXn+ci/tOQuqejP/b0dLzqBuyAnBDuancgp9lOScRHsx7qG0ieU=
X-Received: by 2002:a67:c088:0:b0:39b:1bb3:bdd1 with SMTP id
 x8-20020a67c088000000b0039b1bb3bdd1mr2770791vsi.85.1666145121218; Tue, 18 Oct
 2022 19:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20221018153620.tyuedbldi2ofbe2x@houat> <20221018201804.na5x7lohm4yszg5h@nitro.local>
In-Reply-To: <20221018201804.na5x7lohm4yszg5h@nitro.local>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Oct 2022 21:05:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJQx8T_a4M+78p2AyAGBD4esX+=Zs+XT9mT9oDd2z=oWg@mail.gmail.com>
Message-ID: <CAL_JsqJQx8T_a4M+78p2AyAGBD4esX+=Zs+XT9mT9oDd2z=oWg@mail.gmail.com>
Subject: Re: b4 bugs / future improvements
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Maxime Ripard <maxime@cerno.tech>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 3:18 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Oct 18, 2022 at 05:36:20PM +0200, Maxime Ripard wrote:
> > Hi Konstantin,
> >
> > Thanks again for b4, it's really great :)
>
> I'm glad you're trying out the "send" functionality, despite its experimental
> state -- your feedback is very welcome.
>
> > There's a bunch of things I have noticed in the recent weeks:
> >
> >  - It looks like 87e0e464959c breaks msmtp which doesn't recognize the
> >    -f option, and will just error out
>
> There's got to be something else going on, since -f is required for sendmail
> compatibility. The msmtp manpage specifically mentions that is supports it:
> https://manpages.ubuntu.com/manpages/trusty/man1/msmtp.1.html
>
> (see under "options specific to sendmail mode")
>
> >  - Generally speaking, rebasing a b4 series is a bit troublesome:
> >
> >    - It's a bit tedious to do. One needs to rebase and then edit the
> >      cover letter by hand without b4 being involved. I don't think doing
> >      the rebase interface all over again is reasonable, but maybe we
> >      could add a subcommand to set a new base?
>
> Interesting. I'm not sure I fully understand the problem, but then all my
> rebase tests were all very simple cases of running "git rebase <newtag>"
>
> Is there a reason why you have to manually edit the cover letter after a
> rebase?
>
> >    - If one sends a version, rebases, and then runs b4 trailers -u, then
> >      no tag is found for that series. I assume it's because the
> >      change-id has changed, but maybe for series that differ from the
> >      last sent version we could also look for the last sent change-id?
>
> This is really strange, there's got to be something else going on. Here's a
> simple test I just did:

Isn't this the same issue I reported where the patch hash changes and
no trailers are found.

Rob

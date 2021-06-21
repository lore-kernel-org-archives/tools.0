Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB0B173
	for <tools@linux.kernel.org>; Mon, 21 Jun 2021 23:07:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5566B61001
	for <tools@linux.kernel.org>; Mon, 21 Jun 2021 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624316867;
	bh=EMI0cTziUsGspfG2kgQM4FAuurht60FAdFGUsWUoSkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BSgHw9n+haq08O4AhvLWzNSszrO63gHtxbQv+sOKjtRWyyPkW7b1e2YBlFg8XWVff
	 GKhYjG/YNhnlVbUr76G58EFj1leCOzSgRp26hCVcEIKQL1ItJ3FAm4SoGFi2jm3sO+
	 nAYQ49JMV6kdIiiGV3a0xC/9rErK1B7Moq0gUEgYtNefscdvX+YKl8vzKXRjk2/wt8
	 fyVw4bon12LWgCe66xJ0DFn2mqdqJC+tLXFh4t2opFs91huwV+lgOAV9xTchBo7E8Y
	 A90NAVhpc1V1lk5fgWSJg6rlWF/wPrfHfvFqqd1+1piT8StX0/2qQEbbmFlbAVessQ
	 We3V2zyxFIKpg==
Received: by mail-ej1-f43.google.com with SMTP id gt18so31352417ejc.11
        for <tools@linux.kernel.org>; Mon, 21 Jun 2021 16:07:47 -0700 (PDT)
X-Gm-Message-State: AOAM5307Rh3Zb37kZ3fxZ2uh7P2Kg65HBEKbZJDr3XTDJyhWmf8fff7v
	ZFHPOufx6ojnmfktscxRcVsEazlYUkhG+POOug==
X-Google-Smtp-Source: ABdhPJyGzXbCqwLCz36imW9SwZICU1RO0Ohcf21gCFTv6NhUr2VyDlxV2nH7lJar4uPc6W16tJnIdJxHPmVcCFhSoDQ=
X-Received: by 2002:a17:906:1951:: with SMTP id b17mr545595eje.468.1624316865995;
 Mon, 21 Jun 2021 16:07:45 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210618182452.2577871-1-robh@kernel.org> <20210618182452.2577871-2-robh@kernel.org>
 <20210621200325.zgz4eibneuchus5d@nitro.local>
In-Reply-To: <20210621200325.zgz4eibneuchus5d@nitro.local>
From: Rob Herring <robh@kernel.org>
Date: Mon, 21 Jun 2021 17:07:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKntMMa7PjkxJQjK+YTykEtLbpMc=Hj+YhHCbMGguQ+EA@mail.gmail.com>
Message-ID: <CAL_JsqKntMMa7PjkxJQjK+YTykEtLbpMc=Hj+YhHCbMGguQ+EA@mail.gmail.com>
Subject: Re: [PATCH 2/2] am: Allow specifying a base to check applying series
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 21, 2021 at 2:03 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Jun 18, 2021 at 12:24:52PM -0600, Rob Herring wrote:
> > Add a new option, '--check-base', to allow the user to specify a specific
> > base git ref to check applying a series to.
>
> I just pushed a reimplementation of --guess-base into master -- can you see if
> it does closer to something that you want?

Yeah, it works. It's a bit confusing that the result is 'Base: current
tree' when it's not HEAD.

The more I think about it, the more I think '-b' needs to be a list of
refs or should be a separate sub-command and the user can iterate thru
branches themselves. It would work as-is, but it's kind of pointless
to repeatedly go thru all the 'b4 am' steps each time. A separate
sub-command would keep with the unix way of commands that do 1 thing.

I don't know that the guessing algorithm is any better now. When I ran
it with my current tree being something a series doesn't apply to, it
gave me some pretty arbitrary ref: v5.13-rc1-69-gcfe34bb7a770 (which I
think happens to be the base I just did a rebase on)

Rob

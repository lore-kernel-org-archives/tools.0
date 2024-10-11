Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E411CB51E
	for <tools@linux.kernel.org>; Fri, 11 Oct 2024 18:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728672523; cv=none; b=kbDmhPlTF7nAQgUSn817nmJlkgZXPLtMWbOCMi8Va06i24XXjgWk/r5DRsEqyxqM+SVcN6hT250YxbgsixYZdpdD7tsN4V/rtid/Ws0Q1eMAZp/ZXdY0K9kfu10GvuMdVTOx4vfH4Kr1MDBjscTU3CN7mxqf0NtReRcwYDqEpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728672523; c=relaxed/simple;
	bh=zXSPpB+S+O65QiywLueWuyjSjhnX+FOCCh1CBFcIdoU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNDQAkhPDE2EJlJwjOaZPiyRATSRmEb417Sqi980lpBRk3JL71+ANB/mte2GlREfAkeoJhF3IhcQ+ema/+R6QmatCI5tkfr+WHNISwpj/kzM/sd9cFn/nZ7yAXO6oNVTaGgcXIUkpQyHafe8dBQ9wx92dZhH5NUu02RA0sp1NYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cGXDcgOZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cGXDcgOZ"
Received: by smtp.kernel.org (Postfix)
	id 9D360C4CECD; Fri, 11 Oct 2024 18:48:42 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CE13C4CEC3
	for <tools@kernel.org>; Fri, 11 Oct 2024 18:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CE13C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1728672519; x=1728931719;
	bh=hVuzWDtF+PIHDBWagXIJit4WUg0kF7kHON/7piveUIc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cGXDcgOZvYAdOJDHomuW9YMT9KJwZBZQoH7vYYXMetCjSNnXSq5EikndfNtHT//ih
	 6tNqzduLlIZ289yTtQs3pB0es+Y+dVf9AUp61O598ppAF315D+K0piJMY3uh7paOko
	 GPfh8RWh19h8PDajdnTZWDJowrsK2ZO+aPwJ0qTxB7mTsPAetx3ujXvGQxqJbi9H5o
	 20yhqJUu8Yt1BQ+50Ln4qBkbeGcLvDG2NUmRK3MiJfo7E6B9/bWlSm1tNj9xT1H0KF
	 LC9qnyIvj4gCjYItxDCdKyuZvLYtTEJSTJBZCWz1AeOiM171lEtWRlc2BIXKveurdp
	 vG3zaPhncz16A==
Date: Fri, 11 Oct 2024 18:48:35 +0000
To: Brandon Maier <brandon.maier@collins.com>, Emil Velikov <emil.l.velikov@gmail.com>
From: Caleb White <cdwhite3@pm.me>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] b4: support optional shell completion
Message-ID: <D4T79H1PP9GS.3TMUX3X28SOZJ@pm.me>
In-Reply-To: <D4T4YGGNY30T.29QNDWMMTODP9@collins.com>
References: <17fd26a64c611f64.779eeb9e361f5655.8f7af20c5282c140@lt-cwhi-0222> <CACvgo50XO5M1ZHQPO-J8D+cSUftKqUFytJTwHmMnNMhMSEBJ1A@mail.gmail.com> <D4T4YGGNY30T.29QNDWMMTODP9@collins.com>
Feedback-ID: 31210263:user:proton
X-Pm-Message-ID: 39ba397f2af2b10db3a17e2f919d5f39a331bcbf
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Oct 11, 2024 at 12:00 PM CDT, Brandon Maier wrote:
> Hi Emil, Caleb,
>
> On Fri Oct 11, 2024 at 4:39 PM UTC, Emil Velikov wrote:
>> On Thu, 10 Oct 2024 at 18:12, <cdwhite3@pm.me> wrote:
>> > I would recommend using a `completion` command instead of
>> > `--print-completion` to generate the completion scripts. E.g.,
>> >
>> >     b4 completion bash
>> >
>> > This is a more common pattern and is used by many other tools.
>> >
>> > > +Shell completion is provided by the command ``b4 --print-completion
>> > > +{bash,zsh,tcsh}``. To enable shell completion run::
>> > > +
>> > > +    eval $(b4 --print-completion bash)
>> > > +
>> > > +To make it permanent on new shells, add that command to your ``$HOM=
E/.bashrc``
>> > > +or ``$HOME/.zshrc``.
>> >
>> > While this works, the more common pattern is to echo the output to a
>> > completion directory which is auto sourced, for example (bash):
>> >
>> > For global installation:
>> >     b4 completion bash > /etc/bash_completion.d/b4
>> >
>> > For user installation:
>> >     mkdir -p ~/.local/share/bash-completion/completions
>> >     b4 completion bash > ~/.local/share/bash-completion/completions/b4
>> >
>
> I haven't seen any good reference docs for this design pattern. All the
> tools I've run across document this manually using either the `eval` or
> bash-completion methods. Same with arguments, `b4 --completion` or `b4
> completion`.
>
> The shtab project also doesn't have any opinions and supports both
> approaches for arguments.
> https://github.com/iterative/shtab
>
> I have no strong preferences either way, I can resubmit with these
> changes.

Some programs that follow the `<program> completion` pattern are:
pip, kubectl, helm, composer, npm, himalaya (Rust email client),
the GitHub `gh` CLI, etc. Ultimately, it's up to you and it and it's not
the biggest thing either way, but this is the first thing I look for
when I'm trying to figure out how to get completion for a new tool.

Usually, installation docs will show both the eval and the completion
directory methods. The completion directory method allows for lazy
loading of completions, which can speed up shell startup time, but
it could just depend on your shell.

Best,


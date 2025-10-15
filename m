Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E246171C9
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546450; cv=none; b=LpKP/4A2UAZI0+XY4nj5PuZOIv4f067mDaK9mJKsYHcOTzwCdS3JhRmqQgfb6X09Mc27e9w4kch0s718uWLAPWnsUUzB2o5PPQTvJDXyGViF8Io4XFiSTljtg6dSHDhGo61JR0wJ/zsBqgT3PXjzPwKCMSXi/fFTmszFDgOrRP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546450; c=relaxed/simple;
	bh=GQJKeE42pFls+fjtcwV/VVt9hPe8dtZotKIMAkEeP7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4RLY8bcfM/7gWrgFlrWv/ALBoNo7+iE68wEkXIRGy33sPPJ1xYpjyGgKIEhZZLYxxJSdn2ftNsuaiAJX7E1NDKSPMu1dj/KKJobIrnN9ArtZvGrYZnfnp7NdHCJAtARB9Pij/twRBuAuZwMZkjPmqvFwE3SJXUGCeqWVBG5dgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0iNTdVS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0iNTdVS"
Received: by smtp.kernel.org (Postfix)
	id 32A74C4CEFB; Wed, 15 Oct 2025 16:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D021C4CEF8
	for <tools@kernel.org>; Wed, 15 Oct 2025 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760546450;
	bh=GQJKeE42pFls+fjtcwV/VVt9hPe8dtZotKIMAkEeP7Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C0iNTdVS9PFeEiBl6uk4Q2kmY/IJ1HdiGgUZkb68fxzhsJBTV9aP4CZWZ5yP1qO4J
	 VAL1df59xLdbod7MI/fu7ZaZKQidynwjXZab6YK1xlxi3qgOZ7FlC+tO8O78CCeURD
	 V1PpJtPLi6QnA+aH1Ml60cLJPlDZtkjvGlA4knqL57o2NgzpGWvz2nHLxoNaGwJSl2
	 Nf1W1r+VUNdA7vX5JHkyBGkP6RhtrvsAIS7VfXUkNGnjPG8o3UpuBKR4VW/olSsraw
	 opBQrvgFctDiSw9iaHsLHnT/YZF5/YRqZP9X67MBMxRAtFpJo0RtJKNkqboSRH2xcj
	 myG1TmuTcCTow==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4539dddd99so471782666b.1
        for <tools@kernel.org>; Wed, 15 Oct 2025 09:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvKYsUjQt6NlY5n2aBsj9r1QashyfWOgXqYM4GiFVyLcGQ0VqL6Z9J48mi5osSQg/x6MItvg==@kernel.org
X-Gm-Message-State: AOJu0YxfTTvwHsmdHsOt5PJS+NidR9uOqNFp8Hs8XnmjKQ+wR7EKnStJ
	YuBpv5RxjakVM9e9J9FOLLE6AxEIxsgu7TBUW5SN6Rr6+ykBcEkX+MUL0JlZTBMZy32l8mpL8uF
	jnwNWptOiXYiJhxz6YJUPM9i30+gGTw==
X-Google-Smtp-Source: AGHT+IH6icgWzH3Zilt3SGfQHRgQizZgQm0DqknYe/1FaqAA6P4ga8RWrV1CerAS7TMx+FeNQ4d4MBjcsTFawETrIZI=
X-Received: by 2002:a17:907:e8e:b0:b45:eea7:e97c with SMTP id
 a640c23a62f3a-b50abfd5effmr2869734766b.47.1760546448682; Wed, 15 Oct 2025
 09:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur> <741ab86b-753d-40ec-91b5-e1b8bb4a3de1@sirena.org.uk>
 <20251015-arcane-lyrebird-of-ampleness-aec27c@lemur>
In-Reply-To: <20251015-arcane-lyrebird-of-ampleness-aec27c@lemur>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Oct 2025 11:40:37 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Y-hwAgsCd632YDwb78Z3nJ7xZ3tp44qHcUsJnuAUF+Q@mail.gmail.com>
X-Gm-Features: AS18NWAONdhY0kXfQ0iQSAMnzL4Kb4OHkRUOvTUzQLW6monZlvVCAAYY6xc8Xc4
Message-ID: <CAL_Jsq+Y-hwAgsCd632YDwb78Z3nJ7xZ3tp44qHcUsJnuAUF+Q@mail.gmail.com>
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 8:45=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Oct 14, 2025 at 11:13:00PM +0100, Mark Brown wrote:
> > On Tue, Oct 14, 2025 at 05:17:43PM -0400, Konstantin Ryabitsev wrote:
> >
> > > "b4 dig -c [commitish]" will now output a single link to stdout (all =
other
> > > output going to stderr), so that it can be piped to other commands. I=
t should
> > > be the latest matching patch received by lore prior and including the=
 "author
> > > date" of the commit. This weeds out all ensuing backports and cherry-=
picking
> > > efforts.
> >
> > It would be really handy to have a --mbox (or something) option that
> > will download the mailbox like b4 mbox would, my main use for this (and
> > for the existing link tags) is to pull the message ID out of the link
> > and feed that into b4 mbox to get a mailbox which is what I'll actually
> > look at and work with.  Obviously that can be scripted locally but it
> > seems like it might be a common enough need to automate directly,
> > especially given that the scripting will be going right back into b4.
>
> I just added a --save-mbox option to use with -c. It is currently exclusi=
ve
> with --all-series, but I can also make it be non-exclusive, so that someo=
ne
> can save all revisions.

I would find that useful, and not just for 'b4 dig', but for 'b4
mbox'. My workflow is essentially get a msgid from patchwork and then
fetch the thread to read with 'b4 mbox'. A current shortcoming with
that is I don't see the prior versions. Best case is there's a link in
the cover, but often not and that's a switch from mutt to my browser.

Rob

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A76313263
	for <tools@linux.kernel.org>; Sat, 20 Dec 2025 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766264204; cv=none; b=lYGVhJvPtvKkQ425uTSjY5mo7Yr31E/U1idr5bMbT/ayjbMvnQKruM3c0E4ECOPGMIjvKglAO7BusiErIeTHlmYHKx623HiMZ/mpd2Sm5HeHEKMMZBqGCC8fagNMHA6gkUjwCMkpvG6E2MQ/A+pkRUR388UbJgBPKTkfchhI2co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766264204; c=relaxed/simple;
	bh=TVleq1r1pK3WTC8libHO6pOnhN9gsocMcW6yp64hWqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJaE6YolFAxIMziZNjz2DvbXpigOUL26NVgXN4HV7imofFj6CSsXLk+1nGotYlQ3L0DSJhlcD46ipUNT1iKf3nBSRavflshx+9wEaylknLL44PuXcI31lV6mDAn81rI8TfxzuniELSC+Wgt6/rXkpMcqeb3UkaNRs/ZbDIXmH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nri98sSs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nri98sSs"
Received: by smtp.kernel.org (Postfix)
	id B65EEC4AF09; Sat, 20 Dec 2025 20:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BCFC4AF0C
	for <tools@kernel.org>; Sat, 20 Dec 2025 20:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766264203;
	bh=TVleq1r1pK3WTC8libHO6pOnhN9gsocMcW6yp64hWqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nri98sSsexWXeB3E349Dh+0dZ1m/67oUfezN4g3o0XpsE2TXmWVCQ1pX4fT9aH74y
	 bp3mYBb/P3JMclUCZozts81I+fGauUZQlo4tkJSsGChNVt0HShDiQGvqMnQz+yFcfk
	 CyA9TxbvXGieKTmWS+Q5D3rNPYSrEPdqzKt/wjF29suUGJ4kVne36vi2iiWb/MCkFg
	 UDep2Y2fGRk+8gpIVZVwwUSBIokJRnffzYmutty0+ObXHLz1rEFXgpu5w93Xka1FqM
	 J4349KeiYGELoEnxbzgdhdyeFBPqpnisvLl5KYI3BJBpv3cEswCGCiyg4TbgmbPcQq
	 4lL9DJlE6NJ/w==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-642fcb38f35so2352615d50.1
        for <tools@kernel.org>; Sat, 20 Dec 2025 12:56:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX603eOS73iAxU4cfJ85SV9Z1H8BjtkBP1YoJylKiGqjl0cI1s2vPn/37EREM8d1Z8w5Z88zg==@kernel.org
X-Gm-Message-State: AOJu0Yz5LbXUa/owS237Ndt41XgcBW0CEjdezXSki75P2lWQcCUQ8HFt
	/ab1ddFRbs7JlL9uDAolOqFbZM0MaNnvqE1tHdbGUi0o4YTIFRtkHEOo+Unfyd8Wu9rpZx0R+6N
	v8hiOUPiPnGQoCxBSmsqODJ4K5+hGtbg=
X-Google-Smtp-Source: AGHT+IHy6ZSCgqUGCikNKbyuE3WTw5SiWCMrXNPzGyZmz4dEOXwgNEBSU2h8/GEqL4xrYMn8SkiyR6iR1E3bTxlJxIM=
X-Received: by 2002:a53:b048:0:b0:644:77bb:5705 with SMTP id
 956f58d0204a3-6466a8c51ccmr4620653d50.77.1766264202625; Sat, 20 Dec 2025
 12:56:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur> <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur> <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
In-Reply-To: <20251218-merry-azure-chicken-4d3724@lemur>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 20 Dec 2025 21:56:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
X-Gm-Features: AQt7F2ocb671rZC66fEl_M6HVp2Ru2NhHkSJlvZ7oty29BPYD45wyI5TWRjegn8
Message-ID: <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 1:38=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Thu, Dec 18, 2025 at 11:41:17PM +0100, Linus Walleij wrote:
> > > Oh no, this is what happens when I don't check adding new feeds after=
 a major
> > > refactor. I think it's working correctly now in 0.2.2 -- please check=
!
> >
> > Is that also in the git? I just git pull --ff-only from the korgalore g=
it and it
> > still says:
> > Successfully installed korgalore-0.2
>
> It would help if I push, eh? It's done now.
>
> Try the master branch -- there's also a "kgl track" there that lets one
> yank arbitrary threads *and* receive any updates (requires lei).

I kind of guessed on the implicit dependency on lei so I already
installed that anyway, perhaps the docs should mention it?

It works fine now! kgl update pulls in the new massages since
last run, which I assume is how it is supposed to work? For a while
I was worried that it would suck in the entire LKML history :D

Excellent tool Konstantin, this is exactly what I need!

Some examples on how to use it to get "your personal developer
feed" using lei with korgalore would be deeply appreciated.
In my old gmail setup I have a "!TO-ME" folde which labels all
messages from all subscribed lists where I am listed on To: or
Cc: and put into that mailbox, I assume I can achieve the same
with lei I just need to figure out how. I think this is a common
maintainer usecase? Or how do others do their work?

Yours,
Linus Walleij

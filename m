Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8233559D8
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442815; cv=none; b=JggcjmfVgN7hUqWxo0jFpzyDWV4H0Q9vp4JkpI7lynK6C/xadtkPeFCh7G3hVZCJpNtOQ29fKnaoGe3rdpIDNkyufStNnRImSK8s/40Mja6Cd19EK7nefKA0/ZDajDcUVThFD51zW/VB6TIHJ3BYccBpPluQV4hAveoMLIz9l7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442815; c=relaxed/simple;
	bh=jukllxETKAT93XGZdPjrPkU4AhJW2EJaVEtcDgnCHCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0H/nNUS0BKFYFY9MjtEYdeo5mHv428PJUU3VpAMGA31wCojjs5xO1OfxSQ2/c+3R7t57HEX4zwNr7HZVNCYKHubdB4xOETrJrkdj7fWhVoQfcyOwZ7KiSpTvESUxNiegqUYwIHDgH95R4F4jK/5OXboqTCDfLlTdNnB/MOhsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Med0mlKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Med0mlKD"
Received: by smtp.kernel.org (Postfix)
	id 6AAC7C16AAE; Mon, 22 Dec 2025 22:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552CDC19422
	for <tools@kernel.org>; Mon, 22 Dec 2025 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766442815;
	bh=jukllxETKAT93XGZdPjrPkU4AhJW2EJaVEtcDgnCHCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Med0mlKDfGTjFOQnw+Lx351q0ZjhXtXCob+EfA1k4OhgJZNqMByF4DcJB9L8hPC2s
	 OsgnOqKHMqv7hv0JjiosW4bhw53EgEUSe7XKeF52aYm9M0IrVIwX8blk0vospn0tZB
	 RIwaGjg3Yb/40RymZiyJBPAmxTqT2sMN3UAjmRDgpClpXYtrv2dTcXeSXY7t7K/cJj
	 i+PXe15msgwJOnRs/vzowxzMAe7i2hvCK12kzWRPIuMorXaaOsook9j+PnnlGrVJxU
	 VB+mL2VXM/+o1tMu0QSldDujvLKmu0ffBVM9IWTwGf7YaJ4HXEVlaTQgYwgy0F83G5
	 6mft9n9lEftKQ==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so3934812d50.3
        for <tools@kernel.org>; Mon, 22 Dec 2025 14:33:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2pLiV4bNqY6IL9p+5U20SBmxeiebPeF0tCHEDtvHj1ezyGzvEhozREf048ezdVSWAUvgRJw==@kernel.org
X-Gm-Message-State: AOJu0YycZsLhYzmr2L3nsgMATKJR2dWbFIO7wRhjjoeXda/x1R1prFV4
	asiI3hzoe9Wm1UvNBbepPnZoQ9ncyGwJpuWNh4eCDNy1gaaSVA1RcO1pKe8dkbxzRmR7OPtwaPR
	G+SVF6VWRgn9Npc+Sq2MRheoR6NCmPYE=
X-Google-Smtp-Source: AGHT+IHa3etAKejopZNyPcM/+kDBcOAbeJAdcI8lWP24svcytKXM7YvXSBAQoTLqq0Epf6OHjousl+lb11MNS7G4iCg=
X-Received: by 2002:a53:cf52:0:b0:644:6f3c:11f3 with SMTP id
 956f58d0204a3-6466a846536mr7494166d50.27.1766442814704; Mon, 22 Dec 2025
 14:33:34 -0800 (PST)
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
 <20251218-merry-azure-chicken-4d3724@lemur> <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
In-Reply-To: <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 22 Dec 2025 23:33:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
X-Gm-Features: AQt7F2pL3jF8y3KhD3CCWsG_clMsjyFFkOu8UShWpGLDm8AvRoBGpzC8bgVITrE
Message-ID: <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 4:50=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Sat, Dec 20, 2025 at 09:56:31PM +0100, Linus Walleij wrote:
> > Some examples on how to use it to get "your personal developer
> > feed" using lei with korgalore would be deeply appreciated.
>
> This is the next step -- this tool is a stepping stone towards the "maint=
ainer
> container" I talked about in my tooling update. I'm hoping to have a smal=
l web
> frontend (accessed via localhost) that can manage most of the korgalore
> configuration, which would also assist with putting together lei queries.
>
> It could also help automatically convert F: and X: patterns from the
> MAINTAINERS file into a lei query, so that someone would just have to pic=
k
> their subsystem to have the (mostly) right lei query set up for them.
>
> > In my old gmail setup I have a "!TO-ME" folde which labels all
> > messages from all subscribed lists where I am listed on To: or
> > Cc: and put into that mailbox, I assume I can achieve the same
> > with lei I just need to figure out how.
>
> You want:
>
>     tc:linusw@kernel.org
>
> The following query should do the trick:
>
>     lei q -O https://lore.kernel.org/all/ \
>         -o v2:/home/[username]/.local/share/lei/to-me \
>         --dedupe=3Dmid \
>         'tc:linusw@kernel.org AND d:1.month.ago..'
>
> Then you can add a korgalore lei feed:
>
>     [deliveries.to-me]
>     feed =3D 'lei:/home/user/.local/share/lei/to-me'
>     target =3D 'work'
>     labels =3D ['!TO-ME', 'UNREAD', 'STARRED']

I like what I see, I will try this out!

One TODO: after 1 year to 6 months if using korgalore users
will want to purge old mail, say "kgl prune" where they like
to get mail that is > n (week/month/year) old deleted from their
korgalore imported gmail folders.

I have a script like this for IMAP currently that I just run
regularly, when I hit this brick wall of storage I guess I can
start looking into adding this to kgl unless you beat me to it.

Yours,
Linus Walleij

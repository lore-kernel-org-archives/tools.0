Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3876350D6D
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325355; cv=none; b=qWPLj27jzRJd+vleFM6tduDj8sIQjayFxG2BPxSvAg6LuK4Z6CczW15R9+jsW7GFhVMQ+Dpe/q8BIug7JrZS3nMuoEKnKzH7fCLfe5AzeR8/lbNN8o7Ptx3Ca4UYSZ98Wnelv3GlMzxJ3YosAwWWp+OixlzG7yUhfxwwsjSQXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325355; c=relaxed/simple;
	bh=62mQqeHBq9ZyJFFxcskEyz8sLHwJGaf95x5A0qDKOp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmBfXwShPA/6DyeYgpUJf4cyj+baBteSUBNvV+DhOuuYO3byX4xlkI6//2LLJgOxGCGdpGsE1l7Mcg1IX5d/k9dKRHh75QOY6Q3dXlJcBvBz6puR8zxQSN/5KXkB7qOEh2mV7Hbo744kaNZQWSHDLYVVpjQwHc7yfawDdb/j0fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6WMHB4n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6WMHB4n"
Received: by smtp.kernel.org (Postfix)
	id 61679C19423; Tue, 13 Jan 2026 17:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C126C4AF09
	for <tools@kernel.org>; Tue, 13 Jan 2026 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768325355;
	bh=62mQqeHBq9ZyJFFxcskEyz8sLHwJGaf95x5A0qDKOp4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u6WMHB4n6tcVQDuDQF9pR9T0uYpWV0mJwQTEWIyTFMkuDaQ4m+T5njUZ0bKMsFjFR
	 FkwfEEJGIPz/VC+p6T9J2SRqIzRWojonwuvl4A2GGkPbwbS/HK3Jvuo/ijjCaYGHSB
	 +MKF+DxSefbI6OMSfrdxQblC3NjY9CscnoM8JFU4tIWvlqw+1lxbShkRaIlGu3IibC
	 AivbUA3vwQvKhHwlys6FL3JTG6cw7U79uIVoQguzr5lNJjbHKn0cCLdjKvmSC6tiAT
	 havWRfCBXwogbLSIrRtw7gVMbDyk/pUGWHZInE2CUcHH4V5knDukk2A9Y71g1FM6rz
	 /dy/Bn/C8fFVw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b871cfb49e6so391580066b.1
        for <tools@kernel.org>; Tue, 13 Jan 2026 09:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFTJkcOG3+RC61Xm6/DDVVqBuv4uUCK/Ufx4itOyMTz/Z4eJI5tyZ/RSfso+1ux8gLwS9VIw==@kernel.org
X-Gm-Message-State: AOJu0YyBs/1CsbRgRapb6xF9cfS5ValUFMnHMSW2rR/9eQ+gOtUtXUzw
	H3gcgf6rLAOmF7NjGpKglrzATrZ9iWcDjBLDdV2Kx0XIkNoemGi57rqJXdeALIadf46xvRAFSi5
	MW+PRmLK1hKRcnxvuKBl1md4xTFAz3Q==
X-Google-Smtp-Source: AGHT+IHGvZzL+t05288BvLklGnrkgcTY4GNz7NcK9Z3SzJfeoUc0ZoP+K7XqjirwxipqzodYcnmKFiaW0W9K2gqoB70=
X-Received: by 2002:a17:907:e10d:b0:b87:205c:1aa7 with SMTP id
 a640c23a62f3a-b87205c1d96mr483494266b.44.1768325353819; Tue, 13 Jan 2026
 09:29:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur> <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur> <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur> <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
 <20260111-hilarious-spicy-cobra-ad26c6@lemur> <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
 <aWZCqXlJcMEQU-J9@bogus>
In-Reply-To: <aWZCqXlJcMEQU-J9@bogus>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jan 2026 11:29:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+f6A4zn6Ea-jK4YuP6RkY1syHEPwf-jGN3iPSOD5fL1w@mail.gmail.com>
X-Gm-Features: AZwV_QjexkRTJroFuVC6Z7iGsXy-But9ngpPDyWEmoC9fnNDYrMj6NgFLELiIts
Message-ID: <CAL_Jsq+f6A4zn6Ea-jK4YuP6RkY1syHEPwf-jGN3iPSOD5fL1w@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 7:11=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> Hi Linus,
>
> Thanks for reporting this, I have been postponing it for a while.
>
> On Mon, Jan 12, 2026 at 08:52:45PM +0100, Linus Walleij wrote:
> > On Sun, Jan 11, 2026 at 9:16=E2=80=AFPM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> >
> > > > I would almost set this up to run as a cron job if it wasn't for th=
e fact that
> > > > the Googly API wants to reauthenticate every now and then. Other th=
an
> > > > that it is smooth as butter to work like this!
> > >
> > > I've not actually had to redo my gmail authentication again, but I do=
 hear
> > > that it's less smooth for others.
> >
> > I've had to do it twice, second time today.
> >
> > About that!
> >
>
> For me, it's most 1 week and I can see that it matches the expiry in the
> token.
>
> > What happens when the token expires is this:
> >
> > $ kgl pull
> > (long splat like the one below)
> >
>
> Yes I too get the same if the token has expired.

In case you missed the earlier discussion, you can also just use IMAP
with gmail and avoid all this. I just moved over to IMAP and it works
fine. The only limitation I see is you can't set multiple labels on a
message if you wanted to do that. I only used multiple labels for the
UNREAD label, but that seems unnecessary for IMAP.

Rob

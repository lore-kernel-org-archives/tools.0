Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C5321F5E
	for <tools@linux.kernel.org>; Fri,  9 Jan 2026 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768001487; cv=none; b=gLTGfMzp4ZWXPOFU3wBM7pyd1RNY6arHEbOAj1srxykhDLMRI0VglzRifokBMmJkHVtOYDJBNpVydDk8sMFLRVs0ISRfowdzSuiAI7CRi4558s3VRN8kZHCCyp+eDKxbnA7qiP1AsZzVVQp+iB6pF4z4P1F71fVhYdrnl+A1WrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768001487; c=relaxed/simple;
	bh=Jp+5zj2uaykiGiqkkDRVoIZQn0QLMyla//Yzs/OCPkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4G+nRSlLY51OBcQ53/xIiZWfdg5CRBsgfpbXibAD7wAFgeyvU7S29BOrYeeo6dP9YIrMHjglB6c57MvfPmGsR9KJwZibNZkkVkviIqSUFSdYVaAetysl0RJ1MxpLYHb45IIGAdd38Hp+FnGHwexnGW37h58XNEdVg2G/ptnmZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCX84ksc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCX84ksc"
Received: by smtp.kernel.org (Postfix)
	id 0F338C19424; Fri,  9 Jan 2026 23:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE12FC19423
	for <tools@kernel.org>; Fri,  9 Jan 2026 23:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768001487;
	bh=Jp+5zj2uaykiGiqkkDRVoIZQn0QLMyla//Yzs/OCPkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DCX84kscTsyqMIkxI6un1u701yfa/p6iRhUnNPOW6rNYi3oYmEk4I8dOz6boRbtPm
	 zS4RYJXVPz4HzxcS00seMXqJNytGSXPJQeunNr6p8GihAhJnVDWIXUJkNDrgcHpAHF
	 FmYDAeFZlIDJZRzBFzrNn02SlPD5UHzIUZGm5Hi7BJhfAh0Fu9mNiBCEEvs9BHZffk
	 cTSTMwSuPrRkelXdD24nIPLXFyDk403lF/G14ekYjFmt1zYTjTPJJnURJNl8Q1aKSL
	 3NYNgUnj+VXIEqKD2YMQBcBFPAHCXna0EPDXctKXLVI4Yk4nBzbFT3WHHl5FpqONW6
	 zRap+xoKNZYpw==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6420c08f886so6817585d50.3
        for <tools@kernel.org>; Fri, 09 Jan 2026 15:31:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+oY9i8qmCl+WpDB72ti7ndUMgr7bSmwzpxlxTeJe6cyRDfBvVqzCFU5Um+hTeSGsmiZZqsg==@kernel.org
X-Gm-Message-State: AOJu0YyDgRPdAljA1mi4JkEpwQtsHB6fbavnNmc38/S0LIpwcks3yVrP
	dEAA/CjFJCr7XsR6TqUblUXgyBG8zVhCwv+IkJTBI61Ey3LHtGjmwGak8DRuaAvtC3cn1P+V+Sd
	17Lzst5BpJwZjnHIUD7MIj5QPTMb6CFo=
X-Google-Smtp-Source: AGHT+IGe7i3MIRUV2OeZ0NZSHeJvb7zmIJaRBRWW86asicICr595dviXMn3N2E2iTTo8PgZOMNEq6HnJeKuzlETTmuI=
X-Received: by 2002:a05:690e:1484:b0:640:dd53:71aa with SMTP id
 956f58d0204a3-64716c58b47mr9172221d50.46.1768001486273; Fri, 09 Jan 2026
 15:31:26 -0800 (PST)
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
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur> <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
In-Reply-To: <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:31:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
X-Gm-Features: AZwV_QgepWOgOAIu5Tqr_E7zSCs7nX-yrVqDnDN2bHOPHR8VpOVkKBnQhw7wosE
Message-ID: <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 11:33=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:

> > You want:
> >
> >     tc:linusw@kernel.org
> >
> > The following query should do the trick:
> >
> >     lei q -O https://lore.kernel.org/all/ \
> >         -o v2:/home/[username]/.local/share/lei/to-me \
> >         --dedupe=3Dmid \
> >         'tc:linusw@kernel.org AND d:1.month.ago..'
> >
> > Then you can add a korgalore lei feed:
> >
> >     [deliveries.to-me]
> >     feed =3D 'lei:/home/user/.local/share/lei/to-me'
> >     target =3D 'work'
> >     labels =3D ['!TO-ME', 'UNREAD', 'STARRED']
>
> I like what I see, I will try this out!

It works pretty well. I set up a script like this:

#!/bin/bash

echo "Calling LEI to get mail..."
lei q -O https://lore.kernel.org/all/ \
    -o v2:${HOME}/.local/share/lei/to-me \
    --dedupe=3Dmid \
    'tc:linusw@kernel.org AND d:1.month.ago..'

echo "Issue kgl pull to pull it to gmail"
kgl pull

Looks like this:

$ korgalore-lei-fetchmail.sh
Calling LEI to get mail...
# /usr/bin/curl -gSf -s -d ''
https://lore.kernel.org/all/?x=3Dm&q=3Dtc%3Alinusw%40kernel.org+AND+dt%3A20=
251209232704..
# https://lore.kernel.org/all/ 90/?
# https://lore.kernel.org/all/ 163/?
# https://lore.kernel.org/all/ 268/?
# https://lore.kernel.org/all/ 597/?
# https://lore.kernel.org/all/ 708/?
# https://lore.kernel.org/all/ 889/?
# https://lore.kernel.org/all/ 949/949
# 83 written to /home/linus/.local/share/lei/to-me (949 matches, 866 duplic=
ates)
Issue kgl pull to pull it to gmail
Updating feeds  [####################################]  2/2
Delivering to personal  [####################################]  83/83
Pull complete with updates:
  to-me: 83

I would almost set this up to run as a cron job if it wasn't for the fact t=
hat
the Googly API wants to reauthenticate every now and then. Other than
that it is smooth as butter to work like this!

Yours,
Linus Walleij

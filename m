Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81062309B9
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097689; cv=none; b=aLSFgXB05d+AveeyY+WUSd0xQICKNNAEj3GjEjNhGjwinvY5NaYmOBYwYr8C5kkNLsc9pDcs1jb9/guOB47K0mde9qvDeuEXYscauo2Y7MaFHnHX1OknhPI21LQ7uPqbJVbvcG5F6y8u3gGTELdm4qwl/pqPChYTPdXuZ1X0Gds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097689; c=relaxed/simple;
	bh=vzqM2iVcLuhPsgtyqJkzTle31gBRWbWr7Wwwc7S9hJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkswKwruO7H5sSAWKAglDXAEYhbqWuuFbZmk0f0UNeJoFSengh21KC6OZR7DxhI0CoTvJh0MAJjH+Bp+JTPaZrwHHpwvNZBnXqpptJkes+2Odcx3SaUPufjbqV2q6zqH1x6fXXKZ8io3qruyBoLShVDRor3OyOGHgdHSYl5TXKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnLCCl0h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnLCCl0h"
Received: by smtp.kernel.org (Postfix)
	id 7688DC116D0; Thu, 18 Dec 2025 22:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D03EC4AF09
	for <tools@kernel.org>; Thu, 18 Dec 2025 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766097689;
	bh=vzqM2iVcLuhPsgtyqJkzTle31gBRWbWr7Wwwc7S9hJs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hnLCCl0hUfUJFMvkWuDUjxni/eHJhjFH2d3h71b9jRHRR+w5ymWG083oxtOyFG67x
	 DDrVqC/j/OSpQmab0j/WFVNV95yFvNt9nT9m439gC7bHSlsL3l4oyPN7zOllS/tXys
	 9jgmaTlzGlLh+bUT6WHt8T/OWx8H7RGM2/SFX56Bvn38s0J1kuFDmOBFOfqiI/huUc
	 +jZ7F4xh0fzURAhZGoDNyCRshRnTjWh5CO0B5SauWYtY1SzTdRRhhYdF5mUCozg4j5
	 PME0TCdlUUx0Y21f3zLvMWMvbVXGhECxajgK3SMyJXo+aYDPdtFu/9nXTCtWkwLn0W
	 sZp1/g/MOoadw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78e6dc6d6d7so11498677b3.3
        for <tools@kernel.org>; Thu, 18 Dec 2025 14:41:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWS1rRx0VbyY40sz4JtL4dNUDXtFNwAnywFrfNiCvjikpWUG1gFL1NjgOD6Mvn+fqZZQyLWw==@kernel.org
X-Gm-Message-State: AOJu0Yz6HuUbosbxG3bmcix0M+CNX2/8haP0m8YcUrx/J+ffRIM8mKIm
	JURliV+EY58bYSGmJqRcKFq2A9G8TFwaNbnaYNRgloLH3Aj2L5OL0FLloej3VZbnYtWK/Lcz4Fu
	R5lUXatPCAIcAelFRaanAhfo4brJuY+Y=
X-Google-Smtp-Source: AGHT+IGgzYodu4AJwctDSPxqqiSYTqYUGf5RRn1kfMemc7GV1rs3dyEL/yUgvT9l3ltiqV5fjAc5pJ/iVpHav+dn26k=
X-Received: by 2002:a05:690c:4a0d:b0:786:7a54:4632 with SMTP id
 00721157ae682-78fb3ec3960mr9275967b3.13.1766097688706; Thu, 18 Dec 2025
 14:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur> <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
In-Reply-To: <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Dec 2025 23:41:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
X-Gm-Features: AQt7F2qTDpjWKIZK_AWf9Tbq06oluzO_tiHKZCrKOyK_iNwkDp4h83uPVtYemd8
Message-ID: <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 9:47=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Thu, Dec 18, 2025 at 06:51:34PM +0000, Sudeep Holla wrote:
> > > >   File "/home/linus/.local/lib/python3.14/site-packages/korgalore/p=
i_feed.py",
> > > > line 386, in feed_lock
> > > >     lockfh =3D open(lock_file_path, 'w')
> > > > FileNotFoundError: [Errno 2] No such file or directory:
> > > > '/home/linus/.local/share/korgalore/lkml/korgalore.lock'
> > >
> > > Ouch. Yeah, this should fix it for you while I push out a better fix:
> > >
> > >     mkdir -p /home/linus/.local/share/korgalore/lkml
> >
> > I am facing a similar issue where kgl yank works but kgl pull fails
> > slightly in a different way.
> > I started it with kgl, version 0.2.1
>
> Oh no, this is what happens when I don't check adding new feeds after a m=
ajor
> refactor. I think it's working correctly now in 0.2.2 -- please check!

Is that also in the git? I just git pull --ff-only from the korgalore git a=
nd it
still says:
Successfully installed korgalore-0.2

And I have similar errors:
FileNotFoundError: [Errno 2] No such file or directory:
'/home/linus/.local/share/korgalore/lkml/git'

Yours,
Linus Walleij

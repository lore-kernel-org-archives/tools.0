Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92690239E81
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442524; cv=none; b=QKctPkyOrb7JmcZ3XI1wZiriuNhD/9qTLWG3eTGpUGn8goyXHYXYSV6jSbwseRggPO/x/GLoyIvuxR42DlpZk+f4GYKrm+8dHc+CdTMJeF1V3pyj7uUYBZE9aqSCJrmLmavQTEo0e4roEzVvPX/wLOMNGq562PdW0xxE/mh/91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442524; c=relaxed/simple;
	bh=xBi7DlcWbU9mUvN15slmQ5WzPKtmn0pB5Ay7hyS+Rcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oz2jwI/0kGzhc4FqzMIjKGqxftYfoGuKC6q0BwzaRA9wDwxTVY0TwnyB+ApeKu0SFu/mbx1B/q7FqT2A50k8VSsnTCJPK6ctjCF4n32UZNLJTipyet4212UcwJUM2tUraVxkMSUkZ7V722wN2yOcFbKAbXSMeXF2I3r9fT2k+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yb+7yWLW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb+7yWLW"
Received: by smtp.kernel.org (Postfix)
	id 432B0C116D0; Mon, 22 Dec 2025 22:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C24C4AF09
	for <tools@kernel.org>; Mon, 22 Dec 2025 22:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766442524;
	bh=xBi7DlcWbU9mUvN15slmQ5WzPKtmn0pB5Ay7hyS+Rcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yb+7yWLWRShq1dIlLFWfQBJT9AK6VlUY0eiCZUt4K/9xka2AjU+Wk5zkbCzQDzVrB
	 tInhm9fidj/f9+CB1+fc3/vESjWmN/RtJm+5jIPT9G1vHNFJc+oCKFbG9R4sG9gdO2
	 2JWzLXovURVpvjsDhHJnOGFcTUyawuQ94aXrFUXuEiPT5VIQezT5VWxwmiiIQpQ7sg
	 YgfDlKwjWESA1aGX6hSWrkjOM684ls6tqFBjSFSoKLCj27qvjmNPlc6oaZJutFyGJl
	 YlLlWbrxOpbNStBlXvJGiR/Ssh0I+T6Pgkikdfa2V4YedKdQLjWnM089sHOoEntioX
	 F3WOcTWhhy+8g==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso3777680d50.3
        for <tools@kernel.org>; Mon, 22 Dec 2025 14:28:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnoa/gAWIH5iYYFGvExXOQZ5ywHkcRwNoPFvXrsmYtxs5IHtClJTjRGcnjlxnLMoMtqXkfbQ==@kernel.org
X-Gm-Message-State: AOJu0Ywh4y56BMbcarRYKaYRn4AgjwPUcFBmWwGjdx3CfC5YTB2YkZDf
	oXFC4aBweVAVkaiyaOHQrzX8/+9eqNBIzM7C33aqNyMN/3nlrugZDj90Qvd/L3MwJj7/YjoK5uB
	QhEqQCJlCexrO7mA8Um9+9wRPPn/JKOU=
X-Google-Smtp-Source: AGHT+IEllIFZ7LPbJKYCvFMyeS4uNDIgxwcuoU4e6Sdp22GSEah0WK44bV+0iIwsRVQ3LacEZd/rZ9BN5jzE+lsBd0s=
X-Received: by 2002:a05:690e:4106:b0:644:60d9:865e with SMTP id
 956f58d0204a3-6466a8ede93mr9756829d50.97.1766442523393; Mon, 22 Dec 2025
 14:28:43 -0800 (PST)
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
 <20251218-merry-azure-chicken-4d3724@lemur> <CAD++jLn=QckMx4QD=4fwQVcLYACJCgG0Hw6Bo6Wek4S4Ywn7VA@mail.gmail.com>
 <20251222-careful-kangaroo-of-opportunity-5e70fc@lemur>
In-Reply-To: <20251222-careful-kangaroo-of-opportunity-5e70fc@lemur>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 22 Dec 2025 23:28:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pxV4T6HWvNshSUnC7DB_3o-ZuY=L0noKP5hLY9zSdww@mail.gmail.com>
X-Gm-Features: AQt7F2pqE9jYiv2uuUAjAN_8wRkmZ1VL_zY4KfuqqyeAcZryLEeYdPeMhALye84
Message-ID: <CAD++jL=pxV4T6HWvNshSUnC7DB_3o-ZuY=L0noKP5hLY9zSdww@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 4:23=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:

> Do you have any labels defined for your delivery? E.g.:
>
>     [deliveries.lkml]
>     feed =3D 'lkml'
>     target =3D 'work'
>     labels =3D ['Lists/LKML']
>
> By default, this doesn't set UNREAD as a label (because you may not want =
that
> if you're just dumping a copy of a big list somewhere). If you change tha=
t to:
>
>     labels =3D ['Lists/LKML', 'UNREAD']
>
> that should do the trick.
>
> I can document this better if that helps.

AHa I get it. I understand that the Gmail internal representation of an
unread mail is to label it "UNREAD".

I have been using the same through Gmails IMAP and there it
translates into a flag called "Seen" instead.

IMO from a user experience PoV adding the "UNREAD" label
in the config file is confusing, you are importing mail you haven't
seen before and by definition it is unread, so I kind of feel the
gmail target should just add this to anything it brings in instead
of having the user handle this footgun, but it's maybe just me?

Yours,
Linus Walleij

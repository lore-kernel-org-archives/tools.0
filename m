Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CA37C11E
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769546; cv=pass; b=oWktrQO2tD6Apb0FTgmnL/u8CiXrP0PFv4ffazqeb6uu+p4r8WyYFB/k+l8SBCsx/SZPLiW8Ny8Dky0XFUGPJZcsc+ulu8EB6nVMTQz1JXOqpOIHGqTPDuYw0N961f6HlcgUz5amAmvXtgfGuh9KFN/vr+0zMeYzQ9ycNhvn8zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769546; c=relaxed/simple;
	bh=sZtLLAsbyNvkQrvbgVBTyim4QlemUQaP8Sz0us9ZOp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EImQ1c0JOs3gfhG2+FAhuktmH+fZNW2POCK+7vjBErV4hP5aAMIsyCcs980zq7+YaEpu7rBGYYl1GgP78jYPfn1gJngR2nDMeAs2+iCbQtfUHlvt3rQgx1wKDhCF0Pb0oGRza0iHd2YaEOEijfmI5tAxEs4THJhYcmNYJh9qAqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUYrTJ+P; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUYrTJ+P"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899a5db525cso69382476d6.3
        for <tools@linux.kernel.org>; Tue, 17 Mar 2026 10:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773769544; cv=none;
        d=google.com; s=arc-20240605;
        b=k8QSFtEhSspY9TXnRr2p0Fhb1mt5tQxQUVVVzh8aMkge/HVxu7WJjTkTDgtiKtTv4l
         YVHs0QJ6gveMcnK6rOmTj2BDhCP7OtD4U3n8Rd0JXqI1Bvdu9F+FXz/8imvgMq5lLAzy
         hE82/axlC1NujQnZMFt5je4qOBEq+rZ30r59+QGfOCgf+lLFJbRr9dHOPhtb7XC+SJrv
         C5w8c9p1+pv5qaoblsrt75HnTcQemT8/lj3zVJPXD3l+aIFoX4BY9xONuwu5cvYAawx/
         1iFHrOP4Bve2xoFSX/jJQ4mQTxlslNE/hO/Evb5KBVVNkmmthX1ut+mHUv7lckxu9Gq6
         Smmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZtLLAsbyNvkQrvbgVBTyim4QlemUQaP8Sz0us9ZOp0=;
        fh=gDUicugKDL5SJhoOgAY7DtKJuLAwVDtGoLJpqpTKx7k=;
        b=In+JqI4+VK1M9eKVlZaEb+LhPpYy3s1PT7Xp8Bmi0LWp529zoEzjD5MVAiUX5brGLM
         CnKq01kfUsgxDZvBgPJfrccrChK6tO8yV23VaK9TP3HNU5jicgmXglGLL74wxGPAhT3v
         8+Fnaa/20OCxvy4puaBJz1f0VTJLgc8b4PTxtrnoCRePeOB7hj/R0EC4YDEpWGiZm5Rt
         ODyaoLlYH2/TVqhHl7iJhzqOh+rS7QlNvshIgUi2EM3fnKG0JME7awVlBR2xYJZYHmN0
         lcaBM9iC7W8UL2BxpS/dS9J35mARHHcBd5uk9jnJJYvy1XUvn2+RV3eRuP0tGlPHt8Wi
         +uxQ==;
        darn=linux.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773769544; x=1774374344; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZtLLAsbyNvkQrvbgVBTyim4QlemUQaP8Sz0us9ZOp0=;
        b=UUYrTJ+Pt7OhbT8zrDC0Va16vOuyiexTm6YqInl0PFCtrC3SsfXHMFknmT5o5uuO7c
         3R4Rt1kS//u9sUrc6eSrw4jO+sHEScXM2FD5YFkG9pFc6HzPOsTIIHnQBTtERNPiyjfF
         kFQBUlgHMLWsJ3RN5dyhEnxBSC0w1lB4W8HRSZqaQ83jlJaiiEUc5j86fa9099Sn02YR
         35GOz5pIGOgo6GuHxuI0w3poyHKauYN1oPcG1q0M3LuMRQY6rRWNlhjMOvgsnpBQgIJP
         bsB/8clh/XW/8jp4Ou/vCHUwzaW2aKCIBDWKpb4t0PUqHwWMgyWlJ8U914aCMpOyyfuk
         J8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773769544; x=1774374344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZtLLAsbyNvkQrvbgVBTyim4QlemUQaP8Sz0us9ZOp0=;
        b=Mr2hxa0ilVqBVL8rXPqoyVitkLZTR+d/PdlkDGveB6dJPg9a5EuNiMk97Of5jIWmHx
         ZGul+bYWXvkcQy+vQi/Q3VmPb/M8VGOct8s9XXIaQ3kvArln8LhorxaAmlVebnvx5Wws
         myL8ZneQp/xLEf8imRx7C1rXMW0cssVIDue0qa/1wnHNf4TOlzMtgBOTEba6OQbt6JYq
         jtE0vOUnqSj+r3TgyBWJ4LBPyhDtCk3wtSu6ryMYQ/rz0RYD6d70vViOYkyP3pCB049j
         4OzrOq2u23/6GUWMNpDPc3Q/xrXH/WJEmL5qSxVmjkdGBu26dGHtjQ4VtLXC1ZO9UZ0Q
         E9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH73GlGceinn3z6a4Km7FwdXNtXZnKvgBJ2rbnkYqXuOUxCg6duL9wKbgoe/USHoY8P91LnQ==@linux.kernel.org
X-Gm-Message-State: AOJu0Yzxw57nfRGy81WkDdZfphpEf4Uqd2HL2MmamFB5SZOzfZ/1w+SL
	Lm9fFQ+3+knTox9R0HDvdgLNOKfjFru41m26xpBCCYxStN6ypVKP+5IdG8ZkFU0PxrWkeMNb7MR
	6jhJVw1qIgjv/NWi9zzvvHdgc1KAF3VE=
X-Gm-Gg: ATEYQzyaBRfMvVNO5J60ZaNG95M9vvLHw+E0hWVe6/TiFB5vHDvdk2VYarshTyR6wLy
	mcENyMuOX9BPucvDnrQXVGeVNQP6siIbRSvepk0jYmqfnJ7HPA0k5WGC0qFNTkq83Go6LUVSw+Y
	RsBv3pF6TkrZ1CQT5iC8CYdO3K39ekoEggnmhiTbSPUaloQrWz2aTvkN+7kD1jUO7RyvTp+8ZS7
	hBT1dZnYZbJ4ELCQhNR5zjQ36X4UKidZh5oj1hH6Z9kGpnYdYcUgSAUKbZlfYY5ZFDc4qDOGH4J
	F/ChDSK1Aqps3i5QNoIlXsC1O2zkROSKICiYtw1S84kG4MoHP97TJPzFmasUTXM=
X-Received: by 2002:a05:6214:4e83:b0:89a:7e03:f914 with SMTP id
 6a1803df08f44-89c6b4a2f19mr6296766d6.11.1773769543832; Tue, 17 Mar 2026
 10:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
 <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com> <87v7euo0vt.fsf@toke.dk>
In-Reply-To: <87v7euo0vt.fsf@toke.dk>
From: Chuck Lever <chucklever@gmail.com>
Date: Tue, 17 Mar 2026 13:45:32 -0400
X-Gm-Features: AaiRm53t2GoyQ5FuGshZJIxOWiCuJKUe3FTVW1h7bB1d5rjosow63wz4-XoJiQ0
Message-ID: <CAFMMQGu3FZKde_EK29Croffoqt_xucM--8CCJQ8QT0uHoeZUSQ@mail.gmail.com>
Subject: Re: Using "b4 prep" with Stacked Git
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: Paul Moore <paul@paul-moore.com>, Konstantin Ryabitsev <mricon@kernel.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 12:51=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <=
toke@toke.dk> wrote:
>
> Paul Moore <paul@paul-moore.com> writes:
>
> > On Tue, Mar 17, 2026 at 11:08=E2=80=AFAM Chuck Lever <chucklever@gmail.=
com> wrote:
> >>
> >> Hi Konstantin -
> >>
> >> I'm a long-time Stacked Git and b4 user and I'm hunting for a tool to
> >> juggle the many data items involved with posting kernel patch series
> >> for review. "b4 prep" seems to fit that bill but it has some issues
> >> when it comes to large cover letters with Stacked Git.
> >>
> >> The branch-description strategy is the least-bad option for StGit
> >> right now, but it's fighting git's design -- git config was never
> >> meant to hold multi-paragraph prose, and there's no way to tell StGit
> >> "don't print the branch description in stg branch --list."
> >>
> >> A file-based strategy would solve all three problems cleanly. Somethin=
g like:
> >>
> >> .git/b4-cover/<branchname>/subject
> >> .git/b4-cover/<branchname>/body
> >> .git/b4-cover/<branchname>/changelog
> >> .git/b4-cover/<branchname>/recipients
> >
> > Fellow stacked git fan here.
>
> And here! I have been using the "cover letter as commit" mode of b4,
> which works as long as you remember to 'stg commit --all' before you
> invoke b4. I requested a pre-hook functionality in b4 to automate this,
> so will take this opportunity to bump that:
>
> https://lore.kernel.org/tools/87ttdkrylx.fsf@toke.dk/

To quote your 2024 email:
> So, my feature request is this: add support to b4 for a hook command
> that is executed before any operation that will rewrite history - and
> abort the rewriting if the command fails.

Ha! I set up a hook in my stg skill to interrupt Claude before it
tries to modify the series using raw git commands. Same hazard.

I looked at using the commit strategy and felt it doesn't work well
with my own stg muscle memory. I didn't think of using a hook.


--=20
Chuck Lever

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18303E024F
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860781; cv=none; b=lJXXhtbX2NcR9AQedGssc2JXpq/2qdqssNpYs/NIJqae8GO3NIBcT+J8iVwJgocPd6Tp7pTgZmRuPX5Zr1gdm0F0jmcqBA6kbpzoBdL/pc8GsutDYEa9OaiTG5nB/nvvRQ7dxnbI0zDQYE5aj0usTVlvSFIokqAg++uB3Lnwqpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860781; c=relaxed/simple;
	bh=5FXgTbcMD4vryKcNiJb56EElIh/38dcF91sV8qXFfaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvig2as9ZOn5V5AfjYrUbEMKjWXxN8oH/BOfv0lhKq4rF8YannALQgKp3+KgIrmu9FsENvKVY2Pd4dUa75Ot38iQmHZb6foeGuX4817E27bGH6HvECBJjToYVMHKdvwEVU4i+9CDL7GRxk/cnj9g4Gh6qcHB9VMK4bTeBr1tXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRiNgay4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRiNgay4"
Received: by smtp.kernel.org (Postfix)
	id 6304BC2BC87; Fri, 10 Apr 2026 22:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE50C2BC9E
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775860781;
	bh=5FXgTbcMD4vryKcNiJb56EElIh/38dcF91sV8qXFfaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eRiNgay4pSjQT39HFcnmSZueczic4fTGLDbtE6miyvmQEWP57nNOq34zx1wKJaxZE
	 6jFHvL9sNAEWujzB7DAaHBl95fcOV3W1+oKf41zVetADLTA4xByLReutk+t+5MaCAe
	 fGwX1jk3j9+yku8rs/76qO2Xgjt8OsjCCeyoTncZjUAcIhPF+Q8KxaPn75KxEiGrZy
	 9w5NfEOiYoPB3pSuDfoI/d0M2LnRTNJFayksQrG5uPeN7KYXPx+xFTUjqjmguYk3X0
	 a/YRL4TcDlKss911ofPIVo8Hdf9jfUsfzEbZ6BM7sKOVVXJR5aYGdSbTCxPhEJy4rg
	 uREkZo93MtSUw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3870778358aso22948311fa.1
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:39:41 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy78wyp+L7LiPxM/YzG0R+bkOsZp4DC6SJ6x3q/bAvzeqHiFCq7
	WyOGFjbYboe/PoQIRQZUUIVWFODYT5OP546EBbRet1VDADpsG29XXckT01cnpW511YR4qKuxvgF
	VWq2uk67saTjw9MI6uJNZlflfx2uU+gU=
X-Received: by 2002:a05:651c:2109:b0:38a:6acc:85e with SMTP id
 38308e7fff4ca-38e4bee61f6mr14632761fa.32.1775860780041; Fri, 10 Apr 2026
 15:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
 <CAJ-ks9n_cg=NNFKYKoJPR1AzzxMRa7CB3i2Vz2SgWbG=ZeoSxg@mail.gmail.com> <20260410-soft-funny-platypus-e14ad7@lemur>
In-Reply-To: <20260410-soft-funny-platypus-e14ad7@lemur>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 10 Apr 2026 18:39:03 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9nFGV2umd4pNG0WwmUPV6cVKB1mYdOKRekvADLo4e=gmQ@mail.gmail.com>
X-Gm-Features: AQROBzAXr9824YTqiplqplCGWYDGUM7iXDsKtPXwkCr5SjR1anbYzJE0me4MLzM
Message-ID: <CAJ-ks9nFGV2umd4pNG0WwmUPV6cVKB1mYdOKRekvADLo4e=gmQ@mail.gmail.com>
Subject: Re: [PATCH b4 00/12] Enable stricter local checks
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 11:21=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Apr 10, 2026 at 11:05:31AM -0400, Tamir Duberstein wrote:
> > > The last patch wires the review TUI to run the same local checks thro=
ugh
> > > a JSON-emitting series check helper, so reviewers can see ruff, mypy,
> > > pyright, ty, and pytest results from b4 itself.
> > >
> > > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> >
> > Hi Konstantin, any interest in these changes? I see some of b4 has
> > been moved to liblore, but I believe that package has the same type
> > checking gaps. No worries if you're not interested in these patches,
> > but I wanted to demonstrate that mypy (even in strict mode) is still
> > quite lax (e.g. it doesn't warn on unreachable code).
>
> No, I do want to see them -- it's just with the latest changes in master =
the
> series no longer applies and it got pushed down in priority. If you want =
to
> target liblore first, that will be an easier target for me to take and th=
en we
> can revisit b4 linting changes.

Good to hear. The liblore series is
https://lore.kernel.org/all/20260410-harden-type-checking-v1-0-fcf314d9d748=
@gmail.com/.

Cheers.
Tamir

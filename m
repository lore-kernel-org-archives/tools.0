Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D62DCBE3
	for <tools@linux.kernel.org>; Sat, 26 Sep 2026 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428493; cv=none; b=LJL3p59UoSibrWqyP3RXJI5p7b8rada6aYoNRvC1uXf4OC8nKjFYeZFT+zm/ptj06efhvLH11hhxc8hnG8fdB2NIeRzCk8ookO/xmR8gfgbN7aAFiM8ZRdgY6vHQ6ZfSVl+lTYDQkfnsHwud9ae0TwfYcCJqosedY4jKHT3vtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428493; c=relaxed/simple;
	bh=yzqtHs6Nec8VyNuSIUujgaA2tnR7D/dbeFAaTh/GT2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzFz61XpDCv2XPlt8ET0vwUoq+qsoM4VUUrLkKUg9fRX36KwVIgSeL9y+oUirRoV4wnoWRNQxL1EZ65wj4H7Ayi8+OMv3mFvWCUOalCEDQl6H8WjFUIS/NZsqlAPLYllIS/q86QxmZT7qXwyvBWrc2/T6ikzK0L36oZ0v4aikRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOC7jVMQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOC7jVMQ"
Received: by smtp.kernel.org (Postfix)
	id 2B4DD1F0089A; Sat, 26 Sep 2026 13:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159F11F00893
	for <tools@kernel.org>; Sat, 26 Sep 2026 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790428492;
	bh=yzqtHs6Nec8VyNuSIUujgaA2tnR7D/dbeFAaTh/GT2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nOC7jVMQ/iSRgiCwAgZOxl4BNZTZS+o6kqxYY/qCcfkBZqHl9QbER3w1PGPNZwwcq
	 d95qteACgNf+JU6r2NWlls2HZAgXWQQ1YtDAAmsFMZ8qi1lz/UfV74vcX8emkf1shR
	 8d4Kt+mTRv4WPACuk8nV3AQrytRhkvz2bmOJPbqOCvxiiDrqdYu2gmaOon2XTK4VTw
	 cNDmbmnP76xiSpnfy5vNjftwUx/SSFxcLiUoNRUgpSV5Zt0ZIHvZ00rXjAcMr3kAcQ
	 HUmTZzsDR2S8SOfIh3t+nxzzqabVcGFw8pmrEy0aaQa9b0gIl64ExXFLJL99HfKoER
	 IDFz/5q0C6VtQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso12629681fa.3
        for <tools@kernel.org>; Sat, 26 Sep 2026 06:14:51 -0700 (PDT)
X-Gm-Message-State: AFuF++nfqA2Acw4F426lf5bbhlIkK3KhIbipUUwljBCnfi/+QrzVD5ga
	P/1hPfyM/k7Gj0MDJ6l9U07YXIn+Oo16gYhHHGoUhMIqiLuz0Z7P6LPP3JeRfYIvsrDNmNG2fW4
	iVznSvOrB+VcOtU3wh/93+gIx7bLMHbU=
X-Received: by 2002:a2e:be91:0:b0:3a6:3d05:317 with SMTP id
 38308e7fff4ca-3a63d0505abmr24271301fa.24.1790428490771; Sat, 26 Sep 2026
 06:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260918-fix-cover-recipient-parsing-v1-1-5ccbbb572736@kernel.org>
 <0c57c5d6ed9b484616ecb0c76be06d2cb5b99a42.camel@posteo.de>
In-Reply-To: <0c57c5d6ed9b484616ecb0c76be06d2cb5b99a42.camel@posteo.de>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 26 Sep 2026 09:14:14 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9=T-v2J7PY+_+ZW5Ap-Ayn3XF4rkMja=P3DTDKeQu7Odw@mail.gmail.com>
X-Gm-Features: AclHuK8y2mx-W-mPoFJmhSlWvxdLGI4mbir2q7YTssk4cwoLlg9YM4FRfZ2ADro
Message-ID: <CAJ-ks9=T-v2J7PY+_+ZW5Ap-Ayn3XF4rkMja=P3DTDKeQu7Odw@mail.gmail.com>
Subject: Re: [PATCH b4] prep: preserve recipients above cover changelogs
To: Markus Probst <markus.probst@posteo.de>
Cc: "Kernel.org Tools" <tools@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 8:27=E2=80=AFAM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> On Fri, 2026-09-18 at 15:14 -0400, Tamir Duberstein wrote:
> > When a cover has a changelog below "---", prep --auto-to-cc misses its
> > existing To/Cc trailers and appends duplicate addresses after the notes=
.
> > New recipients are also placed there, where the preflight recipient
> > check does not find them after the cover's diffstat is generated.
> >
> > bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
> > limited separator parsing to bodies containing a diff or diffstat. Raw
> > cover letters contain neither, so their trailers are treated as prose
> > when a changelog follows them.
> >
> > Allow callers to explicitly request separator parsing. Use that context
> > when collecting and updating cover trailers, extracting destinations,
> > and folding a cover into a single patch. Retain automatic diff detectio=
n
> > for other messages so free-form replies keep text after visual
> > separators.
> >
> > Add regression coverage for raw covers, repeated recipient updates, and
> > separator text in replies.
> >
> > Fixes: bf7beca19f72 ("mbox: don't split on '---' in free-form reply mes=
sages")
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > Assisted-by: LLM
> > ---
> > This surfaced while preparing a patatt reroll: --auto-to-cc appended
> > recipients below the changelog, and b4 send still reported that
> > --auto-to-cc needed to run.
> > ---
> This seems to be a duplicate of
> https://lore.kernel.org/tools/20260628-prep-v1-1-8ac18db0abf3@rsg.ci.i.u-=
tokyo.ac.jp/.

Agreed, thanks for pointing that out.

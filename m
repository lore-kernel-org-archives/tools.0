Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBFC2C031E
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675426; cv=none; b=IMaDQctw+Ajq6RPAxdWJGgOmuL5U5bt1B+gBGzONdvT5AFM5spqLdJ1f3ide/Hwi/flxzOWAmRTKq+AKHrRTskuM1xLsqXqkQJvFXfEXRnyT+slo+3QKQwn5IjaJME3XYoqUZz9qwMsN+U/YOWs/iY9eV2RzzmXb9qo9JQv/62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675426; c=relaxed/simple;
	bh=TS/oXd5oUVLCBNc7RS1+ohknXPeipwrKV5M+VcHBS5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJMofiGFslNmikAYbk2x14LNGv5D/HQS2wc7B5PaDWgIhjajsACqoX5Vau8QqWhZ2VapstadKUskjppnqUDpKnL6pETBhxmwZEzOoMS7gNMj8NL9Elzv5dsYDz4praO7NGLQTirlW8A1spZz3iKu+qvL+BW8UPSMuNFFqi26XgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsnRJfkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsnRJfkf"
Received: by smtp.kernel.org (Postfix)
	id 1907DC2BC9E; Mon, 16 Mar 2026 15:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0342FC19425
	for <tools@kernel.org>; Mon, 16 Mar 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773675426;
	bh=TS/oXd5oUVLCBNc7RS1+ohknXPeipwrKV5M+VcHBS5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PsnRJfkfIg4el2W48vt8Rkz5sZ4imxUGr72fl9XxpBbdo1/f8lm61DAKJm/9yF5/s
	 gAVRQFfUolSG2tU76T/rDuDA1n8tobgLvvPl1WxHwJhbkbXkrO5tMfvEEUCawgPxz8
	 F3TuctSu+j8vMte7Nz311GVIBYpRgxJ7k3SBg2m6d8Ky915b2HERjSKTRxygj9GCGw
	 6A+QO8Ux4zhucx6FUwKTrEkE9YScbIoqm6OSdVOgqFZmytmE2khvfEAE5P4IO/v/7s
	 mozhDlS8103lgBn7PBa9w+/+q1cbpauC2koX/vz5ukyqIPXzQXy2aBh3pgHlVB2lpA
	 47jJUbtA10wyA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a3225d59fso35308101fa.0
        for <tools@kernel.org>; Mon, 16 Mar 2026 08:37:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YwtaPpHPSqQZkPXDEQ73gyxe5UN+ctM/jFXa6lxNWvY6D0tzkUY
	C0uNOIiXjeUmM77/jLk/twSqyiMgV43aY14Gr3I0suK37VHLd5O31r+wo0AqG4rHdiPuLimGhKF
	LZp6PHvL6RVjpFJj2Eq8qiu0iAYcBm0U=
X-Received: by 2002:a05:651c:41c5:10b0:38a:4106:5147 with SMTP id
 38308e7fff4ca-38a89671253mr32750241fa.14.1773675424633; Mon, 16 Mar 2026
 08:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260316-followup-tui-bad-v1-1-ebe1beab9804@kernel.org>
 <20260316-peculiar-koala-of-inspiration-c80bfc@lemur> <CAJ-ks9k5D9Ua=Cnwe9mC8daQNR4oCAj0a-LMeVcd1PdzMpu1Hg@mail.gmail.com>
 <20260316-lively-chupacabra-of-destiny-5deedb@lemur>
In-Reply-To: <20260316-lively-chupacabra-of-destiny-5deedb@lemur>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 11:36:28 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9mFGG-NB61QuxXQib0KMZo64+is6UA8f6px=T6LAf1Fvg@mail.gmail.com>
X-Gm-Features: AaiRm50t5-nPAThRsX7uf8d97Fk6TB7zAmAug0lZk1FzeOqoK-Z2XJQVatfmMh0
Message-ID: <CAJ-ks9mFGG-NB61QuxXQib0KMZo64+is6UA8f6px=T6LAf1Fvg@mail.gmail.com>
Subject: Re: [PATCH b4] review: suspend before tracking saves
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 11:31=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Mar 16, 2026 at 11:24:23AM -0400, Tamir Duberstein wrote:
> > > I've added a stern admonition in CONTRIBUTING.rst to instruct agents =
to stop
> > > using Co-whatever-by: trailers. It's more than just personal preferen=
ce -- it
> > > generates junk mail.
> >
> > Makes sense. Codex is quite adamant about the "Co-authored-by"
> > trailer, so I've also submitted this feedback internally.
>
> Yeah, well, Codex is a just a tool that can be convinced with strongly en=
ough
> worded instructions. "Co-authored-by" and similar trailers are wrong, bec=
ause
> they imply agency where none exists AND stick in bogus email addresses th=
at
> are most likely used for undisclosed purposes.

I don't disagree, except that it cannot be convinced because the
session prompt (where this instruction appears) takes precedence over
user prompts. Anyway, I've resent with the proper trailer and reported
this internally, as I said above.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0538D00A
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674701; cv=none; b=XxZGeIl4cKK1fxEWOa7E6jrFhs5AFysEMj9DPTUgD0TX+d3eQZ7FqXrGGTyuopnY7F3PU6yc/Wfp3Z8y8iGwmynLDQt5IuJTLFfCjjhRzjQ6QQETWsXuhF+gt9VRAFrX/+31mQYuRphoKIvfXmHv2np9HKNZZVAuKvCQzKOv5vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674701; c=relaxed/simple;
	bh=hphUXrKQlzbYYTiMtdh/MO0bHgYB4A2p0SUSrlPeUTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5Cx5ap9c3oWOg0vYXfb2IYCjS3thgs3cZNUuDj+vDQj76y2Yvio3tnIGpMgAILlcR98jawSAbgzQOwfitx35mj8h5en73+YfXvzJICdVrkRCHQo6s4505g8JV86n+z47E1zBiHqFWAj1VJ/CSnEgEviN6LiWS5yyJQWXfF/7Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jig22eWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jig22eWI"
Received: by smtp.kernel.org (Postfix)
	id CADACC2BC9E; Mon, 16 Mar 2026 15:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FBBC4AF09
	for <tools@kernel.org>; Mon, 16 Mar 2026 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773674700;
	bh=hphUXrKQlzbYYTiMtdh/MO0bHgYB4A2p0SUSrlPeUTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jig22eWIN9k9k3YQlKsGVuUGpuAjbXEuNGWRIS8EbiRz+n/v2WnwsCNOanyLs4VBs
	 +cMwTnU6gLXvIsZT+WDllpyUr6pvKlYc4Vq9Hm4aOLBAwj0eOrYqY5VSTSO4uuOCAl
	 L51RB4pOqg26h6KgDYQiqs9O/DnpBcUSKqdQyevCvnkGpUhdJoIbs5yFviczFSqp6m
	 ogCd/k2C6SUjcPhzgZuGVvve9YIS4Wj3om7fIa7iAmrKNNMekvvySyx4cuYUwC0Cv4
	 /z1tr0qDfxQ3e5hZ3xdXnwlpN0/ALyY0UUcbEz6/sCSq/9IfUMOXD5c9eDC7ChNXCn
	 QKkwzrt2bOdlg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a2544b52bso40674101fa.3
        for <tools@kernel.org>; Mon, 16 Mar 2026 08:25:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YyB3gYcVmGfpI+NOesNgzf52U6WPW/k2g+BwEkIpGCJxTH+YRJ6
	ABdunMsLEMW3r1/hksrYmNHW2C8nnYPGgJAnvCNyMc20r2rwp0cVS6PhaXwV8MjsrATfLx60HL+
	G5WImwGRBtgRfTbKXkqjQN830j6Foj0A=
X-Received: by 2002:a05:651c:f17:b0:38a:33ec:98e6 with SMTP id
 38308e7fff4ca-38a8973bb59mr44805201fa.20.1773674699327; Mon, 16 Mar 2026
 08:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260316-followup-tui-bad-v1-1-ebe1beab9804@kernel.org> <20260316-peculiar-koala-of-inspiration-c80bfc@lemur>
In-Reply-To: <20260316-peculiar-koala-of-inspiration-c80bfc@lemur>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 11:24:23 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9k5D9Ua=Cnwe9mC8daQNR4oCAj0a-LMeVcd1PdzMpu1Hg@mail.gmail.com>
X-Gm-Features: AaiRm518TauyLyViAa3A5uzcaAhRU7xt_ZCPn9r1WqiRsJ3gGkwcj5e3kDMyGDs
Message-ID: <CAJ-ks9k5D9Ua=Cnwe9mC8daQNR4oCAj0a-LMeVcd1PdzMpu1Hg@mail.gmail.com>
Subject: Re: [PATCH b4] review: suspend before tracking saves
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, Codex <noreply@openai.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 11:11=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Mar 16, 2026 at 10:48:39AM -0400, Tamir Duberstein wrote:
> > Wrap review TUI tracking saves in self.suspend() so interactive git
> > signing and pinentry own the terminal cleanly. This avoids sluggish
> > input and swallowed keystrokes when follow-up loading triggers a
> > tracking save.
>
> Thank you for sending that in.
>
> >
> > Co-authored-by: Codex <noreply@openai.com>
>
> I've added a stern admonition in CONTRIBUTING.rst to instruct agents to s=
top
> using Co-whatever-by: trailers. It's more than just personal preference -=
- it
> generates junk mail.

Makes sense. Codex is quite adamant about the "Co-authored-by"
trailer, so I've also submitted this feedback internally.

Thanks!

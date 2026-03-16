Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3BF31B810
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773689625; cv=none; b=BqMiYsD7NI5F5+5b+EYzMboScvTL3A8DBx51L/Zx1jVl4MkRJGg9X3bOcYHTGmE56KizvMEPQaAivSg+cR7xo1tnuGJcrssKk+fjQKZt1DsfO/oSAL55Bs9u6U8XaZliJ1ZD4oFpkjyDSOlunx3emwPr/I+Qhg0JyAhHacgue2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773689625; c=relaxed/simple;
	bh=KUr9mkxm+NI8goLpObqbdocNrX3DNrX+tHfjElMdY2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5bftN1/NxWfVTkcXwV9R/FwDkuj/6KABCLz9fyuljtLpz4BlDCW/QKNe4rAHYDgDCVPvBg16zWNqRexga4yJwQavJWPgm3ZrEu0AIa+RX7ol0BaOKMYm0dkN1wqKbMp2FtqGcQIAlweP/cQDVvwLW6YS+QxSvcMA3vZK7kY5Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4BBPJ/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4BBPJ/r"
Received: by smtp.kernel.org (Postfix)
	id 7C514C2BCAF; Mon, 16 Mar 2026 19:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666A1C2BCB0
	for <tools@kernel.org>; Mon, 16 Mar 2026 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773689625;
	bh=KUr9mkxm+NI8goLpObqbdocNrX3DNrX+tHfjElMdY2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O4BBPJ/rGtA4uw/x8H1w2qUxE+woDrdN3vG1qCYhQ0oSHguKTybhRiuyFVMSLr8My
	 4RGlqiZ3kh0i/ejczkkmO+1Zv0RYK0LkVm4KYpNKxpv+jqWTrg7vI12p1/dowPs1HR
	 3FLi3ut/mVQEFbzvmf5MMJ/7bD1CVBONqlHjyEWXRqSmLjhtxJwDP3fex5JBx7eBNJ
	 vUKC9tLeiYLlYZgE/peWNIJj4fkUI/vJhcakrQkQwpSAfD6ZDrQwipb9rwanqau61V
	 1WbIeKMWZB8gKITjDZyIamw7E4i5jVErgKTRDWYk2/aj67S3aVkqWymRQ2vTsp2gDj
	 1IXVb3sXi9T2A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3878de20527so43077911fa.3
        for <tools@kernel.org>; Mon, 16 Mar 2026 12:33:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YyN8S/93ZKVa0j67bpw5DAKKK23qMayTtL6g6zyvfTw+FYaCqet
	DHcaOkkoUvaWchB2bQkxnl79QYha8HBPqJ6E1pdHmnvmWJHDtja4/0oREN6K+R6V+ew5bbzaclo
	eRObf6nz+RoqJecbiI5SWLaLAUGWb2t4=
X-Received: by 2002:a2e:9086:0:b0:38a:4de2:8807 with SMTP id
 38308e7fff4ca-38a896a7acbmr40453911fa.18.1773689624093; Mon, 16 Mar 2026
 12:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260316-followup-tui-bad-v2-1-f4d163415e8a@kernel.org> <177368915821.1682813.18391167383301333506@lemur>
In-Reply-To: <177368915821.1682813.18391167383301333506@lemur>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 15:33:07 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9mwmQD5eYs9DKp2VtBBmfnYO1BPQY7pe5JncoBf3nhqkQ@mail.gmail.com>
X-Gm-Features: AaiRm51RVQ12urVkoFbDmoclqMhTyXwsIf9MKUJzYwO7FnG3M59ZUkxQYIZzzjk
Message-ID: <CAJ-ks9mwmQD5eYs9DKp2VtBBmfnYO1BPQY7pe5JncoBf3nhqkQ@mail.gmail.com>
Subject: Re: [PATCH b4 v2] review: suspend before tracking saves
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 3:26=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On 2026-03-16 11:16 -0400, Tamir Duberstein wrote:
> > Wrap review TUI tracking saves in self.suspend() so interactive git
> > signing and pinentry own the terminal cleanly. This avoids sluggish
> > input and swallowed keystrokes when follow-up loading triggers a
> > tracking save.
>
> I didn't take this directly, because there's actually no reason why we
> need to be constantly signing the tracking commit, especially since in a
> number of places we were completely bypassing the signing. I've
> refactored the code to reuse the method that shouldn't invoke gpgsign
> when managing the tracking commit.
>
> Try that out?
>

Looks good to me. Codex suggested that as well but I lacked the domain
knowledge to determine if it was sensible.

Thanks!

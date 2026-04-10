Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73D18A92F
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775833570; cv=none; b=jTtx522al+VyPxNCnAd2f6DnZeRR50CmeXyDlcyE0Y9QlLkZ1VACqJTy5h8Ev8Oh0HLYRUJ02KO6OVj/n7y235rVDM7p78SfUDYLFMuaQb+OTg24VMNKWhMpS0e2n8jP6hLkIY/WPK8iwwwnlVE066zZIU9OfI0rHLhVcTEEEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775833570; c=relaxed/simple;
	bh=GRVLF4iGrmFGXsoc7Q6VOKxcNiJ4Ou/R6NqX2keFSYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ka17v3mSPnUyAwJOzOHq/c59urq6wwTl48gwD93X+WpZiMOEVzwSpasNEYoHil5Y4vFfjn4Qz+pU7n8NzEmVcwDNFSLNkhTB4x82I+y72r5d8AH30MjDeS5xuBb9JVaitrsUAr4FyZZ5iBG2e8Pbu66mBPj1Dyg92liOdNdnh6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQ+jQ/o7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQ+jQ/o7"
Received: by smtp.kernel.org (Postfix)
	id A77AEC2BCB1; Fri, 10 Apr 2026 15:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF41C4AF0D
	for <tools@kernel.org>; Fri, 10 Apr 2026 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775833569;
	bh=GRVLF4iGrmFGXsoc7Q6VOKxcNiJ4Ou/R6NqX2keFSYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VQ+jQ/o7cKQlZ6dgzUNztlUcNBYl9QNr+ho5HHlP+frG/jean4h9VSxLGC6Hg/Exq
	 DnL7tTaR9BCd97gr0ywjxD4EZzkfAN7cAYi/8aGFwSerRNaqul1LwtLoO6aPYwWLEC
	 p6EcsmpSyx5slKKFmRoxMkikUrWaP9anWJGKfYh3Dckxf1eG/Pdb9ZBZNch0o0ITuP
	 BCBSW1/jR8m5RNL+VPPb+bw7sCKENpmWVtkOAe8z1I8xPG6Ojzc3iX3PsnMNiHJlrd
	 kxrzWnpCrthKs+J03pYY8SpSIJu0GjwEyqXyBB7ba7I5irHkF/cj8K9+Oii6f1vdHD
	 Z5VwxP7zvkWug==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so2296266e87.0
        for <tools@kernel.org>; Fri, 10 Apr 2026 08:06:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YzSyqQzVEVLJ1uVN/vEvK90REJ0NpnfErS57DlnXjbifc54PJrI
	RJ/ir1iinaXVJPBJOAM4e4p2BBFYC6USYaKKdRZtTqLDaIMXPftV6fj4vfSe3GUHeVEr45mWXA/
	UH1V2EeAxUberu1Z5Mn/GKJvvZxNEcIw=
X-Received: by 2002:a05:6512:3f11:b0:5a3:ccae:c656 with SMTP id
 2adb3069b0e04-5a3efb43e69mr1200812e87.16.1775833568157; Fri, 10 Apr 2026
 08:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 10 Apr 2026 11:05:31 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9n_cg=NNFKYKoJPR1AzzxMRa7CB3i2Vz2SgWbG=ZeoSxg@mail.gmail.com>
X-Gm-Features: AQROBzD61fw62FAA4kR66H4ONLWumZ5vKJdvCMxXcZHWBUp518CLhsLJxhBRdsA
Message-ID: <CAJ-ks9n_cg=NNFKYKoJPR1AzzxMRa7CB3i2Vz2SgWbG=ZeoSxg@mail.gmail.com>
Subject: Re: [PATCH b4 00/12] Enable stricter local checks
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 12:48=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> This series makes b4 local developer checks enforceable from the
> review TUI and makes the repo clean under ruff, mypy, pyright, and ty.
>
> The early patches set ruff formatting and import behavior, make the
> test environment reproducible under uv, and type the misc helpers enough
> for whole-repo mypy. The middle patches tighten mypy and pyright, then
> add ty with all rules enabled and bump the Python requirement to 3.11
> because the code already uses 3.11-only syntax.
>
> The last patch wires the review TUI to run the same local checks through
> a JSON-emitting series check helper, so reviewers can see ruff, mypy,
> pyright, ty, and pytest results from b4 itself.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Hi Konstantin, any interest in these changes? I see some of b4 has
been moved to liblore, but I believe that package has the same type
checking gaps. No worries if you're not interested in these patches,
but I wanted to demonstrate that mypy (even in strict mode) is still
quite lax (e.g. it doesn't warn on unreachable code).

Cheers.
Tamir

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FD236B06A
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163563; cv=none; b=PP71LY7lN/+WMU+lk1i7T3fX38nnuKMU8e/1z/ze+KkWXPAHzgXh3lDfgXMZsqE65brMrOpnCWaN7Yof0tJNgZB8D1HUbOlK5b0ptlZGTk3+mHQOvHvWLDHLNbvN8c2bGHBXO/vWhU2DDZ8U++osja0x80LHJVa5hR5RG5frCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163563; c=relaxed/simple;
	bh=H3CxgYJt/DQboZ3SWBCSj2tORjVO4osrEMXE9sVOGqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7VfP/PD5ZF0XXtBmXiiPzxjyC9VW60Q7GYFcsZRqSqFY36ItCtVfhSG8gK9ZDayfVrW58OJwswWgPV8qTR90n1k5VNX+2xt+Chm0c7PabUK7PaYnAGCS5UPGMB6ty27DVrQUzPMX96CzQ3gXWgLcLsiDcpgNHOVXsDXCzQGOC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbl3j0Tw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbl3j0Tw"
Received: by smtp.kernel.org (Postfix)
	id 01512C2BCAF; Thu,  2 Apr 2026 20:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB1CC116C6
	for <tools@kernel.org>; Thu,  2 Apr 2026 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775163562;
	bh=H3CxgYJt/DQboZ3SWBCSj2tORjVO4osrEMXE9sVOGqg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pbl3j0TwYuuNQCw4xmyNDruT5jnagD8BEZX+616Yrenl37QCsIoyZZTJzZDtQfX4S
	 gNlz8TsN5OqjhT14CThzGdoGeKt+hE8DK3n3yORbnXBFGk80n32djzPv5h5p3eA9+c
	 qkND/JKyHEQOWMU+gBDBvAJgFjK7qkwhwlxlPHnqnrsCA+7fCnZIrZBJOYQNjHNgfo
	 nygIKKx3zXXs5WsOGSD3JAFp6L9jBNxk1iW6FXYCYI203S4X81oHjW7+t9m4DzMEnW
	 ElOZMppeMiaGwd1TLLoyYIfAGHwhKSd/CUc94VVU+kcKCIBGH2OYAghRfB+q+L2Fmk
	 G9aSHGAoOxkwA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a3066b68bso12053591fa.3
        for <tools@kernel.org>; Thu, 02 Apr 2026 13:59:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YxWIV8SDFSxs6dzq/JluMKHDmi8xLrW1QfO4ZlZALVCkc8PpXUJ
	A0cFZnXeAP3eh4jNOjBAoSFCrRHBVgMqtcI8XI+JJfj8rGjaaRu9fPlWKYpbTtITr8vMMC8Uhdp
	VnbgwZTGLlemJERlJUXUECA2cmFKiJPw=
X-Received: by 2002:a2e:8057:0:b0:38b:e6c7:2c4d with SMTP id
 38308e7fff4ca-38d8d4b5751mr833071fa.12.1775163561612; Thu, 02 Apr 2026
 13:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>
 <20260402-didactic-excellent-scorpion-8f5189@lemur> <20260402-messy-acoustic-wren-63e0b4@lemur>
 <CAJ-ks9mZc=Q-KVnF0K=0HVW+rLxVa4beOqRFWs-N5qKKCW=9Lw@mail.gmail.com> <20260402-wakeful-enthusiastic-labradoodle-5ce67d@lemur>
In-Reply-To: <20260402-wakeful-enthusiastic-labradoodle-5ce67d@lemur>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 2 Apr 2026 16:58:45 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kj-7raQr-vN2RSmsF44nhCSSuOX=k1g3ROgZPPy8UPdQ@mail.gmail.com>
X-Gm-Features: AQROBzAeAvowXWWgE1-hGmQsOpdLa9eNDMZ3jURzXJudcg1P0i8qFXvG_rjR82E
Message-ID: <CAJ-ks9kj-7raQr-vN2RSmsF44nhCSSuOX=k1g3ROgZPPy8UPdQ@mail.gmail.com>
Subject: Re: b4 type checking
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 4:44=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Apr 02, 2026 at 04:07:15PM -0400, Tamir Duberstein wrote:
> > Thanks. I think part of the problem is that you're using `uv tool run`
> > rather than `uv run`; this uses your global mypy instead of the
> > versioned one in pyproject.toml.
>
> Ok, I removed the stray ignores that were needed for older library versio=
ns.
> We now have:
>
> $ uv run --extra tui --extra completion mypy src/
> Success: no issues found in 46 source files

Nice! Thanks.
Tamir

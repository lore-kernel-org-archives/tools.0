Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA462DCF57
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775160473; cv=none; b=FTSFOLEJWn/6jRLL2lkMd2UT0Y1jLB4v1MFK57O1PsqrHKE8peCp4KJLKd5XFI+e6D1ughxfbs39J/LlfiRXt2taqxzdVm2nAYKI1o6VnP16oQPRGuACWU9UwGy97TIeriB5P4YJTQmCvZoVLO+OnNBcEXc6QkIi8ntqEPlvrzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775160473; c=relaxed/simple;
	bh=5x1RE8jpyGEsy0DBBdtgk0YO5BIsfmTAXglEmtSHCoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pk3MUYBxvjKcW4P7zPhTeEIeqqN38+pUv1AYaen36f5bBaifeUgXd0y6skA3+zOzwLsCMRY3A04SgXfQuQH06ydrcHrr06Z6F29JAhnBFCzkGlBDWiwWHjWslWLYPQj9slEoyo+3/aYj/yWS9bpiYWpYbinzs66MPt9szR7XBp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHrGTzXP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHrGTzXP"
Received: by smtp.kernel.org (Postfix)
	id 15758C2BC9E; Thu,  2 Apr 2026 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AC8C19424
	for <tools@kernel.org>; Thu,  2 Apr 2026 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775160473;
	bh=5x1RE8jpyGEsy0DBBdtgk0YO5BIsfmTAXglEmtSHCoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PHrGTzXPHJSd57mwA7NxwiziAxifPdcpqWmPCI8enMC9LvUhUmd77tiNNVtwm1vDv
	 6U2QDD3x9bAd8mzrI2wTD1mt4AXxlhBwLLrpvmaqLgMP3mCylk6fn8oea8+jNjR9cG
	 g3T445hezzQFMe9LMyBxAf0JF6OcPZIgQYoIowKKwgjaVUCNdZZ4aA30ZayDDHT/x6
	 FsxhtsxN+pyl5wd3vaodKVEBt7GSxNdqqRA1mIqLpTIMHd0QpSeaI5XFH5I7hHKn29
	 y5lvr1q97VhrTRAHVvSDyK4sMF1JSc4uBLil+fpwbYPUjoyp6zkqUFh+Z5hk6cPIB0
	 iYheuBQ8nPPMA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38c688bdc71so9956941fa.2
        for <tools@kernel.org>; Thu, 02 Apr 2026 13:07:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YzmEypjo5iFemw9vpUWAUCbiAY5DF6Okb2mjo2/kFYMm5NydcD/
	Q/+s8kSln7tJ1tWHJ0J2/yS3qP/tgPVYcMeLQZXs+m91GC9Gys/TrUw3ZC7CGbI0s74pj02mCLU
	NgvhJAFr8L+iQSbX7qEPhx5hJF0LUSfI=
X-Received: by 2002:a2e:b8ce:0:b0:38c:4c5e:330a with SMTP id
 38308e7fff4ca-38d97888e58mr530331fa.35.1775160471674; Thu, 02 Apr 2026
 13:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>
 <20260402-didactic-excellent-scorpion-8f5189@lemur> <20260402-messy-acoustic-wren-63e0b4@lemur>
In-Reply-To: <20260402-messy-acoustic-wren-63e0b4@lemur>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 2 Apr 2026 16:07:15 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9mZc=Q-KVnF0K=0HVW+rLxVa4beOqRFWs-N5qKKCW=9Lw@mail.gmail.com>
X-Gm-Features: AQROBzC58a98Cj3M-Hlmkoz9GYit4Vz7tBZ4QDqjXpRqnjXJKiEMWTHKP4VEs_M
Message-ID: <CAJ-ks9mZc=Q-KVnF0K=0HVW+rLxVa4beOqRFWs-N5qKKCW=9Lw@mail.gmail.com>
Subject: Re: b4 type checking
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 3:46=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Apr 02, 2026 at 03:28:55PM -0400, Konstantin Ryabitsev wrote:
> > On Thu, Apr 02, 2026 at 01:15:51PM -0400, Tamir Duberstein wrote:
> > > I sent some typing improvements back in June 2025 and I see you've
> > > been steadily pushing things forward since then. However, when I try
> > > to run `uv tool run mypy .` on b4 I get just over 350 errors. Is ther=
e
> > > an invocation that's expected to be green?
> >
> > For the most part, "mypy --strict src/b4" gets only a few errors. The o=
nes
> > you're seeing are mostly tests, I think. I see that uv reports more -- =
I'll
> > take a look at them.
> >
>
> There were just 3 that I found. The report is green now:
>
> $ uv tool run mypy --strict --python-executable "$(which python3)" src/b4=
/
> Success: no issues found in 28 source files

Thanks. I think part of the problem is that you're using `uv tool run`
rather than `uv run`; this uses your global mypy instead of the
versioned one in pyproject.toml. Here's what I see now, after your
fixes:

% uv run mypy src/b4
src/b4/__init__.py:1784: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:1794: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:1797: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:1804: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:1807: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:3177: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:3180: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:4637: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:4638: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/__init__.py:4643: error: Unused "type: ignore" comment  [unused-igno=
re]
src/b4/kr.py:66: error: Unused "type: ignore" comment  [unused-ignore]
src/b4/ez.py:193: error: Unused "type: ignore" comment  [unused-ignore]
src/b4/ez.py:195: error: Unused "type: ignore" comment  [unused-ignore]
src/b4/ez.py:202: error: Unused "type: ignore" comment  [unused-ignore]
src/b4/ez.py:283: error: Unused "type: ignore" comment  [unused-ignore]
src/b4/ez.py:284: error: Unused "type: ignore" comment  [unused-ignore]
Found 16 errors in 3 files (checked 28 source files)

>
> There are a few more in src/tests, but I don't care about them as much.

There are 48 more in tests. Personally I think tests are just as
important because they might expose typing bugs, but that's just my
opinion.

Cheers.
Tamir

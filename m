Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640466;
	b=1jpEbZo1/VZnYLpgQOG83nzCo0Pqq/eqmMcMD6O6rnYFx2dwsdg5Ym5WjiGhTw6D41n2
	 wsW77cst+uZLO73JIOJCuhyITQyAoOdGimFIQAyy21GYbbcaqTLePA0Kc8vpXSZwEuWvw
	 rXp3xJFvx1uvEpTTXiHUcCPPWO6glA2psNVPuFdlCzNLjyN+badmTqqyv7w+oZs4IS8Mj
	 DL0sx+z4s7ET9HgdvkoUhklM5rHSwk8xa/nAZgPP6424zmCQywUafi8raW3KoHh+hncZA
	 6/O840Bg2WmLjACwZFkM4buZZfLQpDR4J7ktjI4K+BoihJVWj2PHxI0TfSSbI/hqltQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640466;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=A1mC+xIqhQgsx4WuUrAsYYRoBoZvp2I7n0G3k6cDeCE=;
	b=W+QKDFFtQtmin+r67FlInzTqD9ITUpNHMTu7IwDxNueCEUc7Sw16vTfNdnUNcqk+l3Rg
	 dPSniyQDz5n2hAFwBeItxpoVNttrP43Whlj9PNm6pE9yxGH0DUGSWgJVDOr5Pa4aPWwo0
	 ZTXzW1HPsKyDr+9R89Ky9YzZUhW2XJiuZPaLoyOaJ6K1EL5MMmBIw/YHcD8PWbxotAo4O
	 XjuZz7a66RDq9CZU5jNzI5t8+LKkzxZ8ZcXCcxhUw4svI4gdV3aOUVW8EX5ZCwlxE34s+
	 rALYLmlr7D+jcEW9lcV9IldbFK7cuCMKweRna04Etfcv3mIF7Obu9sxk1RPUrsDAQ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UELv+mvR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31886606A32A
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UELv+mvR
Received: by smtp.kernel.org (Postfix)
	id 06E5E1F000CA; Wed, 25 Nov 2026 21:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998241F000C4;
	Wed, 25 Nov 2026 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795640465;
	bh=A1mC+xIqhQgsx4WuUrAsYYRoBoZvp2I7n0G3k6cDeCE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UELv+mvR4aJrjD8BYyWpr0AQLAhgzZsHelhXgecfcBmP7r3HbgYQbaORVZESjO05r
	 IM7hQ3rqofPBkUrpsnyKyOX9CE202XwaQCXWVVN8HTDYi39t5EmwmQn658OBriROkx
	 iEX24ekJabLdeX1E/PBZz1B9ETUvCJIFn7LJ3zLw=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/3] review: recognize tracked patches merged
 upstream
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
References: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
Date: Wed, 25 Nov 2026 21:01:02 +0000
Message-Id: <179564046256.1145923.9411001643787169541.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3648;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=3r/eSJUSy9HoASYC4Rd+njA1TicBorVMVxOQwLs03KU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZfSbkl1aLJpcae7iJdXyzTvU98mP1k1nu3EJdOUfZ7
 z7qlU/rKGVhEONikBVTZCnbF7spqPChh1x6jynMHFYmkCEMXJwCMBHzKYwM26rcXVkaX4m2rlmz
 6E/ZSaY95ae3nmX09xf92mLwsPePLCPDs3pZhq1NRX7NBXs2sUw5s9hx11fdsKJrNxPk3kz49vk
 uMwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Tracked submissions can remain in review after their patches have landed
> upstream. This series checks upstream history during a review update and
> shows which tracked submissions have been merged. Once all patches are
> found, the tracking list marks the series as merged.
> 
> The check matches commit subjects and author email addresses rather than
> diff contents, so it can recognize patches edited by a maintainer before
> they were applied.
> 
> The first patch prepares the tracking database and branch rescans to
> preserve per-patch matches. The second adds detection and displays the
> results in the review TUI. The last patch allows the upstream repository
> and branch to be configured, or the check to be disabled.

I didn't take this exactly, but I liked the general idea of being able
to recognize when tracked patches land on another remote, which usually
means that someone else is already handling them. The feature is now in
master, though it's still pretty experimental.

What changed compared to your v1:

- No fetching. b4 only reads remote-tracking branches that are already
  in the repository, so the result is as fresh as the last "git fetch".
  v1 did a --shallow-since fetch into a private ref on every update.

- No discovery. The remotes to check are listed in
  b4.review-check-landed, and the feature is off until that is set.
  v1 used an "upstream" remote or asked the GitHub API for the parent
  of "origin", and was on by default.

- Several remotes, all their branches. v1 checked one branch of one
  repository (b4.upstream-repo, b4.upstream-branch). At least, for now.

- Exact matching only. A patch counts as landed when a commit names
  the posting in a Link: or Message-ID: trailer, or has the same
  subject and an identical diff (patch-id, tried with four diff
  algorithms; this logic is now shared with "b4 dig"). v1 matched on
  subject and author email without comparing the diff. I know this is
  likely to result in missed patches, but a false-positive is worse
  here.

- Any patch can land on its own. v1 only counted a consecutive run
  starting at patch 1. I wanted to also handle a scenario where a series
  is partially applied to another tree.

- No status change. "landed" is only shown, never stored, and is
  worked out again on every update, so a patch that drops out of a
  remote stops being landed -- this sometimes happens with next, for
  example where a patch lands but is then un-pulled. v1 stored a new
  "merged" status as a side effect of updating.

- Landed patches behave like skipped ones: "H" hides them, a take
  leaves them out of the preselection, and review agents pass them
  over. In v1 they were only listed in the details panel.

- Nothing goes into the tracking commit. What landed lives in a
  separate table in the local database, keyed by message-id. v1 added
  columns to series_patches and wrote the status into the tracking
  commit.

- A fully landed series keeps its own status when a newer revision is
  known, or when the maintainer has unsent comments, replies or
  trailers on it.

- New for scripts and agents: "b4 review list --status landed", and
  "b4 review show-info <branch>:landed-patches".

What was kept from v1:

- The idea itself; you are credited with Suggested-by.

- Your guard against rewriting a checked-out review branch when the
  thread is cached, credited with Reported-by. The cache is now
  refreshed once the branch is no longer checked out.

Thanks for the submission and the idea!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

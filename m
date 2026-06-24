Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE014388382
	for <tools@linux.kernel.org>; Wed, 24 Jun 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290159; cv=none; b=kqOoxJSAGl4P4uQc9gGqZDcHBric3hn6DVryndRoe8YRCXgxFI5NPAXHA63DWWUNDP8mimSK5jmRGnK7qYyC2i2uJ6ro+tnmZj0xGmWtACNJGF9Vd2VWQaKlFfM0u2FFxviT4aetgsrLUne4pYBM1rp3wFhOgBkpd7KQ6PG+VdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290159; c=relaxed/simple;
	bh=Eu+R6ne7N/jZ119cwxC7ynjfCMx+B5vBhwRThPaauk4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SrXZW3rSGS0DtzI4bND3ceWazb9BLwuZLm0aPRNnRFUlkAVzLRFlylzkO0LWp7Ha3Oogfkk8uGiZqTNgU6zuWbLjPbTKMbg7PiZjR36BbjbkaYUp949wV93WerdxgH/J+XpLM+hy/IEc1bgUZTIcgsHqIUiY1ZEJWzK1LpVSszI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZZx0kwP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZZx0kwP"
Received: by smtp.kernel.org (Postfix)
	id BA8A71F00A3A; Wed, 24 Jun 2026 08:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E418E1F000E9;
	Wed, 24 Jun 2026 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782290157;
	bh=QEBa3O/dFkA+/7UZtsam5vkXboS+ca1Ugb8ucwaX5Pc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SZZx0kwPG9fLg1ppmtpLMCZO17RCAzdC0ILvmBSDG/e4CQ0GxuJfF/Ikx1IyX9TuE
	 jLVz0KWmXo2eJgAy7ebYsHUR+75obNJ3G8RuZvREidNrQRYTM344l146boZA+io4Lf
	 99pjZwzgOO24O4jOp6ITzC0zZfvjQZkmbJL4OKT3xaT8NGWZqbonU+FY6s9oJ01w1z
	 9SFCWlz+CA03jVV6s5/axXR8nb0AgNtaqPeYj+13+EgULlFiPsuVsegR/C0XJC7jRn
	 s0SrvX4FjaM1LIqQwKnI6gfwvU/mt08ZT8MkNxPob45w+5IT/dIuWbECRLpauwlep9
	 1rIjqZ+12Li4A==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/5] shazam: stop --resolve from silently dropping
 commits
From: Christian Brauner <brauner@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
References: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
Date: Wed, 24 Jun 2026 10:35:51 +0200
Message-Id: <20260624-querulant-herzform-unmodern-faf5463919ef@brauner>
X-Mailer: b4 0.16-dev-d4d07
X-Developer-Signature: v=1; a=openpgp-sha256; l=4191; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Eu+R6ne7N/jZ119cwxC7ynjfCMx+B5vBhwRThPaauk4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZT3v54bHcMeUM00m6nkffn4rd1meXJqyUk7ZLefqvt
 70dni25HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABORlWH4n7g6wfVDTqNzYNME
 1UVzt/zgjn+YPXt3sYfo8dri5OrJUxkZdnRK3fnqUZZiOjV8j5jS00sHnaZ6hZqoW2w3bf1zv/Y
 nFwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-06-24 01:41 +0200, Christian Brauner wrote:
> b4 shazam --resolve exists to help land a series that doesn't apply
> cleanly. The problem that motivated this series is that, while resolving,
> it can silently drop whole commits from the merge it produces: you end up
> with a merge that is quietly missing changes, and nothing in the output
> points at what went missing.
> 
> Why they vanish
> 
> When git am can't apply the series, the old --resolve path merged the
> patches that did apply, then replayed each remaining patch with
> "git apply --3way" and staged the result with "git add -u".
> 
> git apply --3way can only do its three-way merge if the blob IDs recorded
> in the patch's "index <old>..<new>" lines are present in your object
> store. For patches that arrived over email those blobs usually aren't
> there -- which is frequently the very reason git am -3 failed to begin
> with. In that case git apply --3way falls back to a plain apply, fails
> with "patch does not apply", and exits non-zero having written nothing at
> all: no conflict markers, no unmerged index entries.
> 
> The replay loop assumed any non-zero exit meant "conflict markers are in
> the tree." It advanced past the patch and asked you to resolve conflicts
> that did not exist, so b4 shazam --continue happily resumed at the next
> patch. The skipped patch's changes never entered the merge -- they were
> simply gone, with no warning. A patch that only adds a new file can
> disappear the same way when it rides along with a change that can't be
> applied.
> 
> How this fixes it
> 
> Stop replaying patches with git apply entirely. On a conflict, b4 already
> leaves the in-progress git am parked in a throwaway worktree; keep it
> there and finish it natively:
> 
>     cd <worktree printed by b4>
>     # resolve the conflicted files
>     git am --continue        # or: git am --skip
> 
> git am drives the whole remaining series through git's own machinery,
> which stops on every patch it cannot apply and never silently skips one.
> Once it is done, b4 shazam --continue fetches the fully-applied series and
> merges it exactly once -- the same merge a clean b4 shazam makes. Because
> every patch now goes through git am, nothing can vanish. This also brings
> --resolve in line with how the review TUI already resolves conflicts.
> 
> Since both now resolve am conflicts the same way, the series starts by
> lifting the worktree plumbing the TUI already had -- detecting an
> in-progress git am, and fetching the finished result out of the worktree
> before dropping it -- into b4 core, and shazam reuses it rather than
> growing its own copy.
> 
> Resolving conflicts in subdirectory files
> 
> One gap hid behind that guarantee. The series is applied in a sparse
> worktree where only root-level files are materialized, and git's 3-way
> merge refuses to touch skip-worktree paths. So a conflict in a
> subdirectory file -- the common case for real series -- still made
> git am -3 abort with a clean index: no markers, nothing to resolve. The
> user was pointed at a conflict that was not there, git am --continue
> dead-ended, and git am --skip silently dropped the patch. Only root-file
> conflicts, which the tests happened to use, ever worked.
> 
> git_fetch_am_into_repo now rebuilds a full worktree on a conflict before
> handing it back -- abort the partial am, disable sparse-checkout, replay --
> so the conflict is recorded with real markers to resolve. b4 shazam
> --resolve and the review TUI both apply through this one function, so both
> are fixed, and a regression test drives a subdirectory conflict end to end.
> 
> The same commit hardens the rest of the flow: b4 shazam --abort no longer
> crashes on a corrupt state file, --continue refuses up front on a dirty
> working tree (keeping its state so it stays re-runnable), a failed
> worktree fetch leaves the resolved am in place to retry, and the docs now
> note that --continue merges with -M and leaves FETCH_HEAD with -H.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---

v2 will be coming shortly.


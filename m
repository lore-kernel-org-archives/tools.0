Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440F3E6387
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 20:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774299560; cv=none; b=GaEjfpEMsQVCTvbMxVWFlfS+7NsiWxtgxPwecW5y2DEkaBeJYxPR2L1gbVFepcXw2bJdSO4ZzmxvOot8H2JDPfsZfmq3MQb0UBe1OEV9YpYkWipopIK/LdlPHrSKeEJSXYChpwzxQjqSIqZeTISmdxCR8gU97isEzr6L1YnbYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774299560; c=relaxed/simple;
	bh=3Uwy9kCqCqg4yeS0CUt8QhVPiVU6+dMv8XfmblnslOo=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=W4ElYKiIugLOn1izOPeyc0NJyzG8giloyjFFC8depyKCjIQJheYUpYWDSxkduSuEaFw1peoX12OiOQ0E/n5RB5g9oNu587CFcIgHEHNFRB9IDCwbqmfdb7fcxGr8H7w7hatOTpYB9N/IkMdMXGhWXPJiEVFWAvW4ciAeXry38Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXWMhE9i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXWMhE9i"
Received: by smtp.kernel.org (Postfix)
	id 29618C2BCB7; Mon, 23 Mar 2026 20:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122DBC4CEF7;
	Mon, 23 Mar 2026 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774299560;
	bh=3Uwy9kCqCqg4yeS0CUt8QhVPiVU6+dMv8XfmblnslOo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dXWMhE9iJrC6fg/DrQ8LIjugxEj67yHpvxFwK1e1EH+ssBrGtbqvnh5WP7i2qN2wp
	 Yg5IRBq608XGm8EkDcFUJBsYJKRwi6T8nPb04ZCnmQLgOUSsXgRnIDzJLdKG8I5PdR
	 FZXpGbAllXiCcILIiy1bUnMm7Cwv4sF3b6eDHS2nb93nDOpL+oGv1/RwP6Od5pxkyZ
	 Mz7PzyIBmhk1vRM68ix6S6FDd/3nXopC3i1iLLOO8F0AteKHzDKvdbBVBGRcSsTJiv
	 sA/5M+jyMhM1iSgULmOeQNv3vm2Tgf/h9OaevjTncF2VpgOitos9lkCADiTBIYRExQ
	 gCPIHEq93Fn4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7FC6E3808200;
	Mon, 23 Mar 2026 20:59:09 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: tools@kernel.org, broonie@kernel.org, konstantin@linuxfoundation.org
Message-ID: <20260323-b4958fdfc4-0e75d99fc85f@git.kernel.org>
In-Reply-To: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
References: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
Subject: Re: Stitching together serieses
X-Git-Bug-Id: 4958fdf4ef6259630525d09cd46f999c7f1fad416aa0c25819516efd8c89d691
X-Mailer: bugspray 0.1-dev
Date: Mon, 23 Mar 2026 20:59:09 +0000 (UTC)

Konstantin Ryabitsev writes in commit 1718708bd211406cc60f6343b559fe02ad2be2a4:

Add --rethread flag for stitching unthreaded patch series

When submitters send patches without proper threading, maintainers
have no way to process them as a series with b4. Add a --rethread
flag to retrieval commands (am, shazam, mbox) and review track that
fetches unrelated messages and reconstitutes them into a properly
threaded series.

With a single message ID, b4 auto-discovers the rest of the series
by querying lore for patches from the same author within a 30-minute
window, matching by [PATCH n/m] counters and revision. With multiple
message IDs, b4 uses them directly. Stdin input is supported via
--rethread -.

When no cover letter is found, the first patch becomes the thread
root — the same structure as a normal coverless series on lore.
This avoids synthetic message IDs and keeps all outgoing references
(thank-you notes, trailers, review replies) pointing at real
messages on real mailing lists.

For review tracking, an is_rethreaded flag on the series table
(schema v7) gates the retrieval path so only rethreaded series use
the multi-fetch pipeline. The flag is persisted in the tracking
commit JSON so it survives database rebuilds via rescan. Member
patch information is stored in a new series_patches table for every
tracked series, laying the groundwork for future cherry-pick-at-
track-time support.

Key changes:
- Extract parse_msgid() from get_msgid() for reuse
- Add LoreSeries static methods for series reconstitution:
  identify_cover_letter(), rewrite_subject_counter(),
  renumber_patches(), rethread_messages(), rethread_series()
- Add discover_rethread_series() for auto-discovery from a
  single seed message using lore search (dt: time range queries)
- Add fetch_rethread_messages() and retrieve_rethreaded_messages()
- Hook into retrieve_messages() and review track's cmd_track()
- New series_patches table with (change_id, revision, position) PK
- New is_rethreaded column on series table for retrieval routing
- Persist is-rethreaded in tracking commit JSON; read it back in
  rescan_branches() and create_review_branch()
- retrieve_series_messages() gateway for review TUI retrieval
- ReviewApp._fetch_rethreaded_threads() for follow-up loading
- 45 tests covering parsing, renumbering, rethreading, discovery
  filtering, and integration with LoreMailbox
- Document --rethread in mbox, am/shazam, review, and man page

Closes: https://msgid.link/8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk # 4958fdf
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


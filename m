Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8503EDAD9
	for <tools@linux.kernel.org>; Thu, 19 Mar 2026 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942395; cv=none; b=bRXQg0zS+DRjI02PZnaEu+GlmFSbNcwdrU7OZfTcjxmxfu/nH19//hSD75gwUqR7+YROFN3B055PCmUQFonNFU2ybSzGjFk0OjztTwa5LYRbjYTc+qKOnC7TgyWPXgpQViUi9fJPCAvy0h0PT9T+JPx26p/xja2+qyyW9FDlbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942395; c=relaxed/simple;
	bh=fi9ehUs2K3y8qrCok5Ce5JVF67dOtNXm5MlYwqDg0bk=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=IpR5LTwTQBY3aSSz6o9piiySafq++ZM5tTjpfItFrf4UknL2Ty5MW6EV+dgkApCdhNBTintl2L5VkAL3miQ2kdBHkneFUw74vluFniK3qgkmmai4qkOTsyogW5ELEeKS9BtlVp1JTu+amfvUn2iP7C65ukrqjuIxsFFTfEn2G7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+Yx6Si6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+Yx6Si6"
Received: by smtp.kernel.org (Postfix)
	id 199A9C2BCAF; Thu, 19 Mar 2026 17:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038FEC19424;
	Thu, 19 Mar 2026 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773942395;
	bh=fi9ehUs2K3y8qrCok5Ce5JVF67dOtNXm5MlYwqDg0bk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=H+Yx6Si6h5Z2+ZFnXD5HU8eQu5MvKmQp6WikBH9uOSva8jyt6ifZY5o3zcGqVvgip
	 qT0bKNwUcd2HysU/ilkOLiU+fM5TGGh6UkSO537JQ2UBv5zWFVdQNxy5HsDR/+WBcG
	 YCL/Zgb/kJoQJxA4MOygTal0nXNuLUCI74LJxIkiJfJVYpsU+/PxpA8TVHke3RTdjm
	 H/dgSQxnTeYbUPbP8r0Fmlvn3AcCMzHqAZGfuSEE1OSiqyVNS2xzJrdO2IGhW2YcE6
	 u1vBRY3KiCuYxmFxJpZmHCv1Q18eSU6TzvDvSQX8o8bo4mxE3GW3KtkC35R+i1XB8q
	 ZqUWIXKKPEGUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05BC339302E2;
	Thu, 19 Mar 2026 17:46:27 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: mricon@kernel.org, tools@kernel.org, broonie@kernel.org
Message-ID: <20260319-bcc07a98c2-dc61cf5d01a0@git.kernel.org>
In-Reply-To: <64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk>
References: <64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk>
Subject: Re: Problems with b4 review update workflow
X-Git-Bug-Id: cc07a98ad6554be8888f9accb9f2bf19dcda1d94fa75207f88eb4a76c2e596bc
X-Mailer: bugspray 0.1-dev
Date: Thu, 19 Mar 2026 17:46:27 +0000 (UTC)

Konstantin Ryabitsev writes in commit db13a1e6989d946ae12fc7acfd7ec38a61df2148:

review: use temporary upgrade branch for revision updates

Refactor _do_update_revision() into a three-phase workflow so the old
review branch is never modified until the new revision applies
successfully:

  Phase 1 (worker): fetch the new series from the network and compute
  base commit hints -- same logic used during initial checkout.

  Phase 2 (modal): show BaseSelectionScreen so the maintainer can see
  and correct the base commit, instead of silently guessing.

  Phase 3 (suspend): apply patches to a temporary upgrade branch
  (b4/review/{change_id}-v{rev}-upgrade), restore review data, then
  archive the old branch and rename the upgrade branch into place.

Previously the old review branch was archived (deleted) before
attempting to apply the new version, so a failed git-am left the
maintainer with no review data. Now the old branch stays untouched
until the apply succeeds. If anything goes wrong the upgrade branch
is cleaned up and the old review is intact.

After a successful upgrade the TUI returns to the tracking list
instead of immediately entering review mode.

Key changes:
- _do_update_revision() now pushes a WorkerScreen for the fetch phase
- New _on_update_prepared() callback pushes BaseSelectionScreen
- New _on_update_base_selected() does the apply/swap in suspend()
- Archive only happens after the upgrade branch is fully built
- git branch -m renames upgrade branch to review branch on success
- Added 8 tests covering all phases, failure modes, and the safety
  guarantee that the old branch survives errors

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://msgid.link/64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk # cc07a98
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172F03C0A0E
	for <tools@linux.kernel.org>; Wed,  5 Aug 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949295; cv=none; b=fG8J2aEH30knjyozyVTbcT9ZcUaW626gzq3BjmAmlQ4Hw2o045KE1CUH6CsNpaLLCujOAmD9WoWAYkEzd7Gma5/Y4w9vdryK9m128ZOnLQj3SGsplOgFM5rh2qwvE/FiIlhJAe2D5KmhXNc4k1tHwqg30QWrfHhGv5We0GbKRSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949295; c=relaxed/simple;
	bh=GTXw2WI2SQsHF2ETkzhpXQqF9Qg+Tjq4hsszwUCSe4I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W7xEpRXUt0lTBRGd+5U2jEGGDLQdFSDfyiCCadebIOw76AKNlCZeEkquMQegW4KvqZT+EOX7UjAEnuMoYlei8s+pmSL5Z7msr5YGHAv+Sh+pSdDI7xtS/5diweYIkkJx4M/R+cteup+oorGs6MF5MP10jmEihVoJuUe82Rguj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0zJ74rS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0zJ74rS"
Received: by smtp.kernel.org (Postfix)
	id E1F461F00A3D; Wed,  5 Aug 2026 17:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8081F000E9;
	Wed,  5 Aug 2026 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785949293;
	bh=c/uXAEqDuzqJIv47T8O61dVRxdzm+/99LxxjE924Ds0=;
	h=Date:From:To:Subject;
	b=i0zJ74rSmbIsJr8naJhljU5VhVC7IMhi4bvfX/Rv04h1BpOTOq8Yll9w+il/bljpW
	 5VZoBZ/MDnBoHAChuojQU9p3Fylj4RTSOdQo8VN/DKD5AnwhACx7lHwrMlxh+CKyci
	 nosHgWPn1TJuM2R7NbvYmeEvTSry8luGNFiWm/3iR7fCiuQ9kLywST5D8KjdIYlMrc
	 6/UfQOqgw6/kid9lOFfKUrd2PvxxQoZGqP0h5Mr5uMBj4fkTg73nQE0RQgAnsycSTf
	 j2EOOuw0F/1G2FWLmrHlEkn0Xr72aOlLiTtoXVm96Cg/EnjuI+yJ++MHNW0m0XOuJf
	 NlXO9tPtsnOfg==
Date: Wed, 5 Aug 2026 13:01:31 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: tools@kernel.org, users@kernel.org
Subject: b4 0.16.0 released
Message-ID: <20260805-alluring-arrogant-grouse-ece17a@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, all:

B4 v0.16.0 is now available! Install or upgrade using your usual mechanism,
or start from scratch with:

    pipx install b4
    # or, if you want the review and bugs tui stuff
    pipx install b4[tui]

Full release notes:
- https://b4.docs.kernel.org/en/latest/releases.html

Getting started guide for reviewers:
- https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html

Full release notes available here:
https://b4.docs.kernel.org/en/latest/releases.html

Here are some bigger items in this release:

# b4 bugs -- bug tracking with git-bug (technology preview)

The new "b4 bugs" command integrates with git-bug to let you track bug
reports alongside your git repository. Bugs are stored as git objects
inside the repo, so they travel with the code and can be shared via
git push/pull without any external service.

More about the git-bug project:
- https://github.com/git-bug/git-bug

Bugs stored this way can also be viewed via git.kernel.org -- for
example, b4's own bug tracker:
- https://git.kernel.org/pub/scm/utils/b4/b4.git/bugs/

A full-featured TUI (b4 bugs tui) lets you browse, triage, and update
bugs; a lightweight CLI covers scripting and non-interactive use. The
git-bug tool itself also ships its own TUI and a web UI, both of which
work fine alongside b4 on the same bug data.

Highlights:

- Import from lore -- enter a message-id and b4 fetches the full thread,
  uses the oldest message as the bug report, and adds follow-ups as
  comments.
- Lifecycle states -- triage bugs through custom lifecycle states.
- Reply to bug reporters directly from the TUI.

Like "b4 review", this ships as a technology preview (alpha): commands,
keybindings, and formats may change between releases.

# b4 review -- a large batch of improvements

The v0.15 technology preview generated a lot of excellent feedback (thank you,
everyone who wrote in -- especially Mark Brown, Christian Brauner, and
Matthieu Baerts). This release focused on making the review workflow more
robust, though it is still considered a beta-quality feature.

Here are some notable changes:

- Reworked revision upgrades -- "a newer revision exists" is now its own
  attribute rather than a series status.
- Applies ("takes") run in the target branch's worktree -- applying a series
  never checks the target branch out in your current worktree, and merge
  conflicts are resolved in place in a conflict shell instead of aborting the
  take.
- Partial-series state -- cherry-picking a subset of a series sets it to
  "partial" state; the review stays alive and b4 promotes it to accepted
  when later takes complete coverage.
- It's now possible to thank and archive in one motion -- an opt-in Take
  checkbox chains a fully-accepting take into the thank-you preview, and
  archives the series once the thanks are actually delivered.
- b4 review cron -- non-interactive periodic maintenance: wake expired
  snoozes, rescan branches, update all tracked series, and deliver
  queued thanks from a scheduler or a git-push wrapper.
- b4 review track --rethread -- stitch together series sent without any
  threading; pass one patch and b4 does its best to get the rest from lore.
- Manual revision linking -- when automatic discovery fails, link a
  revision by hand from the action menu.
- Custom reply templates -- wrap outgoing review replies in your own
  template via b4.review-reply-template.
- Editor plugins for Vim and Emacs -- diff-aware syntax highlighting for
  review buffers, hunk trimming with "[ ... NN lines skipped ... ]"
  breadcrumbs, and adopt-comment for claiming external reviewer comments. See
  misc/ in the source tree -- we don't install these automatically, but they
  do really make a big difference.
- Many quality of life tweaks -- long-running network operations can be
  interrupted with Escape; quitting now takes a capital Q (bare q warns);
  sending from any preview screen is Ctrl-y; your own replies no longer show
  up as unread; prior Reviewed-by/Acked-by replies you sent before tracking a
  series are auto-detected and marked done; the Patchwork browser no longer
  hangs on huge backlogs.

# b4 shazam -- conflict-resolution overhaul

"b4 shazam --resolve" now resolves conflicts inline: on a git am
conflict, b4 parks the in-progress apply in a throwaway worktree and
drops you into a sub-shell there. Finish with "git am --continue",
leave the shell, and b4 completes the operation. The previous
two-phase --continue/--abort flow is gone.

The conflicted series is applied entirely through native git am, which
fixes a serious bug where a patch whose three-way fallback could not
run was silently dropped from the merge.

# Native history rewriting and committer integrity

b4 no longer depends on git-filter-repo: cover-letter updates and trailer
application now rewrite history natively via pygit2. Git notes on rewritten
commits are migrated to the new commit OIDs instead of being orphaned, which
opens up possibility of better git-notes integration in the future.

# Interactive trailer and thank-you review

- "b4 trailers -u -i" opens your editor with the trailers about to be
  applied; rejections are persisted and honoured on future runs.
- "b4 trailers -u --fuzzy" recovers trailers for rebased/amended
  commits by Link: message-id and subject when the patch-id no longer
  matches.
- "b4 ty -i" lets you review and deselect individual thank-you
  messages before anything is sent.

# New first-party dependencies: liblore and ezgb

b4 now depends on two new libraries that are maintained as part of the
same project family (mainly, of note for distro packagers):

- liblore, which provides all lore.kernel.org/public-inbox access,
  including automatic failover between mirror endpoints:
  https://git.kernel.org/pub/scm/utils/liblore/liblore.git
- ezgb, which provides git-bug access and powers the new "b4 bugs"
  command:
  https://git.kernel.org/pub/scm/utils/ezgb/ezgb.git

If you're running b4 from a git checkout, you should run "git submodule init"
and "git submodule update" after switching to 0.16.

Other notable changes
---------------------

- b4 is now tested against distro-shipped dependency versions; the
  pygit2 floor is lowered to 1.14 and two review-TUI crashes on older
  Textual releases are fixed
- sendemail.sendmailCmd support for local mail submission
- b4.custom-msgid-cmd for custom message-id schemes on replies and
  thank-yous
- b4.send-me-too = no to keep yourself out of Cc when sending
- b4 prep --cleanup-older-than for bulk-cleaning stale prep branches
- b4.review-apply-base to pre-fill the base selection dialog
- More reliable series matching for plain (non-git) diffs

# Thanks

Many thanks to everyone who contributed to this release with patches,
reviews, bug reports, testing, and suggestions:

- Alice Ryhl
- Breno Leitao
- Cássio Gabriel
- Chris Samuel
- Christian Brauner
- Clément Le Goffic
- Dave Marquardt
- Jacob Keller
- Jani Nikula
- Jeremy Kerr
- Jiri Slaby
- Jonathan Wakely
- Lorenzo Stoakes
- Louis Chauvet
- Mark Brown
- Matthias Beyer
- Matthieu Baerts
- Maxime Ripard
- Miguel Ojeda
- Miroslav Benes
- Nicolas Schier
- Tamir Duberstein
- Tan Siewert
- Vlastimil Babka

As always, bug reports and feedback are welcome at tools@kernel.org.

Best regards,
-K

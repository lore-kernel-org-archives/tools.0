Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3635E95E
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774039636; cv=none; b=s2JrorC6WkfAStqbS3raq/ZDJVg0MxcSqv5YzlmXWreVOLqODDMMk6vlf5PqAvplYkxiFhF/0cyxj50//WJpBOB+HvAAZCCJ1zHkHhXksijQLR/+ybugHDxtjggSAMhDegCKvmIo7cnyCfC4JmBrBqRg62Hy/R6CvzQIdpp3aEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774039636; c=relaxed/simple;
	bh=owYDT/DxwBtaFv1YyAFg/Ln7Jez0HgjWfkbvSaPhlzo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQTHQ4DlQcpRbhEc4gIzF5sTsFq5EOYZOnGWqDw8hOkJIJHnvd8K/RWQraBYRxVP9Ft3cAXXgdguTIUKfEXGNi1q1MtGx/EYJF6EPaI9sZRxMT7owiPpyh0UFxg8oQnmGW3kZ1uSTJmBbjEvGpLsHyhqSjjUl2XRdFKBqWXnOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W/EFSkie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W/EFSkie"
Received: by smtp.kernel.org (Postfix)
	id 02DBAC2BC87; Fri, 20 Mar 2026 20:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F8BC4CEF7;
	Fri, 20 Mar 2026 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774039635;
	bh=owYDT/DxwBtaFv1YyAFg/Ln7Jez0HgjWfkbvSaPhlzo=;
	h=Date:From:To:Subject:From;
	b=W/EFSkieBzKOlbbMZwtlS5E5dHDxd8GGR75T2Fse8c71XR//zCRPQMg0I495uH3Mj
	 LSvkBw/SJLyPdYUyeckwjLyMY1OfFJczba71TOH8Zcm2NVJ+Ui0WOCGh1tOPD8ar1z
	 giWVLyXi4m6g/I8vdsctI0ZzrORXoE8LlvnWqh18=
Date: Fri, 20 Mar 2026 16:47:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org
Subject: b4 v0.15.0 released
Message-ID: <20260320-portable-jaybird-of-focus-41fd66@lemur>
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

B4 v0.15.0 is now available! Install or upgrade using your usual mechanism.

We're recommending the use of pipx now over pip, so if you want to start from
scratch, you can use:

    pipx install b4
    # or, if you want the new shiny review tui stuff
    pipx install b4[tui]

Full release notes: https://b4.docs.kernel.org/en/latest/releases.html
Getting started guide with screencasts: https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html

# b4 review — TUI-based patch review workflow (technology preview)

The headline feature in this release is "b4 review", a terminal-based
workflow for maintainers who receive, review, and accept patches from
mailing lists. It ships as a technology preview (alpha): commands,
keybindings, configuration options, and on-disk formats may change in
incompatible ways between releases.

The TUI requires the optional "tui" dependency group:

    pipx install b4[tui]

The workflow is built around a lightweight SQLite tracking database and
per-series review branches. It comprises three cooperating TUI apps:

Tracking TUI
  Browse and manage tracked series with status indicators, take
  (apply) series using merge, linear, or cherry-pick strategies,
  compare revisions with range-diff, send thank-you messages, and
  archive completed series. The app groups series by lifecycle state
  (active, new, waiting, gone) and sorts by most-recent activity.

Review TUI
  Split-pane interface with a patch list and scrollable diff viewer.
  Add inline comments and code-review trailers, preview outgoing
  emails, invoke an external AI agent for automated review assistance,
  and send review replies — all without leaving the terminal.

Patchwork TUI
  Browse outstanding series from a Patchwork server, set state and
  archived flags, and track series into the local database for review.

Highlights:

- Series tracking and lifecycle management — track series from the
  CLI (b4 review track <msgid>), from your mail client, or from
  Patchwork. Series progress through new → reviewing → replied →
  accepted → thanked states.
- Revision discovery and upgrades — b4 automatically discovers older
  and newer revisions of a tracked series using change-id and
  in-reply-to chains. Upgrading to a newer revision preserves your
  review state and prior context.
- Inline commenting — press "r" in the review view to open $EDITOR
  with the full diff quoted. Write your comments below the relevant
  lines and b4 will format them as proper email replies. The diff
  view shows community follow-up comments from the mailing list
  alongside your own.
- AI agent integration — optionally invoke an external AI agent
  (Claude Code, Gemini CLI, OpenAI Codex CLI, or GitHub Copilot CLI)
  to produce a first-pass review. Agent findings remain private to
  you; you decide what, if anything, to include in your reply.
- Per-patch state machine — mark individual patches as done, skip, or
  draft to track your progress through large series. B4 automatically
  excludes skipped patches from cherry-pick selection and outgoing
  emails.
- Three take strategies — merge (creates a merge commit from the
  cover letter), linear (git am), or cherry-pick (select individual
  patches). B4 adds per-commit Signed-off-by and Link trailers on
  request.
- Snooze — defer a series until a specific date, duration, or git
  tag. B4 skips snoozed series during bulk updates and automatically
  wakes them when the snooze expires.
- Cross-machine synchronisation — push b4/review/* branches to a
  private remote and rescan on another machine to rebuild the tracking
  database from branch metadata.
- Mutt-style thread viewer — press "e" to browse the full email thread
  with tree art, attestation status display, and reply support. B4
  tracks per-message flags (seen, flagged, answered) across sessions.
- Worktree support — enrolled repositories work correctly from
  worktrees; a configurable review-target-branch sets the default
  branch for take operations.
- Patchwork state synchronisation — when you have write access to a
  Patchwork instance, b4 automatically updates the remote series state
  as you progress through the review lifecycle.
- Prior review context — when upgrading to a new revision, b4 carries
  forward your previous review comments and notes so you can see what
  you said last time.
- Quick-reply — reply to follow-up messages directly from the review
  TUI or thread viewer without switching to your email client.

# b4 dig — trace applied commits back to mailing list submissions

The new "b4 dig" command searches for the original mailing list
submission of a commit that has already been applied to a git tree. It
matches by patch-id, author, and subject to locate the original thread
on lore.kernel.org.

    b4 dig <commitish>
    b4 dig --all-series HEAD~20..HEAD
    b4 dig --who --save-mbox <commitish>

# b4 shazam — three-way merge and conflict resolution

"b4 shazam -H" now performs a three-way merge when applying patches,
which significantly improves the success rate for series that do not
apply cleanly with a simple "git am". When conflicts do occur, the new
--resolve flag drops you into an interactive conflict resolution session
instead of aborting:

    b4 shazam -H --resolve <msgid>

# b4 prep — pre/post history-rewrite hooks

Two new configuration keys let you run commands before and after b4
rewrites history on a prep branch (for example, when updating the cover
letter or applying trailers via git-filter-repo):

    [b4]
        prep-pre-rewrite-hook = stg commit --all
        prep-post-rewrite-hook = stg repair

A non-zero exit from the pre-hook aborts the operation, which is useful
for tools like StGit that need to commit their internal state first.

Other notable changes
---------------------

- XOAUTH2 and bearer-token SMTP authentication
- Presubject support (b4.send-presubject / --set-presubject)
- Send-email alias expansion (sendemail.aliasesfile)
- Codespell integration in b4 prep --check
- Shallow same-thread support (b4.send-same-thread = shallow)
- Force cover letter for single-patch series (--force-cover-letter)
- Default Link domain changed to patch.msgid.link
- Full-index binary diffs (--full-index --binary)
- Clean multiple prep branches at once
- Thank-you self-copy (b4 ty --me-too)
- Range-diff arguments (--range-diff-opts)
- Trailer provenance display in b4 trailers

Thanks
------

Thanks to the following people for reporting bugs, suggesting features,
reviewing patches, testing, and contributing code, and especially to Mark
Brown for valiantly trying the very early, rough versions of b4 review
workflows.

Alexey Minnekhanov, Andrew Cooper, Andy Shevchenko, Christian Heusel,
Conor Dooley, Dave Marquardt, Geert Uytterhoeven, Jonathan Corbet,
Junio C Hamano, Juri Lelli, Kevin Hilman, Krzysztof Kozlowski,
Lee Jones, Linus Torvalds, Louis Chauvet, Luca Ceresoli,
Manos Pitsidianakis, Marc Kleine-Budde, Mark Brown, Matthieu Baerts,
Maxime Ripard, Michael S. Tsirkin, Miguel Ojeda, Nathan Chancellor,
Panagiotis Vasilopoulos, Ricardo Ribalda, Rob Herring,
Tamir Duberstein, Toke Høiland-Jørgensen.

Best regards,
-- 
KR

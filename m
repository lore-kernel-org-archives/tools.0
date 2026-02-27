Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E243E4BB
	for <tools@linux.kernel.org>; Fri, 27 Feb 2026 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221990; cv=none; b=d7PZovC5VCoXj3vD3I54kWIu4z6sGGnQtkRYpHbpxqf7d2O/UkTI/jhuYQfZRZIszj42f5eZnqELiN5t3EMCOBckdtkW5K+eBX4Frb2BFD27KRSuxOYCUjWB1Oe9oZxXnegaT3cwfJ1i+OGnIVWCblI5UQNjMBzVl24XlXWo7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221990; c=relaxed/simple;
	bh=0aq3X6MZeJbicD4gZmtgPYahp9kwdjtOB6pjrI0Za3c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yj5G73Vf3CBTs87BrT6RloiN/eE4XDS5hMlMKpzqIaeeWp9+5EeDaWq+LSjS48DmFcy5lm0TQKg/I0iAryTqPEwWdjt4dmDVKDLdhKku3vmeNrDrii4C6Onewo5gjkjtM3IeKtQvGvOIznGRZI3YkzfoWyjd6fFX5+u6BnLLdCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBRXS2F7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBRXS2F7"
Received: by smtp.kernel.org (Postfix)
	id 96E62C19423; Fri, 27 Feb 2026 19:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D83C116C6;
	Fri, 27 Feb 2026 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221990;
	bh=0aq3X6MZeJbicD4gZmtgPYahp9kwdjtOB6pjrI0Za3c=;
	h=Date:From:To:Subject:From;
	b=HBRXS2F7gIxj5b0cE+h+/RJRQZlC8207W0mZBz5gOkTwb4yHEsBl+ZtLXgP+lHQ8w
	 lHPh4Xa9YQ2FkcW4h+XgIaFa6BizBxdZX3b9VGHTFnbBnZ+1I9NfoxKcphnFdB2g3e
	 icBfG6LXekfVXSPp05veSiBVOjpLiccVCd3fLkYUvpzWg+ion/GTQtT7ITMGbXPnTQ
	 UtHq4PR5ZCpj0JF4MQGM4eUdi2x8g7y1xNkAv3fVgUt/f9o+mPRlGzvSqvBsQdPtXQ
	 r2SwVl0ycoaWftygIVQ64/kQ8V9ARUDXkNaWhBfe04470wGxOLyu96cDSxufls9evs
	 lDVW/Xvx943Tw==
Date: Fri, 27 Feb 2026 14:53:07 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: users@kernel.org, tools@kernel.org
Subject: b4 review available in master
Message-ID: <20260227-imported-aromatic-guppy-ad3dca@lemur>
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

TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
maintainer duties. A getting-started guide with screencasts is here:
https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html

It's available from b4 master pending initial testing and will be generally
available in b4-0.15.

Longread:

I've been working on "b4 review" for a while, with a few false-starts, a lot
of despair, and then a whole new direction that seemed to have finally worked.
So, the usual. :)

I am finally feeling confident enough to release the code as initial
technology preview, with the primary goal to get some direct feedback. The
goal of the UI was to work alongside your usual email client, allowing you to
use it for as much or as little as you like.

The feature only exists in b4 master branch, so if you want to try it, you'll
need to be comfortable running b4 from checkout. It also requires having a
valid email server configured with git for sending outgoing mail. If you're
already using "b4 ty" then you're good to go.

The only new dependency introduced is python-textual. I say this with a bit of
tongue-in-cheek, because textual pulls in a ton of other dependencies, but
it's usually already installed on many modern distros anyway.

You can do the following things:

  - Track incoming patch series from lore using a message-id, URL, change-id,
    or by piping a message from your mail client (e.g. via mutt integration)
  - TUI-based tracking list with series lifecycle management (new, reviewing,
    replied, taken, thanked, archived, waiting)
  - Split-pane review interface with patch list and syntax-highlighted diff view
  - Quick trailer addition (Reviewed-by, Acked-by, Tested-by) with a single
    keypress
  - Inline diff commenting via $EDITOR — comments are automatically formatted
    as proper quoted-reply emails for the mailing list
  - Preview emails to inspect exactly what will be sent before sending
  - Fetch and display follow-up messages from other reviewers directly in the
    diff view
  - Range-diff between series revisions without leaving the TUI
  - Automatic discovery of older and newer revisions when tracking a series
  - Revision upgrade that preserves your review comments on unchanged patches
  - Three merge strategies for applying series: merge commit, linear (git-am),
    and cherry-pick
  - Thank-you note generation listing each applied commit with its hash (and
    more reliably than b4 ty, since we keep track of applied series instead of
    guessing)
  - AI-assisted review using an external agent (Claude Code, Gemini CLI,
    OpenAI Codex CLI, GitHub Copilot CLI) — agent findings are private to the
    maintainer and can then be selectively incorporated into the review
  - Patchwork integration: browse series, view CI check results, track series
    directly from Patchwork, and automatically synchronise Patchwork state as
    you work

Watch the screencasts in the link above if you're curious and please try it
out. I'm sure there is a ton of corner cases that are not properly handled
right now, so the more feedback I receive, the better.

If you want to play with LLM reviews, you will need to specifically configure
your agent. See docs for that. If you don't have a subscription available, I
am told that there is a program for OSS maintainers available:

https://claude.com/contact-sales/claude-for-oss

If you know of a similar program offered by other LLM providers, I'll be happy
to know about it. I've tested claude, gemini-cli and codex. (I did test using
ollama-based agents a while back, but the results were a very mixed bag --
there is usually not enough context available to these models to perform a
useful code review, but ymmv.)

Best regards,
-- 
KR

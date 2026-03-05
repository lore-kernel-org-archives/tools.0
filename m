Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA2D3D3CFD
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734717; cv=none; b=h/yNC+6FoyfrNj9Fwn5HuLroHmE9rAAnNgBsBAOIzcEtDgKQEylELVJzptXhQ15e4X/nLbq8G16UfdtPeuQSq4bfr4W/AIne5Fz1fYHioBcCCzWEA4BlkOICVLY0IB4PfFHVbxQI+DO0dPuPEQr+3SclRuPQr4oTRXmBChmSPM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734717; c=relaxed/simple;
	bh=Gu9R0mESY+gbsh/hNv9eOFTMkAHElkxBGAlwTZfPz9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOXpiaLL6ZggJbD+cSi2i//ySZVY0jNTAcOUL2EKeyAK0Y/x5T5XlMYQLsyPMa14zu+gc44GSjnQc53+3I8JSd43ZdSdfuEU2Dxe2ei6UM7ZGgSACeYkPJErzyMzGIvvfRiSfhPaz3cIPfXmo8ojy25+/AuyAKlbo3ie8+8Z5O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNsSZMgG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNsSZMgG"
Received: by smtp.kernel.org (Postfix)
	id CB40CC19425; Thu,  5 Mar 2026 18:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A42BC116C6;
	Thu,  5 Mar 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772734716;
	bh=Gu9R0mESY+gbsh/hNv9eOFTMkAHElkxBGAlwTZfPz9Y=;
	h=Date:From:To:Subject:From;
	b=XNsSZMgGC81RtWN+7fr6vvvYb4/vEQO8awNk+OJW0ikjaIgrVJYs16Lb32AhO2w4z
	 /OtzrzA8F3V6aUBtdOF0Nw4UInwO4JeiVb1MrbHBBhMUUEqbpizt0ho9ZlpwcrUa31
	 o3QCqXKR9LCuzTzBngeNycsMfuEuW6J9E7pdWw/CEoKjCZdmkw+ajU2l8XnFwF28IT
	 Tgn27DBEASqZx3tjfP5IAKbrqNRQkdWwD/VujUwvqVAMGccpXrVUBGQDhmbCd+upZO
	 cOvY1Li5B8AW0bFx6WGZxcNCWbkoP0rgT5U5l4lPBwJeesCaG08KIBO87deMwftzkW
	 NkGhNBiG5fOmw==
Date: Thu, 5 Mar 2026 13:18:33 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore v0.6.0 now available
Message-ID: <20260305-stimulating-observant-coati-9e12da@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Korgalore v0.6.0 is now available with a new subscribe command, default target
selection, and numerous bug fixes improving reliability across shallow clones,
remote errors, and GUI configuration handling.

New features
------------

kgl subscribe command group:

A new command group for managing mailing list subscriptions from the command
line. Instead of manually editing configuration files, you can now add and
manage subscriptions directly:

    kgl subscribe https://lore.kernel.org/lkml/
    kgl subscribe list
    kgl subscribe pause lkml
    kgl subscribe resume lkml
    kgl subscribe stop lkml

The "add" subcommand is the default, so "kgl subscribe URL" works as a
shorthand. Subscriptions are stored as individual conf.d/sub-{feed_key}.toml
files, keeping them separate from the main configuration.

track-subsystem --list:

A new -L/--list flag displays all tracked subsystems, showing the subsystem
name, configuration file path, and delivery details (target and labels) for
each tracked subsystem.

Enhancements
------------

Default target selection:

When --target/-t is not specified, commands now use the first configured target
instead of aborting with an error. This applies to yank, track add, subscribe
add, and track-subsystem, matching the existing GNOME applet behaviour which
already pre-selects the first target in its dropdown.

If no targets are defined in the configuration at all, kgl now aborts early
with a helpful message pointing to the configuration file.

Bug fixes
---------
- Non-lore feed URLs no longer create invalid directory paths; URLs are now
  sanitised by stripping the scheme and replacing special characters.
- track-subsystem no longer crashes when a lei query matches no messages.
- Cached is_empty_repo() check avoids redundant git subprocesses.
- Public-inbox commits that carry no message file (rm/purge commits) are now
  detected and treated as successful no-ops, instead of being retried
  indefinitely as delivery failures.
- Remote server errors (e.g. 503) are now logged as one-line warnings instead
  of full tracebacks, and a failure on one feed no longer aborts updates to the
  remaining feeds.
- New commit discovery no longer fails on shallow clones; the --ancestry-path
  flag has been removed from rev-list since public-inbox v2 epochs have linear
  history.
- Legacy migration no longer crashes when the git directory has no epoch repos
  (e.g. from an interrupted clone).
- Delivery state is now initialised immediately after the first feed clone,
  instead of wasting one full pull cycle.
- kgl pull no longer crashes after kgl track add due to a tuple size mismatch
  in tracked thread deliveries.
- Git error messages now include stderr output and exit codes.
- Shallow clone failure for dormant lists is handled by falling back to
  --depth=1 when the time-based shallow clone fails.
- GUI startup error for missing GTK dependencies is now shown before
  stdout/stderr are redirected, and pipx environments get a pipx-specific
  install command.
- GUI now automatically detects and reloads configuration files changed on
  disk before each sync cycle, preventing crashes from stale in-memory
  configuration.

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Install via pipx:

    pipx install korgalore

Thanks to the following people for suggestions and reports addressed in this
release:

- Ard Biesheuvel
- Borislav Petkov
- Dirk Behme
- Krzysztof Kozlowski
- Mark Brown
- Vlastimil Babka

-K

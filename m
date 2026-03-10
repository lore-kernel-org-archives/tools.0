Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97292BD00C
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169753; cv=none; b=DIXK7FlozJTlvtLaDBPlYu3VnEk9oaPYhFGf/Jr5flBwlJArejLkD9hdI/KWxDN4xUV0NyDDhVvprOSu11mLPKgVBGUqFKzdM9Y5h6hPxp2TV9QHdeRz7JXl9W1loeUkmGW+2Fr7/XPSSYCAoTb56jbMNoQZA4Uuq8DxWwvTlnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169753; c=relaxed/simple;
	bh=pS4HEBY9XuaUJvLu5qSHCnXEVS5fqqb7kih1R4ZzKEI=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ioKaEYMvJSktxk6x1jqW+yNOLEPM4JWCjeAmBzNUixMQJx12OGyNw5l+d+TH+s5LHaaL4LZWub8S+NSRq6bJ01mtjq1HqpGBMuzspITXQhNE7uY2no0LAkBJHbVj+ZRR4gvio95W4EYOvI0cmgtI5ILAjecAZGNKMGw6w9Jujo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ4tp39M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ4tp39M"
Received: by smtp.kernel.org (Postfix)
	id 90A6FC2BC87; Tue, 10 Mar 2026 19:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D78C19423;
	Tue, 10 Mar 2026 19:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169753;
	bh=pS4HEBY9XuaUJvLu5qSHCnXEVS5fqqb7kih1R4ZzKEI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MZ4tp39MCLGRyOK/lCZ5EZt1U9/Mjja3YqTnF2aw4GzvEwp/FE9Gy2Bbr26bEpJP8
	 Up2ljRWAUWKQ9X4ew11IRYagBGg7rqgVe96oZdXmaopqhWNBSZ3j6NkKH36Ad7z+9T
	 un5TJdprXyK/V05z+6cAQFKx3n2vZi6jDvAxSFJoyc+GyKZv/i/0JJBn2g7eFXLMCO
	 UlDi6cWAIyvipdttEt0Azo+fycrRkLVdETyaMZP3J701Ya1m2Kh/5RwpoWqUi7BU0I
	 Pc/1Pv215s6qJWPJs7RSZjd6uHDOF2CLwZH6/imyr4nC94q49IHKPtNbp8cubsdCuv
	 SwdIv9yIsY/XQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42EE13808200;
	Tue, 10 Mar 2026 19:09:11 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: broonie@kernel.org, tools@kernel.org, konstantin@linuxfoundation.org
Message-ID: <20260310-b38491bec3-dea49b25af83@git.kernel.org>
In-Reply-To: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>
References: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>
Subject: Re: b4 review handling when base can't be guessed
X-Git-Bug-Id: 38491be4ab034615182c75f1f9a86389c5126cdbca07726bcf8ad608ed097851
X-Mailer: bugspray 0.1-dev
Date: Tue, 10 Mar 2026 19:09:11 +0000 (UTC)

Konstantin Ryabitsev writes in commit 9189f0b31a20311748625d0f2f88afbcbc41f4e4:

Add base selection, attestation display, and take confirmation to review TUI

When the base of a series can't be guessed, the review TUI previously
offered no way to specify an alternative base without quitting and
manually checking out a different branch. This was reported by Mark
Brown (bug 38491be).

Improve the review tracking TUI with several interrelated features that
give maintainers better control and visibility during patch review.

Base commit selection: add BaseSelectionScreen modal that lets
maintainers select or override the base commit when checking out a
series for review. The screen tests patch applicability at the chosen
base and shows the resolved SHA on success. A reusable WorkerScreen
modal provides a loading indicator for running callables in worker
threads.

Attestation display: add a checkmark column (A) to the series listing
that shows green when all patches have valid DKIM/patatt signatures.
The details pane shows per-attestor breakdown after the From line.
Schema v5 adds an attestation column to the tracking database, and
check_series_attestation() checks signatures during update and
checkout, storing per-attestor results (signed/nokey/badsig).

Take confirmation: add TakeConfirmScreen as a final step in the take
flow that test-applies patches before executing. This gives maintainers
a chance to back out if the series will not apply cleanly to the target
branch. Ctrl-y is now the confirmation key consistently across all take
flow screens (TakeScreen, CherryPickScreen, TakeConfirmScreen).

Keybinding changes: split the update keybinding so that u updates only
the selected series while U updates all tracked series, with proper
footer grouping. Cursor position is preserved after update operations.

Key changes:
- BaseSelectionScreen with test-apply and resolved SHA display
- WorkerScreen reusable modal for worker thread callables
- Schema v5 migration for attestation column
- check_series_attestation() and _format_attestation() helpers
- TakeConfirmScreen with pre-take applicability check
- u/U keybinding split with cursor preservation
- Documentation updated for all new features
- 27 new tests for attestation and formatting

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://msgid.link/092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk # 38491be
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


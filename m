Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B568387350
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841801; cv=none; b=YNwLbzAo86NRePvlregw6xLDC+6rIiVJGnWZjppcMzKyqk3aLeSSK11qj3tPhqf1cW+J/jRWMx8hhQvtHR+c/nNBalpnPsFWFWxDlCffUsKWHkdlJ9907vWDcAgr5UzBExVmwiKY+/0LMB3ekhYCUSRZRuKGx3RtO15OG5V+5bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841801; c=relaxed/simple;
	bh=+pMOPDgl7YQ2jYOrz2ZM+yrEEvZaUihitvD0N17hh4s=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=JHfvvQA3jXho2OdQpDoKYJoErZPnpnyNRr7iYHKh4/z+hy6N8FhWon+ybIIg72I4BZTQvczBC/3i/eA8JeJljgWxzaJI6wjhZ/rHWvXTiw5cmTNiVf5gmXfx7kV8VRSO5f7QlssWRleQBfCCbz8mUpJ3hihwEOzdVvcBkX5tjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHfcN9Ej; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHfcN9Ej"
Received: by smtp.kernel.org (Postfix)
	id CE0ECC4AF0C; Wed, 18 Mar 2026 13:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CB2C19421;
	Wed, 18 Mar 2026 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841800;
	bh=+pMOPDgl7YQ2jYOrz2ZM+yrEEvZaUihitvD0N17hh4s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eHfcN9Ejev8sbIRwb9ANgXFyh0pYMar3g53LxDuWuauaFlX2oVAiBpp8eVcq//0p6
	 2gtEAxJG3Qv0MqDYT2ruyOOnb5EsYoT5MVMjRDZT+03ISgXCn3XUsR61oIYf3NWFTF
	 slg0TcLvoFrR7V5ysRGsil59OOXs9umC9r62xMa/5ZBFge+GwI4rVsPt465HPnMmiY
	 AmF0KRV13ohmwKXCG0chPrz+TmHaSFsHOn2BA3gV+wA9RXJ5ibV8MzZtbg1L4AinlY
	 lrkQb5PMn8qbQwxsbNHO1AlzVx2dS5k2Ow1TkMJLPR7fsm5PFZN9qsPKzUQeR5m2TO
	 X4YA1sUz6nPaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7FC003808200;
	Wed, 18 Mar 2026 13:49:53 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: mricon@kernel.org, tools@kernel.org, broonie@kernel.org
Message-ID: <20260318-b4a2fb75c2-7ac9eb879be3@git.kernel.org>
In-Reply-To: <069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk>
References: <069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk>
Subject: Re: b4 review handing of rebasing issues for new versions
X-Git-Bug-Id: 4a2fb759cfc2f44cbf9e652089fcce2386dceacf2f3df3fc93445e09cbc6c98d
X-Mailer: bugspray 0.1-dev
Date: Wed, 18 Mar 2026 13:49:53 +0000 (UTC)

Konstantin Ryabitsev writes in commit fed4cd88f9dc9b7370fcdb292aa27ecf40626635:

review: do not re-promote waiting series for already-known versions

When a newer version of a series fails to apply and the maintainer
puts the series back into waiting, the next update cycle would
immediately wake it up again because the (broken) version is still
newer than the checked-out revision. Fix this by comparing discovered
versions against what was already known in the revisions database
before this update cycle, rather than against the applied revision.

This means a waiting series is only promoted when a genuinely new
version appears — one that was not already recorded in the database.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://msgid.link/069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk # 4a2fb75
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6-20250904

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


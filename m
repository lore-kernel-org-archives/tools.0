Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F723D8124
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685163; cv=none; b=elqX5k+k8mxYzOhG4FT8MrEKv0CAfcb5+7WhV4CDsJC74I3QUNiMN0qPzjVegQwvzKcShPVFBaHAr5seQmCqAPRLz71AQ8Ijb8pFknxA1fVDQmzNRN2oO6sO7Gxgp2VvGnGvNyxtk00Bp8IqhGivdJ+z//mS9UWJhd+rf4k+9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685163; c=relaxed/simple;
	bh=tFVWICphP6wEqMQITPgqemXIVkgWQSLG5h4IEmNRPyk=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=GC4/zbVawWSFXxvhM3S9J8CNQJ1B8pagzT65xvROo0Lu1txrmAZn/jXyCpUt4FUO1UurA7JwK/PduIUx5vdFTYHRmF5mi8RBhPNIVnir/VMaLLnlOF3ppoRUVS5lAQp1qF9u3WnqOZrnLyh+79w6W5e52wpuvJ2aFLPP7+Q56r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuzOa5XT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuzOa5XT"
Received: by smtp.kernel.org (Postfix)
	id 8B9F6C2BCAF; Mon, 16 Mar 2026 18:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EB0C2BC87;
	Mon, 16 Mar 2026 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773685163;
	bh=tFVWICphP6wEqMQITPgqemXIVkgWQSLG5h4IEmNRPyk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IuzOa5XTuak6pzHZ14zSJDu7NgTMPuuOV43KanerRcBiSO3yQ/Zn9Fioelw66zPT6
	 uuhBZM6EkwpC2TeCve+VhTFe57Pc1n2UER724Nv6OApm5EYN1GizEd8OgRpX1aYyge
	 1fpmTfmi1Tl75proZzKYQUNR8uWza268uBNER+qk2rM2LDjKjp2BmKzktVe2muNvyB
	 ToH5W+TAPsHPGjrWVAENAyYQp7U0d7c4s2KGZM+r/MuaR0C+Y66fb+qTAjxtq1gF5y
	 N49jURy1Isq8K+hAgWCG7kecSeYNdPqMYGpFLkXAkNKxAL6mTgKycP4qHjR4CXlI5G
	 Mt1X44XbjJCug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7FD9A3808200;
	Mon, 16 Mar 2026 18:19:17 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: broonie@kernel.org, konstantin@linuxfoundation.org, tools@kernel.org
Message-ID: <20260316-b2294e57c2-11bdae01d784@git.kernel.org>
In-Reply-To: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
References: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
Subject: Re: b4 dig not finding commits due to alternate sender emails
X-Git-Bug-Id: 2294e57541dec0d11c1b7f3180cbfa6c99c96f317431397405859c7a775742f0
X-Mailer: bugspray 0.1-dev
Date: Mon, 16 Mar 2026 18:19:17 +0000 (UTC)

Konstantin Ryabitsev writes in commit c43341f9442fd3d315302de9d8c99eb7b6928838:

dig: search for in-body From when author email doesn't match

When a patch is sent from a different email address than the one
recorded in the commit (e.g. personal gmail vs. corporate address),
the author+email search fails to find the patch on lore. Add a
fallback that searches for the in-body "From:" line that git-am
writes when the envelope sender differs from the patch author.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://msgid.link/aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk # 2294e57
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


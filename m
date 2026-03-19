Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4F3FE346;
	Thu, 19 Mar 2026 21:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773956340; cv=none; b=d4Pp5c15Th8jeGncXNpJIRWkcworhLlVuuh/mu+hnu+NbAMSf5z2X2+3rmZ1SOMpwqAJU5snzqmM+1nfG09Spp19gl2q9AFDpIH9tLywNprddRC9+tobb6OZsGR4b6GqhWcWzplxB9MdEE6eptA1XGiNtLK1usTcM43xpRW3Axo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773956340; c=relaxed/simple;
	bh=cZFhWpmTq3GndIXHZyaYH98xkeyzZb9ww5qEVWABkS8=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=vDDbyZYXgOoc+R3frSSAQ78dYPiOBV9sYuaLrZB3Ke0CM4Bcs8IKmYOY968hmlInq5LRblHEcsXaMCm+DKoFccdN6gfpolP/BezUuInXKg4f15Oh7GuOTK5lOpFz8pOvihFQAIK3yyv20aHFm1Aem7c/x51tFtDRcrJyhl6/AFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzozfodR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzozfodR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F019C19424;
	Thu, 19 Mar 2026 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773956339;
	bh=cZFhWpmTq3GndIXHZyaYH98xkeyzZb9ww5qEVWABkS8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GzozfodR/3y1uz+zVXX22eNM5mt5RuFjvKHTxUeIGNL1dV9socmn5ZMclUQhFU3Ak
	 OOByS4gMcwZFm8MAzp5gi2JhlV/MweL2APGoo1bMdl+lo9edBh75HWY1NFgkVmV9SU
	 N/T+zejm953DSN/RIQF8NbmcxstMZvLmLC4Qm0INZT3x//gJJd84JzS8NEtxwjHvuu
	 QqNdi7MKAMbiO45DOjZ5e2zd1j/TcL1lt4aXkUXMG5wF/q0QKX6h4FPCZTXO4Jn32n
	 kZF0wpE0s4FFAGRGMhtyTYFznJtw1ZJ3DJsSiVJXGPhNLQKRckJX5QESTZL0wGn940
	 rZEzwKiX76KkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42B4039302FD;
	Thu, 19 Mar 2026 21:38:51 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org, toke@redhat.com, 
 users@linux.kernel.org
Message-ID: <20260319-b73df66cc6-5ca5125a64ff@git.kernel.org>
In-Reply-To: <87ttdkrylx.fsf@toke.dk>
References: <87ttdkrylx.fsf@toke.dk>
Subject: Re: b4 feature request: run command before rewriting history
X-Git-Bug-Id: 73df66c98d8604ebb266e80cb6226df2a251802d645579214b7128deb548ccf7
X-Mailer: bugspray 0.1-dev
Date: Thu, 19 Mar 2026 21:38:51 +0000 (UTC)

Konstantin Ryabitsev writes in commit bc6c4d853c7eace3b7f325cbd17dfe2d67760fb7:

prep: add pre/post history-rewrite hooks

Add two new configuration keys, prep-pre-rewrite-hook and
prep-post-rewrite-hook, that let users run a command before and after
any b4 operation that rewrites history on a prep branch.

The pre-hook runs before the rewrite and aborts the operation if it
exits non-zero.  The post-hook runs after a successful rewrite; a
non-zero exit is logged as a warning but does not undo anything.

The primary use case is Stacked Git: users can set
prep-pre-rewrite-hook to "stg commit --all" so that StGit's internal
state is cleared before b4 modifies the branch, and
prep-post-rewrite-hook to "stg repair" to re-sync afterwards.

Hooks are called around git-filter-repo runs in run_frf(), which
covers all history rewrites on existing prep branches: cover letter
updates, trailer updates, and reroll cover rewrites.

Key changes:
- New run_rewrite_hook() helper in ez.py
- Instrumented run_frf() with pre/post hooks around frf.run()
- Added 6 unit tests for the hook mechanism
- Documented both config keys in docs/config.rst

Suggested-by: Toke Høiland-Jørgensen <toke@toke.dk>
Closes: https://msgid.link/87ttdkrylx.fsf@toke.dk # 73df66c
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


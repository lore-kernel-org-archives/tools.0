Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A62C80
	for <tools@linux.kernel.org>; Mon, 13 Dec 2021 22:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8A7C34605;
	Mon, 13 Dec 2021 22:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639434604;
	bh=57nEu43jmXUPVomzZA0Iaq0EaW76mFa7tCfX3rhN6o4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RXKE0ZmTMUMif1udoPI/f97JaTDBvUiNi/G1CZbgjUmcY2DCE5eqCJ7OU2TLHu8LA
	 U01lLmjWo4/wen5pHddq4b25badLz+0/oPm+fiVuJ7zK7O9EtvVJ85bcGz70G6gM0L
	 2DP73qY05TPjIgrU7USxjWp+Kpeih0Tn3C5Rcg/s=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
In-Reply-To: <20211201001126.4106635-1-keescook@chromium.org>
References: <20211201001126.4106635-1-keescook@chromium.org>
Subject: Re: [PATCH 0/5] patchwork-bot: Use worktrees for repos
Message-Id: <163943460451.66209.15259767684450096453.b4-ty@linuxfoundation.org>
Date: Mon, 13 Dec 2021 17:30:04 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 30 Nov 2021 16:11:21 -0800, Kees Cook wrote:
> To use patchwork-bot locally, I wanted to use my existing worktrees for
> various repos. This makes a few small improvements and then adds logic
> to deal with specifying branchs and operating in worktrees.
> 
> Thanks!
> 
> -Kees
> 
> [...]

Applied, thanks!

[1/5] patchwork-bot: Note which actions are part of "housekeeping"
      commit: bba5718890cbc3704528c028e104dde197d4c49c
[2/5] patchwork-bot: Create CACHEDIR if it is missing
      commit: e2dc648b93b77e45fde736ecbff8d0080fca41ff
[3/5] patchwork-bot: Allow limiting heads to single branch
      commit: 36971ee3ad62a56f40c3663a82b7475151df2a77
[4/5] patchwork-bot: Handle repo being a worktree
      commit: 460990bdca13805f7e9b5d6c8037437f655bcfac
[5/5] patchwork-bot: Allow initial database to skip recent commits
      commit: 6fc2e91a876b0a2771eedb0fe6106d7f47eb8aab

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

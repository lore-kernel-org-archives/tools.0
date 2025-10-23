Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023A17C21C
	for <tools@linux.kernel.org>; Thu, 23 Oct 2025 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761251442; cv=none; b=WUUySz57AJcBabeu5KCDbo+pKnxCslMstUReUo7lfnyylKH32OmaVUglEvSZAbbanoV3ItvqlDsxD7Hig7q9EKBb+AWb5ms91Ze+5uXiSbfG0Ce+w0ZGEu5T4YGwVFinw9FdctnrK5BEefGH4RHxlmLU8ut35k99Q2tgKtiMosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761251442; c=relaxed/simple;
	bh=kqhG53pd/W5u52vLRheMkkSXg1V6IE3YZkmbG8Rjblo=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=sOO+rXrTvOE1IC7JYMPPJ+mmQrMaNWW8ZPHyPNQwlBoHu0aXrJ3MeGLMJu81+4bJ3lBFv6B9rmUTmt+M6gaFt0DUxEDc26F2MD89M49e/BbT2gg6KKYmA7B6LelJyRBFH/mREtQHZf2hO/WemCbPN6nTw2UeLkvmdLO6OP71YQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmTkkK7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmTkkK7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4C9C4CEE7;
	Thu, 23 Oct 2025 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761251442;
	bh=kqhG53pd/W5u52vLRheMkkSXg1V6IE3YZkmbG8Rjblo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TmTkkK7de2Z/61GhgaFEcWdVpdBNU9pKseQ19oiYn3XmqyYhBOdrkQC7+8PymfqRR
	 GSLLlrhplwVFGN+7T8vD8b5WNrJs7qx+4k2gvk4BIOSIc5VpDZr8znooGDyWM6dTIP
	 skO+LEl+0jabCU2YfzOzq0B2u+mdlHjz2KSBiQULxXV4U1SFonks1VRj8ouCqNrQNc
	 nBcScHPzqph3wF2J6NSN0xjC0hhhnNGgucHNdRwNvF5C5s7bsQblSNBZnCVV9TwvS0
	 PDJl86J28qoX7lgYEY4p4YoQSsanMpY+oARzGUMVRas8MlpBZf4OiP91zPY8i14gSM
	 7QsuluNmS0Ibg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A895E380A95E;
	Thu, 23 Oct 2025 20:30:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, tools@kernel.org, 
 konstantin@linuxfoundation.org, krzk@kernel.org
Message-ID: <20251023-b220695c5-5c28cb276534@bugzilla.kernel.org>
In-Reply-To: <ee6bab51-84cf-42c4-8ace-dd895f7d9318@kernel.org>
References: <ee6bab51-84cf-42c4-8ace-dd895f7d9318@kernel.org>
Subject: Re: b4 prep is affected by .mailmap entries
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 23 Oct 2025 20:30:23 +0000 (UTC)

Konstantin Ryabitsev writes in commit 509f56ff5c24e2ad48cd2621e54c67910ea19fc1:

ez: add --no-mailmap when limiting commits by committer

Following the principle of least surprise, new entries in .mailmap
should not affect the result of git log operations, at least not when
operating on prep-managed branches.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220695
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=509f56ff5c24)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


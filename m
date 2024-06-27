Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D977F15ECD1
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500425; cv=none; b=gFlgN6j5ScdXXta24QGDjNmWmXfQ+xOOxxuq1SlGA+JpbuantYAwcJlUiIE0bfktkqQuPcHWt+Nve3ikYT0cCLXuJhGYVmLz6uiWPrR0kjtDiyeXK9nWrH3y9RDmChZWfzVjxVpAbRTMEjNUBrGG+zC8ePow964+PHFmTH7UUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500425; c=relaxed/simple;
	bh=kEJCcTwI20QjKapHRZbTPLcYoqldb5nw2OeqF8Wt/ms=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ZcfuZHtQYBId8TY9a8B0q4HR0Xn4iu+9RfB+q5wHYE7/iRQopzKd7tGoc278tJo9Sgabi831sMLg8T3H+tWdAyORz/oboGntvADBLV2snZh9p2lA57ZgXlaKnU7r5D2RK75gcxMu7DEI/SnDojnwe3XZrsnDewVVtM6oJThl5cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIFKwWSr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIFKwWSr"
Received: by smtp.kernel.org (Postfix)
	id 9C940C32786; Thu, 27 Jun 2024 15:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D08EC2BBFC;
	Thu, 27 Jun 2024 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500425;
	bh=kEJCcTwI20QjKapHRZbTPLcYoqldb5nw2OeqF8Wt/ms=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=oIFKwWSrvuUyu2Wq5md07u09MZfTXZyEUSYkU2nEGk7W8A0SE+VwwENH5Jo1CUe6E
	 bgxun40fCqisCAMTzB+yv7toK1U20BVIoSPRq0Qy3YVN+orp9XPxRV9Wl5g5xhmRSx
	 lR6PszI4pYPENHRdG3vH0pd3S2KYXk3B5yoSLp/7Y28p6BjGdpW78ZtjAqbqyH3qc3
	 rjgGtSwrN33BEFfhN6grl31m/JeFnwjguTX87eNkwjS/SB78ZG3dttwsdTVV4Jlwrn
	 52krP9pBIuBkHFqiz2RGffMjo10qWiGt8YmdMg5GnnK8OOYMA05brUfQvUz3FZtimq
	 0tBrkAwRACc6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6922BC433A2;
	Thu, 27 Jun 2024 15:00:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: arnd@arndb.de, conor@kernel.org, tools@linux.kernel.org, 
 tools@kernel.org, konstantin@linuxfoundation.org
Message-ID: <20240627-b218995-35ff9500a3ca@bugzilla.kernel.org>
In-Reply-To: <20240627-unrest-rigid-c7bb9ac94bc7@spud>
References: <20240627-unrest-rigid-c7bb9ac94bc7@spud>
Subject: Re: patchwork & b4 failing to detect pull request
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 27 Jun 2024 15:00:25 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218995

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


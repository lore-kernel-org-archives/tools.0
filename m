Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC004158A3A
	for <tools@linux.kernel.org>; Thu,  9 May 2024 13:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715262624; cv=none; b=p83Wi8/3Dq+8C5XzOmRjNZVxxoDqIsjkBX43M8fbc4I/P817mH3uRxT8vVpva1dQ8xnU9pcP6HcwqGd2YTGKwq54YVr1RWDbvVENvFvgpfB3LSfDatc2eygbGN6PJdt3ItXQqGyZbzvVhE4wpxAeO3Nkw6aFtGtkS4S2FC0r+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715262624; c=relaxed/simple;
	bh=PskKKIab8kjjfgo+U9yc8Ax0ejXizDyUyaJv7LMjZXQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=fV4eYD6sQKK8Ds0zihShUnVtemcqJt0Lgg0ZiJ3xyf8YWSDvzcmeEr93Ka8undAczNL02lsvhmU/AXZFx0gNjMXNJUeKZNZPUQidAffUMcGVDTgRAvcSJEAnSp+pQNuFv7lcTS1AK3vg8ftUIGUEA3OiW8w10lWi3mGGuk7yOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk5mJvoH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk5mJvoH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80D27C116B1;
	Thu,  9 May 2024 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715262624;
	bh=PskKKIab8kjjfgo+U9yc8Ax0ejXizDyUyaJv7LMjZXQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bk5mJvoHA32gnLbUTBPmwxI2kknvxAbGw0i/4S0Pp8k0s2qKrIEfu31v5Fe0d6Fiz
	 AEciRKbW+SlPMMFch0tmX3uo5ueZI1FnHiJG6WBAiLJYp2p5deN31XEw+dh2Jo12ug
	 03qzezGHcB+2+pTq1nanNgSZ1CiKPTkoeMBE9FiYr5YzX1RJ1+xlKsq5yGvKmJKKWN
	 wnCDOuPk+LaSYyaIw1gC3bz5Fd8OqIwuw4OoLFyDFFKgUv2zTB1yh0DGY5UxftPd9o
	 GOwl/B8eJSmQC7/sSkHqdSL6SSMzkc0HvyOHeUPcsQZc+pE02b6QSlzsvwYHBM4eNB
	 PG81deKHEikKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C1D4E7C0E0;
	Thu,  9 May 2024 13:50:24 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, tools@linux.kernel.org, tools@kernel.org
Message-ID: <20240509-b218824-6eaaf012683e@bugzilla.kernel.org>
In-Reply-To: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
Subject: Re: b4 shazam not stripping ---
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu,  9 May 2024 13:50:24 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218824

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


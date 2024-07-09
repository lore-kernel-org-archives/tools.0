Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22816BFB0
	for <tools@linux.kernel.org>; Tue,  9 Jul 2024 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720548428; cv=none; b=BS6clZboCognE0fgaTUpv/FvSdwVNwjU0YkR4hy83+g0d13Z6VJH8NZRaaSJSRDYIIDIK1x2+fXHDNeKiRqOj4vsXo1JHUQd3eJDWhIiEs2UuILGAA3rKKb/mHNVMknr8li8C2kyhQeWfVb1s58MuZlEXm6pFcLW1j5eAu12NI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720548428; c=relaxed/simple;
	bh=QLrxFm8ynBqcZOyJZ78qLtVO8wtBkxPXCPNHaVejLfQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=mLcMIG4bblOLfMcPUEbofymlJsL2CxWp4ahWOAnQnQA5ZxMynahkEklvLQRpkk9sQyUvjWnI2lt98P72dFmlmBSW0D/VJQiNsVE1vMdVhDnBBi0CvwCxJgjs0ZWdHi97xvYPUeui2Pnis8y84hjgjaM6ri0qgRzOm/U/UKkbm3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4MqTe2L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4MqTe2L"
Received: by smtp.kernel.org (Postfix)
	id 82486C32786; Tue,  9 Jul 2024 18:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA5F6C3277B;
	Tue,  9 Jul 2024 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720548428;
	bh=QLrxFm8ynBqcZOyJZ78qLtVO8wtBkxPXCPNHaVejLfQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=o4MqTe2LOa/Ex22hKRfjc/+q1H1VQ4xgbNjAy27XR38s/Y1wpWlwfEKyELwT2K+qG
	 tX1N1AsInPt3nhtjnVO6PvjgYqihXZkUelajKknce5zgRwbF2ubmPRRuOBtkJmIVrY
	 wzDCp7JM4ExBn/ggyVxEvw94ouAbgiyXKJ1e2UvbppiRY7bSxHU/hz1Tl15rjXFAdb
	 dQBfGgU9iQduCPj/zMjD+GHRZDaLzhNFz624C+2Dm/tl0KTdzOghVx3WO+LZ0Vriuy
	 PE4xxBGiLpSs73zkDCXzTIfAWKQpozrdjeohWGMOB8bAIAr9QasqtllAVxbzS1fA8l
	 +IfqIr3eCNs7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9893EC43468;
	Tue,  9 Jul 2024 18:07:01 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@kernel.org, andrew.cooper3@citrix.com, tools@linux.kernel.org
Message-ID: <20240709-b219021-bf44bd07a438@bugzilla.kernel.org>
In-Reply-To: <475803b5-3cc3-4da9-94b8-c2ec648d0c35@citrix.com>
References: <475803b5-3cc3-4da9-94b8-c2ec648d0c35@citrix.com>
Subject: Re: b4 shazam --single-message still grabs the full series
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Tue,  9 Jul 2024 18:07:01 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219021

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


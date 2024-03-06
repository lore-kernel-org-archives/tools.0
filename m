Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774C713172D
	for <tools@linux.kernel.org>; Wed,  6 Mar 2024 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745023; cv=none; b=UQCt4ujU7MiMgYZwUTtXmnmSbbYDXPHDnE53IDtJeeWdZqqnwOKC8VamYULf5uYAU6/dw6bW/SbuahmYeLIL4D3TfpC5ylD87gEJEm3e+4hFGGP26rlPuksSf/9s6c6y8wuBz+19FihflY1AEMAPtbqRHD9QXR5eRYuL+rUZ9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745023; c=relaxed/simple;
	bh=x2VPQKCrUGzwvSQFnIg9P0B2FYUJzLwembq7TedbA6o=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=X5NZVZx9bHrEX1pgktjG5AhdBBZ1luQ7IedIO1KihU6v9WtfgE9QGieLPPqrzFJ3RnmuJY6mALU3GxWEFDSv/1rFn8RXCx2DSCRDIsDgSQ6Yr5W0+NkW/IodeGsSB3WuqSJ5vJZDPhs5sBxv4MGGtgol05I7xT0IW9+V5/FoU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdH3H7JJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdH3H7JJ"
Received: by smtp.kernel.org (Postfix)
	id 3587AC43394; Wed,  6 Mar 2024 17:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19488C433C7;
	Wed,  6 Mar 2024 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709745023;
	bh=x2VPQKCrUGzwvSQFnIg9P0B2FYUJzLwembq7TedbA6o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HdH3H7JJHELPSGHhEtKnoTe3ahzsWyv8aRXkR54h6y9VP4gyWc5LWEwbdgcEtOp41
	 jtKpbpdka0Te5N/mJ9sJWViDUJaDO5QczCoTv1roz5mDpJSxB5cyPsJxLcVI5Jyuyd
	 IDkQTz/QlAxxmUX2LOCtYUpR+CZaMd3LO6ZXLv00CcD9AT9E+h1XMLP1TWMIIdL5F3
	 k5jkt35jx68pxpyOBLZd1dEtpwtIRctkN2kYdBiLvb6b4jxnWdlf36/k3gitvJXNiG
	 33jiDm4eAKsNgJUohl+znum3zKkaMsphrKbCxOjUkhoHZAGh9sOAGj5tyNJa86I/wO
	 YBEy28Jl65sSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6D7AD9A4B5;
	Wed,  6 Mar 2024 17:10:22 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, tools@kernel.org, tools@linux.kernel.org
Message-ID: <20240306-b218567-930ba42cd30c@bugzilla.kernel.org>
In-Reply-To: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>
References: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>
Subject: Re: b4 DKIM checks
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed,  6 Mar 2024 17:10:22 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218567

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


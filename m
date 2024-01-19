Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACD157302
	for <tools@linux.kernel.org>; Fri, 19 Jan 2024 21:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705699532; cv=none; b=KGwz6aB/ULp6acpUibMPODAJMxJQi2ONL7nzf38rdn5BeBZ0H/w1VdHAMu2YEz/BAaRfzS8HYINXb19Jgq4yiB1O8mr2FiN+EKfDbDSQ3JyM+941igJvcuyEkxLk8SOh4Faswlu3DXl/cwVYyXHf2P9CClRzLhRp5VG8hQMMSxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705699532; c=relaxed/simple;
	bh=6NTlN8UPbNngtYoX0GPeZQEDJeioplqh5hP8Bmypois=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=EMGiP8KLPTLi4SXEiDGrX00bBkyZQX0oEcfj1M60pttG06RH/qX1G2QrPkkSltfpbO/ajz/3FBx2NNn93dIhoOu+ynZUIV7Gyob46GjosjmeKKPrGLREkzWKeWi8o/KgNkJ+Y+4uc3Zft7wam7TPvyTnfqUop2cF7cqFwAxv3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=On3QhVg0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="On3QhVg0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F19EC433C7;
	Fri, 19 Jan 2024 21:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705699531;
	bh=6NTlN8UPbNngtYoX0GPeZQEDJeioplqh5hP8Bmypois=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=On3QhVg0KA/R/zRDzH09wrlRpbmkdx/+txY1tUe1buPgkSAGrjQrgxEjU2rTdDT17
	 +5FJnTVBum8yqPxbILLUfK/XrvKH2dggxIDV/Wje2XHa0VGwLEVLyHpyhj75x29feI
	 Y7qetQGkZ3/K6lNhrj46ODn7OK2c14G8a0Z9gUrK0cFhuQ4Swla2+b0m3/wcMyiVkJ
	 Ms2fN/YHFzro4RPZt15QqmO5vyEQu9CKxiP0D1os6mJl2UJddcamWgeK41+cQK60ng
	 hbDSwYvAsW1Llsuv/DmXMG6txscorJZ38bOlHSCfQ7ZzG1Zf2ilH1s11iJO5YMRUwQ
	 vAgDI/mYkOyWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 75A86D8C96C;
	Fri, 19 Jan 2024 21:25:31 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, tools@linux.kernel.org, 
 broonie@kernel.org
Message-ID: <20240119-b218400-ca81cf4b546b@bugzilla.kernel.org>
In-Reply-To: <39a94633-fde4-4060-9c9e-de7d5a92a6bb@sirena.org.uk>
References: <39a94633-fde4-4060-9c9e-de7d5a92a6bb@sirena.org.uk>
Subject: Re: Restricting trailers to update for b4 trailers --update
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 19 Jan 2024 21:25:31 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218400

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


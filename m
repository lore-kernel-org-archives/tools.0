Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB213AC6
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 17:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85916C433C0;
	Fri, 16 Jun 2023 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686934853;
	bh=RlUJ7N+YCS2dwJQZDdmiDEAess9BgYHVSxvSys646oE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HYpPYgP0LN/QM7FC9MqzaaNb1HsE8zTqU7EZYjxSEJX/ADO7y0/c4boPGoALXjIYG
	 AmBfBijDXqvDfxqk1IKoLnpMJysAisPVxOzzFUB3xgQm0UGnMhcwNbBgPDV4Ew4R9n
	 EhN63oVCl/DHxW0jLu8fuytfh6wigm7EClCD7wHVrkJnY+OQom+NFueWa/E3rLUv1c
	 vZha3SOhGGyQfvNS5jIoHIpMml2niauRMYzkMuLwiLof9dlvIhu9z0dZWulFNZzAtV
	 yaS7wbRrf9Rq+G4jt6Ps/8tWceBEJQKc3H7KV9RBgAmqI+FHPU6aZgDTRMC0gtcjZs
	 uRZJM+9NYPAGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6E95DC395E0;
	Fri, 16 Jun 2023 17:00:53 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: erik.schilling@linaro.org, tools@linux.kernel.org
Message-ID: <20230616-b217564-6be2d6c0ceb7@bugzilla.kernel.org>
In-Reply-To: <CTDVYQ01B09D.1FUED4Y6IQUKI@fedora>
References: <CTDVYQ01B09D.1FUED4Y6IQUKI@fedora>
Subject: Re: resending drops previously configured prefixes
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 16 Jun 2023 17:00:53 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217564

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


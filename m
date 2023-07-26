Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E94CE9C
	for <tools@linux.kernel.org>; Wed, 26 Jul 2023 19:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFDCEC433C8;
	Wed, 26 Jul 2023 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690401260;
	bh=rK2/qCfA5Nva9UIrk+5Urqi3T/Cj9g324BNXjEP+6Jw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=s206ovkZJAN3q+4BdQjBnV/yt46qu9R+hFlUl5/wr9/hk1DhJLt8xOnb/2xez5F6t
	 6HywdgOxIktc788ZFDV95JwUjd5ZCDqqnVkkjSlBv2lObHtCYHjNB9aLp5dz4VeCVL
	 VOyZYYaetrHB8SdpKYChUJh3BJHFikoWmHu1xioaOpjvrevvAB5ww7Xz2YxW/Y7qdK
	 VdM1ddwPTDh6dGjNgLjqh/QtUX/kgm1eUtGCPBsEA/7PFhWOQbfGvHrcs8rIDALw87
	 /ObxV4lzAPGI/rvMeQ21BDChbWrZOaHWZeLEmvXuVdihZUjlqJ9CfKjEqOAc3nBr8T
	 Z8E+jp3Xk3ZEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1134C41672;
	Wed, 26 Jul 2023 19:54:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: duje.mihanovic@skole.hr, tools@linux.kernel.org
Message-ID: <20230726-b217713-e86698d4567e@bugzilla.kernel.org>
In-Reply-To: <1940519.PYKUYFuaPT@radijator>
References: <1940519.PYKUYFuaPT@radijator>
Subject: Re: Encoding issues with --auto-to-cc
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 26 Jul 2023 19:54:19 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217713

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


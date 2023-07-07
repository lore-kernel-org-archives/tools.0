Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F723C5;
	Fri,  7 Jul 2023 16:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB815C433CB;
	Fri,  7 Jul 2023 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688747966;
	bh=ZdI6b5+XQy2zBX4BkNBMFhFYHFAp7v8I9Dwg0J2tJ4E=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=W5jtJy25ZFkAMd1Nzub1EjMTA/xDZbfVpnp0sMUoizqPu0cv+5dUV73Rbrj2KxDVz
	 rBbTIUqLvHt1ua9dMfS/x2KG+TOEsTNod1mm4EGg+ACIb5DUp+xfK0+G6/hlXAU/rv
	 2q966P3jBjeNg/mOVpmDX4HkWP12ibsxQUPETjlLyY3lT+C7t8MySPriAw6JAz8XVE
	 q9tdrlv8k+PEoCzPfFnqsZv15UloCYFTuVxcx7VE6+T+yr4Euokwxi+TWhU990ZYgV
	 /fXe5Y3Rt2djh0+bhNN64cHX8iyl+i7vvk9PLemzPb4nJ/vv3CiVP4gOD/wME7pCoe
	 spqJa8d3nH3rA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF1F4E537FC;
	Fri,  7 Jul 2023 16:39:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, erik.schilling@linaro.org, tools@linux.kernel.org
Message-ID: <20230707-b217642-33a623d001fa@bugzilla.kernel.org>
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Subject: Re: Allow sending prefixes before [PATCH]
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Fri,  7 Jul 2023 16:39:25 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217642

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


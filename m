Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDBF2101
	for <tools@linux.kernel.org>; Wed, 12 Jul 2023 18:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B504C433C7;
	Wed, 12 Jul 2023 18:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187166;
	bh=0uFksQUjuP67JMSgb33zpXhrxIn0o2BhcvFABNdvtdU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=emXlQTP22mcFw8fKKRQjioFAUen9j3pSjedtFrf496oJq10toR+eubwxQMpVJhgkR
	 6R4O3Xo3htQKJv3QTObdQYyMZLw50TGsXEZDF916JD3eqsc3ilNQiQDNgWQEy8mou+
	 isswdwvY1vG6cC3rEHudn/JWjf0mufg4fY0ZnSC1nZobODHjKqYD6lNy2Jo+UX4HQj
	 32i4HaQDPn1q+NuLujl9WTgMgVg0elwFy/SE9ZUNthMj8Ntm063QdV2FpBOafMSXsA
	 PLTfNAjA0VF6uZ0ZncmJYtf2xPRV8nqAKnOazGk0T7fusYZQKbmKndTqITMLIZNemn
	 khA1SkNu/ANCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26B39C4167B;
	Wed, 12 Jul 2023 18:39:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: brauner@kernel.org, tools@linux.kernel.org
Message-ID: <20230712-b217668-f4308c800e03@bugzilla.kernel.org>
In-Reply-To: <20230711-berechenbar-bordstein-b22e1f7f9835@brauner>
References: <20230711-berechenbar-bordstein-b22e1f7f9835@brauner>
Subject: Re: Picking up changed commit subjects when generating thank you
 messages & patch list generation
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 12 Jul 2023 18:39:26 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217668

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F33D2E4
	for <tools@linux.kernel.org>; Wed, 19 Apr 2023 20:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BBE8C433EF;
	Wed, 19 Apr 2023 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681935310;
	bh=MqR8xdV3hIW/Egm+Bfmvz4983Ly37RIIFym14n/Zk8k=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bgnw+O5+iS/pDUhGnMJqDQGqmUjbV6f9z/67fg3uD8HWyaLgYgZ/mAKOKgavIXNfp
	 +gHU0gNaBMt8Q6xXlxGwH/gcG4Btj0qKFMCkLGfN3HU3FpZ+RHtItkBDbxf4SWQxy/
	 6F8nAdAgqUmCZUSDf83J6CCSXBukA4eJxEUtbvvfcbe/xDKI/373Hd5Y1nV5fcI/5L
	 LXlXovDsbIviMa1JGwrhwfNpgieSP+Q0QWIxEr9+SUe6M8A46p2E8JptemCeySKaLQ
	 Q8vVVAcFJO4nHXXic32SALE+9mfeTbVZBqRJlowEKthGuXMW4Os3eN0y7lkpJ5tfSR
	 76sLR8q/D3dwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DEFCFE4D033;
	Wed, 19 Apr 2023 20:15:09 +0000 (UTC)
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
Message-ID: <20230419-b217331c4-c2555d67abe3@bugzilla.kernel.org>
In-Reply-To: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
References: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
Subject: Re: b4 trailers --update splats on new branch
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 19 Apr 2023 20:15:09 +0000 (UTC)

Konstantin Ryabitsev writes in commit bfdf5b3b0835c8c351abbcd9b3b5268acf6545fa:

ez: better fix for "no follow-up trailers" condition

Previous fix for bug 217331 didn't properly handle the situation when
trailers were sent to the cover letter, so implement a better fix.

Fixes: 00e423af1a (ez-trailers: don't crash when there are no follow-ups received)
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217331
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=bfdf5b3b0835)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


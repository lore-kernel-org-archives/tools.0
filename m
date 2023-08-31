Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B138F57
	for <tools@linux.kernel.org>; Thu, 31 Aug 2023 20:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DADEC433C7;
	Thu, 31 Aug 2023 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693513928;
	bh=6YeVEPv9h6FSZ2TmHc4O7TDhFCbMZ3G7InNiWTu4DwU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JnPB25TPQnmkBuXBAXG0Db25JGaxSM/yOWV5ZT3f+PWTSk/ksSGQ92K5BP1r4OWvT
	 KwGSWX2/6qSfVNF/cMFy8klotJO1g3Hx3R+fGzyLjedQSN5CGf8f5N9ClQ7sRlNoWA
	 ORfiKIhOtZlWvSOmYne07gUintJjebPIfZ94EQVRH5AIWsAUAqB0p9ikca0qQ4JKbk
	 DRefjrk1vJrtu7TUBnqK5OX2PxrCU4FR+f7P/ciW4t/lwdOYNwGDFWV0iwcYBAL5VJ
	 hy7AdjFc9pTAcjpFHjomRSOgaDCEtunjt4K7dQhpoT9vVdIM7K6kujHqZ9cFTrVimU
	 HMVBccAF2NhlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3494FE270FB;
	Thu, 31 Aug 2023 20:32:08 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, tools@linux.kernel.org
Message-ID: <20230831-b217852-3ef20a1de150@bugzilla.kernel.org>
In-Reply-To: <c9643b70-8751-a2a2-185e-174ec2560328@citrix.com>
References: <c9643b70-8751-a2a2-185e-174ec2560328@citrix.com>
Subject: Re: b4 patch corruption
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 31 Aug 2023 20:32:08 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217852

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


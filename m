Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CE1B908
	for <tools@linux.kernel.org>; Wed, 21 Jun 2023 20:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDC33C433C0;
	Wed, 21 Jun 2023 20:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687378127;
	bh=LEZSUElCYQtjW043clxU4p40aBPNtqo7Y2GI58tfxiM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=J0i1pOARuPIqxdmQa18ePzlfHsnsMBxbIkSpzrPffAswty1lUYAFVwprKACaZxA/2
	 ptf2C0EYgW08dC07BidGQRw/mXPCKKo1hCws1y22RcsIGMPJlgJZBNctOuGCmI/c0G
	 YzEDiQZGBIfye3jtck+ZYR8BY9lYsHWvnOZNqCXc8g5sEiqpSA2npejDM8wIo9aOT+
	 9orEjAcYSSEQdJgeZoMKPVhN8dNVVq+ZZStofJ31kbIS/ofVltyOJokyGwzYjC0n3f
	 78I6vQPovrPK86flB1qwzXZkf8ZexxOjqvQoUEoL9Bpe43Q87mOIt1TnlqYwvE1hXN
	 6JKhUJnCaupLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BAF41C395C7;
	Wed, 21 Jun 2023 20:08:47 +0000 (UTC)
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
 brauner@kernel.org
Message-ID: <20230621-b217359c2-0d1b295fac4e@bugzilla.kernel.org>
In-Reply-To: <20230331-ranged-decrease-6027cce938ff@brauner>
References: <20230331-ranged-decrease-6027cce938ff@brauner>
Subject: Re: b4: individual patch series should have the latest timestamp
 in the message-id
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 21 Jun 2023 20:08:47 +0000 (UTC)

Konstantin Ryabitsev writes in commit 377e02fe2bcd16946b821d3ec2c384192523ee75:

ez: make message-ids use today's date

When creating the message-id of the series to be sent, we're reusing the
change-id, which includes the origin date when that change-id was first
created. Change this to today's date in order to be more conforming to
how git-send-email does it.

Suggested-by: Christian Brauner <brauner@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217359
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=377e02fe2bcd)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


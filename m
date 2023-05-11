Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9348653
	for <tools@linux.kernel.org>; Thu, 11 May 2023 16:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 480C2C433D2;
	Thu, 11 May 2023 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683821388;
	bh=OJxXnvAVwrfXlwBBJAbrc8f9Q/wgCuPnx4E3e1fl5+0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eZbPPe5FHcYCjBy1ut5Pv2XdPOLDbSHn1vcyufY9UzM5777YG6uuwhphXU2bJ2QJa
	 vg6SlLcnhPOlCm+b3tWz3DYYj75TYZsBXb/OS0ectUGCEc/Iu4YbOBqslWmgYhijcS
	 nTz3wWA8VH9T8vy6+wJaeAsnGpfoQdl4Q74tXSh6+R1ELb6E6VVDzf6s7JYpaY0S2W
	 5odSY0luo7+cw2+CA1zwynWXr8Z6U72tSYU9r76eX469P4DmCVKk3CjLvtpmwMltZt
	 0zmn20muV1CoRp944YcnWHnBOosvK149WVqLoZ5rK20Yrc0sA3Yp/CylgAQZIoHOPZ
	 aA1mByskLXYCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29DEAE26D4C;
	Thu, 11 May 2023 16:09:48 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, tools@linux.kernel.org, jgrall@amazon.com
Message-ID: <20230511-b217430-477121df33e7@bugzilla.kernel.org>
In-Reply-To: <a512454c-2bd6-fd20-dff0-5ec19c8f85a9@citrix.com>
References: <a512454c-2bd6-fd20-dff0-5ec19c8f85a9@citrix.com>
Subject: Re: b4 am/shazam tag accumulation with HTML-ish emails
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 11 May 2023 16:09:48 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217430

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


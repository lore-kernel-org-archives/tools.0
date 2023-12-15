Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CA130127
	for <tools@linux.kernel.org>; Fri, 15 Dec 2023 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bna9O8pR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B3BAC433C8;
	Fri, 15 Dec 2023 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702668023;
	bh=awcrkUrjV6G91qZBe94eltDkUEOmpVmnjOa0ar8+cpo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Bna9O8pROzEE+TI8L0j+E/6SxUMQjMff2FoiQrikLxJ+7PWKrPsTfepdK0VWHIqGl
	 KfbUpHAbcpVhoaEtzgQv+9BlTSIc/BgxCLIfVVZ/5V+1ZjnpjGO8c2OY+oSsswnS46
	 PQQ9N+CRdrQB14PaVXRpLVSmNpVy+N4xiGwkAoxurwZExd4P9qk0kCjOsdy1PbRu4I
	 0svAahov7n4UvuDIPsA0f1qjxH18HI1Bf/fUKCugj0wtdbF0lUpEvjagM5VySl0g4m
	 GPx0YAB5XNhygeWhc/1X4M0TkbKBgURDEIUMTFSfuYLV/vwI7rN9W5cOI1vGQmuwxY
	 V2qUKXKJYO6MA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 233A0C4314C;
	Fri, 15 Dec 2023 19:20:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: vbabka@suse.cz, tools@linux.kernel.org
Message-ID: <20231215-b218272-7eb770cda267@bugzilla.kernel.org>
In-Reply-To: <34582e34-5b62-ab86-682d-dac555e90330@suse.cz>
References: <34582e34-5b62-ab86-682d-dac555e90330@suse.cz>
Subject: Re: b4 send suggestion: handle .git_aliases
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 15 Dec 2023 19:20:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218272

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


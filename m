Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000A2EAE1
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3ByZQ3j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 580EBC433C7;
	Fri, 22 Dec 2023 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703277320;
	bh=F5LNxcfTzDV2q4ghyvT4tChzktGzee1bzOSC2iJvIu0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=I3ByZQ3jIVOZGXp9zVndue0YR0CPkm1GJhxh/tXRUmscftbNPlCmP4wTJxmiIOVBP
	 iQlk+rPwF8f1fwjFU3rzj1u/GSxsOL3mpPuQoOUnP/uBh70FLw0z+ci9pPX+eiSaWZ
	 7oixv9uOVp4+7dze07gH7bV+ufpOiY6NZIfxsR8Pnfdniegf6WHonWo9n9knZPYDpR
	 CRdauaaFx9hFkB1n5RcXVW382sHxTlozzRjS8ndTTki+0Fw4rNZhGxoj4z7YEkNiaM
	 O3Aeops2m0tQOy3WaXxwmPc/YdDEdxvSNOnllIHZSQ75pm4jnQhqDYA9iCFrPda5nT
	 JB675Tbg/U46w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B85CC41620;
	Fri, 22 Dec 2023 20:35:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: mpdesouza@suse.com, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20231222-b218302-82ebbc7ea595@bugzilla.kernel.org>
In-Reply-To: <20231222-horned-caiman-of-freedom-3fec0a@lemur>
References: <20231222-horned-caiman-of-freedom-3fec0a@lemur>
Subject: Re: [PATCH RESEND v4 0/3] livepatch: Move modules to selftests and
 add a new test
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 22 Dec 2023 20:35:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218302

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


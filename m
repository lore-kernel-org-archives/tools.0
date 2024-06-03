Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7407582D8E
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717426525; cv=none; b=H3qDfgYwCian34gCHyt1VHcUpMWMCXcNif1R7oTQc5IuujoNoGowLrQN6tYZCYWfWwEewSUsu8Y4vww4iAwxkeOtBZLmOVYS2lyygKeNELMzF3/nzJo4Bc6C4vfvbqXc00THTqThmo7BXrlBNftJrdN/2sskOiw0/GyfSMnpGRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717426525; c=relaxed/simple;
	bh=52SviDeVAXg/8CL2lUpzXGvDNqnvYBzcy66G2A94yB0=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ONw7pZtk07kJGL8hZu9HWv6J+HIDJ99PZLOd3aw5RHPltnxlv7hVF/+UWzr2DFfvVLK4zuKBoDU9kKcFWTESLeEJFNcAXoQNjUUu6IIUhu78O+tX5y4EDnAPdkTu5EMYMpazYgfxndwDCjoLnvAjblzYKltBQiaPfrt8i1/Ex1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPEqHNHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPEqHNHV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 055A2C2BD10;
	Mon,  3 Jun 2024 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717426524;
	bh=52SviDeVAXg/8CL2lUpzXGvDNqnvYBzcy66G2A94yB0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IPEqHNHVIxKOR4lAnFQCofkQYzneSNFLRlDqXC9FivJvOUwDWG8ANtOYOigk+c1Ba
	 6axFJHlgikFfU4aW+4wObpIKqT1PMgXzibxQFd97f8lP67OMpdngWuz5VONst7v+R8
	 IvcPS2zoghhtgsdZu5H8ouSDQ8hrGcgQWxmnSf80bzLYjG26dUMMb7oVHEf9+/IFvA
	 bLqputJPHUFJ9p1ifbJm3cDOTmL/dbe0UZj5DpyQY0uKsD9fOR5TDvhVA3epMPf9F+
	 nWUJjK4QmxvDXxzHkSsxBTLtG35g3Z2lbSnvIaLxhqe5yHvs3eUk/puBhaAD5uiX5I
	 W4V612Oa1MedA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E3485C4361C;
	Mon,  3 Jun 2024 14:55:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, broonie@kernel.org, 
 tools@linux.kernel.org
Message-ID: <20240603-b218933c2-614cc0fe68ee@bugzilla.kernel.org>
In-Reply-To: <dcbebe7e-5e01-4559-8bf9-37a0749177d2@sirena.org.uk>
References: <dcbebe7e-5e01-4559-8bf9-37a0749177d2@sirena.org.uk>
Subject: Re: Thread breaking behaviour for non-patch messages
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon,  3 Jun 2024 14:55:23 +0000 (UTC)

Konstantin Ryabitsev writes in commit d47074144878a7e027e20c90d00159d2e35bd9d1:

Improve auto-noparenting logic to require a diff/diffstat

This is a partial fix for the reported problem -- we still need to be
able to retrieve the full thread in mbox mode, even if we're pointing at
a standalone patch in the middle of a thread. The auto-noparenting
should be specific to the am mode. That said, with this change, this
will likely behave as expected in the vast majority of situations.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218933
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=d47074144878)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


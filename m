Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882E322A
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725640517; cv=none; b=QgiRarFb+AMhRRiG/x0UhHF7qy9pgTFv1Pb+A8tlYGynIDqUGNe9ZXbycYvQTTkgzVAty3nr7zJpmhNH4VjYmVNJknUg0HiTYCrzxVFn7BtsU7LKZ+f7/dHOxKU5bBg/GQdPz7gZNKYE10KEIdnucCVlynFNCbzuoZmeO+vo18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725640517; c=relaxed/simple;
	bh=2O7Aec+aQ2uqbK/IdX6qlNDWpNwC2xR3rXlJV2xgSH4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=uYaFGCnFUh0qZ68Iqxv+hLFjcH3kZAa4LHNR+dSyUFXxx3HXWaQsLOI9aiw+rFZF+MFzup45E6F1w/KeoCRacd2lXiLugg4utAfIoMpaa3RBxs9J1PHXbvQEsexPX9a2TMtIIqeZM+ik9Zj0l89DVBRYwzcRGv8gz6aoI8o9Gp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+V+PKTZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+V+PKTZ"
Received: by smtp.kernel.org (Postfix)
	id 10BB1C4CEC6; Fri,  6 Sep 2024 16:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA94DC4CEC4;
	Fri,  6 Sep 2024 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725640517;
	bh=2O7Aec+aQ2uqbK/IdX6qlNDWpNwC2xR3rXlJV2xgSH4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=N+V+PKTZTLneOQUNZqil6yV87JkDBVQ3fEN0W6ymkxaaxG6L1/2ET+EhhJuN4fI1V
	 UfaCnU7cXO/5bhaFuHjlueaX3r2EGRcAw2RcCFH/VDWgXKomyIvLCpPkP+xQNTtCOn
	 t1tsSg3WPB1Rdy6Jjbnl1pIH40WZgTo/OOqWLK6/E5Up8KL7ixaWm2MTScCoHI8HYA
	 aaLJwRS0gQpt0TRUkRHP+YH6jkSRIPSxwL+Jh+PvaA2qlK6BI9JM9C9MuSgVVCSh85
	 VrPUV3JeNur4YOY1qDsWkzJi6XJPdYFmiJYJHFak++gLxq/bZKT7yYfnGyjMTy7GHO
	 Hb+TYOVxn79+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F01E83806644;
	Fri,  6 Sep 2024 16:35:18 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, tools@kernel.org, khilman@baylibre.com
Message-ID: <20240906-b219163c2-9ae5886026d7@bugzilla.kernel.org>
In-Reply-To: <7h4j7y32gk.fsf@baylibre.com>
References: <7h4j7y32gk.fsf@baylibre.com>
Subject: Re: b4: prerequisite patch-ids generated in wrong order
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Sep 2024 16:35:18 +0000 (UTC)

Konstantin Ryabitsev writes in commit cb14d1fdbd054988773234624906ff39d8a6311e:

ez: fix prereq expanding for series specified by message-id

When we retrieve a thread from lore, the messages in it can be in an
arbitrary order. Make a LoreSeries() out of them first to make sure that
we always output prerequisite-patch-ids in the correct sequence.

Reported-by: Kevin Hilman <khilman@baylibre.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219163
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=cb14d1fdbd05)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


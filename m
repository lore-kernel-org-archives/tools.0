Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E641F03C5
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760477135; cv=none; b=TXYygDmi4t4l0z3RYxJG6aPnkFJ47pjhRXM3GuyTV8z1m6eujkecuJIZlE85OAZp5xWhCn+q5pCEH8r9/vuhsPEgh+TKSyXkVcrMjzTnJrXxRkBbLScrmOKnbIRII8QRw0bdu7/5I8fNjsL7uL5ta33TLs8KMYb+oJ5cxKE1AXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760477135; c=relaxed/simple;
	bh=4kyoclODB28dOBCnmdgiehZF5X4FPJb9zmuVH8+RKDA=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UquofzBe1U76KkaFSwtv8z0nqREOc8DcaAVDLtIpZb1q0vkon3N9LhTyyeQznq1vR28e7d9wqEsRxT10PsGQsCiAApK8GkU3uHybgQdOxKLUHc6qZo5hFZEc+umGjjOv1C+RTvOgUSaYHPl4dWuxxpoDh4k7EaOuNIDLsZab92g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpHokdKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpHokdKb"
Received: by smtp.kernel.org (Postfix)
	id 14973C116D0; Tue, 14 Oct 2025 21:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC60C4CEF1;
	Tue, 14 Oct 2025 21:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760477135;
	bh=4kyoclODB28dOBCnmdgiehZF5X4FPJb9zmuVH8+RKDA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MpHokdKbb5D0JjTnzy9v94RwmVMWE1j5hzQfyud84JDnp8iXr7Ss7imND8aoh22yZ
	 mGYj5UtoQaOAvVpioAMsGMPNW3h856AiMK0NgAcCfXcaqtHX0PJKVJAF/K67nCR5Ke
	 StbO1FncN/jm1389tkzhL5DDI6bpAw8ZoEY5SX2WaQCJS8HXl9d952joUIk+6GGcqj
	 k6yqqIjuwBKPvWyiELw3IImT4boebisAlsUEGxwUG2dS8ZsuNMTbbOOQMzdW5VqpFJ
	 ZU2knbXEG+FvMtYXm79Dq74sYVR2fPGIi8MZWrj1nRDiTmoklncZo9C2o+CI/ir+hw
	 w5XUugjPBRehg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37D76380AAF2;
	Tue, 14 Oct 2025 21:25:21 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, konstantin@linuxfoundation.org, geert@linux-m68k.org, 
 users@kernel.org
Message-ID: <20251014-b220661-13d840784179@bugzilla.kernel.org>
In-Reply-To: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
References: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
Subject: Re: b4 am no longer prints file name
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Tue, 14 Oct 2025 21:25:21 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220661

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


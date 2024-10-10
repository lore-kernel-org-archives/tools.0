Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B41BBBFC
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567928; cv=none; b=BALZmDnsAfKWl+8+7AIsWI1Fg2pxQoXKdKeEBrIgoMVXBO47b87eaq9q4dfK4aDuDT7jx19coqxkamI4hYAxj7h2iQz3nyP/0gD3NRt6D+Eg/47IX20jfpixE37VbcXFYVUBF6IOAlMtEN1bDomZ8Tv/l5LDJaCizsjVPGcOo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567928; c=relaxed/simple;
	bh=wPKx06kf1bgLokctI7PYBgZ//TPd6srej1CPOelQSYc=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=fcLWyNR0TrVbYaonYBEK44UI4kzlUikjKEauI54dAYhYZo22rDo0kyQHitPCuOLfzO6KfoRXPFWkSfrcixicELsKEhd7raHZqcXIn9SPs3ROpuHm9ZLLqgoFRrLKTKc9yHKlBn9FQd5doHmmGf8LbwspyGWNiby9DNfasktuUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtBppNqQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtBppNqQ"
Received: by smtp.kernel.org (Postfix)
	id D469EC4CECF; Thu, 10 Oct 2024 13:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49F7C4CEC5;
	Thu, 10 Oct 2024 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728567926;
	bh=wPKx06kf1bgLokctI7PYBgZ//TPd6srej1CPOelQSYc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UtBppNqQBH9xCBRsOaajlGk46jhJZ0U9G223P/rNobHQ9+JX7weMFxPfyW7Na3o7Q
	 VilHaeoZwy12XOQmEdM87hbRJD2rCmOJAK98cbazAEMG/QyHWUzd6eEsjV8xnThss6
	 OFrskCz0niV89QnLOGd1FZRWIZKIXyxxqh/weIoMWaYn+vV9ORH9kCZQtWEMldf837
	 hBLRCAZzs7keqsZPA096hdkUz7h14Bs/6XcBwJwnoXqQezA/3uVrvgDJ2k1lxZNCkn
	 o71zqHWngCEdqP3L49Br2Gjqh+uJC0H2u+QFcJZCHMrtX0Jx7uTZmZo0zTPFbjZCzZ
	 xycQ5w9lMAHPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A57F3803263;
	Thu, 10 Oct 2024 13:45:32 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: christian@heusel.eu, tools@kernel.org
Message-ID: <20241010-b219374-7e06a26f67bd@bugzilla.kernel.org>
In-Reply-To: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
References: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
Subject: Re: b4 crashes due to type error when signing with gpg key
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 10 Oct 2024 13:45:32 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219374

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


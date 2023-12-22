Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5BF2EAE9
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJ9EUyA9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59FF7C433C7;
	Fri, 22 Dec 2023 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703277631;
	bh=07FNvSfZXgiqDIZlQryK553qbjI2chf7fqNhzk94IA8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LJ9EUyA9/C0a6pxiQbRqMCLyoIQkAO4TOjdpexs21O4ByJIXqofJ9ssUIXmFPEw9M
	 OVmX2kfbAfIbjP5i4ROoHBuR5t94VU/4R701PQk//Qs0Og4+U2pUhSCi66Ssrhc1Wi
	 RV3apO2sqsQDgNC63hqLY/Me7olFZ3BxgIbP6Ebj1wqtkQ2FDdSrozu0EqniqwyXyf
	 1jkADE3bIpLJToJUCRgpzgDlgkhV0Xr+Rm+bpmXmQujQi/Azenk+WsD4pibYN/kumH
	 FsrWyKQGhfyDiBbSRRSetBxcCEGHeRn37SEXn0a0/hf0k4gE+kwf7fJopkcS4sOmGA
	 3CtLxqZIj5mnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40D93DD4EE0;
	Fri, 22 Dec 2023 20:40:31 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: mpdesouza@suse.com, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org
Message-ID: <20231222-b218302c5-d6e268c23183@bugzilla.kernel.org>
In-Reply-To: <20231222-horned-caiman-of-freedom-3fec0a@lemur>
References: <20231222-horned-caiman-of-freedom-3fec0a@lemur>
Subject: Re: b4: implement send --dry-run-to ADDR [ADDR ...]
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 22 Dec 2023 20:40:31 +0000 (UTC)

Konstantin Ryabitsev writes in commit 4e03211130d5afbf26297bee8b549013fc30e6fc:

ez: implement send --dry-run-to

Sometimes it is useful to be able to send the series out to someone for
a quick one-over review (e.g. to your mentor, boss, colleague) before
actually sending it out to the actual maintainers.

It is now possible to do so with:

    b4 send --dry-run-to addr@example.com

This will not trigger a tag-and-reroll and will include a DRYRUN into
the patch prefixes to clearly indicate that it's not the final
submission that should be used for review.

Suggested-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Link: https://lore.kernel.org/f5c38763b4d42cfafdaac24d83ec18b81dfc073a.camel@suse.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218302
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=4e03211130d5)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


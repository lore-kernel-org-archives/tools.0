Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA832C8E
	for <tools@linux.kernel.org>; Mon,  5 Feb 2024 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707153326; cv=none; b=UmUjkJC0ivuMKGfQghPQhYonVnM9XpJqKvvpLUrEp2sWDzj0VzvlEasFEL2qtRHN/4ibSzZdYt051LF0IYXLXz5PGrsagS1bs5TL17HVynqXLQ3cUpW9tYqGmlkpCQuu1vt6Be1eR+2pTNjE3HKZbMcWeMkuX6Dpx1QhLce1frg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707153326; c=relaxed/simple;
	bh=ZH06u6VeJsvLkP33r6EGDJo3FrcfJvP154VwO4qoFsY=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=B1H2VRGN4gE4S01BvSSTfOleU7uJK3jiD2UR6AScV2RrhSpUFWLAB9QwHD5LZ7chGoZ0pShzeY4Yl45tvlH219zRt9nuE4IOkveP1FuR8h5xIs9Qc2i/8ejQekiq6ApMeve6dTOrvEWKkjU3cX/DhgOv8pMJZN5xxd+mE97RKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjbBWiTB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjbBWiTB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E56CC433C7;
	Mon,  5 Feb 2024 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707153326;
	bh=ZH06u6VeJsvLkP33r6EGDJo3FrcfJvP154VwO4qoFsY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=YjbBWiTB2p0yRUxGm/YBMbp9SnqZjQrf89ekx5Auo9JaDnzOMacZ+vRTjHE8T25Ss
	 tRXcT268LACmCDz3XbDPkQ0g44hYk7UQwF8DHCMpUrzcI48Ae8j4+JdDqnuPtPv4KJ
	 fJ5092aMk6Kohl92yx3GlghS89Ubm0mmkUv8XOqgbhgfaVxQL9WuKxcolYjFyePevl
	 YWeg1HqnjgoHU2UuLpf03n9NXAgIwdIYXnlPv7LFaDQs2ze485M8At4H5H/RI3mR/e
	 wYl8ljPpi/Z+VC0BQS342RqQfudH6rbfSTF2J/a2mWDXHe4dmTqMIbSfXPtM3Gyb+Y
	 NOoDX8mQgdeVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 046CEE2F2ED;
	Mon,  5 Feb 2024 17:15:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, lkp@intel.com, lucas.demarchi@intel.com
Message-ID: <20240205-b218463-da743080207b@bugzilla.kernel.org>
In-Reply-To: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
References: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
Subject: Re: trailers update and bots
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon,  5 Feb 2024 17:15:25 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218463

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


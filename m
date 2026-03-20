Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED63D6CBA
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025578; cv=none; b=rDBGmaVdqHohXq6/41p03TpdSzNzLkEhFBu9Nnhci2ppRZs11GinQj2Sknz+L9kgsUT/h5kf2KqXflGiRC+NzWdTmwQ21/npvbuplMgJ21euGsM4veVf7xskB2fgPO/Z287FcPKWEC3olyd2r2fRaIN7W1y0A7otAr9iEEErQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025578; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=sfyKdY1OLnIxuD7sNqonxyGx7pocLmh0x9kUzAnAfLjZADYXoWYj4K3rDA8C/9lQU452sxQQD9KdyEf4EeYOdzsJYjxzJqyTBUyvtfSAOlvpyMKUtIAb8jGAN7B7eAOFzZQeVOYJILIoFPFGvVtT58ijElzHFAxYh7GsZcVOYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tL/BdYhn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tL/BdYhn"
Received: by smtp.kernel.org (Postfix)
	id 2D682C19425; Fri, 20 Mar 2026 16:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1736BC4CEF7;
	Fri, 20 Mar 2026 16:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025578;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tL/BdYhn7rhNU5b11sJUmxGN8v2RKosYPC0X7ZUDD7svZnGE/VBrxmK43B31gfJuD
	 3sz3jGNN5wl5yqinOQe5wew4l08xMMNzEL0eqxe+7sntmB0qY+/lgp35NRIsHaTir0
	 A2Vq2EwaKUuWoWnexs0F9u3/CrO7sXzD520RJj6/wL/TIOCetHzKyAusgzdJED6zk/
	 zpLnREZJjc2CS9hPD/frTKGpSKFKMR8WhmN/ACBBepmFe+9hZJ+2FphQjuuMQivJvR
	 Ztt/X+0gPwQJecKvMQhSntPc+DG4a6/8PoAoatYdL0G248v+0dzbJVNsL1pmy+xJuA
	 4zwS3tuDjWVCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7BBF5380820D;
	Fri, 20 Mar 2026 16:52:49 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: broonie@kernel.org, mricon@kernel.org, tools@kernel.org
Message-ID: <20260320-b47d5a4c-0c3148f63372@git.kernel.org>
In-Reply-To: <88549a4a-cc82-4200-b73b-e335cbb2b024@sirena.org.uk>
References: <88549a4a-cc82-4200-b73b-e335cbb2b024@sirena.org.uk>
Subject: Re: Series revision identification issue
X-Git-Bug-Id: 47d5a4c5015d25d13b7e4ea1180b06d75983bf79b6a233c5b040a6f597f27c1c
X-Mailer: bugspray 0.1-dev
Date: Fri, 20 Mar 2026 16:52:49 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


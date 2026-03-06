Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0892DC331
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 00:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757717; cv=none; b=exNpS133CeDoy6g5qXz/O5v0q7R6oym3KdrPfEnJ1X66OOk5E4+wvSyeo08n8lWwTq73Qcx+h8u9+oaBrbAIJ7P4/Xi+iHMtn0XKI/t/7xT4lx8qWcutvDwhvbrSHIGmzNF135pL+u3o9pRJ450ClFoOnUyhiOdsedbUEsdOp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757717; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=VbJ1ARv/AZfwdbBg28QqZdw3vi7qUASe5Xc6/KLCvjRstrYWhvL+N8KUcQG1PGvl/cW2cWWlpFBDuWOOuGcM0h282e7B/kx/DMjJvwgShG5O5/Mh5WjBa0q6d65X0oehyzA07K7qqmGtfU3CcrrIGpB2y80oFBkcLUbgFbJwdVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCBUT13Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCBUT13Q"
Received: by smtp.kernel.org (Postfix)
	id ECA24C2BC87; Fri,  6 Mar 2026 00:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D105DC116C6;
	Fri,  6 Mar 2026 00:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757716;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HCBUT13QVzI0qqoJ2T9IwTl0jfgjVZG/uKgDJvnbuz/AokEp6gJvHi9Ptwei8DtuG
	 3nRb+0jZUKS+6hyGR9qIdcNit3XxKELr21PtQp5MVay+lqrSqikxuojVu1Bb+M54Ct
	 gm623IGScc+b4x9Kr5LxZeVMxfME5/8xF371bkU9XUifXdoi7h2OwFAd5GMPu/dmO9
	 AgZXeeNQP2mnYoGK2sXE3G1C+A3A++5iOrT2/fS/aOmS/TvIxGAEPXnh3TD3sGWK7Z
	 5972lAdSpChiklzHOI0NqoDbuE3NL+QFchHHru6+2oMkKqrhYQXM36p6C5Vn2plru7
	 mIkMw+IQFLIrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCFDC3808200;
	Fri,  6 Mar 2026 00:41:57 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: thomas.petazzoni@bootlin.org, bugbot+b4@kernel.org, tools@kernel.org, 
 luca.ceresoli@bootlin.com, louis.chauvet@bootlin.org
Message-ID: <20260306-bb9c4cde-1b03ffdb5751@git.kernel.org>
In-Reply-To: <DFUF52RW81LD.28YE20HG4P0L1@bootlin.com>
References: <DFUF52RW81LD.28YE20HG4P0L1@bootlin.com>
Subject: Re: b4 shazam applies unrelated patches due to dfblob collision
 (b4 0.14.3)
X-Git-Bug-Id: b9c4cde20c7a10eb5783d72d25ac8b832b5d0810c0f3883da72dae33c02dd358
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 00:41:57 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


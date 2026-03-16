Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F151C2324
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683341; cv=none; b=VnICU1Jq8+X+4XFPbrCxByW7ryUAl73R4do9uKvDXiiJjd1JXBYe9MpA5I8JlAzs2nUywpzYBdzjUOyklHIB9yDYrJ9hN9x5j/2eTDoSy+s6CMIono2QRQcEqFqqwYQEltJ2JZVQUoqC2R8/B1Xazc7IkSs3ZG+WuYLYlLAtLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683341; c=relaxed/simple;
	bh=OV5PSYinO7E/pRPZW/R8Z5osPDBixJipUods773w00k=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=AFwhxE7QC3azLF3G7LFbbFGMSCwN9o1Sv2DjmB1HzhdGDQlByQSJeG2xlIg7ZgNtPbXjJSGeW5lQTwHWP2ddFSCKh//iR1Lf97qH28uM3VoG8t2AWglArkSURzDEfxUMkJUjHFYM/gX0/Vzl2GIftfeoHI1QGSETOE8UfN1EvKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmYzbRpy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmYzbRpy"
Received: by smtp.kernel.org (Postfix)
	id 17CF7C2BC87; Mon, 16 Mar 2026 17:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE712C19421;
	Mon, 16 Mar 2026 17:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683341;
	bh=OV5PSYinO7E/pRPZW/R8Z5osPDBixJipUods773w00k=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UmYzbRpyOYfu55ZrWImDgZYo4oYhvUF/XiorULcs5OCgRxSbmqCUduTksQFu2fYV5
	 WKFyD2JjFTENVQTao+YGl8thnILExqv72zxBJJixkXsaqr4iviW4D3qN5Cb6nXCY95
	 UEDzmutDma2wUA0JMI0wJOUyK9SZ4X5UMMxyrK9/4lbws9ciV4o0t+DX0IL7LTem22
	 CkMVVRGF0Fm5XCJDzxyKwRBj+VTVuxm9oF/DlAsPGUTA7rdTpglGivxR3jBDz8X+ta
	 y+GLpDFz0QUqio9WSAiS5uixarJojBBL/B4gTGAHmuM2/+rZCyedSfrKh3sFn6ws9F
	 V5WsutaboyHXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0635A3808200;
	Mon, 16 Mar 2026 17:48:55 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: luca.ceresoli@bootlin.com, louis.chauvet@bootlin.org, mricon@kernel.org, 
 thomas.petazzoni@bootlin.org, tools@kernel.org
Message-ID: <20260316-bb9c4cdec2-7d562b690fb1@git.kernel.org>
In-Reply-To: <DFUF52RW81LD.28YE20HG4P0L1@bootlin.com>
References: <DFUF52RW81LD.28YE20HG4P0L1@bootlin.com>
Subject: Re: b4 shazam applies unrelated patches due to dfblob collision
 (b4 0.14.3)
X-Git-Bug-Id: b9c4cde20c7a10eb5783d72d25ac8b832b5d0810c0f3883da72dae33c02dd358
X-Mailer: bugspray 0.1-dev
Date: Mon, 16 Mar 2026 17:48:55 +0000 (UTC)

Konstantin Ryabitsev writes in commit 8a652aeaaa90be4c26d7c2fb5cf899840c737ebd:

Fix get_extra_series pulling in unrelated prerequisite series

When searching for newer revisions by change-id, the nq: query on
lore can match messages that reference our change-id in a
prerequisite-change-id trailer rather than as their own change-id.
This causes get_extra_series to pull in entirely unrelated series,
which b4 then treats as the "latest revision" and tries to apply.

After collecting candidate messages from the search, validate that
each revision actually belongs to the same series by checking that
at least one message per revision contains a standalone change-id
line matching ours. Revisions that only reference the change-id as
a prerequisite are rejected.

This affects b4 shazam, b4 review, and b4 diff, which all use
get_extra_series for revision discovery.

Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Closes: https://lore.kernel.org/tools/DFUF52RW81LD.28YE20HG4P0L1@bootlin.com/ # b9c4cde
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


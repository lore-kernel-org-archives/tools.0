Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AEB3A5435
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377068; cv=none; b=U4pNermAt4dANK62fuVoaZzyK7kBxfL8Ma5f5af7gB1ysNbWrh1n8SVRWLdgx1/e0azoVdi+XaNPx82Q5Nebvz9ZxmAM7/0UjBHz8u8FyMyP5pF1QiRtVagZFMqTtNnnh7aCdGlRjkv1RwPpRH9rNRIKGoN6Ot0F4tzbyuPmn4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377068; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=k7RSgE+Ds1WCyUfA2x4SRSF8ghnySKyO+J0mxu4lCvpuusETedfx3t0A7ilcv0JO/sklBKdwxIKdC1glQY7IczX9lzn6gYlplf3IcIKmcvxhAXwzleuMQ7fpJLZPikLKqtZplI+w7YHa3h2YY5oWBvETog7LIeV1yf7Yc6dpu8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBBo6fpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBBo6fpm"
Received: by smtp.kernel.org (Postfix)
	id 6ADA9C2BCB2; Tue, 24 Mar 2026 18:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FBEC2BC9E;
	Tue, 24 Mar 2026 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774377068;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=nBBo6fpmXPeutsZ+qTeOxU22N5MTOzhv6wbhI+Iljl3KBXDYWH/+iaIVdLj1e4v0F
	 xpnIckmuQbISvZ0tDyRs+Lfok9yCLF5xKthKiuHyA/YGzwvzx0d/3CwTuJ+jnWNhlK
	 BJy8wUhFCrnkriWZDSb/A/BRnwM+wgus8gzPTxf/i37BSu8JM9a7xwjDgsOL3h3dpH
	 UwgQEOXfwUAxTmXNw0zsDcL0JV/S8THYWgX2Mr/sU6GKVzNTcU8MLmUNBqreA9MZ5j
	 jT+/LsVoKopfPUgAgHi+9LsXfD/sanuOKltkRAd6MzLaTnQNkJOD/Wol+hh7KPISii
	 psGFUL+KRebEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42A693808203;
	Tue, 24 Mar 2026 18:30:57 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: mricon@kernel.org, broonie@kernel.org, tools@kernel.org
Message-ID: <20260324-b8b2fcba-4d7e63c6b599@git.kernel.org>
In-Reply-To: <f4c4741d-0795-4e8f-abd3-420ab849dbdf@sirena.org.uk>
References: <f4c4741d-0795-4e8f-abd3-420ab849dbdf@sirena.org.uk>
Subject: Re: Clarity of pending sashiko reviews
X-Git-Bug-Id: 8b2fcbacaea82525eb47e5306c67b03e3970aee640fe2ec691b00b29ac2057ac
X-Mailer: bugspray 0.1-dev
Date: Tue, 24 Mar 2026 18:30:57 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


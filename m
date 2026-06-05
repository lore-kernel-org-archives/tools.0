Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00783932E4
	for <tools@linux.kernel.org>; Fri,  5 Jun 2026 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628861; cv=none; b=UfHmGGP4IvReSrRtG2dsZe2un0/ziZH18HgMd/XoaKKUE5uUm7UHvtWuXUAiNIQa73BD8Ny0W7iLf7n9OueBeR2y9grlHZv7INL12m/M3/w2Nt+j7Un6zqN4dLwq2DGHlkczZ6NpUQ0khTuSgsokgZFB86m72P2qNMAHqtEaLB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628861; c=relaxed/simple;
	bh=MQLqR1tsLBWjj9E1HDC80FlWI14UfM/ZWyloDTeSCck=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R6FyiW2S862/rZ2GZ8G+yR6nv9AyShtwXoaQiGYwgedTP4IfbTx+aQxk5SUHIONiBH/ezeo/wNXYncKFr+mYa3s3a/go9CL6BKudsiQsU3Fpja39YV6HqRSxm95YH9GQvSOcLwI+VurDJuVNXBKbHyHOa8wKuIJUg2PkW+kmZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTyt+HI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTyt+HI3"
Received: by smtp.kernel.org (Postfix)
	id 1DB331F00898; Fri,  5 Jun 2026 03:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91821F00893;
	Fri,  5 Jun 2026 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780628859;
	bh=kxsVcNpF2nMgSFum4I+7273LRuxE0YKk7bHuZCrsgvw=;
	h=Date:From:To:Subject;
	b=QTyt+HI3hS5qgh2SuLt4IZN5FNZRgdmYrUYjzEELcoYV2BOzogtnDHPt/nbE4K3Zr
	 yva86WbN7GIKVoh2SVtUmvieaR2hVxdFcQAL+6L8pvMwFgvSC5fgPlbRLOzzwBkDo/
	 qXR6w9uPzzTR4yTohpCcC/YjEWHssg91/DGMO3RiLh+UanV+8mAqI1bki1jkWJ3+8z
	 FNSbZY55MY8wTlcVSzAJdOza4BwUA28llmU017e/fDp6K6QK/H5a/Zh3n6cgduZ7Yw
	 Gy86/BQD1r2Im0DpBdt1jltE7le8dU8k6XkXKAQ7TXCglkY6S02FeMiJKy0HlrJWs5
	 XTp0mS4lIUUog==
Date: Thu, 4 Jun 2026 23:07:37 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: tools@kernel.org
Subject: b4 review -- biggest pain points?
Message-ID: <20260604-dangerous-bobcat-from-shambhala-97b022@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I finally have some cycles to get back to b4 development in a fuller
capacity, so I'd like to do the next iteration of b4 review and b4 bugs
features. I know some of you are using b4 review fairly regularly, while
others have tried once and decided it's not working for them.

What are the biggest pain points I should focus on? From my memory:

- I know Mark sent quite a few bug reports and from talking to him I know that
  huge series are problematic performance-wise.
- Replying and inline commenting still needs lots of polish, because it's
  deceptively like responding to email, but also not.
- Tracking series updates periodically gets wedged, but mostly with series
  that aren't using change-id's.
- I think series dependency tracking isn't working as intended, at least
  definitely not on rebased series.

What else am I missing?

-K

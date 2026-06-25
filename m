Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA081A9F87
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412488; cv=none; b=cVyWif/My+IZpErjMypqc7Ddx/NiawpXLUxP88Wmq2pP+7TjPsayqOA0BJyZO0UW/ksY8JF3iz6qICCg9JP9bj8ORBrOO4TYCbl6dw2+9mN/s71Iito6jNSApQo1gRBKg4+ugG14bA2h+18weXw+W4DrV96FDruzgfDI6U/Dwsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412488; c=relaxed/simple;
	bh=aABwxCVdsvFsFW7YyGpvIYUAihoTorRENhhQiRjo4mk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=c+dWptdODhLiDOoTZtbEIXQ9dZHOhRKyvvwUw3TFJGprDw4JJnp3iZBQpfOkyFh3RSn/vsvZffegZonsJh32riFMoowWUYMrdL6GjjXj74qLSRe7gbm8ETQ3RJh/jMVaeuMjoFPav+kYtvkojxdMkNCEYb4EeADf7tKOGRCVRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R8yOIaJV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R8yOIaJV"
Received: by smtp.kernel.org (Postfix)
	id AF3721F00A3A; Thu, 25 Jun 2026 18:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FE51F000E9;
	Thu, 25 Jun 2026 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782412487;
	bh=Clcl/L0+AuNZ0WABMPKZZ7YHfYKmC0lwbptZ1Qu5e9c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=R8yOIaJVYHSpRFP/bG2UYQ2p4AXefktSSHKQmI2lcV/Vi1PXx/ptVHnw6THIbZtfV
	 cFuA3qOwx3shWB1CBbTyuYG754OSmQPos9MhkggclXzpH3eNm5WylftkCNFInEBftH
	 05YGIYR82cj4zZGHJ++HaJUBAr1+ax6etk8ww8gI=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 0/2] review-tui: add a "cherry-pick + merge" take
 method
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
References: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
Date: Thu, 25 Jun 2026 18:34:24 +0000
Message-Id: <178241246473.56008.7989203027158709620.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=aABwxCVdsvFsFW7YyGpvIYUAihoTorRENhhQiRjo4mk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJsS7aIXcpffsLcgfHWrHB+f3Y5lYUTd8/zm/TG/bBoS
 qXy1MWPO0pZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzEqouRYe/LpLK9UzQPVT5e
 eGSS5aXdRQfOy2dU5c/75hq+zyCg6y3D/7ifN69Eqfn/6bnU9+zZlZ3vHTMjvq2PnLr4J/ehvrf
 XXdkA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> The review TUI's Take dialog can apply a series three ways: merge (a
> cover-letter merge commit of the whole series), linear (git am onto the
> target branch), or cherry-pick (pick a subset and git am it). It could
> not do the combination a maintainer often wants: take a hand-picked
> subset of a series *and* record it as a cover-letter merge commit -- the
> equivalent of "b4 shazam -M -P".

I don't have any specific objections to this series, especially since it
covers a workflow gap that is useful to you.

> That path was already half-wired. When some patches were marked skipped,
> the "merge" method fell through to the patch picker and merged just the
> non-skipped patches -- _do_take_merge already builds its mbox from a
> cherry-pick selection. But with nothing pre-skipped there was no way to
> ask for it: "merge" always took the whole series.

Yes, in my mind the skipping would have been done in the review app, but
if this speeds things up for a busy maintainer, then I'm happy to also
let this happen in the take process.

> ci.sh checkers (ruff format/check, ty) are clean on the changed sources,
> and the tui-tracking, tui-modals, tui-review, and three-way-merge suites
> pass (213 tests).

This phrasing looks familiar, so I do suggest that you add
"Assisted-by:" trailers when you rely on an LLM agent, if only for
stats-gathering reasons. :)

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

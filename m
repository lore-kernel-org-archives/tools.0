Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A135AC00
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782238597; cv=none; b=djt4T4R0vm+nPQBg9h/jqrqYi/6vQG2jXYfMhKsxRhE0btxTG5qSE6M27WG96GGo20OtJDPH4WAyihRdlgxrbPKcNDz2X4l+crdIW7EYySI0X5mgBwi7dyU/uXl6CF0Rj/z5i2CpVVUuSjmacFw1wZsyIlhhT3GPjo01HwmzanA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782238597; c=relaxed/simple;
	bh=2prC0jlSTcOnIlVLQ9xMmZUcKfyTQ7ezYrw3BCy3ACc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=m16Wi8g81ABAtLuzJ1c2u8MgO81kTuokQDyGlfZzfQXFJewvsL9mcwiMqXgCT/ogNW7+uawMdhlGgMk8v1QcW6AT9p5Bcu7Xpwc7nJLxOAKLSV8NJ+zGcVpco7S9WF45Z8lJs++pPU89hcXmtetmh5RcWtmps6uEa84Yy9CfGs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vtDgMfq/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vtDgMfq/"
Received: by smtp.kernel.org (Postfix)
	id 752FD1F00A3A; Tue, 23 Jun 2026 18:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FF51F000E9;
	Tue, 23 Jun 2026 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782238595;
	bh=9sCrTcTgSb9qV1QZbuYRtBgl2pPBziSAZlX0+oTSZlg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=vtDgMfq/LLdXVxsh2zphCWBRIaaQk3R5amK8J3RmWTTI6Meyhq4UDjHfD5FT/R1oU
	 RZ87WJj+mSqVFEioRLu+dhTldPh5vdM6nnZehz5UfWxxPob7mhzCb2aim0Ez4EWLrS
	 GgEhtwpRQczeoxU/ssxFrEG+02vFD6ltyVopNnhw=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/6] review-tui: worktree-aware takes, resolve
 take->merge conflicts in place
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
Date: Tue, 23 Jun 2026 18:16:26 +0000
Message-Id: <178223858665.1539887.18387233629212425068.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=2prC0jlSTcOnIlVLQ9xMmZUcKfyTQ7ezYrw3BCy3ACc=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKsztZdsvktZ7Fx/jttl32Xz/Q4i7K2zp3XLDNB4+3N3
 rey1esDO0pZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzkjjLDHz4b67LONZpyVS8u
 TL5/sDXCpq/k5KTG1etOBu+XzzZV9mb477FuQrfL3yNSCu+mlfqJ8Tprhqy9t1pZrvJXq4r/Ul5
 WXgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> b4 review's "take" action applies a reviewed series to a target branch by
> one of two methods: a merge (git merge) or a linear/cherry-pick apply (git
> am). Review is often driven from a different worktree than the one the
> series is applied into, and the target branch may be checked out in yet
> another worktree, so a take has to run wherever the target branch lives and
> never disturb the current checkout. This series makes both take methods do
> that correctly and teaches take->merge to resolve conflicts in place.

No objections to this at all, but I do want you to fix a few issues that
running ci.sh identifies (mypy errors).

I should plug this into .b4-config, really, but until I do that, can you
run ci.sh and ci-matrix.sh to make sure they are all green?

Thanks!
-K

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

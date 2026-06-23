Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE93B274652
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247706; cv=none; b=VCJQAh288+ZCk5bk/ZLlI6EaCY9DHEUg2PSKa1CMUMETh/obboI2bSPeD0ANC5VRvwNinYqSD8WmlaBZBzuK5Jqfj5WMv/0Pn2Tk5mC18kTjxaFiI5zy73ZRSAbd7fMBxP4U94Lfx3ZLuESM0JWG+uxFfWb/n5kly83onLiXlPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247706; c=relaxed/simple;
	bh=cwrBUX45+zmAzwjqwtpfGn2DNqZr5VlcdkxoY0M3EGc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GIqtpw9alktTLbgCYX5JvBn/mOXuun2snyixrs7Q/mXNuCz5j1peTF2wCPjrXM8ulYVPWebIn4mS0BbPwBlQtZ2POQf5vWRqrkCgV1w5E0sqJgK2vaXGPeX3/zG87e70G16FzXIqKs697oaTUxVHYNoHFZOFBKqxYgeIJhjhy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q7qZDmlJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q7qZDmlJ"
Received: by smtp.kernel.org (Postfix)
	id 938A01F00A3A; Tue, 23 Jun 2026 20:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508C01F000E9;
	Tue, 23 Jun 2026 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782247705;
	bh=JKFR31oGSjgAF57wI89NsycNaR9E4kiTfOErKDTl4CY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Q7qZDmlJuCNmPWcUcyvez0VhrORszUwmZpV/gsmQRXWWeZa2kezAq7kvM+EF3Lc41
	 VcOw1DhvmyMncUoULcjvCcfAhLCV9DLF41/6OS08V84zy4thUIQKF2dWSxfiDS4agQ
	 P9IFW6iwOS02PdOnDxcKUj28TpJjnMr9BJkNpKmw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
Subject: Re: [PATCH b4 v2 0/6] review-tui: worktree-aware takes, resolve
 take->merge conflicts in place
Message-Id: <178224769941.1625862.13364942135427385622.b4-ty@b4>
Date: Tue, 23 Jun 2026 20:48:19 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=mOv+xZ9xrAlbLQ1RXrcQ/+UGLtZ+75NmlmPQLI/7FtQ=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKsPkpo270KZb588/mFQz/mvBQ41qbSzfqwm2nyJOUHd
 +wnf7va3lHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAidhYM/92d1FXa9F95Je6Z
 phkucSNa+ZLKvgv6xbP7uvK/fg1UOs/wT11ij835QkHNgj8sVdsnTJPhjnG8xhN+48D1O5I7N1T
 rsAAA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 23 Jun 2026 22:34:16 +0200, Christian Brauner wrote:
> review-tui: worktree-aware takes, resolve take->merge conflicts in place
> 
> b4 review's "take" action applies a reviewed series to a target branch by
> one of two methods: a merge (git merge) or a linear/cherry-pick apply (git
> am). Review is often driven from a different worktree than the one the
> series is applied into, and the target branch may be checked out in yet
> another worktree, so a take has to run wherever the target branch lives and
> never disturb the current checkout. This series makes both take methods do
> that correctly and teaches take->merge to resolve conflicts in place.
> 
> [...]

Applied, thanks!

[1/6] review-tui: factor cross-worktree take setup into _take_worktree
      commit: 4951ef12e9d1840a1ca6c54349ff5c04dd3bab55
[2/6] review-tui: run take->am in the target branch's worktree
      commit: 359461dab31d67b2f622ac219d7dec52b5488a9a
[3/6] review-tui: test cross-worktree takes
      commit: 782fd0e009fc633d5d25ddf451d68d8c5900d470
[4/6] review-tui: run take->merge abort in the target branch's worktree
      commit: f7e6f2ac6094bf7c47aece39d9a077ce39623f7a
[5/6] review-tui: resolve take->merge conflicts in place
      commit: 089665dbb6ba02f02683cc2256a38314e843a12c
[6/6] review-tui: test take->merge conflict resolution
      commit: 31de72604837bcec7c79ca3b541458923b527803

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


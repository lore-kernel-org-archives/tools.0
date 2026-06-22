Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577C3148DD
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143855; cv=none; b=Q0p7oQG3qZK8O+/la2rfVzvy4n0x5jVwPatvGgBVozozXN/NNi5woOOVRSlHZ4abK33QUe2KezxqyhdMzNkZtBP2WsUhTgnZBMQRw0GfYFVzn2CburjxPRKOWPsIKmMwW2zYlhByY9rBB36HgSA7xtq108AtDwrwhZYgAzrjRNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143855; c=relaxed/simple;
	bh=MS7cbIDrvN5o7YBWwDuTi0zdNuJJBSKTqufjNd7YnXI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IP0vFm2eEkdpOuNGRwKJBrtb3peD0doLdcmYq3VpgJMsdlJzLEcdDyvJUK02hrFn9BjK5oUMbugvcauYs2SJk9nH6F/YCKqJOpx8Unsyc8s4pPJtW7pmSQ4SNhK6LlJ0wuov7CtY2j+dvoUvvChJtdXG5uXWTRdEAIxXCwjuYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jpzywms8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jpzywms8"
Received: by smtp.kernel.org (Postfix)
	id 39C991F00A3A; Mon, 22 Jun 2026 15:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D2E1F000E9;
	Mon, 22 Jun 2026 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782143854;
	bh=Egbd7/gUY5g6GnYr/1MUKpKwc8cyxKnMwc9/H42sYZQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=jpzywms8h6pmV2SlKGApluuDgFvg+nkAYAuCJCfeKJ3Qac28v5AdrMHXRDz6WF1A+
	 q079DEOMs/7CzeAaVuES19OKoA9L53WgmX0M31Paobl57AHbdc0NJqe4O8VMlrXvio
	 qEa0KBgN5D7fkUy4QhCE9vO7O7FfjayFCw4tj2t0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
References: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
Subject: Re: [PATCH b4 0/3] review-tui: align take->merge with b4 shazam
Message-Id: <178214384853.1406066.9646416635712281426.b4-ty@b4>
Date: Mon, 22 Jun 2026 15:57:28 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=l0XnuYu/B83y1raDWF0Ve+ml9hz/bzm8g+fsanDEPsY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIso3NfsuUKrGvv19/99xenL8/y/X/vX5y19YL05ytz7
 DUk1y6711HKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiX3sY/ukcnDWn7mD9A/YE
 t8IlLUcPL9u9reSj5Pm+abYPzUXO9Pgy/JVOUj/GfvH6ZrEInopF/Wtb2SbaM9m1dV4/oBiiFbk
 lmB8A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 22 Jun 2026 14:20:42 +0200, Christian Brauner wrote:
> review-tui: align take->merge with b4 shazam
> 
> The review TUI's "take" action (merge method) applies a reviewed series to
> a target branch, but it had drifted from how `b4 shazam` behaves on the
> command line in two annoying ways.
> 
> It ignored b4.shazam-merge-flags entirely, so --log, --stat and --gpg-sign
> had no effect from the TUI, and because the cover was composed in b4's own
> editor and then committed with `git merge --no-edit`, git never got a
> chance to apply those flags or to show the --log shortlog for review.
> 
> [...]

Applied, thanks!

[1/3] review-tui: honor shazam-merge-flags in take->merge
      commit: 5f7ee8ddacea7cf1cc8df76686f7d0eb088adb4a
[2/3] review-tui: run take->merge in the target branch's worktree
      commit: db9a629c3e959e6a437f2e1a24a506151aa04565
[3/3] review-tui: test shazam-merge-flags and worktree resolution
      commit: cfbfa5d163d6016cae0eeff9033b416c006db968

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


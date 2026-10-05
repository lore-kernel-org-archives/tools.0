Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F0476CD6
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197850; cv=none; b=Or5ecTcRqPemQa0lUOI7fCFN5ntqWdoQfI3+HHWeLTkyi6dHF2hONZlJvoXEwlQm9WKQrwK7hR5PTxiLgSCtghl6PSRBEfwDATwBT6CZepmR+VYClKyMYL852NAERM2hiXLPCxx0ORby0RK3duFi8+JvuQ7q1fnpGFzfkN4VRmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197850; c=relaxed/simple;
	bh=jolTEuoj+REcv+GR90rmiLQ0IFdiEXQpLfhoO0JpXFI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BjvbVtEMTQ4hLgsevlvQj0OEpc+vlS307GafLdSz2MsnRsTFdmLQT6yY1EPdTL954jiz4gf4O5ACICW2TMjyC93GAl+0nZREi/spKS93/tATIn18vfmp9h/PteY9257PJ20IcTAfGzhoESGaSNu5PuCl/mYAZRKr95aD71Rre8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DVpF/s1i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DVpF/s1i"
Received: by smtp.kernel.org (Postfix)
	id B18CD1F00893; Mon,  5 Oct 2026 10:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C48C1F000FF;
	Mon,  5 Oct 2026 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791197848;
	bh=MyG6hyAtWn2a5fPTBb9W5WC0qUfGzVBVnd9QL9LWzas=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=DVpF/s1iRYsLroY2HuKBcc0bMkiOlRma5Pxpv9JOrfPkR5Z6y2nm71nrWrM6cM6dS
	 sWep0rCQH0w+qng+6h/x8v03ofP1moef0B3FZobFqyqwvBbMUD/eXxIZzAMObKp3gt
	 amOUxmO9b3lAIu4etoRlRnJ0VQTmM+TMPsaXSOcA=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
References: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
Subject: Re: [PATCH ezgb v2 0/3] Tighten JSON and source type checks
Message-Id: <179119784264.1849317.17438983150200138658.b4-ty@b4>
Date: Mon, 05 Oct 2026 10:57:22 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=qhZ1CTOQYwMH/gz9wAlGtAzGRJ5974GiSG1GEADVAtE=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLION027//L0ivCc55smTJm0bVvekqdXw/b+Kf30W4e/T
 E3arGFJQEcpC4MYF4OsmCJL2b7YTUGFDz3k0ntMYeawMoEMYeDiFICJtDxgZJheaLDv0E9zB59d
 TJziEY9uGTrtaYvgXVJSk75nu5mTyHaG/3Wctz73GBVWM4odmzFhx/x9bocO/V5uy6Bwm2HVzNb
 UL8wA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 18 Sep 2026 18:03:20 -0400, Tamir Duberstein wrote:
> Tighten JSON and source type checks
> 
> Upstream a047342a231d superseded the CI, formatting and checker setup
> from v1. These three remaining patches narrow JSON and git objects,
> replace the dynamic writer test double with a typed subclass, and enable
> strict Pyright checks for source code. They also align the contributor
> documentation with the uv-based CI workflow.
> 
> [...]

Applied, thanks!

[1/3] Narrow JSON types and type test doubles
      commit: 5773698ed41ac4a92b541f83173f9dfb51660abd
[2/3] Enable strict pyright source checks
      commit: 03bd9e3106783f39e808227aa8270572e7106083
[3/3] Document local CI checks
      commit: 87b89abeb9465e1e8b406978cb7336d88d1ff315

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


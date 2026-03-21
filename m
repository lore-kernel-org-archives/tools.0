Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42C4223DE9
	for <tools@linux.kernel.org>; Sat, 21 Mar 2026 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774096073; cv=none; b=Zs9IQF+Xv2ZLs/NiBHtdRU9O2tyPsBFzQUitH7FnOPJWwbfV/RnKt1K1K7O2yVEPjxvqDlZondbSNRasZ1PhQJpP4TNNrZBFxMF7gpAZdVLsrB2tYf43VehawRTx5H7So/yPR7wzJYfAeb7pX0iFM1U84+O7QmJfH4equK3f/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774096073; c=relaxed/simple;
	bh=xXvqnZh6Iu7XvLlPpz7EMJMw48jQsCApqLSRqm9TKfw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=Iv3eo0CRQR1ajFkPfExMpHCzMVEePHIlq7NYOJYIB4Cc97GiOoAv0UyTjF0KGv4+MVMouTrCxZUjPh1OIBh8wpNnVEgfCbrGSVcgJQMA7/mdvc5gNMiQO76y/cBM8X3fXp2eVJ+ztlbV5OAiMum0rMSvcznhvjTSRJeuzzMW4aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PO/fKXQF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO/fKXQF"
Received: by smtp.kernel.org (Postfix)
	id 6A50FC2BC9E; Sat, 21 Mar 2026 12:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC820C19421;
	Sat, 21 Mar 2026 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774096073;
	bh=xXvqnZh6Iu7XvLlPpz7EMJMw48jQsCApqLSRqm9TKfw=;
	h=Date:From:To:Subject:From;
	b=PO/fKXQFQDIxo3v6aqhGDk+Ifx3GxQVkYM38NKwttE+Km2xTq6ySvh4b7LoC0UARj
	 gWdFj/7Z/ISklpLBiAonjdIeMF6sk6V/VpKQ6eHkEu+TCY+UIU4QHhPMQeCxgg1eCQ
	 2ePPNKlbRXHladPTK5UPIcrd8uGvwiFswfQXWifIMOanPfkzYN1keTHehvSt2X66NY
	 ZhcNjD30q52E//p4SOOueEYbqUIJS62rwABW3aiXkqzZomO8TzwSrI9m0oCiEaoxFE
	 EWBgno7DOmt4WCw4OqJTIT3v4yyaeB6iGB6FF9yBWDn9hFFbH6bwMJcd1NOF5oJ1GH
	 B827tBqt/39kg==
Message-ID: <d2333f94-54a8-4175-b4cd-377c7b4dae9b@kernel.org>
Date: Sat, 21 Mar 2026 13:27:51 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
To: "Kernel.org Tools" <tools@kernel.org>
Subject: [FEAT REQ / BUG] b4 review messes with hooks
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I am trying b4 review in a repo I used for maintenance. That repo has
also checkpach and signed-off hooks installed:

https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc-tools.git

Starting review causes quite a bunch of warnings, I guess from post commit:

1. Executes in other directory (?):
line 17: ./scripts/checkpatch.pl: No such file or directory

2. Missing SoB:
Errors in tree with Signed-off-by, please fix!

Any idea how to adjust the hooks, so b4 review will not trigger them?

Installed hooks are:
post-applypatch
post-commit
post-merge


Fuller log:
####################
Base: dcba46f4b7a86b0b93f46ecd9e7a82d758c7ea78
Magic: Preparing a sparse worktree
---
Applying: dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
Applying: clk: samsung: exynos850: Add APM-to-AP mailbox clock
Applying: dt-bindings: mailbox: google,gs101-mbox: Add
samsung,exynos850-mbox
Applying: mailbox: exynos: Add support for Exynos850 mailbox
Applying: arm64: dts: exynos850: Add ap2apm mailbox
[Checking commit]  0fab950fa7bf dt-bindings: clock: exynos850: Add
APM_AP MAILBOX clock
[Checkpatch]
/home/krzk/dev/linux/krzk/.git/hooks/post-applypatch: line 17:
./scripts/checkpatch.pl: No such file or directory

[Signed-off-by]
Commit 0fab950fa7bf ("dt-bindings: clock: exynos850: Add APM_AP MAILBOX
clock")
	committer Signed-off-by missing
	author email:    alexey.klimov@linaro.org
	committer email: krzk@kernel.org
	Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Errors in tree with Signed-off-by, please fix!
####################



Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2126129CB3A
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 22:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770156036; cv=none; b=EhslEYZgvNYoWT+ZCKg3/lQj+PGfrye+YsdP2AWd7E6FYHorVL/rNyLxBeLJLnuq2imP8BASh5KfC2GN+sA+LyOlBtm2e9FzVWmOi0ziXr70WSE7Se4PVJl0Cx9R3OMBvLNvC7T9GLazduPINQ5hwN2B4Ny8sh+IBFHMllmTEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770156036; c=relaxed/simple;
	bh=XvBHjgRaYkFFCVu8vWWn3P6KYBVgn/hMLr/z4slaEno=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uj44lcaie2WYTxHoB+itaiD+W17YHb9b6bXcFuNMVtXO8FOsmkS3tGTen2h39a8zUmjikGWHH+YtEURReFyTeAX8YWHu0oL4yaXjt+pBEjT0aZ4+YrHxkVlKhTSBvrm3Nj0w9hArM8MrDAOQ1JvQ2Wqw87lCy8RwCNgjOwpnXMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VOHeUMbF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VOHeUMbF"
Received: by smtp.kernel.org (Postfix)
	id D5074C19425; Tue,  3 Feb 2026 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EB8C116D0;
	Tue,  3 Feb 2026 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770156035;
	bh=XvBHjgRaYkFFCVu8vWWn3P6KYBVgn/hMLr/z4slaEno=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=VOHeUMbFoYs2JQL3yzW9oSB8hnqaL/U1mhqUAJtEi/RI+pAW9Rbhv5LEKy87OJuVj
	 3gLiTbYRKcQw4C91H9/BF4Gk9NnjXX/ifnp/x1M7y6ljlZlp1Xqvv29mSbUMk7UzEG
	 uupPKnywC8qpCBW8Z4TxQ2cYsib0dkxH3Y6yDyd8=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 00/21] docs: various fixes + migration from
 definition lists to glossaries for config settings
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
Date: Tue, 03 Feb 2026 17:00:25 -0500
Message-Id: <177015602599.1183724.18098082713650045602@lemur>
X-Mailer: b4 0.15-dev-4e7d2

On Tue, 03 Feb 2026 14:30:59 +0100, Quentin Schulz <foss+kernel@0leil.net> wrote:
> This makes use of rST version admonitions for config settings in
> anticipation to make each config setting a term such that we can
> cross-reference them easily and have an anchor in the output for easier
> link sharing. Then it migrates current "verbatim cross-references" to
> actual cross-references using :term:.

Great work, thank you for sending that in. I'm holding off on this only 
because I want to try merging it using the new review ui, to test the 
full review-merge-thanks cycle.

I noticed that there is no attestation on your patches, not even a DKIM 
signature. Do you mind setting that up -- this is probably not the last 
series you're sending in.

> Note: ``b4 send`` seems to be picking up
> ``Signed-off-by: Your Name <your.name@example.com>`` from the git
> context in patch 11 and adds it to Cc recipients for some reason??

Hm... definitely a bug that I'll look into. I also see it added to the 
CC list, so you probably got a bounce for that as well.

Thanks!

-- 
KR


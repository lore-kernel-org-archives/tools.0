Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2F1A0B08
	for <tools@linux.kernel.org>; Thu, 15 May 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317403; cv=none; b=BP6eXZIZIpW2rVqFVMZV/KV7VCg1FRiFIotS1gbv6LlN1Dfee1QbQCfBDWPydE+0Kga3AdAmTJ8Nnz5xZhIa0wlxtZy63nwNcTvZYFgz/1e+GjerXxMitYYfslDqtmkPF6fdbNC3T/dbJVTuLAueX2+bns5O+OhvaHEtlEixBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317403; c=relaxed/simple;
	bh=0OlaN3P776kBTXpyve55EUV9l8djGB3b/ahDSqtt70k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppT/2G/Vxh1CGzVKhs1eZ0/B5tUwaEuBzDKDmnqHhS5HcVBVSHP204EvfyjfXSoxYx/s3XlLe2ezROMTdruvEXkgisrLBHds1cmN6O8W5ZgelUKpEGzlpazHpxfKFqCIR3cQ4+2bjZISvI9OGk5kPxBM0cHNNKxvw9MNDYhPTCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ziWwQClz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ziWwQClz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A3EC4CEEB;
	Thu, 15 May 2025 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747317402;
	bh=0OlaN3P776kBTXpyve55EUV9l8djGB3b/ahDSqtt70k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ziWwQClz38GXqtxvaq3buOd72nH+c9ZgTjBwtFlzI6FdJA+uuEYAiPtpy/fji0APL
	 amndX/cp0MajNMFB9SuwRCprFmBJInY0gEWhyfkTK7zoEa73hHpCiXezBsvCewUKVY
	 08YNiaYa0F6WqM3q4sRYeenQHYeDdS7OKk+iXfus=
Date: Thu, 15 May 2025 09:56:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org, 
	users@kernel.org
Subject: Re: patchwork-bot incorrect reports
Message-ID: <20250515-archetypal-unselfish-orca-cca6d1@lemur>
References: <CAMuHMdWgwiNcHHopCCMLcidDkunhbGD+ZpMSoOAXy=PvoTVzYA@mail.gmail.com>
 <20250512103155.76f3b6c2@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512103155.76f3b6c2@kernel.org>

On Mon, May 12, 2025 at 10:31:55AM -0700, Jakub Kicinski wrote:
> > For quite a while, sometimes the patchwork-bot incorrectly reports that
> > a patch was applied.  Usually this happens when a series is applied
> > partially.  In that case, sometimes one or more of the unapplied
> > patches still appear in the patchwork-bot email report, while they are
> > still marked as "Action Required" in patchwork, so no real harm is done.
> > 
> > However, today I got a report[1] that is worse:
> >   1. It claims that Jakub Kicinski applied a patch to my repository,
> >   2. Its patchwork state[2] was changed to "Mainlined",
> >   3.  Its patchwork entry points to an unrelated merge commit in netdev[3].
> > 
> > Do you know what's going on?
> > Thanks!
> > 
> > [1] https://lore.kernel.org/all/174703868703.506001.16395245401308177497.git-patchwork-summary@kernel.org
> > [2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/TYRPR01MB14284C8E8145635A1AD8314F4828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=ccb52a9c8dfaa4e2cbb2524b68a7ead72038b039
> 
> Hm, weird. I wonder if I'm doing something special. BPF had a similar
> problem and it's usually my merge commits.
> 
> Maybe it's because I add https://patch.msgid.link URLs to merge commits,
> which are technically not patches? Should I switch to lore links on
> merges but stick to patch.msgid.link on patches?

That's my conclusion as well -- the bot is naive in how it treats the links
and will match a commit to any message when it sees a Link: that leads to a
known patch. I'm working on adding some logic to have it be more discerning.

-K

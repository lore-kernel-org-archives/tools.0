Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165C78F52
	for <tools@linux.kernel.org>; Mon, 12 May 2025 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071119; cv=none; b=ejE9jMrLEdTPQQBVvLtMVAYci+0o8+3VjkYMDJycTdlY60M6CropmFgt0wRTSp4tTYeuANqUXSWm6c+50pVruNkNH4LiczRjyREchuif7M/XhjL6UBQEEklwekXF84ExXJGw8vLHglWnheEigHqyTEswjf2qVhC0Z4ylcvJHD5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071119; c=relaxed/simple;
	bh=MRYFcmO7bYEvs3jOZzfgw7fBW91UttkU2UlUruuYeWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jzah6KDaU0piJZocqRNBPF/1ilwSeIsotNfBpHxFKmlQqezD/SnUp7lrkIDcw8C0P9z8ihqLVcYQB0asN4pm4A9LJk4JuoYrw6TCGyocuhcwf3X/t18KbADLr2EpSy9crEzpNBRbfJDVrc+hKh0zkfGa2q+Y9yXYvWp8bLgeCrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO+nE4kU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO+nE4kU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45271C4CEE7;
	Mon, 12 May 2025 17:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747071119;
	bh=MRYFcmO7bYEvs3jOZzfgw7fBW91UttkU2UlUruuYeWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SO+nE4kU4BFt/LcfIBaTnkLT6M6Fte/WeGhqKIzrLV58Mddfw8FDk5W8ucIKR3ZiO
	 A3t+/kayUSrZBgddMVaUtsl9Bz07ZVot5yzaQSR0fSFHY3aB9T4GQECTCM90ZuoabY
	 FMEisj0u1iRajyjLHcawnpQ+4R2PA9SyqLRu0TON/cr5llYce7sdQKYeLwQ9acxcu3
	 ZXiianzVIDUycOfDudbReodAqoNHW+ntW1X7mQAr4lhazVgHyhUS+tKAnUhYI7stwu
	 IzHF7knsKbtPGBYWCxMo38OsDnDOwYNOfIa8jvrA9UpAZsHtAdB7lfjHRNm+1mnCzF
	 F+cmioHJampRQ==
Date: Mon, 12 May 2025 10:31:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@kernel.org
Subject: Re: patchwork-bot incorrect reports
Message-ID: <20250512103155.76f3b6c2@kernel.org>
In-Reply-To: <CAMuHMdWgwiNcHHopCCMLcidDkunhbGD+ZpMSoOAXy=PvoTVzYA@mail.gmail.com>
References: <CAMuHMdWgwiNcHHopCCMLcidDkunhbGD+ZpMSoOAXy=PvoTVzYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 15:27:57 +0200 Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> For quite a while, sometimes the patchwork-bot incorrectly reports that
> a patch was applied.  Usually this happens when a series is applied
> partially.  In that case, sometimes one or more of the unapplied
> patches still appear in the patchwork-bot email report, while they are
> still marked as "Action Required" in patchwork, so no real harm is done.
> 
> However, today I got a report[1] that is worse:
>   1. It claims that Jakub Kicinski applied a patch to my repository,
>   2. Its patchwork state[2] was changed to "Mainlined",
>   3.  Its patchwork entry points to an unrelated merge commit in netdev[3].
> 
> Do you know what's going on?
> Thanks!
> 
> [1] https://lore.kernel.org/all/174703868703.506001.16395245401308177497.git-patchwork-summary@kernel.org
> [2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/TYRPR01MB14284C8E8145635A1AD8314F4828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=ccb52a9c8dfaa4e2cbb2524b68a7ead72038b039

Hm, weird. I wonder if I'm doing something special. BPF had a similar
problem and it's usually my merge commits.

Maybe it's because I add https://patch.msgid.link URLs to merge commits,
which are technically not patches? Should I switch to lore links on
merges but stick to patch.msgid.link on patches?

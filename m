Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE4B238D2E
	for <tools@linux.kernel.org>; Fri,  7 Feb 2025 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940540; cv=none; b=mzB3Q/s5/TqkhP3RFadb/Eu58Bpsvo1Nya6FR1OapZRaoSv/bVeV2NhHv8XOUEfpsY/1nBoSU56DD5R2xe0Qcr9Zf/eB+mFjyNRm4CL+A2fo7nlD1MsLKbb8ibrFDzN4mU+okmhZaYgtIAMHgkmS7cTupLzzclfdBuWFa+Fp2bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940540; c=relaxed/simple;
	bh=de/vaMcwn4034Gd+GJd81WQWSTWYAwLCld5RVPLy+8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W1HzIZN57Q+fuSKZ8mHZJkTGpjJRl/cQrnWw2DAGQtPLRqYsPTC9WGYFdivIYRPc1MgUrrSRuof/Tv9DD6l2HvuhIumRapz1Q6UkVc/SG8B0nPgR05VmQW4ziehQbp5+LtG/9YULl+a8/h6+UvVUHeq1UmgBalODyEkkKRkPQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSY7vl1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSY7vl1b"
Received: by smtp.kernel.org (Postfix)
	id 207F3C4CEDF; Fri,  7 Feb 2025 15:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599F4C4CED1;
	Fri,  7 Feb 2025 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738940540;
	bh=de/vaMcwn4034Gd+GJd81WQWSTWYAwLCld5RVPLy+8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sSY7vl1bgDSWQzyRDww4TgNboxaNA5/V34TmOQYaIpqW+Oh4H51LFNXvtU1VHlluC
	 /XP/qXXqevLxIgMg1x5dWxxP/7aWePuQUNkDcYXlQMco7nHUIP8fVN87v6NdHGp6Hh
	 BoAvdumIJc55z1r9aXHJZoIXbw61yTrOQkUXOhhpG0kHDfbV8WNI0PYqOaq3VAQUWp
	 p7hgHSx/FrCG+ltBf9gDQ2t42dGeFYyJXZ/f7DdtKxUIUTC42OrIUY6Y40B5ZDWHTK
	 LTA4f7iQKtVZnukTWc3mjzIBJv52rJKtUSornfRkAnconoLv1nw5Va3nwE1JFJPan5
	 2RvkTbk944D5A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] ez: add subject prefix flag
In-Reply-To: <20250206-bipedal-aromatic-lynx-10ef38@meerkat> (Konstantin
	Ryabitsev's message of "Thu, 06 Feb 2025 12:50:11 -0500")
References: <20250204-prefix-v2-1-468f166eb9d5@kernel.org>
	<sJc_kTOdc_TO6xU4a5R-VeMSBS9dEaZU27NKWw2L0sJL5x4NrFfFtTU8MTu3JILevvjO9HE4hP6OIsV2HXB_cA==@protonmail.internalid>
	<20250206-bipedal-aromatic-lynx-10ef38@meerkat>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Feb 2025 16:02:08 +0100
Message-ID: <87seopiyrz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Konstantin Ryabitsev" <konstantin@linuxfoundation.org> writes:

> On Tue, Feb 04, 2025 at 04:30:45PM +0100, Andreas Hindborg wrote:
>> Add a flag `-p PREFIX`/`--add-subject-prefix=PREFIX` to `am` and `shazam`
>> commands. This flag will add PREFIX to the subject line of each patch before
>> applying the patch.
>>
>> One use case for this is when composing trees that consist of patches from many
>> different sources. Adding a prefix to the subject of each series makes it easy
>> to see the origin when scanning the commit log.
>
> I get the reason why you would want this, but I also kinda hate the idea,
> because I'm almost 100% sure that this will make it into someone's -next tree
> or something like that.
>
> Can we take a step back and try to look at it from a broader perspective? Do
> you use this approach during code review, or for some other purpose?

I use it when assembling trees for upstream work. For instance see [1].
It is super valuable for me to know what commits are from list when
scanning down the git log.

For a series prepared with b4 it looks something like this:

f3d69aaf6b6c1 * configfs MAINTAINERS: add entry for configfs Rust abstractions
b813426cf1e74 * rust: configfs: introduce rust support for configfs
d2a88d97552a9 * rust: sync: change `<Arc<T> as ForeignOwnable>::PointedTo` to `T`
935d4487ff8d5 * rust: configfs abstractions
0a2d72888abc3 * LIST: [PATCH v15 1/3] rust: types: add `ForeignOwnable::PointedTo`
988bd1ba2ebb3 * LIST: [PATCH 3/3] kbuild: rust: support `W=e` for Rust
3b39f5625406b * LIST: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
89cfa7f9c1099 * LIST: [PATCH 1/3] kbuild: rust: move `-Dwarnings` handling to `Makefile.extrawarn`
2014c95afecee * v6.14-rc1 torvalds/master local/torvalds/master Linux 6.14-rc1

Here commit HEAD~3 is a b4 cover letter.

I'm not married to this approach, it was just the only one I could
think of. I really like that the patches I apply with `b4 shazam ..`
appear with `LIST: [PATCH vX X/Y] ..`.


Best regards,
Andreas Hindborg


[1] https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/log/?h=rnull-v6.14-rc1


Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.13794.1589209407008905362
 for <tools@linux.kernel.org>;
 Mon, 11 May 2020 08:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=IV26w+4n;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: will@kernel.org)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E661A20720;
	Mon, 11 May 2020 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589209406;
	bh=XD/LhYyvDhsofnt+eQ941OaeTNnvthBhy4Ypy+yPPTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV26w+4nUva8BdA7BdDSSMrsQMRRrWdIb/9/zWzy81ltU5gLWoU9+lwk4ujIbeHS6
	 /WgXSz2d8zl0AIcNOmu9ISapKcHAYAgqrVdilzaG+ZLD7lqWLjpqemtXGuyXvbgrFV
	 3+GABY/Kl7Jz1HY9HhAMFc9oX5fw41OOku4Nbl+I=
Date: Mon, 11 May 2020 16:03:22 +0100
From: "Will Deacon" <will@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty not picking up per-remote git config properties
Message-ID: <20200511150322.GB22040@willie-the-truck>
References: <20200507114255.GB29541@willie-the-truck>
 <20200507173750.jvd6kvatmon36pa2@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200507173750.jvd6kvatmon36pa2@chatter.i7.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 01:37:50PM -0400, Konstantin Ryabitsev wrote:
> On Thu, May 07, 2020 at 12:42:56PM +0100, Will Deacon wrote:
> > Hi Konstantin,
> > 
> > I've been having trouble persuading 'b4 ty' to honour the 'b4-treename'
> > and 'b4-commit-url-mask' properties if they are specified on a per-remote
> > basis. This seems to be because get_branch_info() has expectations about
> > branch naming to which I'm probably not adhering.
> > 
> > In my specific case, I have a branch called 'for-joerg/arm-smmu/updates'
> > which has a remote called 'wd-korg', so my .git/config contains:
> > 
> > [remote "wd-korg"]
> > 	...
> > 	b4-treename = will
> > 	b4-commit-url-mask = https://git.kernel.org/will/c/%.12s
> > 
> > [branch "for-joerg/arm-smmu/updates"]
> > 	remote = wd-korg
> > 	merge = refs/heads/for-joerg/arm-smmu/updates
> > 
> > but 'b4 ty' always takes the properties from my top-level .gitconfig.
> > 
> > I've hacked ty.py as below to get things working but, believe it or not,
> > this is the first time I've written any python so I suspect it's all a
> > load of rubbish.
> 
> It's not, I used it largely without changes. The latest master and 
> stable-0.4.y should be a lot less naive about local and remote branch 
> names.

Cheers, Konstantin!

Will

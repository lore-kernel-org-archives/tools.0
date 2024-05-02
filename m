Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424FA15E80D
	for <tools@linux.kernel.org>; Thu,  2 May 2024 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714674681; cv=none; b=aaDYj+31z/h77hVtvqUr8QQhPv02+kSfmZ9QT0XnsW4oXIOedGranpy2fsKk1CpiQTjw4Lk1dAPjCG+796kV7kit0FbQHCt+npumjZarHj9a+im60KwU5X0WkVCJ8g4+97BI/PNlYpjN8pCsY+CeXS3PJghoNSBGykRm03a7DlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714674681; c=relaxed/simple;
	bh=hN2lsYobOe/pFhvsNHuG2sR+bdNsc0+fT6aN3YHWjrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kk1ysD/WDzJMapeGgpe6gRCMZl2l8XcKDQsdLYxUNeCSuVRfcfrrLfC7Q3dnq1MjpwS09MuUHsfz+NkoDAy4Q5+GR+ml3UNYoz4WeQe3pqONL4ukJ2QknG4bQK6QbH6eG+uJmUiGrVLGVTvrmK3MWYF36FtsXtaRVcpdhE5RfhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1kuihUUL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1kuihUUL"
Received: by smtp.kernel.org (Postfix)
	id EA65AC4AF14; Thu,  2 May 2024 18:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6605C113CC;
	Thu,  2 May 2024 18:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714674680;
	bh=hN2lsYobOe/pFhvsNHuG2sR+bdNsc0+fT6aN3YHWjrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1kuihUUL1yzTYaZOjEsnFETjFgkGZQSL2eYcgAL97YzgMali1n6k7ipecMueRrGDr
	 KU76/nzEz5hH1Pr6dOmUx5OIlOAXO6ZCz1U+uXEeJsUqNXpU9H2gFJY6r59pSWFQeU
	 hVbwgQi14XZBv4+Dzt0AKNxwtNsgUzZqi61WRhBk=
Date: Thu, 2 May 2024 14:31:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Will Deacon <will@kernel.org>
Cc: tools@kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v2 0/2] b4: ty: Fix incorrect patch/commit association
Message-ID: <20240502-secret-tireless-emu-acfef2@lemur>
References: <20240304134241.20447-1-will@kernel.org>
 <171459859217.935458.14461888310866914252.b4-ty@linuxfoundation.org>
 <20240502092354.GA16551@willie-the-truck>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240502092354.GA16551@willie-the-truck>

On Thu, May 02, 2024 at 10:23:54AM GMT, Will Deacon wrote:
> > Applied, thanks!
> > 
> > [1/2] ty: Try subject matching for every commit before using trackers
> >       commit: 47bd55d3182d875802700670270f5ee0877a8d5d
> > [2/2] ty: Remove unused 'matches' variable
> >       commit: dced92071d2135ccbec521cb4face63cafcdc407
> 
> You applied these already (with different SHAs), I think:
> 
> https://lore.kernel.org/r/170958794467.8875.12454526353405240108.b4-ty@linuxfoundation.org
> 
> So I'm not sure what's happened here :/

Bah, you're right. I blame the split brain between b4 and patchwork here 
-- for some reason in patchwork these were still showing as unprocessed.

Effectively the 2nd time was a no-op:

  $ git log --oneline --reverse 590044aff85f3e11cbd5efb9e192847bb3b51b3f..
  47bd55d ty: Try subject matching for every commit before using trackers
  dced920 ty: Remove unused 'matches' variable
  775893e (HEAD -> master, origin/master, github/master) Merge patch series "b4: ty: Fix incorrect patch/commit association"
  $ git diff 590044aff85f3e11cbd5efb9e192847bb3b51b3f..
  (no output)

I am actually annoyed that this operation doesn't throw an error and 
doubly annoyed that the only way to fix this is to rebase -- but rebase 
I will.

Sorry about the mess.

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A02F60CC
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568903; cv=none; b=iq4xNXObkrLplydbpyEnSkdsJOA5gxacnLMLQudvLmmCM06OAnDUqG6PcXtV9M8MMD8qWdSuYU9L/JtlRTFK6H4SPrVjeQA25KvalkV4nGmem1wtIaMU87lvSJ22g5tGCIFAZeKJk13lnoYMso052cnxbn5yPy2WTNh1VDW2/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568903; c=relaxed/simple;
	bh=ddVYzWWEZqBgrxihymwrrgCQWfVyT8+lYLqENkAiWaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YipGcshI+Pp8Z1ot6NCz1etri2WzWM1MYooHKoZrfiNZZoqRcjP8WedGOMwlTtZyvXTi42PR1eqdkOUhO/LSrVMvEPCN5zRH4zRjWtFuhttPApCrIZdH8eK+zYAuLdi6cFKqx4SZxsc3FP8gXKD1TB16ppr9Bd7KY/fbvfytUkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MBCHXclA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MBCHXclA"
Received: by smtp.kernel.org (Postfix)
	id E78D2C2BCAF; Tue,  7 Apr 2026 13:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7657C116C6;
	Tue,  7 Apr 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775568902;
	bh=ddVYzWWEZqBgrxihymwrrgCQWfVyT8+lYLqENkAiWaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBCHXclA646h1P6KRNK81/F73Mq85GEEJpaALRyd88HBkmWvDCSjGKfM4KLhiHJIy
	 YKN4X1Uiuq1ilgGR3DZ9d0ztP6tK/tRNAiMC4mzTsNIxwOlA6ji0F3wXaf/lhPsf3p
	 xUqhr8c0cjklbFExiXnn8Zf2GhaqqZdI3QqeVnGo=
Date: Tue, 7 Apr 2026 09:35:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, 
	"Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review state is broken after series reorders patches?
Message-ID: <20260407-rampant-active-mongrel-b7ad0a@lemur>
References: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
 <177549837114.3355865.7109422546107942051.b4-reply@b4>
 <177550045089.3385816.4021244769990222254.b4-reply@b4>
 <5dfbf9fa-532c-47b3-95c1-4b14f6fed577@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5dfbf9fa-532c-47b3-95c1-4b14f6fed577@sirena.org.uk>

On Tue, Apr 07, 2026 at 11:50:37AM +0100, Mark Brown wrote:
> > - will automatically mark identical patches as "skip" on upgrade, so you 
> >   should only see patches that have changed
> 
> Is that a good idea - patches marked as skipped won't be applied will
> they?

You are right, I forgot that we automatically default to cherry-picking when
there are skipped patches. Let me revert that and think of a better approach.

Regards,
-- 
KR

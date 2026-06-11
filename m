Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB21E7C2E
	for <tools@linux.kernel.org>; Thu, 11 Jun 2026 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142998; cv=none; b=HzsPoMYoJ7+UouZEsxdw3DAUHjim84+8nVeD2VlPYxdy1x8lEvWMru/VPHFyEDkVqzE46jQRNKMmhfwqx288PdoAgCqhDg4SlQ8qetnAJtt+WVJ/S9gBAlt9ZU6D76Y92z5XJcEZnO4wI7lt/ecqFS0ZOAcSWN7S4Vw0/y3+lCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142998; c=relaxed/simple;
	bh=igCxPeLUXuj/6Yl58gbmifYnTHKf+T3JAZb3G3StSV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WestNvkgS2V8dsD+lZXUUrEfis/LxEJjqScnCv302CqmSAIN3zpRYjx1GhAkLKu2mc2Csc9psYehBhdZiSNgOvnIN3nkusG5dagkIP4dVC2iiwkd7mPf3CB/aJHFsdpLyjsB53Jb4KZ8JApjxawDgrC/NAKTXyU3qrPlYVnNgCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yx/vkt64; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yx/vkt64"
Received: by smtp.kernel.org (Postfix)
	id F1A521F00899; Thu, 11 Jun 2026 01:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3631F00893;
	Thu, 11 Jun 2026 01:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781142996;
	bh=SSi9ngqxCM0DfevvGsPaJHLRVg5M15QnevkAo5iwDYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yx/vkt64QO8e6ct/00tk/fDiq5tU+ggPETfyuVAYixA91vnQuQbkOZUJxkKnwRc1F
	 Ujm0BIZs4yQuNOgAScc9mCpKpRe3xA88V7xoFP0X5ABREtEagcX984Je8gdo+3kLnx
	 i7Wma85Ql1f132ai/pMGqpu+puy7jveVNc9Dp6do=
Date: Wed, 10 Jun 2026 21:56:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review tui: too smart reply features?
Message-ID: <20260610-psychedelic-encouraging-quoll-c7b949@lemur>
References: <c281cf50-7935-488c-8429-03eac9b8902e@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c281cf50-7935-488c-8429-03eac9b8902e@kernel.org>

On Tue, Apr 28, 2026 at 12:52:01PM +0200, Matthieu Baerts wrote:
> Hi Konstantin,
> 
> I'm still trying 'b4 review tui', and something that bothers me is when
> my replies are mangled. I have three examples.

Okay, the latest master has revamped that quite a bit. I was also not really
happy with the way I kept fighting with the tooling, which is the opposite of
where I want to go. I had the bright idea to move some of the functionality
into a vim plugin instead of doing it in b4 directly -- this way you still get
most of the neat features but without the inability to undo or forced/awkward
quote trimming.

Can you try it out and see if you're fighting with the current master less?

Thanks for riding the sharp edge! :)

-K

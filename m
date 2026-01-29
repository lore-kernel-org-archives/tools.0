Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C76238D52
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698854; cv=none; b=t3a7oCB+gG3f2vqTI95YRQupWKdT28/BStK0tfcdKxcmqJRxCvlyoUFaniQxLagpBZ/5ziZGDwuZBw9y3EotjKPQ+jvLFvz/dK/ma3PJc6Ja5KG6in/iMojl3Fi/gqX4nw7AAFX6fvR9LNtXkxKc4btOILrfG9ATY00fEj0+f6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698854; c=relaxed/simple;
	bh=Ih7LAACH8torOKDPuk0LZXMiAsDmoC3OwSAQsQMmZEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRYynHU8I7GSMcZsC7/+sH1YgepBU7CiT6gju3CKhf5Q4PLkERitNSsNy7hSTMSxesL2fa6zlCZ9B/kIXFtnJyYzq8xkAqBlr7hkETkx8PdY2h7OZxBh1gcWZiHJAxzypZh31R5xOCy0zmpah+X4SXtZCHc2hnw+r1X7ET6o40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IZ+YVnGk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IZ+YVnGk"
Received: by smtp.kernel.org (Postfix)
	id BE1A4C116D0; Thu, 29 Jan 2026 15:00:53 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2C9AC4CEF7
	for <tools@kernel.org>; Thu, 29 Jan 2026 15:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2C9AC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rL8iYb8IkzpalBGE2t1GuY0dsoBZ8LvuJFxQNfhvrwQ=; b=IZ+YVnGkzQDAW0hnqvsHMnQpjP
	D/FSDJGd6pkyBCIA7G5WA1C0iruivL3xspKFq4Po1HYDOGV3P4jbnR8J/6hZG0i0DJxLMz9AO9OI/
	6s7oZbe/ZGLhRl7Q1I3HI6fBsYYFR+WOKGffU7RbqopC58paYuzJKPn5qTEs5wa2ZQEX4vRTouKcG
	vbJzygYhXH6gnB5+xYvpcBU3IELCalBVypH3UkpAEMq9U8LwrICeu4ABjpyin2Y+3/4zutudVQ2/e
	e4lCGH1wwSurv0kEXuI8rB/dI9oPYTQ/8LQf1/UquLGed8QzrtcsISlEvvCXxE2P3rKpXCPl0vVKJ
	VWeGhPfA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vlTVn-0011Qa-5T; Thu, 29 Jan 2026 15:00:47 +0000
Date: Thu, 29 Jan 2026 07:00:41 -0800
From: Breno Leitao <leitao@debian.org>
To: Mark Brown <broonie@debian.org>
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
	konstantin@linuxfoundation.org, "Kernel.org Tools" <tools@kernel.org>, kernel-team@meta.com
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate cover
 for single patch patch series
Message-ID: <aXt1MNwsoVxmG9Nq@gmail.com>
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
 <DG115TDKJFHA.2VQ4J0C51DKHX@bootlin.com>
 <aXteOVMUIKNzv2te@gmail.com>
 <DG14EHTYTJTN.2NQI0XSURUJIP@bootlin.com>
 <aXtoMh3MEuJHXtMH@gmail.com>
 <d68a802a-abfd-4cf1-a95c-a7eea231c627@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d68a802a-abfd-4cf1-a95c-a7eea231c627@sirena.org.uk>
X-Debian-User: leitao

Hello Mark,

On Thu, Jan 29, 2026 at 02:15:45PM +0000, Mark Brown wrote:
> On Thu, Jan 29, 2026 at 06:03:44AM -0800, Breno Leitao wrote:
> > On Thu, Jan 29, 2026 at 02:51:05PM +0100, Antonin Godard wrote:
> 
> > > Some project ignore merge commits altogether, so I regularly see series without
> > > cover letters. Are merge commits that frequent?
> 
> > The trees I am familiar with, they add the cover letter to the merge
> > commit, which I personally think this is a good practice, but I am quite
> > sure we don't do it everywhere.
> 
> I think it's more a question about if you get merge commits, within the
> kernel that's very subsystem workflow dependent - a lot of subsystems
> have a fairly linear history, they just apply patch serieses on top of
> each other on a single branch so merges are very infrequent.

Thank you for the clarification. If I understand correctly, it would be
reasonable to add an option to b4 that skips generating a separate cover
letter for multi-patch series.

In this approach, the first patch would serve as the cover letter, and
all subsequent patches would reference it as their reply-to.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E71A23B9
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769695434; cv=none; b=ZnkUmZFzcZ3cJTgQuRPDQBzGBCDLmRtWiJoE1Vj4T2Z9593anC+feM71do3wbr4GG7GruE2GYkFwu7h81roFKzQfoggBIuqSqMYjn4HxcwpeE5ertc8IWnDmVcQHXOtle7RuXhN4gueXhLskhhTPJsDc1yS1jyuyaV745vneWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769695434; c=relaxed/simple;
	bh=cQaJQABK+U6yfUDNjC+9gJOELpx972J+CVIq0qebTvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em7Cl88dIJp2kATmv4TIawh6tDE17zbm7B4bIdLKUfXFGOgVB+PMUp17zE3pUGc7rDCSXvl63GXA4d1bNOdFTCuscuQZrD7NASfSaVVBdG32+MoeZg2qAkow0AZ4VAoJfAR+nUc+Fmw8tDxBISSty5PZsX/UlULQxTa5wOVi6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=AdFiROWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="AdFiROWU"
Received: by smtp.kernel.org (Postfix)
	id AFFF5C116D0; Thu, 29 Jan 2026 14:03:53 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA457C4CEF7
	for <tools@kernel.org>; Thu, 29 Jan 2026 14:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA457C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=itQ4OlJ8KUMeTytDlPOirTMK0DTyacszdN6QBu3cljc=; b=AdFiROWU0GBJHOvvEpOIi8xQ/i
	1C/oaPRaJv2DV3SuWrcrjBMt4ZND2Pa/ePOKitvACXjA+20IRM+1DcvlHvKVo+X6HrUDUlb1akXY9
	DuOEIfEYePt5lntff/PoJNPKT8XOJFjD2/M3JjfSnkm7wzQ7hNIDW8i1yj7SV8nc3aHJxl9tCmLtJ
	OzrRH9fBJAkAni2eojMg+ktoIQbtCNJ6mCq7pDpvFEAs2HMCKR2obQnSCu98Qg5UtckBioz+7JYm9
	241PBNWazUVlzArwRmYQstk/CDSax2Q8tam+dgWqCHS3IEv8GkqUnPiEG/x68DkhDAfAT1Zxn+u5u
	SSj3oQdQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vlSce-000zYT-96; Thu, 29 Jan 2026 14:03:48 +0000
Date: Thu, 29 Jan 2026 06:03:44 -0800
From: Breno Leitao <leitao@debian.org>
To: Antonin Godard <antonin.godard@bootlin.com>, 
	konstantin@linuxfoundation.org
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, kernel-team@meta.com
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate cover
 for single patch patch series
Message-ID: <aXtoMh3MEuJHXtMH@gmail.com>
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
 <DG115TDKJFHA.2VQ4J0C51DKHX@bootlin.com>
 <aXteOVMUIKNzv2te@gmail.com>
 <DG14EHTYTJTN.2NQI0XSURUJIP@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG14EHTYTJTN.2NQI0XSURUJIP@bootlin.com>
X-Debian-User: leitao

On Thu, Jan 29, 2026 at 02:51:05PM +0100, Antonin Godard wrote:
> On Thu Jan 29, 2026 at 2:21 PM CET, Breno Leitao wrote:
> [...]
> >> I do find myself needing the last use-case sometimes, when the series does
> >> not require a cover-letter.
> >
> > Why do you need this case? I undertand a cover letter is required for
> > a multi patch series, so, it can have an easy merge commit when merging
> > the series.
> 
> Some project ignore merge commits altogether, so I regularly see series without
> cover letters. Are merge commits that frequent?

The trees I am familiar with, they add the cover letter to the merge
commit, which I personally think this is a good practice, but I am quite
sure we don't do it everywhere.

> I'm not judging on whether it's good practice or not, but introducing
> a --force-cover-letter option would maybe not leave room for having
> such a use-case in the future.

Agree. I am wondering if b4 maintainers want to have this possibility.
Let's see what Konstantin has to say.



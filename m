Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B634BA35
	for <tools@linux.kernel.org>; Fri, 10 Oct 2025 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760107699; cv=none; b=OQ20V5TPgIgrGYUggnkj6SRwG/zKP6+Quy6P0Q5hayel/5P/H2cgKCyr7XGBEEMr40KsbLBBdGB+T7+3H3HvDPzc+CTHq1IZyxuYdlxwsSIcO+qdRNVcCcR0vUCVgLsS3jKY5ETZWHQdd/IfvrItrAO5Ii8CO1kazIuFDT1bwgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760107699; c=relaxed/simple;
	bh=CeM6nUzIFD7wGDTCMpXuHxki1fnzDflCCmRmuB0HVGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeF4Jk4xi8sNQpAPerv91sHDiFIJtT7A72wLKEaClbcSSPJ4bnfMS16x25h0hP+vPpFjJ1TiZO5JSXpLq5UZ9jlt62gdtgHiBYtJPtoduj3FtozDjw1detDSSsC/PveCfYqDozAAbnRtmlEHjYMKv53DNhrz20on4LIly5R9m7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ac4iE8KN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ac4iE8KN"
Received: by smtp.kernel.org (Postfix)
	id 12CCFC4CEF9; Fri, 10 Oct 2025 14:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C29C4CEF1;
	Fri, 10 Oct 2025 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760107699;
	bh=CeM6nUzIFD7wGDTCMpXuHxki1fnzDflCCmRmuB0HVGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ac4iE8KNrkBVh8OZYo+/RJNuDvBmfQgi6sswJYtLQK84EnakOwXp+eF203LRqi2AG
	 ft7lNeddlLLl1InPGrDDP7r4qvtvaYCo2GBoJcQyl3sob9v/yY4/yooXlzEKlqc+FW
	 F7mLOqaAFDcxRHz7WaZQRTjhLppjzbza6gizjFXdhm6PTCeVqjdlRtBK3I0S/gn1ZD
	 JpKV/4L0n+iEt2pjn+w54h+ikLQakZn1uarGaHIwY/Q2Yx78/z7suNX0FDH7hPtF1m
	 SwOGiJbMKAd4nro7vEKrcTJI0pQfh6iu/FoUECD1idwXXJa57w7+59NkuZ2tcHcmur
	 u5Wx4ulw5WfOw==
Date: Fri, 10 Oct 2025 15:48:15 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251010144815.GJ2988639@google.com>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
 <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
 <20251010143452.GH2988639@google.com>
 <20251010-feathered-pastoral-woodpecker-de863d@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010-feathered-pastoral-woodpecker-de863d@lemur>

On Fri, 10 Oct 2025, Konstantin Ryabitsev wrote:

> On Fri, Oct 10, 2025 at 03:34:52PM +0100, Lee Jones wrote:
> > > Next question is -- have you recently stopped adding Link: tags to your
> > > commits? :)
> > 
> > Oooo, yes!  Yes, I have!
> > 
> > Why would that make a difference?
> 
> When patches have been altered by the maintainer, we can no longer match them
> by git-patch-id. In the past, when we found a Link: trailer, we could still
> match their provenance by message-id, but if that is gone, we can no longer
> fall back to that. I am working on making the "ty" mechanism being less
> dependent on that -- hopefully the master branch should become more useful to
> you again in the near future.

Thank you for the quick response and explanation, Konstantin.

I shall rebase with vigour!

-- 
Lee Jones [李琼斯]

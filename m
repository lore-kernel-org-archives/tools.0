Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26806318EE4
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675099; cv=none; b=uq2YvsWcpGLtryoc/vymAbcRHG+f9aXrWBaYd6y8gqYk2k2vICPeszgYzvMESEFUTn0yd/ZLohoFJzY7lSizkRfBljK3j4T7lgqCPnEiOP96KdEvxpzhGf6V1vQilLHssgJuO56ZMC21tZhvP3HIf1p1xbq6JXlFz/XWagQCEyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675099; c=relaxed/simple;
	bh=arHIrD9qTsCgTnB/a8Pbsl3//qJD8acGoSe67VljLOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0EHVbQVe7kSiMBghX5O24fvkF64jpPMRw6xX+VJYSiYa6uyyu2Q8Lsc3JXKrO/GMq1+1sH3GgoRXoAnAaolp9X2fkUKMF9T/E+HOzlLOitYhOL2PbIQBijTWc8QSV50+DXGsD8cK5VB/NJQ69B0Kcc9PI32UjETFL7Ndws31nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1PPHSkBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1PPHSkBP"
Received: by smtp.kernel.org (Postfix)
	id F1ADFC19425; Mon, 16 Mar 2026 15:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9830C19421;
	Mon, 16 Mar 2026 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773675098;
	bh=arHIrD9qTsCgTnB/a8Pbsl3//qJD8acGoSe67VljLOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1PPHSkBP6NmLDImoIPf2NyUckeO3VGNYjZW/uKGHTc0XNT3RlUaO63EyjyxDe5WS2
	 1UOydN9bLu9IITy10icxYwYrptJwqTqJEcL/Tiw4edfCcoht3koLx0Dp2h3yL6oqjZ
	 Y4Jmk2DKp9FrumsNjxCSO6JOxKjzp+r30YO8yHO4=
Date: Mon, 16 Mar 2026 11:31:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] review: suspend before tracking saves
Message-ID: <20260316-lively-chupacabra-of-destiny-5deedb@lemur>
References: <20260316-followup-tui-bad-v1-1-ebe1beab9804@kernel.org>
 <20260316-peculiar-koala-of-inspiration-c80bfc@lemur>
 <CAJ-ks9k5D9Ua=Cnwe9mC8daQNR4oCAj0a-LMeVcd1PdzMpu1Hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9k5D9Ua=Cnwe9mC8daQNR4oCAj0a-LMeVcd1PdzMpu1Hg@mail.gmail.com>

On Mon, Mar 16, 2026 at 11:24:23AM -0400, Tamir Duberstein wrote:
> > I've added a stern admonition in CONTRIBUTING.rst to instruct agents to stop
> > using Co-whatever-by: trailers. It's more than just personal preference -- it
> > generates junk mail.
> 
> Makes sense. Codex is quite adamant about the "Co-authored-by"
> trailer, so I've also submitted this feedback internally.

Yeah, well, Codex is a just a tool that can be convinced with strongly enough
worded instructions. "Co-authored-by" and similar trailers are wrong, because
they imply agency where none exists AND stick in bogus email addresses that
are most likely used for undisclosed purposes.

-- 
KR

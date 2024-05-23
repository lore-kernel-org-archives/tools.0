Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACA913B7A6
	for <tools@linux.kernel.org>; Thu, 23 May 2024 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716467117; cv=none; b=dNjQtWaYDOhXur62HkLsbHNRa32g/cutrjnh9dMV2FmaJX7kXLbBuCNDheoiI0UrFLCJHQXTC2C5nFsPREh4Fs81TUu4HAKHlYHbrJB98JbLmt7T4cm1/zf2gOWT26klJ6tdO6y0vh3JdGV/0p8Sk7tAgyqE4OqdDjBj39Rr9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716467117; c=relaxed/simple;
	bh=UJX51IXVA9kCLBKncTmXAuYm26yxPFNpI1bfXQ3Higk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmexszZ9hX5x0OlT36hwmO1EROXcopaLTdbLmKoOco2408hcqqRfz9M7QQalSmSJ0Dsi/3K6EluV2f4MDmJmT+k4zsYtwPjgfRLU8QmW0WeIvupsvZC9EwT1JUVVDqM5cke+G8iZGylz44fp9ZSc8FsNHHfHZSgL4Nvj4iVhgCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YMYwtqfp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YMYwtqfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867EBC2BD10;
	Thu, 23 May 2024 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716467116;
	bh=UJX51IXVA9kCLBKncTmXAuYm26yxPFNpI1bfXQ3Higk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMYwtqfpVkiCitHsk9EEr7ILK3kCF1JgbHyRsxHEst/GBremTE4fWQNPpl81LmjoN
	 ICxlali7S8SfxjoBUcEGtsrkbuCIkfP+n4K2ohZ6khBfpPelfJ/w8n8cCvFGpGjkHp
	 Q57UgxcUDqHBGLWMD7E8f1REvEWYoEjg8trJgr70=
Date: Thu, 23 May 2024 08:25:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, tools@linux.kernel.org
Subject: Re: b4 prep-perpatch-check-cmd conf via .b4-config
Message-ID: <20240523-charming-steadfast-donkey-bacccf@meerkat>
References: <87sey8yksi.fsf@baylibre.com>
 <da201b46-c653-45ea-bec2-5110c8116c8c@kernel.org>
 <87pltcyhmz.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pltcyhmz.fsf@baylibre.com>

On Thu, May 23, 2024 at 11:58:12AM GMT, Mattijs Korpershoek wrote:
> >> I've noticed that v0.14+ contains the new b4 prep --check command.
> >> 
> >> This can be customized via b4.prep-perpatch-check-cmd [1]
> >> However, we cannot customize this via a project specific .b4-config [2]
> >> file.
> >
> > Even if it is would be handy, this feature has been explicitly removed
> > for security reasons:
> >
> >   https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a1360385
> 
> Ah indeed, I missed that. Seems like a sane reason to not allow this.

I may consider allowing prep-perpatch-check-cmd, but not am-perpatch-check-cmd
to be set in the .b4-config file. The scenario I'm worried about is where
someone sends a patch series to review, and that patch series happens to
contain malicious edits to the .b4-config. This scenario is unlikely to happen
for a prep-managed branch where the author themselves works on patches.

It's still something I'd worry about, but it may be an acceptable trade-off if
the goal is to make it easier for newcomers and one-off contributors to submit
patches.

Let me make this a bug so I don't forget about it.

bugbot assign to me

> > There could be a solution similar to 'direnv' where a 'b4 allow' command
> > would mark a version of '.b4-config' as trusted, e.g. by adding a
> > checksum in the local git config and checking it before reading the
> > config file?
> 
> Maybe that's a better idea.

We could use this approach for am-perpatch-check-cmd, but I'd much rather not
allow setting this via .b4-config at all for the moment.

Regards,
-K

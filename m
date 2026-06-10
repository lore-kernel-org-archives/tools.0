Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186F91A682E
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099188; cv=none; b=SQCG4mcOEPVWFbxGooGoHCh7JGx49VjSCjN7XXokxJaaYs4D9ajmmCQJ8MaG4LSkqAzx1lsJyQ8aEMNzQP1T628VQBSR2JDHCAI0DpwBHmoTUpJ2FSM1VpaY43U5X9yAyFOCQkaMrHFBczcW9Nfv2fzkFHHlI+mE48heWJ45yOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099188; c=relaxed/simple;
	bh=LWD3JcSbqfgQk2gNYZhgDIDOHZ/fVAyVMPnaRjSvE6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p71+QJFZeajcQaLB+RcA21OiSJf34DUbrCX5A/chmf0sa9bg0QtLyYtbftgKDF7H4zT7HZAg0VRw3h7kLmKSegEC36f7NynU3+j6j98CxiDuU57+SUunnpMW6IBHItS8l5ZWUapXN1xOAfjCBtnG0C8gFtNuRlCxLCGcA+jKRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JusNndTp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JusNndTp"
Received: by smtp.kernel.org (Postfix)
	id CE1221F00898; Wed, 10 Jun 2026 13:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BCE1F00893;
	Wed, 10 Jun 2026 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781099186;
	bh=2Uo/5EdMNCzqAWZ3d3YELnuQVuxfO6Kuut5PwwNzll4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JusNndTp9cKTbLo3bNyKuzs5tueVEiDLPKMHckJ8cpkSB59l1JQ4zdIyFupP3E+Ph
	 UUu6/kL7XeSKnlBqLFV/0kkzuvO2kZ/EHGfNtR2W6VHS/tE1hu3W7a0nau9Lgl2r5V
	 e5SqTI76W/6JW7cpc+QzjWWaGMorsY1Y2jizI4f0=
Date: Wed, 10 Jun 2026 09:46:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review workflow issue with partially accepted serieses
Message-ID: <20260610-influential-wolverine-of-improvement-f01d0d@meerkat>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
 <178104250404.112711.2880594121343252200.b4-reply@b4>
 <ailGd8akixhx_GHg@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ailGd8akixhx_GHg@sirena.co.uk>

On Wed, Jun 10, 2026 at 12:11:51PM +0100, Mark Brown wrote:
> > You can then review it again to take more patches or do anything else
> > with a series that is being reviewed. If you take a subset of patches
> > again, the series will go back to the "partial" state. If you take them
> > all, it will go to "accepted".
> 
> > From the action menu a "partial" series offers everything a "reviewing"
> > series does: take remaining patches, rebase, range-diff, upgrade to a
> > newer revision, snooze, mark as waiting, abandon, archive, thank, etc.
> 
> Yeah, so the not being able to send thanks is actually blocking the
> usual flow - as well as not sending the thanks mail the tool doesn't
> understand that you might have no intention of taking the remaining
> patches at all so there's no way to say "I'm done with this now, send
> the thanks", you can just archive the series or return it to reviewing.

OK, to help me properly model the workflow, is there ever a situation in which
you would:

- accept patches 1-3 from v1
- request changes for patches 4-5
- wait for v2 with those changes
- apply patches 4-5 from v2

In my mind, this was always a "send a follow-up series with just those 2
patches" -- should we even support the workflow as described above?

-K

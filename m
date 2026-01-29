Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A31885A5
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692875; cv=none; b=XsKQUMV6flMnfMOAwULCWmDSaCkYQFBkLMzym9r5HjVlJrAyAZCikBvnMjkuMEmZehui7sV6YpY4rzwYJV/dFsZ68rXw2rQ5fYC8qlnqeoD9vl/05NwnoNLwIWEsrpOUZ5EhJfZEuH2Kcu0+FgDubvpqe9DrokL35o+oRrl5yTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692875; c=relaxed/simple;
	bh=UpQ2eeOl4gtNv7LUMFdCglD7Z+ITrQYOqBdCsZ41Vaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKEmiOHbeCeXpMSRjYkcL0jyMdknXypxCl3O+6UdW7tX+9ihkvicUIMgD2gwpaJDjRW/O0wHcNEuU+UY1EXEa6Kuq2SwxBWRfSxfcrUh0wcP7czB9swLai2j6Vq8krLd/zv/bcgngn7Mp1E6yeSFvnNa7dQoxvhNgiMxnCIf9Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZoQjcgWa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ZoQjcgWa"
Received: by smtp.kernel.org (Postfix)
	id 8CFEAC116D0; Thu, 29 Jan 2026 13:21:15 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 222B9C19422
	for <tools@kernel.org>; Thu, 29 Jan 2026 13:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 222B9C19422
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TmfaSOu9AMVycCsHXVdKHLppsVgB5bI20YAs0Mt293k=; b=ZoQjcgWar4+HUr06Jyj5wduN7E
	hBlW8eRMD7QY5EI1TWvXbnnuxctJDIoqglt8YP16qXgEQaOYaxRuHyiRNm5HRJcHRDwC5sRW+mDf8
	BTP2zLQpbHkjj+sfGVejy29tl/SxY22FTgnImcOYe8AKeUIc6bfIfaEpB+y6+DsL+6T0UI1Pjhh07
	JdrdEVtVcRsB/PDmdpvI3/LO8aMjoy2WD8dhIB1J0D7RkP/dp7+5vpNCrcZQdoCve0u0zx/X/OvLW
	lFA+33LxDbBHk844OQm1Ru+T+R/cq3sIunrhAe635/kRboXgXXwdYRIFcYC9LDScpbQ1TctBo9M7i
	LAVzwqYQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vlRxM-000yDg-WE; Thu, 29 Jan 2026 13:21:09 +0000
Date: Thu, 29 Jan 2026 05:21:04 -0800
From: Breno Leitao <leitao@debian.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, kernel-team@meta.com
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate cover
 for single patch patch series
Message-ID: <aXteOVMUIKNzv2te@gmail.com>
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
 <DG115TDKJFHA.2VQ4J0C51DKHX@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG115TDKJFHA.2VQ4J0C51DKHX@bootlin.com>
X-Debian-User: leitao

On Thu, Jan 29, 2026 at 12:18:41PM +0100, Antonin Godard wrote:
> Hi,
> 
> On Tue Jan 27, 2026 at 1:53 PM CET, Breno Leitao wrote:
> > By default, b4 mixes the cover letter content into the patch body
> > (under the --- cut line) when sending a single-patch series. Add
> > --force-cover-letter option to allow sending a separate cover letter
> > message (as 0/1) even for single-patch series.
> >
> > This is useful when developers want to send a long cover letter with
> > extra information about an issue, and a commit. Having the cover-letter
> > "mixed-in" makes it hard to follow.
> >
> > Example:
> >  * https://lore.kernel.org/all/20260127-ipmi-v1-0-ba5cc90f516f@debian.org/
> >
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  src/b4/command.py |  2 ++
> >  src/b4/ez.py      | 16 +++++++++-------
> >  2 files changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/src/b4/command.py b/src/b4/command.py
> > index 1f8b8f1..0e685cd 100644
> > --- a/src/b4/command.py
> > +++ b/src/b4/command.py
> > @@ -397,6 +397,8 @@ def setup_parser() -> argparse.ArgumentParser:
> >                           help='Resend a previously sent version of the series')
> >      sp_send.add_argument('--no-sign', action='store_true', default=False,
> >                           help='Do not add the cryptographic attestation signature header')
> > +    sp_send.add_argument('--force-cover-letter', action='store_true', default=False,
> > +                         help='Send a cover letter even for single-patch series')
> 
> I've had a different idea with this which would go a bit further.
> 
> Instead of --force-cover-letter, have a --cover-letter option which acts as
> follows:
> 
> * --cover-letter=yes: always generate a cover-letter, no matter if it's a single
>   patch or not
> 
> * --cover-letter=auto (default): generate a cover-letter when there is more
>   than one patch. This is the current behavior.
> 
> * --cover-letter=no: do not generate a cover-letter, even on multi-patch series
> globally or on a per-branch basis.
> 
> I don't know how easy it would be to support the last use-case though, as I
> don't know how b4 is going to behave with a multi-patch series with no
> cover-letter, but since you figured out the code paths I guess it would be
> relatively easy to try? Obviously, --edit-cover would have to be adapted as well
> to refuse editing the cover when --cover-letter=no.
> 
> I do find myself needing the last use-case sometimes, when the series does
> not require a cover-letter.

Why do you need this case? I undertand a cover letter is required for
a multi patch series, so, it can have an easy merge commit when merging
the series.

Thanks
--breno

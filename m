Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616742367B0
	for <tools@linux.kernel.org>; Fri, 10 Oct 2025 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760106896; cv=none; b=fLxMeNSCc9I5ZALFKL8AB7fnY3L3nGWjO1Mnf1h1q3Lp03kOxHHAbCkIrMAm7e8rjiujLCsXTEgUTaEsnLSP7ijmQiKDdOWLA3XD79V0bPbBJsmjzNVaLh7pcRTZrCGeqd5RKWbVkC3FD/nyKN3i8GhmO3TWVmOKjqbmlL6er1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760106896; c=relaxed/simple;
	bh=UzsGphzeSog675cbmBUm00WYSW0XSbal9/OK3IRXK/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjt7BOZPt6TwGxUPRs+Cpt/B/BfoZPx8TQ09REdu2UwlO7XyBuKhGuQSGx0m341zrxVi74aF/v++/NIYB8caXH72LTQHOT4fhGmZDRTRumAxQEcEEfUCtlcq3g5cZ6fli02GTiB2g8Y9qkUiFDiBwTAJJ9nund6dq9/5WVPTYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUGoAm4J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUGoAm4J"
Received: by smtp.kernel.org (Postfix)
	id E9FBCC4CEF8; Fri, 10 Oct 2025 14:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378A9C4CEF1;
	Fri, 10 Oct 2025 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106895;
	bh=UzsGphzeSog675cbmBUm00WYSW0XSbal9/OK3IRXK/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUGoAm4JxPnZ7xl6XIq0hJWt/377dS4F1oc+zOxPTJgzN7jMPVN++DT+VTHWTM7ge
	 QCjQZ9CFyhEuVx0rcpmuID0ORwWW/2CV502LdWsSqALajqaf6CpP/MPWKgAYDXKRp0
	 027Tp0h5T/yrILRC9bk8Sx+Yqo3vHhmFTRX5MTVm7ozuYK24d8o+84fANBdE5Eh13r
	 Yf2yatxfUON20uW8ibzSa8uW7fnrCqbCMc85uWOae/wVw2DEHpTUggAaZeLuDl15Vq
	 CcA8EQJSXDS/8GSu2qr8GgR2WVA0BhksFks+PZaZPqOP48wtW7vq7tHw2AvKHm3XFZ
	 2TfV/K05x9Iqw==
Date: Fri, 10 Oct 2025 15:34:52 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251010143452.GH2988639@google.com>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
 <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>

On Fri, 10 Oct 2025, Konstantin Ryabitsev wrote:

> On Fri, Oct 10, 2025 at 09:03:24AM +0100, Lee Jones wrote:
> > > >  Auto-thankanating commits in for-mfd-next
> > > >  Found 5 of your commits since 1.day
> > > >  Calculating patch hashes, may take a moment...
> > > >  Nothing to do
> > > > 
> > > > Doh!  There should be something to do.
> > > 
> > > Curious, have you set your diff.algorithm anywhere in your git config to
> > > something like "patience" or "histogram"?
> > 
> > Not that I'm aware of:
> > 
> >   $ git config --get diff.algorithm
> >   <no output>
> > 
> >   $ git config --list | grep diff
> >   diff.wserrorhighlight=all
> >   diff.colormoved=zebra
> >   merge.conflictstyle=diff3
> 
> Next question is -- have you recently stopped adding Link: tags to your
> commits? :)

Oooo, yes!  Yes, I have!

Why would that make a difference?

-- 
Lee Jones [李琼斯]

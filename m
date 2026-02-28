Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A38197A7D
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772297831; cv=none; b=VVfq7hJ0mFfJkoWtntNENrbguHAvzXz+PkgT0xn4Uiw7Y0W4sBKQxnPQlbdebobrfHlZ3ifXp2TpP1Uwdg0coaFInbVWqc6i7ssSwNXl2Sg3ppEJiWpZ9XDjihx5vubPiC6hXyA5plsWrdytzQD389pRiF8VBxlgx5s4HAEh7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772297831; c=relaxed/simple;
	bh=wJBigUDBPhgKGvjlG1FkJ7t/306jpBlbX37FCrnh+r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jn2HUMbGaO1Fj3KpscPyt68nOg/7Tx1WwLYfSepjB0B3NrcJGU8LM2hGYxAX/Ni3voN/B0Pt3g//t1Tm8L1NTSi7Sh/gtSD+Qv3ygfhhCmg29KNsQz0WkeFdK3H8evSBM7cUN3X8HUP5P59ekhLl/stNLbLGxs4uLHoAH1/SuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IN+FZkEN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IN+FZkEN"
Received: by smtp.kernel.org (Postfix)
	id BED21C19424; Sat, 28 Feb 2026 16:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F134C116D0;
	Sat, 28 Feb 2026 16:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772297830;
	bh=wJBigUDBPhgKGvjlG1FkJ7t/306jpBlbX37FCrnh+r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IN+FZkENdTdafBGNy2QhKqn0zmxdGOrNOCHQ2Pm14psEMdjqRMr5Li5qcTtU9lw1w
	 3ssyrV6juUMJRj+TDQ/IPA3h5AqhqdHRzPVEmiNI5an9Ke7n4PSOaDV85lbQyOHiVm
	 BnOyU2wZQUSeQSn4HdqGgSGP4VoLR9O/oDppE8p51ogZAHUsWxvmDroZQ1bLzZEYdC
	 vSlg+3mGLVRmiWL21WeS+KqcThGxN3+93Y7m/RaUWPdB92GgCUN13fW2QnPQ3Jfp0K
	 bc5k/3OwzgybpLKYM7DDJ45ETa9fBFWenRz0jStKEcqRqDC4haVJEyangHe0crKo08
	 WcYVmNk8DxWYA==
Date: Sat, 28 Feb 2026 11:57:09 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-unbiased-mature-beaver-680aba@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-crested-swimwear-a57a3060b860@spud>

On Sat, Feb 28, 2026 at 04:48:58PM +0000, Conor Dooley wrote:
> > I put a fix into latest master for this particular one. Thanks!
> 
> Seems like you got half the problem? Certainly predictive on the "more
> places though! ;)

Indeed. I put the escaping into a bunch of other places, too, where we can
reasonably expect [] syntax from subject prefixes and such. Try it out in the
latest master.

Thanks!

-K

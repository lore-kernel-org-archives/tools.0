Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58125391E40
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147579; cv=none; b=Nwh7SNNJ49us8J2ITfcMR9APYiwfLG2ecn/rms3NThAtB9NmhFhqCUk6P9deTJ2BvT2PEVM1k8IsEgGAMZA4AxmLJ7oUI5Cs4u6lUW7aHNc5JhqbLQSI5Eyt7XNVUwWga0ZKF3EnOASBXTGtbcNXh9mFhHnfQ6oitooVC/UFrSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147579; c=relaxed/simple;
	bh=+AtiBMaSkeNs+xvw3qA4SivxnTKsHWjM9+KTuHCSgrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqWKlLqshmTjBw04eYA8N9Juh01MGi7bnxSKUEiVJkc0+LyZHbaGa67Fx4wKALSMNSa8M4FqHmrWuKibbKeZBxp2XhFrR7PjhvodZ34mszxFcRSWJ7pGAlckQEqVmsK41Fh5322WkDzAqlyk/jpA24/xsBj36wEvaqheOEMMvMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PkozhtkD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PkozhtkD"
Received: by smtp.kernel.org (Postfix)
	id 0EF0AC2BC9E; Tue, 10 Mar 2026 12:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0736C19423;
	Tue, 10 Mar 2026 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773147578;
	bh=+AtiBMaSkeNs+xvw3qA4SivxnTKsHWjM9+KTuHCSgrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkozhtkD9Mtt4Z/NhUbjhEuneKY+Ynef/BfMd235EBgg0/AKFRWST681LISOejw+G
	 xuc0h9wR71LO8m4J8rvHwj/oMW0R2Au15ys0wIk3HB2BraviRaKt8iqoVVA9LdSmBL
	 bqaYj4flSsRWNZ4UQMb39LTFkBRLrmQK0FMb0S40=
Date: Tue, 10 Mar 2026 08:59:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review handling when base can't be guessed
Message-ID: <20260310-strong-copper-stoat-5de7ee@lemur>
References: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>

On Tue, Mar 10, 2026 at 12:49:41PM +0000, Mark Brown wrote:
> In b4 review tui if the base of a series can't be guessed then when
> trying to review you get stopped on a screen saying "Attestation check"
> and in the dialog "Base: not specified (a/b blobs match HEAD)".  It
> would be really helpful to have a flow for specifying what HEAD to try
> here other than quitting and doing a git checkout (which I hope works?).

It shouldn't stop you there -- you can still "y" confirm and try to apply it
to a best-guessed tree.

However, let me play with it and see if we can also present an override for
which base we use in that screen.

bugspray tag b4/review
-- 
KR

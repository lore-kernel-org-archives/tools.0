Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9C3ABD80
	for <tools@linux.kernel.org>; Thu, 13 Aug 2026 18:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786644292; cv=none; b=rLcl2+Dz6Af9IuDykbhTYa0TlxLRFxwpVgFkkmhlrXVx/l7J34GuKL2cUmRxXbIQZYE8vZedkGh54viiGnDUhBFMHbfugkmOwQ7b5VwsYH57zS10XqL5CDiq6rxr7AqDDgh0p0keS9QO2yZfWfdtm4CVDdP4pGBKRcUpEG8Mw8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786644292; c=relaxed/simple;
	bh=S82jjuu1gi7iKhJ3NiG1bG2QxtZ4LibpzvOWR51FWoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvSxBFuO+KqslD9h1tGvWS3dvQBl3CsmxhZNC73IjNZWhr1yZbCsQtQCdejNclzzx980yRB0T5Qs+JL2qicmqvm/dl+DlgMGqdqtbilYK4SbJHemHygSNUOYJ1mV8uarOkCRJOoMEtk5LRszFrm4WuS3E/hLXMH19qkMjIwC8GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pS3Cy3zt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pS3Cy3zt"
Received: by smtp.kernel.org (Postfix)
	id 0DDCC1F00A3A; Thu, 13 Aug 2026 18:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829751F000E9;
	Thu, 13 Aug 2026 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786644291;
	bh=S82jjuu1gi7iKhJ3NiG1bG2QxtZ4LibpzvOWR51FWoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pS3Cy3ztE9IkGCE6SsAGIAB4QWctgf+y4wkgY6/m1MuSoiRctf/zo0g0W7Uo7nIM1
	 B+85mEF5Xj4gMUGzJuirhTGX8N7gOtHqFRwws6guyoOX8itWzgUqtIxHj+4SJzFTn9
	 8Bly+ugRQwAR9tmTEjVIgQKryL91eXQXYIU4UqPQ=
Date: Thu, 13 Aug 2026 14:04:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review crash
Message-ID: <20260813-rigorous-sawfish-of-protection-1aecb4@meerkat>
References: <1bcfac04-3a85-4d8d-a0a1-094abe5dd807@sirena.org.uk>
 <20260813-athletic-therapeutic-armadillo-cdd2bf@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-athletic-therapeutic-armadillo-cdd2bf@meerkat>

On Thu, Aug 13, 2026 at 01:35:44PM -0400, Konstantin Ryabitsev wrote:
> I'll add the fix.

The fix is in now -- it will pop up a warning message with an override option.
Please try it out.

-K

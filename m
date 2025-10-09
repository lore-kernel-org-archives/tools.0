Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4F26E6FB
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 20:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041321; cv=none; b=cXCVXh2ubED573diwVzF9OOeWeGIjPjk6FwYGVxoTokWwGCKRQLRS4EnVZwSE3mPCnVSasBYoxJvE/Qns9cJLochSzPRW61RQ8WO3rRezC63z1yPtA6tA/dUFOMJjbhJfjomCRmNwjjZWkyZzr9CoBTLzbNWCkUUGbBhIOsNkjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041321; c=relaxed/simple;
	bh=H/lm1fEasxX/LAmttefs9DCPeCTjkkh7E6nq/COmfMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb+9sm2UJ/pPGimwEB0DpEg/20vYyH1pcmLdCLQ07en8EWQ7cYZA+JMydRvkrYGQRFuM50+2/t6/snusXzdXgqz0cFDI2ABFB2HCS+iT+S9IWp/hIGvvfoxakS4tff/piXfgdkfvVZmFd15LcGxjs8uLOcWc3M/OFChTlYJv37w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z02eg/Ks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z02eg/Ks"
Received: by smtp.kernel.org (Postfix)
	id 23779C4CEF8; Thu,  9 Oct 2025 20:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3D7C4CEE7;
	Thu,  9 Oct 2025 20:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760041321;
	bh=H/lm1fEasxX/LAmttefs9DCPeCTjkkh7E6nq/COmfMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z02eg/KsDReX9qvDDuTzIUV1eB409a/twq0XDLV7S2uswItlTyklwZiyoKTuKpp8F
	 QHIzfzDBPynAhiLUG7l1b2toq8uPqmFVIFAlOInN6q07Nr2zAj5LS26OmNgU1pOIlO
	 bhbeThayXcabeCfms9pVE8MgQHydS4e53FF1btc0=
Date: Thu, 9 Oct 2025 16:21:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH v3] b4: support send-email aliases
Message-ID: <20251009-space-porcupine-of-lightning-1086aa@lemur>
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
 <116c58cb-8752-4c6b-95ba-48b30e3aa23b@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <116c58cb-8752-4c6b-95ba-48b30e3aa23b@intel.com>

On Thu, Oct 09, 2025 at 12:49:07PM -0700, Jacob Keller wrote:
> > This has the following benefits:
> > 
> > 1. If the same alias is used in 20 patches, we're only looking it up once.
> > 2. It'll be automatically used in the following block of code without needing
> >    to modify the addresses list here.
> > 
> 
> One other issue is that this means if you have an alias, it will not be
> covered by mailmap.
> 
> I'm wondering if what we want is a separate ALIAS_INFO instead?

Ah, hm, you're right.

Yes, go ahead and make a new global caching map. It's very unlikely to be
more than a few entries large, so the impact should be minimal.

Then we do want to run through the list twice:
1. first run replacing aliases (new loop)
2. second run checking against mailmap (existing loop)

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE02347BD7
	for <tools@linux.kernel.org>; Thu, 21 May 2026 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378185; cv=pass; b=WC5laJrDCiJ8z15WkeCFUrwvR+ZrcIMWvrgChyumty/4rPvtKG4gfKFwAzGRLpKfgcEqMl4C88eWdGB4kh+556ZTBgw/lX+iGOmjE4UOUVSzQq2CfYSQbLjKfFwRuJAcoZ8uN1ckdV2gYWYb8LFtFj/SuFSoR4/0OWo2GF1wSts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378185; c=relaxed/simple;
	bh=GxTMTtwqwgkYCpYEi0mKqXUgJIxALZHUs8yMjcWcFpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVYemm6eeLn5knnX2EQycZOHMsC5kI1Q+z6iua0CSsuRLo+GanEYN2pFt9IWQ7TDZmCneyCJjDZWLntqff0TT7IxQ5VrO5CBEvHbVl/NxZ+EesnYzAf3sy0W7wx28PEo/yuSghooOh6iyfgQ18eLZqg83ATIUJ8yDo/OmX46gKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=S1tQzJDF; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="S1tQzJDF"
Received: by smtp.kernel.org (Postfix)
	id 055BE1F00A3B; Thu, 21 May 2026 15:43:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779378182;
	b=JtZWL7PYhaP7Ffdb3gb2eS14qSag1BwUGlr1BV6owNnUdJo9wjQSCTr+bgCgeR1q3qg/
	 gYabgUZPQV65gNubbVVgipyiPLqZ8WyPcNYHK9po3bhC7o6WfrB6VSF3fuA/5mNU6f0ip
	 TfVjXXbSOn1RpMZeJBj48AI3M1ZZy4g/4AgqEC8e2MaaMtyG98dXcPmGdXLab97ZcmGdk
	 /E4lF258zVwBLALm0m55Ow6HTJnlQE2n5w5hzYAjXL4AmA3jKiZQ9+Lai04pOQ4M6QFxD
	 5G9vKJkReDSvKMeR9sx7FnszFZi9Q8bhxrnCBxDXxNiGU2v/zR+kJIxnSNNkri0QG7w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779378182;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sJ7VQVP+8eMOGE2/xX1jZzCOQ1EVPVY4Z30iKkFyxi0=;
	b=JqVDaqLNMjr0T1EVUo2DLw93fC6ittEen1i9+uaAcDA3kxEW31TvhvMxpJUwMAwKBRtP
	 BCn7+zcSJonin05VGasdWCpQYYmRi6j95BTVm6mkII18sy57djYjkcQUwjLtlUs4sscjT
	 hQ3zVIYWYT7JImtJUWv0sDHezPkvoiIpon3vt+93Kxpv4ydyBLCQj7fki8dze+ha3BW6+
	 M0aLcbk+1qJbemQWYTNVjJ0r67uahHHVn+boR1mFkqF69FfDiI/XUJs7Y1sw9NQtkFxK9
	 xGU71r2Rzv5/WEmUmUpnOHYXlGMDRzhndkR/ctAWxCKjQsR0Jaylq/6BsHuoASSxR0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=S1tQzJDF;
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 590D11F000E9;
	Thu, 21 May 2026 15:43:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=S1tQzJDF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 590D11F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A138C40E01B3;
	Thu, 21 May 2026 15:42:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1wAP95qS8JXz; Thu, 21 May 2026 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779378167; bh=sJ7VQVP+8eMOGE2/xX1jZzCOQ1EVPVY4Z30iKkFyxi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1tQzJDFlAcHDbfhwQpE9dqgslk/KCaXki8Bx4FhnIWllrirWGLHjWGZRNL9vhw3F
	 yim7Wf8XM7V3NUEiP3njaVyZiBq1rbeTtA68GtBWobAorbHWVDds9FcvwbHSGj/5NZ
	 PtRcIXEYnBCIgXhF/9ha/JqS5hn8xddevF6glu+XcVwCzHOOpENue5ZYjNVsBbrpHN
	 Sd5OEvII8/1sBMof893KyehnVI8SnpDCJzwVOtCUHiKTdDFwNI8EBRK2jDUNJoEOhw
	 02PgKhCUs/8LpeokvscayrCaOfK+9mwHeBHu6/majD5srDRwxJhoQQRRQb80wVpFWG
	 VMhER5mcBbQYqzySMIR8JDflBXqRVRCgNHglmk3r9AzZC4z4YtUzfkWa0Tcd5hXs9n
	 NpnGnFmvAcD6X9zlGvKjuet5BvF0hEwbO/CeJ4wdgIfiP0WU/4ZY5IdmGVLzSLk4Ry
	 65WnWxMtM36Z5LtSrtqSamsJa5R/IaMuqHRukvtfOmbdJ7ZN4ksPmxG+qFpuUJwWMA
	 JWwPxAwUgg7ovF7RRM4U6DiLcfzwkwJ+nJc9i4NzMHE51+w0G21O3fJ/GOU8u7he6y
	 jRKy1K13IGhPCTHZM+je+5FtZNUiYkxLn+7K+gt17YXKnCGdHzt+RykelLVHHFei+B
	 BvJPXKE01YYYDhuyFVfgH+js=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 64F7140E01A1;
	Thu, 21 May 2026 15:42:45 +0000 (UTC)
Date: Thu, 21 May 2026 08:42:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260521154232.GAag8n6HItOIrVPd5o@fat_crate.local>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
 <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
 <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>
 <20260520-determined-emotional-porpoise-1cf7ae@meerkat>
 <20260521035853.GDag6C_Td1WFqMjFro@fat_crate.local>
 <20260521-chirpy-hot-cassowary-5df4ff@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-chirpy-hot-cassowary-5df4ff@meerkat>

On Thu, May 21, 2026 at 10:31:44AM -0400, Konstantin Ryabitsev wrote:
> Right, a maildir must, by definition, have these directories, otherwise it's
> just a dir. We're not currently handling the situation where a maildir is not
> strictly valid, but I'll consider if we should.

I guess simply warning that you're not finding the expected maildir layoyt
would help against crazy yahoos like me. But meh, not important. Prolly no one
else is doing shit like that anyway - only me is sticking a stick in the
"machine" and saying, uuh, let's see what happens if I do this.

;-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

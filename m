Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846E7198E7B
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130657; cv=none; b=ObTX43OqocVlVGYaO+pb/Q68TxUKnY+n0VQa5Jcrnu392g3kT1xXfJv2ppeGZvwukkTtw9EhI4XVHl6qp1wz25MZ4dbpma9y43QxqPxsuZ7mdmgkTmoZtl8VUVMCwRP13Y8jBN2fylrHvgbiuLNgStIyduHOFi+UE/nkfWM0WNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130657; c=relaxed/simple;
	bh=wC8aZ3F3Bt/MIvwniH/J4rL9fHCnyUNewRVXs0LtBFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3V4gZhhiSutaHmv4aaiVoVviOOMc1cb8IrAcZksPXlamA3OvDk217f0eL1Qri2d9NTQd8Q+OuuqOGOEX+63gJVhWOaeMPprWuldOrMOJhyzO4jFp1/P920DEZmp4+2ThklNwLt7tbl6IcAFRWpeJivXaN8dl8GzWRjsMPweYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q38xnowf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q38xnowf"
Received: by smtp.kernel.org (Postfix)
	id 19F98C4CEE2; Fri, 17 Jan 2025 16:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F0DC4CEDD;
	Fri, 17 Jan 2025 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737130657;
	bh=wC8aZ3F3Bt/MIvwniH/J4rL9fHCnyUNewRVXs0LtBFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q38xnowfrPmrpZNcIXnarIVBut8efyZoMzHPE7fVHYFORZMqRFhYNukLdG5lN201o
	 NcR9WLeVGA7nkLquwmDlIihiFltI7hx6VB4tiyRZ81H2dluQhu/N1LAExKXyDjdxhm
	 +8NXiqT5GUy4n6/i86VLhSSPy9i6O43LPBf3GWPw=
Date: Fri, 17 Jan 2025 11:17:33 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4] prep-pre-flight-checks doesn't seem to work
Message-ID: <20250117-practical-avocet-of-novelty-9dff8b@lemur>
References: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>
 <20250117-ambrosial-interesting-trogon-a67628@lemur>
 <8f22b90c-3216-4eaa-abf5-85dc29625e4f@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f22b90c-3216-4eaa-abf5-85dc29625e4f@cherry.de>

On Fri, Jan 17, 2025 at 04:49:36PM +0100, Quentin Schulz wrote:
> > What problems are you seeing that makes you want to disable pre-flight checks
> > for everyone?
> > 
> 
> We do not have checks nor auto-to-cc commands, so there's no point in
> telling the user to run b4 prep --auto-to-cc and b4 prep --check before
> sending the patches as they'll do nothing.

Okay, I'm more inclined to treat this as a bug, because we shouldn't be
invoking obviously irrelevant pre-flight checks. I don't advise turning it off
entirely, because some pre-flight checks (like the dependency checker) are
still valid in your case.

I'll work to better recognize when certain pre-flight checks are irrelevant
and disable them automatically.

bugspray tag me

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFD3FEB17
	for <tools@linux.kernel.org>; Thu, 12 Mar 2026 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773339433; cv=none; b=JsS3g3k7Z8GQBccE/km1ZsoPLNIKEMPWju7lmtrXy8g2E3UXgJEct+63/Fm34s7GZVyll+RbRB9H9Jr4kp330SW0t/kaI5gBMWCR0A11+hwme9KvIH769iiTySpM1z19TvLMsf9yBH5EPrxOI2OLcBH4AYtTFD6WfY5X99HuVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773339433; c=relaxed/simple;
	bh=aHWYrMdV/Hv+p4AAWaqovvBtA5LuIEZ9OPtKfi8fl5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plhYkn5A3FDT/hdsgym2y+tT30/+kBxAOiq6kHQ2xb0bjwLx4E/A9Y39/lYqIdJrCiLkM9//AOqBmBkzpOSqCXQl8i3XVedM+xmwFr0ZcwUicr2O1YNrClYReY6psFBMyax3oKgQpM4rPwJ5XRvpn52xzye3WIUf5tFdy0Skz3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXyBdu7B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXyBdu7B"
Received: by smtp.kernel.org (Postfix)
	id 28170C2BC86; Thu, 12 Mar 2026 18:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDCBC4CEF7;
	Thu, 12 Mar 2026 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773339433;
	bh=aHWYrMdV/Hv+p4AAWaqovvBtA5LuIEZ9OPtKfi8fl5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXyBdu7BVkXpJjfjWA7hl16yDFPlQA162xKZh2aTjld4Zw2BHRX8gjJ9MK/M0OAKh
	 7nicgF6L0qqHyZBpW5YUIMFWRbvocK2eleUYuIuqtPtlifZDr+Ct3UIVW5HJRd5XXy
	 ocvb3+pmV22wwvEhmPXiK4e1fzkNq7G2/OxDBgMjGb8wQYssMy0fA8Gv322b/or5x9
	 3qKdQm26LilT97Vka7B6yAGPfnDV/FXeLbknSsn7v2G45zuwYwk3a0iJvHx6dz5rfO
	 QrdIein/ypIpoXxjT9bSJNBn/nF3sg7aho+58vsEDBg73WWuPlgd+ESHsUFoBPfZDy
	 XGBs9ELdSa03g==
Date: Thu, 12 Mar 2026 14:17:11 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Editing commits during review
Message-ID: <20260312-nifty-ultra-koel-30d3b4@lemur>
References: <182ee3cb-af98-4602-bddf-a2419e7add18@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <182ee3cb-af98-4602-bddf-a2419e7add18@sirena.org.uk>

On Thu, Mar 12, 2026 at 04:44:21PM +0000, Mark Brown wrote:
> I can't see a facility in b4 review for editing commits during review,
> for example to fix subjects or remove spurious tags (Fixes: being a
> common one, lots of people seem to just randomly add them).  There's
> shell mode but it explicitly warns against edits to the commits.  For
> patches that just get applied you can fix up after, but that's not so
> good with the merge strategy.

OK, the latest master supports the following workflow:

From the review app, go into shell mode ("s"). This will drop you into a shell
with that branch checked out already. You can run "git rebase -i" and make
changes to the commits, including making light edits to the code. Just don't
rearrange patches, drop, or squash them. After you are done, you can exit the
shell and we should be able to find everything and remap commits to patches.

I only lightly tested this, so please review carefully.

Regards,
-- 
KR

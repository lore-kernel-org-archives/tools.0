Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091C1DFFD
	for <tools@linux.kernel.org>; Fri, 12 Jun 2026 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296337; cv=none; b=KUhhu2F+yg0t6djp/WXiWYC2VfwWyEtc3uqf0VUbg67utZS6kEasVnQjLg+bUMMQ+6Gw8NOn29mFs28PbzW6fbJgyHUUoXV/EusskLeTSces0pmCJTkeBRdGjX5vNatDiyzQc0oQTLnjReUT71kv9oU5d/Gt2q6yCZ4+sUU15c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296337; c=relaxed/simple;
	bh=pJbUfG1nX9VVVyL6KdX3H/yc1WoSRcFJN3AlwgFqZIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwezzcAZNZ3k1guT8SC4Id6cL97Qc5GjrQiFATwmXoxXcAoToRLvxvv5z5H13BaoAAwfb/wnhxetxVae22IU6KdAxpWnEYG+SPG4J3sAjAZsl/gTXxHcZ0OSiYTZLBmvOccmIzcuh4D58vN4ClwSlaKxt2n4ezpjNe1NSMQEJpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BcDtRpU9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BcDtRpU9"
Received: by smtp.kernel.org (Postfix)
	id 192F11F00A3D; Fri, 12 Jun 2026 20:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAE21F000E9;
	Fri, 12 Jun 2026 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781296336;
	bh=s1oq/Iupibe0Z7G/5bs7cGZewX+iUqalTbMjg1jZneE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcDtRpU97iKOH3TK6WAv4mqHhhC7C3SVxW9/Po5c61RLENLs25UktAUyfSbeLSTsw
	 3a5OSte+bT25XwTrm2aBAQanO7eoolZx8w4CHLlQcYuFDZoLDGVqKgZrNDnTu3EkQA
	 1OcV37Rl14CzaS7PRRKieyaGX5qOzqgV8yONwHFQ=
Date: Fri, 12 Jun 2026 16:32:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 pr fetch refuses to fetch already fetched branches
Message-ID: <20260612-optimal-snail-of-ecstasy-cf37a2@meerkat>
References: <aiwCjkJ7DWAAD0yf@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiwCjkJ7DWAAD0yf@sirena.co.uk>

On Fri, Jun 12, 2026 at 01:58:54PM +0100, Mark Brown wrote:
> Hi,
> 
> Running b4 pr on a message that mentions a commit that's already in some
> local branch nor (AFAICT) sets up to do a b4 ty for the PR (which is a
> large part of what I'm looking for here):

You're right, this behaviour was not very useful. I've pushed (really!) a
change that should make the checks more narrow and only bail if the PR is
already in the current branch (or the one specified with -b). Even after it
bails, the PR info will be recorded, so you can run b4 ty post-fact.

-K

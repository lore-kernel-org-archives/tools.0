Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA433C279B
	for <tools@linux.kernel.org>; Fri, 13 Mar 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416535; cv=none; b=OdrSmQnsMkKc0JOuJW0+MlWjwO9wegcVSnerGzz4ux+HrhoyO/LAliXw1e1soohLjz0iIxRPHEPRCz2Iwc1CuFmfZercaOJpInUH/QYwuorab9A3jOUX8KkBkPXMk0SUIlGiQqAzZPwI6zL1AkAaL3xhOOw3nQBnCsJWH1wGjvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416535; c=relaxed/simple;
	bh=YWMk5A3M+t70v2mBbKyPCVEZ3qwa/arOkL5InQ2jQg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpehhoeiOToyx+f1SQdTDeQU1TpDzGSF2BuzQ8AnVC+TGHagCiV8xNM/hpVSlF5jMBBB2q7RcIKS6ZGGZCHqKURZdoy5f5nXjta7HE/11AFKKCJD27tRpmzgeYkxpSKg5vZu+K7reAX8/NwlDwR5AWvv8RHdUZsvg/4/nJ8XafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4bmDagK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4bmDagK"
Received: by smtp.kernel.org (Postfix)
	id 4EE9DC2BC87; Fri, 13 Mar 2026 15:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1133EC19421;
	Fri, 13 Mar 2026 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773416534;
	bh=YWMk5A3M+t70v2mBbKyPCVEZ3qwa/arOkL5InQ2jQg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4bmDagKKA71R0mEJU+Fw3mfJo8IqayguX2SnqnAi4zNuEvMUVkZky9g0tyHrIgmY
	 LJn/Ojq52dA7oFHikiB+0NkHV87bcKEgC1a79kEq2QoNr4z4myccYasjDyvd2KpyzC
	 NM5bySfEDK0FNRBbXTchDNYsMMxjQ0gdgwAIlhp7BlKnOStiLtDBvm3XLLF67DaPsY
	 DLyR7jg90POFylRaH6PSQ9OXQIHs3L2z18UtIlar+aUafiDZXpeL4IgS3k6yyJATX3
	 wiE9e9IHeeL5AROzDkqP1EtD+olvMhZH7oY7V0a4ODcDhLjU1MA4iVDGd2tXMvlh+P
	 95meTEtrynaAw==
Date: Fri, 13 Mar 2026 11:42:12 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260313-poetic-mosquito-of-sufficiency-2b8a86@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
 <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
 <20260303-true-glaring-raven-e78bf2@lemur>
 <20260312172156f5cb4041@mail.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312172156f5cb4041@mail.local>

On Thu, Mar 12, 2026 at 06:21:56PM +0100, Alexandre Belloni wrote:
> > Let me know if that's not sufficient. We can also give a way to hide skipped
> > patches so they aren't even in the picture.
> 
> This worked for me but thank-you still tried to thank for all the
> commits of the series.

This is fixed in the latest master.

> Also: I used cherry-pick, would Linear work?

It always uses linear for cherry-picked commits.

Thanks for testing!

-- 
KR

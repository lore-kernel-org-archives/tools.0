Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4442E7F20
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 23:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491488; cv=none; b=uumB2ifLTQTwrkk4YmLzIw4ptB1zGN0yLjFCRXUSjf1WHel3kTLM7z3yEbBn8NACOjHTIdXuFzGM1WfkT6eDiUW8/0gUAga8AJgxviJeFCO5qjapiTTTtZ7A9kc4dTcC9vUHbxrSKEcdCrCXSXUtHefYeG2QrOQNqGb1lJ9IHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491488; c=relaxed/simple;
	bh=jID4hLJzv23g9rMdK941xlhH/O1OswuIuD4p1D6/ZyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nun5dM7Po+BqPcjwSFkN47hiEgMID9hJZDvcl4Kl/eZOyp+cktVuLVWozI8E7S21jShUEJyq+TR1wZgLHBsytNNmo6iV9r5ckyDYXytKhG2RtaLWIxkgzFCr7eQ0EuBRer2bqKUBYAEgAFZchccEYIiJaqlvjmQ30fXu4D0nZpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JytGt1aE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JytGt1aE"
Received: by smtp.kernel.org (Postfix)
	id F20F31F00A3A; Tue, 11 Aug 2026 23:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906AE1F000E9;
	Tue, 11 Aug 2026 23:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786491486;
	bh=XDqfawfq4YomDJ6z6EC6jhBEvKzeRHvceQEDP6SQK7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JytGt1aEHbSvKZd2a+5YpR2XBQa0ZFOpfq9u6spClEFX1+bJS9QJwjZfxpPuGgGQd
	 Vfd5oyQfYtWOsnnNamP/V+LMhCeVcPzQDDyuCTQANtH7DQItBgl9XAFvsovM/wc68P
	 OZdB2y5POYhKiGk9VlzY01S/FSdDF1HsJJpB4ZAQ=
Date: Tue, 11 Aug 2026 19:38:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review misses a patch
Message-ID: <20260811-maize-whippet-of-plenty-9a5b30@meerkat>
References: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>
 <20260811-spicy-woodlouse-of-joy-7fa3fc@meerkat>
 <20260811-beluga-of-theoretical-engineering-5ca1a8@meerkat>
 <7b541824-f3f1-46cb-a50d-32bd88068c57@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b541824-f3f1-46cb-a50d-32bd88068c57@sirena.org.uk>

On Tue, Aug 11, 2026 at 10:38:15PM +0100, Mark Brown wrote:
> > This landed in liblore, so you will need to run both git pull and git
> > submodule update to see a fix for this.
> 
> Hrm, that doesn't seem to have worked.  I wasn't actually using
> submodules, I had to run 'git submodule init' to even fetch them, I'm
> invoking b4 with:
> 
>    uv --project ~/git/b4 run --extra tui b4 
> 
> but even upgrading all the deps with uv doesn't persuade it to upgrade,
> I think it needs a liblore release and a pyproject.toml update?

There are ways to make it work, but I think it's easier if I just release
0.8.2 so I don't make future upgrades weird for you.

I'm out of daylight today, but I'll fix it up tomorrow.

-K

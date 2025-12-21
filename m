Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC453002BD
	for <tools@linux.kernel.org>; Sun, 21 Dec 2025 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333413; cv=none; b=Kmlal/BA7ZXP6LamixFoAOcsT+pF+3ZUlllrO4aLvVcUnxJaGcpJfl07yC89qu0Zanh18k1myy5+WrC2+Q+zyrlk7QEy7ASoQK9ukHgrG1Zf9Br4t3nR6DPCJ2KrDPP75OO3RQIgJK4eG5bFK1BbJcCV6z7vL+M0Ck7e14iKN2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333413; c=relaxed/simple;
	bh=RgyR/fYSMFCfyRnba1sWYF1OdxEFjMCotBKb3V+PNlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgdslVA4/ZBUxYVQNlf6ZqzxtJhSCFr97GVaI+XSeuhyrGj5z/jfngDsFjcwmJjFGRQasm3zU6zkp6wYAfz62Oojojkz1qB7IjKk8Gk7HQZ+mjKBpllcyZ3b+PP4zsTRIv/39M+FoPAK1a+5yEW3+oR1A69mAISQj/NET7OGw/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lP1sJe36; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lP1sJe36"
Received: by smtp.kernel.org (Postfix)
	id C1B10C19423; Sun, 21 Dec 2025 16:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A3AC116C6;
	Sun, 21 Dec 2025 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766333412;
	bh=RgyR/fYSMFCfyRnba1sWYF1OdxEFjMCotBKb3V+PNlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lP1sJe36rih0m4T2VdQSfEyHwBh4ceFxQ5v9OKRdR8tOFjbz4aBR6QVmq3vQmmNL1
	 7jcydicThdVY2+ijH03tehsmD1NSrG0SuF//FeISiudapul+pwH1rKefSog2ZaFK5d
	 A9c2lEysq4YSogX8GE/9k+OLrgAPA3XEGkZb/VG7pSc/zc4wlv53/2P9UU9GpYWm+G
	 xxkK6vOV96g5AwwFwb/BhThk3XG2JJC8sOYPqFeyVQwVe6m/LgfUBdgVFbltItHq/e
	 jco1cO1Qj48kjEtVXckxX5OYFFH3OWYI3HzWgC4eQN6dQe1P9HngO4vpU0Tix5gtLM
	 mhqWvDS2Tb6Gw==
Date: Sun, 21 Dec 2025 11:10:11 -0500
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	broonie@kernel.org, sfr@canb.auug.org.au
Subject: Re: [RFC 0/5] LLMinus: LLM-Assisted Merge Conflict Resolution
Message-ID: <aUgb4wCNaSxpIhPp@laps>
References: <20251219181629.1123823-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219181629.1123823-1-sashal@kernel.org>

On Fri, Dec 19, 2025 at 01:16:24PM -0500, Sasha Levin wrote:
>Another point raised at the summit was the value of linux-next's "fs-next"
>branch - filesystem maintainers benefit from having their own integration
>branch focused on fs/ issues. Currently, creating similar branches for other
>subsystems would overwhelm the linux-next maintainer with additional merge
>work. LLMinus could change this equation, enabling more subsystem-specific
>integration branches without proportionally increasing human effort.

I've been toying with this one for the past day.

I've started by letting LLMinus learn merge conflict resolutions on linux-next,
so that it could use it as references later. At that point, very little is
needed to have an LLM resolve different variations of the same conflict (that
just appears different because we mix-and-match various trees).

I assigned categories to the various trees used by -next (see
https://gist.github.com/sashalevin/163df4ae1163e0e22a97edc40e14b7f5) and built
a simple wrapper script to generate per-category integration branches, letting
LLMinus resolve conflicts whenever we hit one.

The resulting branches were pushed to
https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git/refs/ .
Each category has a %s-next branch, and a larger all-next branch which merges
all of them together and is the equivalent of linux-next.

Please let me know what you think!

-- 
Thanks,
Sasha

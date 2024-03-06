Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49E1386A3
	for <tools@linux.kernel.org>; Wed,  6 Mar 2024 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709753744; cv=none; b=YLVxBBzBi4kidKwu/vnWBJdi9usVVKnU9dIFZUf21UVHv3qoVorQkD7WSCZxLSxsdyK6mmiOqCk9le8PnpMqfQlBSbufQ3wfslHrsQ/BsVyNyDrQBRYrniBMbntaaLe6w5kB7UGeO7nTC4jFarDy65TaTpJlfoYk3kvWJCIgf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709753744; c=relaxed/simple;
	bh=BEM6Oge7mM9nZXNqPHG4WJs3VOMDPrFuqHbNfwNx33k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhdT5q5Bw0sQH7Z7VBLDCAImiyLN4WA5LJgdQKv0oGPfErl/eq/drYWCyhYdiFVkcvpVxhge7REW7p6/z6ctsxEHwJWl+fe1u2jtImgsRj3AFdwWpphsM2gSq3DWETbuwPSiosCFPTxE0Y3GpCdoVHpDv8ntjlttrgwTrzwK9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I4yGPxEI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I4yGPxEI"
Received: by smtp.kernel.org (Postfix)
	id D50FCC43390; Wed,  6 Mar 2024 19:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D527C433C7;
	Wed,  6 Mar 2024 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709753743;
	bh=BEM6Oge7mM9nZXNqPHG4WJs3VOMDPrFuqHbNfwNx33k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4yGPxEItDzpyX6Td7EPuYA2PxHKMtZccefSaPmLrb0ewWJY39knhHruPZK67wiyi
	 vnTiIIPSrqlrvS2qzPqR9S+T7TKfOb3+wy772rEUyPDZuOXIvl+Aw7LfPxKaA07n8m
	 yEzMkfWM2JQ4lALu2b1C8Fz1XJPgD147VBYpMyX4=
Date: Wed, 6 Mar 2024 14:35:40 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: tools@kernel.org
Subject: Re: [PATCH b4 v2] b4: add shell completion via python-shtab
Message-ID: <20240306-crouching-notorious-toad-acdafa@lemur>
References: <20240301-shell-completion-v2-1-741c88669859@gmail.com>
 <20240305-obedient-centipede-of-finesse-a35a86@lemur>
 <CACvgo53keELtth1xAapQD91EDrZrdK3XVVeVSVE+NX1cygnn3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACvgo53keELtth1xAapQD91EDrZrdK3XVVeVSVE+NX1cygnn3Q@mail.gmail.com>

On Wed, Mar 06, 2024 at 12:03:31PM +0000, Emil Velikov wrote:
> > My preference would be to go this route, because it doesn't create a new
> > dependency on shtab but still lets packagers generate and ship the
> > tab-completion content.
> >
> 
> The above solution can break in a number of cases and since there's no
> CI, it can lurk broken for a while.

Yes, but the same is true for any number of other things. Since this is an
auxiliary feature, it's not really critical in my view.

> - path changes from src/b4/ to ...

I doubt this will change again -- I just did this as a large breaking feature
to make pyproject.toml look less insane and I don't expect to do this again.

> - parser function is moved from command.py, or command.py itself is renamed
> - parser function is renamed

These are possible, of course, but I doubt they are likely to happen. Even if
it does, since it's an auxiliary feature, I don't really worry too much about
introducing this regression.

> Does that seem like a reasonable argument, or do you prefer the
> standalone script approach?

I still prefer to go with the CLI solution. I'm going to commit the script to
misc (giving you proper attribution) and we'll try it out.

-K

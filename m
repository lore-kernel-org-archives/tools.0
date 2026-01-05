Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F33090C1
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636022; cv=none; b=uxFhul0LKvS3Gdd7dBY/Ls8RYck0YUkhVCHZrQvV7mvL6IZgYwmHfhG7xeHU19SvfehAQHaD2W0pDQJNf1wATUVUOvFJR9XVoJ2VP4IFpsxTSUwbyFzfMExDvQDyudO5vIiBgawQOu2FLZFQA9kvvITc6N3p1mR1eZd+jmChwFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636022; c=relaxed/simple;
	bh=c+gsHTxWOkaY0YJjVvddpMyoWsYDjFB8vVtDIr71i4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxHgAvlXO5QqRzaa2xcSsupFuYYzx2/ES2/30yTy1pCrQb6mttns+tMOcM/cFsvIoh1eb5KVbZ/lRm7jydKj1EE6qCfFiyN+zsTSEAHZzuPSda9aaT0KzGNplx+CrObDalGfl2tmDjYGKOK7xEQV4EBgzWcGnDeSPEuioJTC8Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eoo1h29v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eoo1h29v"
Received: by smtp.kernel.org (Postfix)
	id E1987C19421; Mon,  5 Jan 2026 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C2AC116D0;
	Mon,  5 Jan 2026 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767636021;
	bh=c+gsHTxWOkaY0YJjVvddpMyoWsYDjFB8vVtDIr71i4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eoo1h29vWGAwyNebwV4f9l37HLwqPuXia4AD0OWtWTuTRV8v7b5paQAoFF/cNQeIQ
	 rSWTBRDaSPfNKmxOuL6k3wJYqJiyLMm2jRpb2hggKD/hhH3yvpZXHKwnvAIy4wYQ4m
	 mhY9NNhr7lr8Ouhj/Yge/pkYoAJNAKSXsx1DNJq5UJJs7PZ7d/8P0POYPxGFjCSvqG
	 UujF9VHRX8p6NtgKYDj6yO3KfIHhC4CouWuTIJuSVMDBChXS4Ya1WIQfujNLgpm09+
	 6cR7gUYqZM2KT2+UKI3MfudGumUtsHeq3XkD9VYlNPbkAxfrimI3uNHcUTRQnLoYP4
	 u3x8VaNSJdAXQ==
Date: Mon, 5 Jan 2026 13:00:20 -0500
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, sfr@canb.auug.org.au
Subject: Re: [RFC 0/5] LLMinus: LLM-Assisted Merge Conflict Resolution
Message-ID: <aVv8NMl4aQwRcJ-E@laps>
References: <20251219181629.1123823-1-sashal@kernel.org>
 <aUgb4wCNaSxpIhPp@laps>
 <565b28fc-6561-4992-88fa-35808ba1fa07@sirena.org.uk>
 <aUqMwuUoPuRN6Ry6@laps>
 <aUrVzuMz5D9QYF4O@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aUrVzuMz5D9QYF4O@sirena.co.uk>

On Tue, Dec 23, 2025 at 05:47:58PM +0000, Mark Brown wrote:
>On Tue, Dec 23, 2025 at 07:36:18AM -0500, Sasha Levin wrote:
>> On Mon, Dec 22, 2025 at 02:50:55PM +0000, Mark Brown wrote:
>> > On Sun, Dec 21, 2025 at 11:10:11AM -0500, Sasha Levin wrote:
>
>> > clear who would want the various intermediate merges either, I suppose
>> > that having some of the trees pulled into multiple places might help
>> > shake out some of the issues due to things getting sent to Linus in a
>> > different order but OTOH it will increase the total number of merges
>> > done and tested which is itself a cost.  We could also shake out
>> > ordering issues by doing something like randomise the ordering.  I think
>> > I'd want some demand or use case for doing more intermediate merges
>> > rather than just doing a bunch of them for the sake of it.
>
>> My thinking around it was to enable faster per-subsystem tests than what we
>> currently do. For example, we can quickly build mm-next and run mm focused
>> tests on it.
>
>If we start putting everything into intermediate merges then inevitably
>some of those merges are going to be later in the process and will get
>generated later in the process, meaning they're nearer to the production
>of the full -next.  I'm also not clear that we have enough trees that
>would update multiple times a day.

I've left the script running over the holiday break, and the rate of changes is
very surprisingly high (specially given it was a holiday in most of the
world!).

>> Since creating these per-subsystem trees is fairly cheap and can happen even
>> few times a day, we can help identify issues way earlier during the process.
>
>To be clear unless things are super prone to conflicts the big cost with
>adding stuff to -next isn't generally doing the merges, it's build
>testing the results.  To that end the main potential advantage I can see
>in doing submerges would be if we could parallelise the build testing
>portion of things.  That would need some consideration of the complexity
>of the scripting, the build machines and the cogantive load involved,
>and if we were doing that the considerations for constructing submerges
>would be a bit different.  It has crossed my mind, but it'd be non
>trivial to do and not intending to produce intermediate merges that are
>useful to anyone else.

The way I have it working is that I will only recreate a sub-tree if any of the
-next trees that are part of it were rebased, otherwise I will just merge new
changes on top of the existing tree.

I will also do a build test only after I merged everything into the sub-tree.
If we hit a build error, I will bisect between the last known good point and
HEAD.

Between the above, as well as tracking "known-broken" trees, the volume of
build tests is not that scary.

-- 
Thanks,
Sasha

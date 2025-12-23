Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92164329C7D
	for <tools@linux.kernel.org>; Tue, 23 Dec 2025 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493380; cv=none; b=uQeTkAFI+S+l2/slnMWA3lXCtbZ1um+ShYP1dRmwcUwtIBRUpK4mJLB4sFEvRLdjxKjIdbgbuU7waKpDjd3lu0+m5DzcpuF+Ki8xvQLTa25p8O+TrNEEmHXNzySAyCQzg9+xVg5F4kwtFYFVsFbDXDOkE+hHenSkovNDRD6kPGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493380; c=relaxed/simple;
	bh=NPqsH7EEo4s1j3Kz0DzJNfhK3M0lDxbIlUaL0Z4nyqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpsE/iCqlK6qxoihEYbm2lhWHSA0Z/JyzlRCw1XdkNKWqqWxeyLZr9Pwikp9bzaBXYJX9lLdzQmMew7OL88vMtDbZt6jurGBP1mwPeJVNi5mK4OfBHpw86q2kFZ+k0wf8L9sSAFuI09MTXb84TnJpsw00fdaLADMzwdBV/BoSQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpesU46G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpesU46G"
Received: by smtp.kernel.org (Postfix)
	id 44E2CC116D0; Tue, 23 Dec 2025 12:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00C3C113D0;
	Tue, 23 Dec 2025 12:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766493380;
	bh=NPqsH7EEo4s1j3Kz0DzJNfhK3M0lDxbIlUaL0Z4nyqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpesU46GUiYzoPdwyDQ16Jt0nnQNwegiWIA/LF2wJUKvDpfz6S5OeZYgrQyRhGZSq
	 vICsoH6x0X01SMDen6OtBUdcPVlm7c7JQUpxr4N4vWe8fcwNpyp4QM9MRWEQVSw3AE
	 48CHhty068A2FlnOHJkSNNTNQbskxo+qFa3n8/pHnbpOqetgN7yGVWwEceEkmnAG6V
	 gulOMc9UkTThsS+loDiCtuECzJyZc9WvbtAQnC6TDfOjHc+Mc/hQxpHAifX7nXc+dm
	 Y0sTDyjwu2Nkth0nA6cXR1vIMtTIbdi/Ys1OzzC3Gp/iVZ9eUFudG7kRu2FHiY9I0h
	 pezcWcDj3Chvg==
Date: Tue, 23 Dec 2025 07:36:18 -0500
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, sfr@canb.auug.org.au
Subject: Re: [RFC 0/5] LLMinus: LLM-Assisted Merge Conflict Resolution
Message-ID: <aUqMwuUoPuRN6Ry6@laps>
References: <20251219181629.1123823-1-sashal@kernel.org>
 <aUgb4wCNaSxpIhPp@laps>
 <565b28fc-6561-4992-88fa-35808ba1fa07@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <565b28fc-6561-4992-88fa-35808ba1fa07@sirena.org.uk>

On Mon, Dec 22, 2025 at 02:50:55PM +0000, Mark Brown wrote:
>On Sun, Dec 21, 2025 at 11:10:11AM -0500, Sasha Levin wrote:
>
>> I assigned categories to the various trees used by -next (see
>> https://gist.github.com/sashalevin/163df4ae1163e0e22a97edc40e14b7f5) and built
>> a simple wrapper script to generate per-category integration branches, letting
>> LLMinus resolve conflicts whenever we hit one.
>
>Those categories appear to be a bit randomly assigned FWIW.  I'm not

There should be some sense there :) but yes, we could fine tune it as we go.

>clear who would want the various intermediate merges either, I suppose
>that having some of the trees pulled into multiple places might help
>shake out some of the issues due to things getting sent to Linus in a
>different order but OTOH it will increase the total number of merges
>done and tested which is itself a cost.  We could also shake out
>ordering issues by doing something like randomise the ordering.  I think
>I'd want some demand or use case for doing more intermediate merges
>rather than just doing a bunch of them for the sake of it.

My thinking around it was to enable faster per-subsystem tests than what we
currently do. For example, we can quickly build mm-next and run mm focused
tests on it.

Since creating these per-subsystem trees is fairly cheap and can happen even
few times a day, we can help identify issues way earlier during the process.

>This seems like a very separate experiment to your LLM merge thing.

Right, just going off on a tangent based on the Maintainer's summit feedback of
how useful fs-next is.

>> The resulting branches were pushed to
>> https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git/refs/ .
>> Each category has a %s-next branch, and a larger all-next branch which merges
>> all of them together and is the equivalent of linux-next.
>
>> Please let me know what you think!
>
>It might be easier to tell what it's done if you ran this with the same
>inputs as the last -next (it's on Christmas break at the minute),
>there's quite large differences in the end result but most if not all of
>that is that the input trees you're using are fresher than the last
>-next.  Though I think even with the same base there'd be a bit of a
>needle in a haystack thing finding interesting cases, probably it'd be
>more useful to find and highlight specific cases where it does something
>interesting.

Yup, I figured I'd wait until break is over and compare the trees once the next
linux-next is released.

-- 
Thanks,
Sasha

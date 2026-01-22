Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0404335551
	for <tools@linux.kernel.org>; Thu, 22 Jan 2026 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106499; cv=none; b=W49ORRBBchuzjFeWN4Bl6dy+XJKxJsCJQ6cyiur4bMwFNQOgHGfpxhI0X089d3vmUJ6pBl1r82NuDAuqr/DwZFYYuSfaK23w6/t90QSZFpyjUo7YUqcERV5nechsftna1AQTFOzaaT4QkIoiw9jUFBdBbgLdIFbuCoiBf/oPUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106499; c=relaxed/simple;
	bh=+3R9OD9EosfEGpAx3K5+NqSxAUWI4YrHnBCU81wXGEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwE3sRpdvEsc9cdzBf0FbziAWa6TzQs9I20vfUKW/YrAva1f6GABpTgO36LuQiNHiCopHIu+cmBOBglLeeoh77mAWK7bJnf17x/L3uE2nSz7Z0etTVRMpriFzC+hg7INQpPz6lC7InRZD9sFnBOEG2fjBWSIuyRpjngcDVg/X6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G27rMztL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G27rMztL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4909C116C6;
	Thu, 22 Jan 2026 18:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769106497;
	bh=+3R9OD9EosfEGpAx3K5+NqSxAUWI4YrHnBCU81wXGEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G27rMztLEoIo6XtzEPCo/Cv7VluR86Nvb2rL2Pz14hPEbiY/wNM7FpFwQnsOSNkLG
	 8FkIuFYiK0pYiA1S6b7l+jZtHplSV8l/4Iw4FGTch0IfLCHmxo3LxBil0kQbS1TSu2
	 We9hy15omcf6XH0FJ/t4oJsqm4q9LtMW7HorTv6o=
Date: Thu, 22 Jan 2026 13:28:10 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: pw-bot on kernel Patchwork misses pulls with different proto
Message-ID: <20260122-fancy-hidden-parrot-ce21ec@lemur>
References: <f8463626-68c6-4b3e-ac0c-5a01db8e7755@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8463626-68c6-4b3e-ac0c-5a01db8e7755@kernel.org>

On Thu, Jan 22, 2026 at 06:31:53PM +0100, Krzysztof Kozlowski wrote:
> Hey,
> 
> After merging pull requests to soc.git, I expected pw-bot to react -
> change status in Patchwork and send thank you letter, but probably my
> insteadOf rules confused the pwbot:

I committed a fix for this that only matches by path and tag, which should
still be unique enough to avoid clashes:

https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/commit/?id=44169ff49ab3707fb1c84f2ed2ab340c47ff698e

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302334F46F
	for <tools@linux.kernel.org>; Mon, 27 Apr 2026 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304029; cv=none; b=JpsPBcxHj0zWP/MTMNsjbnRA+CVDpqrSY+ZKqFW8JzqYGrgg/9rRKChIWughN6siK5qU0UpsmJde5PJm+WvwYsSmhWZFdnsLQL1vxpQnVtVrqXSoQbyuP9rDczEj+R2cMNjABlg+MdDTLcYJOsISwoxAKvcn+Nd7+BLokDRfmRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304029; c=relaxed/simple;
	bh=Z3Kg+2P7vlHfiKXDW3a9nWMWeiTjmyvJkrSnrrxkAQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0hDpQyEeEN/wCdHBKDL8L2IGoA3AhL9eYaM5/Y4Nqq+ZlZaRtSjpZD7aa03jfaRW/demljNIzCypQ+Wn6YOQ5WnYPUmDBtpI6VnUkrGoV6B89llJ3HBRPM2D4Tk55RaQdC63KA+Cm+0nKSuaJkvo4f3vhNg8qfAgUy+Ok/r8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=djHaWB4A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="djHaWB4A"
Received: by smtp.kernel.org (Postfix)
	id A1F2BC2BCB7; Mon, 27 Apr 2026 15:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665B4C19425;
	Mon, 27 Apr 2026 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777304029;
	bh=Z3Kg+2P7vlHfiKXDW3a9nWMWeiTjmyvJkrSnrrxkAQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djHaWB4AGrH/tiGRAT9mzECKMIwYSKkBMdG/MwhRvpe3wGUBhQmAHkgzWuxaqhRQv
	 QFMGdaEo4zp9BEPOSoEvRSzlx/bOTx73YXrpoF0V5sw5ljeINWD7odaufgT4nwZcJl
	 33yoe10YaEkVO9kFnXgCHdh5ctkGZDqkalGMIxug=
Date: Mon, 27 Apr 2026 11:33:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 tui: Old serieses not removed
Message-ID: <20260427-adept-bonobo-of-prestige-e729eb@lemur>
References: <ae5uBJGVI5plpGkb@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae5uBJGVI5plpGkb@sirena.co.uk>

On Mon, Apr 27, 2026 at 04:56:52AM +0900, Mark Brown wrote:
> As part of an effort to sync review state between machines I have
> arranged for the set of b4/review branches on the destination machine to
> be the same as it was on the source.

So, let's call these "machineA" and "machineB". You do most work on machineA,
but machineB runs a periodic git fetch to get all the review branches from
machineA, correct?

> When I open b4 tui and run 'U' to
> update all branches it reports the existance of several hundred more
> branches, looking at them going past and what's in the UI I think most
> but not all of them are thanked branches which I later archived on the
> source machine, the branches are gone but they remain in the UI.

This is the part that's confusing to me, so I need clarification. I assume the
following happened:

- These series were reviewed on machineA (creating b4/review/* branches for
  them).
- MachineB runs periodic fetches from machineA, which creates these
  b4/review/* branches on machineB.
- The seriews are applied, thanked, and archived on machineA
- When you open "b4 review tui" on machineB, these branches come back to life
  as still being reviewed

Is this the correct description of your workflow? If so, are you running the
sync script with --prune, so that archived branches are properly removed on
machineB to match machineA?

Just trying to fully understand the sequence of events.

-- 
KR

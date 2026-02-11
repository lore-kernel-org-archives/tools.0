Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9D2882A9
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822868; cv=none; b=DsDPvOrGVPhS7ei3tEVJ0tquj4Hwqufb9aU/vO8JOiL0Aj+YZ1ln6aGPHc8G6m5pWWY96MSTAOXVXS2jmwY1Vk7zDyPxNYRleX6RfcB8YvL1eBGxV1kqlzYgF50HzoPcsczZKFukIm23WulkkLHPHI5/0bBSV+dCAv58rkGZN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822868; c=relaxed/simple;
	bh=tkFbi09Zrxzub7TOkl+yOwwaDbe0k/tNPYmP2GGLVqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FB6R9Cs633BvqZwTs1Cuvw0lssz+B+2FZdFuETeXovq1GABOr0tGYmr6J0ZQ3OWeEPemwck65WkTSJZzCY7Ifdc2r+G4JvZFCIyYFgIzhzAUmPy1GVCG3m5D0zHyjkOyEop8DkPKBfaPwAqT6oztlrMxYpEFl/Kxe5WPxBp9ILw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVm5EelG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVm5EelG"
Received: by smtp.kernel.org (Postfix)
	id 2A625C19424; Wed, 11 Feb 2026 15:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3E0C4CEF7;
	Wed, 11 Feb 2026 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770822868;
	bh=tkFbi09Zrxzub7TOkl+yOwwaDbe0k/tNPYmP2GGLVqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVm5EelGNBVn+5fFYE/7HTtI0HQSpuLcn3Sjvc3jWvMBiJGzm/W63OqpF5RMayTAT
	 MJ0b7+0O1L5uGMk28UQnIJ8HKbOhA71ATX+ZJaQRrg3/wNyRwoHgvpmRmrkQJVYhb8
	 p/5IuEz2uiP4DZ2CT8+i0BApH+4fzDJydqx1XZ41KGsHx58iUzAHDw5Ujce/55vVnZ
	 qOYdTLn4wH8skt8ymnvujGp9rSxZM+jhkR5BxZ/xcXAOrIctld0sFxiv2SRrd1r0dW
	 wAiiyIjTRvUPm9LhrDLgoQ3JQMO8TM0iL3RdEyCE0O/p/b89on286YLqNR2xaIaPpA
	 fRmGHIlJlG1NQ==
Date: Wed, 11 Feb 2026 10:14:24 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: korgalore bug: Feed state not found for lch@ list
Message-ID: <20260211-gigantic-aspiring-jaguarundi-aeddcd@lemur>
References: <695ccea6-bb19-4f6d-99cf-1d898b53b1cc@kernel.org>
 <20260209-hungry-phenomenal-unicorn-1ad4be@lemur>
 <c3dcff19-7f6c-4f09-ad63-c3af15e8c5f6@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3dcff19-7f6c-4f09-ad63-c3af15e8c5f6@kernel.org>

On Tue, Feb 10, 2026 at 05:30:31PM +0100, Krzysztof Kozlowski wrote:
> "/home/krzk/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/lore_feed.py",
> line 77, in clone_epoch
>     raise RemoteError(f"Git clone failed: {output.decode()}")
> korgalore.RemoteError: Git clone failed:

Ah, so in this particular case I wasn't testing with the actual --shallow
parameter, which is why I couldn't reproduce the failure. The problem here
is that the lch list doesn't have any messages since November 2025, so when we
try to clone it with --shallow-since=1.week.ago, we get a clone failure.

There is a workaround for this situation in both master and stable-0.5.y, and
I can confirm that setting up the lch list works without a crash now.

If you can confirm, I will tag 0.5.2 for the release.

-K

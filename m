Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DBC3D333E
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361987; cv=none; b=HYGEZYAn2UDhS6AhpvZc6+htvnH6PXFuiXCqGqckYARrtkQIkHR8/Ww8Vt+tgZDgxu8T0qes9JYwL+kxB7CN6yGCFrt5Z8Aqhr2vZyI8ccQ5P4FsYg1e4SBk1/eRQTRbiwpFTaBLdYobYnGGi+JZn5daaWAvycxK4z7a5LIh0ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361987; c=relaxed/simple;
	bh=5SXHV26NXDU7QgeHzR17/HJbRdVEYS2aRI3m8rgX2mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeSzdJ3+LAZOZbDmuGWkxQfmCFY6nJmR3Rys5xv5l/poDY4lEeiP5R9ff32oH4Kgvq/Wp18U7HcPi6IgJf1cqiW5Z3dihOT9rG3uPM33Rw5zAJVbyXlK975oZoZuK3gD9F/osYeKcs1jZYdvVpgJAfzUOU/PEJP5XJHHqWngmFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cFoMHt63; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cFoMHt63"
Received: by smtp.kernel.org (Postfix)
	id F3B68C2BC87; Tue, 24 Mar 2026 14:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D23C19424;
	Tue, 24 Mar 2026 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774361986;
	bh=5SXHV26NXDU7QgeHzR17/HJbRdVEYS2aRI3m8rgX2mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFoMHt63S9laUrrAq13lbn8qAglYMpvuEde9OVs2sv5saIyJKP1ZO/3nhZnwmLVfc
	 1T8nfNKUHy9ce8zxFc40Wr8UOtnsALqYzmkmJ4Rl6fut5dqzE8YSg2By5MG7F0Pvqr
	 3XzT5SZhVYeKjQZdo0v4t8kb2aaIel66JIBgeLBo=
Date: Tue, 24 Mar 2026 10:19:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 v0.15.0 released
Message-ID: <20260324-smiling-wondrous-panther-ebac4f@lemur>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
 <2c35a708-0ff6-4fe0-8974-2e786dadff6e@kernel.org>
 <20260324-complex-monumental-mamba-1e57ce@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324-complex-monumental-mamba-1e57ce@lemur>

On Tue, Mar 24, 2026 at 08:49:51AM -0400, Konstantin Ryabitsev wrote:
> Ack, that's true, I never tried running them outside the git repo. I'll check
> it out and cut 0.15.1 when fixed.
> 
> bugspray tag b4/tests

These should be fixed an there's a 0.15.1 tarball available.

-- 
KR

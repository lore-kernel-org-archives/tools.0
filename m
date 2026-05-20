Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1E37B002
	for <tools@linux.kernel.org>; Wed, 20 May 2026 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779313655; cv=none; b=k49UQsrujlwb2VZQL6UAZD6XZfIaPa/XKfbyQmS+18x2ZdMbMbwQTLD/S+YD0qJNCYv5Ar8T3Zp5bs5EdI/lp14/dK2wdblHZ8/gcEszn/r0WEBNcG1lAc7V71BIIxuo788su3WbPVyPmGdko1TsnURRRT6r1SHN2LRi+lue/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779313655; c=relaxed/simple;
	bh=V+cnYaL38LHChByy6U15TSjSvxfxdm4bMIyDmmR0XPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXYJORucguHGYbUoZuY0a5ldg3hVk2gOjgStHzWzN08fit2UC0DkxfYdI6lOTCLYmqpFGfe+vpi/Y1qH4j0GT8xXpGko3QyLEOwxU51WtADPJtw60JumeBlEOcxBajfj6f2jvvR0xHO0qqS1qUjh1ryArWHUtaPTGSZBSzie+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVDuTH+5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVDuTH+5"
Received: by smtp.kernel.org (Postfix)
	id 8F3FF1F00A39; Wed, 20 May 2026 21:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE171F000E9;
	Wed, 20 May 2026 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779313654;
	bh=EuYjdn9XRUq18y7PbTJxPak0HHkdVWgRFOMyEGEN1po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TVDuTH+595YRtIAeF1ENmFhbuZBLpgix8ZZouYZn6bxSxaaHtBZPCwG59dH8EbXYl
	 /uTXqpWf0Y6aUyafSC0E72lLzCpK4gFnSP+WGoRwLlhL6MsEYczsu3yy/m67r96JsW
	 /HGt+zBrW/RQnkmOt8kxjalDjSd0XD5pY1Yx12KQ8PYIafJngKr7ivWFLXj+XVrVii
	 IUgUk1eWgf/+BMCPMmQ+Ytd+4tLpAezWYrU0oNm7H0ggbn422hG64FiAd/uiFOisbu
	 JblUigZfRBON387JyLkJOJYsNph9VVNSs/Q5tmPSr/q+9Gut4RMcx9w6mX8uqk+Jpz
	 UYluAtrzAKOwg==
Date: Wed, 20 May 2026 17:47:33 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260520-ancient-thundering-bobcat-2f086c@meerkat>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>

On Wed, May 20, 2026 at 05:04:16PM -0400, Konstantin Ryabitsev wrote:
> > git --git-dir /home/boris/.local/share/korgalore/lkml/git/18.git fetch origin --shallow-since=1.month.ago --update-shallow
> > remote: Enumerating objects: 66197, done.
> > remote: Counting objects: 100% (66197/66197), done.
> > remote: Compressing objects: 100% (42640/42640), done.
> > remote: Total 66195 (delta 1533), reused 66029 (delta 1490), pack-reused 0 (from 0)
> > Receiving objects: 100% (66195/66195), 107.70 MiB | 741.00 KiB/s, done.
> > Resolving deltas: 100% (1533/1533), done.
> > From https://lore.kernel.org/lkml/git/18
> >  + 971bb3a5d326...4cfd85f2eacf master     -> master  (forced update)
> 
> If you don't mind wasting some space, run:
> 
>     git --git-dir /home/boris/.local/share/korgalore/lkml/git/18.git fetch origin --unshallow

Actually, I just pushed a commit that should fix this. Funny, this is exactly
an issue I already fixed earlier in a different place where we used --shallow.
Thought I was having deja-vu.

Try that out -- should self-heal now.

-K

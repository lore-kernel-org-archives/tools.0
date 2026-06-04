Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091392571B8
	for <tools@linux.kernel.org>; Thu,  4 Jun 2026 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606036; cv=none; b=FB0WT7y6kfPqPHFe7cmQTpoHDHolJKZAZUbQFONHjwEGMh4qaXrVac+3qp6ortOvpyzK1SHvkB1E5/1olnADUwuiWYjr1G4UznPsV7qL1CJKFtAFNxixvhQB+7P+OEZCdexrsf4O3Q3azLK/ueX8aOx3n+6jwj6TviEZD44oAe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606036; c=relaxed/simple;
	bh=ZWUmyLMl0PeyN2PrMvpSiPLly8VTS82GsoJN2Qkzri8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzXqNtoNaHkb55/uEl6AYuJR0IS7GsyQ2TvVGfWNDNwy4rukONKVvxZ4sVcP2QG312zPXJX/4mqGe6ADO0VieKstMtqA8s8oXEOCLk1vF9Z3sQXcU7QS9BS4ffIoObtycYjzN86UNeGBIQHMM7FozRCNTmVa2A97zShgVkrbNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PE4BYQzD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PE4BYQzD"
Received: by smtp.kernel.org (Postfix)
	id 3F2B01F00898; Thu,  4 Jun 2026 20:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66601F00893;
	Thu,  4 Jun 2026 20:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780606035;
	bh=OmHDH6rKplc1E0gHzYHNy22oF0ESRqm7tTgwgqwH/jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PE4BYQzDGD8ZVNqUwKe2f73C73GBIgRyL8mhP2j/bkLTeFcp6/uPLK3WYNobDjnTB
	 8ZsGHx8Ry0G7ZMc7//mGFJJcWcnT7osdC1ODe+jBjunvlr/BexAc7D4zTNMlB7WkTp
	 YIfJyALghmZUyQK/GHlwlWrgbVaRxk2M/GtWDcEY=
Date: Thu, 4 Jun 2026 16:47:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: tools@kernel.org
Subject: Re: [BUG] b4: assertion error with `b4 send`
Message-ID: <20260604-elfish-uppish-poodle-afaad0@meerkat>
References: <878q8ujbqs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878q8ujbqs.fsf@kernel.org>

On Thu, Jun 04, 2026 at 10:23:39PM +0200, Andreas Hindborg wrote:
> Hi,
> 
> I got this assertion error when sending patches today:
> 
> ---
> Sent 11 messages
> Tagging sent/20250305-unique-ref-29fcd675f9e9-v17
> Recording series message-id in cover letter tracking
> Created new revision v18
> Updating cover letter with templated changelog entries.
> Invoking git-filter-repo to update the cover letter.
> New history written in 0.06 seconds...

[...]

>   File "/nix/store/xl7fx5x8g52g03npg1dpjzvaiijpv98z-python3.13-git-filter-repo-2.47.0/lib/python3.13/site-packages/git_filter_repo.py", line 4767, in _record_metadata
>     self._compute_metadata(metadata_dir, orig_refs)
>     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/nix/store/xl7fx5x8g52g03npg1dpjzvaiijpv98z-python3.13-git-filter-repo-2.47.0/lib/python3.13/site-packages/git_filter_repo.py", line 4712, in _compute_metadata
>     assert(usoa == intermediate) # old wasn't pruned => usoa == intermediate

Looks like this tripped something in git-filter-repo, so not something we
control anyway.

> It looks like everything is OK and b4 set up for the next spin, cover
> letter looks right.

Yes, looks like it was during some kind of cleanup.

> I observed this on nixos first with b4 0.14.3 via nixpkgs 25.05, then
> upgraded to 0.15.2 via nixpkgs unstable.

We actually got rid of git-filter-repo in the latest master, so I'm just going
to blame this on gremlins and blame the alignment of the celestial spheres. :)

-K

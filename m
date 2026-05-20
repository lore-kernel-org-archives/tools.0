Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43573793C6
	for <tools@linux.kernel.org>; Wed, 20 May 2026 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779311058; cv=none; b=OkC5vqCyJo7lYrbUxlNFm/UKr7qKJ/W/XqNLLHN1CmvyBdknD4sgaV2dfQEHdQ8RUg5JoO26dhwLACv8mEvJsJh9k2Cc8Us7FnnxjRedg3p3XMaoxnBArsgqSXAa8mZ83bRzXNljF2D3vKp86387FFpQB1SLy95y95XdVNYLd8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779311058; c=relaxed/simple;
	bh=s/w4nFhpQ+AAZcDVov/uSD/XQ20CXcGiVJgH/sJMOVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+OM+uiblEwwOapezcqOmFZXqGoRnlZ4EkNPz8SMGc4VTvfuXNuVuCoOnyst+qJCViyIVS0q5Ivoe88Bi4xP6CEi47LmVRhZM/UvK5tqJ8Aet7lQXVhWF+MrhyQ0citmFG3N1KtDXonHsML2ed9XEdrY0373g+hU/+nZvM7FtWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvclObA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvclObA6"
Received: by smtp.kernel.org (Postfix)
	id 88EA51F00A39; Wed, 20 May 2026 21:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2843D1F000E9;
	Wed, 20 May 2026 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779311057;
	bh=88ZvMCrzdZAyTxsc5Ijtdvj+8vFR5qcD6UcmKXbDh40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QvclObA6g2cy1Pg3i2/7boE9kr3s2Ipo9mGY1UmUFgBeVnp+sOQ8uFSKY/3m1foO8
	 LES4MSBIsyDhh+aBy9WC8xmM4pVMCfSbnwe+TLUBcqXpBYa0ciMosrNjYP+HRAp341
	 f/NaqIqeOlMTOj52LOIPiYUx2IsRsGv1nhsRetyEuOW2gCGMecgyjGZ46RuGGsxuuv
	 QGMKCQLCIQnE8k3gjdMMY5yxpvUzvTyhOhPFbaWGD1QA5OKGcGpA5S7RCIaB13P1lf
	 gfoSJhCQKAIs8tSgNvVAx4QkWuqGu0XEz170ySGUpR59vZRLsutM7guqSe9FkdLCgY
	 T5rrbUWgcuefw==
Date: Wed, 20 May 2026 17:04:16 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>

On Wed, May 20, 2026 at 01:35:44PM -0700, Borislav Petkov wrote:
> $ kgl pull
> Updating feeds  [------------------------------------]  0/1  https://lore.kernel.org/lkmlwarning: Failed to update lkml: Git fetch failed (exit 128): fatal: error processing shallow info: 4

Just "4". Love it. /s

> Raising the --since does the proper thing:
> 
> git --git-dir /home/boris/.local/share/korgalore/lkml/git/18.git fetch origin --shallow-since=1.month.ago --update-shallow
> remote: Enumerating objects: 66197, done.
> remote: Counting objects: 100% (66197/66197), done.
> remote: Compressing objects: 100% (42640/42640), done.
> remote: Total 66195 (delta 1533), reused 66029 (delta 1490), pack-reused 0 (from 0)
> Receiving objects: 100% (66195/66195), 107.70 MiB | 741.00 KiB/s, done.
> Resolving deltas: 100% (1533/1533), done.
> From https://lore.kernel.org/lkml/git/18
>  + 971bb3a5d326...4cfd85f2eacf master     -> master  (forced update)

If you don't mind wasting some space, run:

    git --git-dir /home/boris/.local/share/korgalore/lkml/git/18.git fetch origin --unshallow

See if that fixes the problem.

-K

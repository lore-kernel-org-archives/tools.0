Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAB82FDC27
	for <tools@linux.kernel.org>; Mon,  9 Feb 2026 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661751; cv=none; b=F/pZ221ZZe6uPhTmlIa4NR/Z+BEcjW69N4VwZkPlG4+xyYvBaN5OpJ3ttRlbYgj+SgOL27oh3+NkYo5ZeCj1Hcsw6ANbAxP365wP3ATf3BFyTNWd7kNVXbS082qIWaMhoHnoCj3TEwpjzxjvAO+XH0OfDdGQuSChq14Sr8zKipM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661751; c=relaxed/simple;
	bh=NnleSmX5zUr9HXx1JLdzcBe05FJoKQ4jCIM0cMm2Z/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmZAF1+3gC3Mm7Q8KKrwUP/OoC8HgwUA7EbY76KeMHHCDAFljyORVbMI9QkRoPFB/9owDDDX8QW/DD2wtDGJdQRNdmRi3PA9dd19F+Zv9vIU8kR5MqlaU83H1gWqQUX/nlQsP3W7vCrPGNHU5pVCl91BSKiTLa+sud+q5XypcwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAeYul3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAeYul3O"
Received: by smtp.kernel.org (Postfix)
	id 1D571C19423; Mon,  9 Feb 2026 18:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA267C116C6;
	Mon,  9 Feb 2026 18:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770661751;
	bh=NnleSmX5zUr9HXx1JLdzcBe05FJoKQ4jCIM0cMm2Z/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAeYul3O2JbzFBoN72/2JG/Z1qpRJvNOy3iGkM92Hjx4yiSZBlHoK6BgmggS7XViJ
	 HLQQcmeKiiRtVWUenoPfeDkOsFngKfxkAObNtYr8Jye3dClMzR3hr5FfsZnRyJfTUp
	 1Wxat07M8qyutYlSGc3GPt7ZdzNbdAnNDDFwantq4wdik6SjnD7+b9YEo4JbhNpryR
	 rlzDV/uDo8zVHBF4kMTpuluTA/S8n2cFfp54Ry7uLQbBFuS//QfB15SXlKNYo7RSlr
	 Y1/Ae77Y8K+BOthQGo94CXH2wd4se4kKK+bySOGyK4RQ61B72eJf0nLe8luywtwpZH
	 15AvzVvdnMS+A==
Date: Mon, 9 Feb 2026 13:29:09 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Liam Mitchell <mitchell.liam@gmail.com>
Cc: tools@kernel.org
Subject: Re: B4 errors after changing git author
Message-ID: <20260209-diligent-rich-prawn-56a859@lemur>
References: <CAOQ1CL4neLRd4t4WZ9mR1r8rF+R7hda61dfOvXDV72u8-MWt8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOQ1CL4neLRd4t4WZ9mR1r8rF+R7hda61dfOvXDV72u8-MWt8w@mail.gmail.com>

On Sat, Feb 07, 2026 at 05:09:26PM +0100, Liam Mitchell wrote:
> The following commands worked fine:
> $ b4 prep -n bcm5974-reset -f v6.18
> $ git cherry-pick 52007b920a7b
> $ b4 prep --edit-cover
> 
> While editing the cover letter, I noticed the author email was wrong
> and updated in git config and the latest commit:
> $ git config user.email mitchell.liam@gmail.com
> $ git commit --amend --reset-author

Yes, this is a corner-case we don't handle right now.

> $ b4 prep --edit-cover
> CRITICAL: This is not a prep-managed branch.
> 
> I figured out that the cover letter author was the problem and fixed it with:
> $ git rebase --reset-author v6.18
> 
> A more helpful error message could help the next person who stumbles into this.

Noted. This is a rare enough situation, thankfully, but we should do a quick
sanity check for all command before we attempt many operations.

-- 
KR

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78270223328
	for <tools@linux.kernel.org>; Fri, 23 Jan 2026 19:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195240; cv=none; b=YMH0Bs1Wvwea3WOokq++tUML7cvi1zgqYROS0MJRy8sLkm1dvoB9sGjhe/RMuc5mOs2MckClBUoyV7rnzebPL/B7M6NqwX6fT9jze38hDnd/mELPCnYJa87mJqBhhFSWg3UMO4wrg4XoQH0qpUyqvve9xygvh2f66gawGqM+VN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195240; c=relaxed/simple;
	bh=nC3qxmR/cdTbZ1AT76cgUEg03USA1tm4SdE9b20KU3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7ZwZriz8+Gbf9D+S+oGTLgP2GCz6YuqYDq/ZgK/er4GnkGhOKs1fzNX7uDGDm1a6ShfU19GR+aw29HzCLOliM1HhKwDwvTPFFWZEY1wt3JwAoLsahgwiF6tD0ISTPWS3gyyvFDOQv7ZmBWm5ZwHWfiVarROLoug7eitpVHUbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SCZSMvNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SCZSMvNS"
Received: by smtp.kernel.org (Postfix)
	id 19C27C19423; Fri, 23 Jan 2026 19:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9C6C4CEF1;
	Fri, 23 Jan 2026 19:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769195240;
	bh=nC3qxmR/cdTbZ1AT76cgUEg03USA1tm4SdE9b20KU3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCZSMvNST6d1ALfq6lGCU8t4BmkdXeeScqL0WBdS56100Vt9ewCnCnam4mpJB9nCd
	 kBNZTSoXs2nz5M80ZbTyGR3yru2/ab/xM4yVmV2r+YVX1TUHJzjC6Cs2Ed8i/fRdq9
	 Cz6d57Mw3N5mLhh3VgbF2OV0SrI7FauMkkLaDd4Q=
Date: Fri, 23 Jan 2026 14:07:18 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: korgalore v0.4 now available
Message-ID: <20260123-ubiquitous-cockle-from-asgard-5eb710@lemur>
References: <473ed792-f970-49ff-8a11-ac9d6a82f83f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <473ed792-f970-49ff-8a11-ac9d6a82f83f@sirena.org.uk>

On Fri, Jan 23, 2026 at 04:43:46PM +0000, Mark Brown wrote:
> Given how long it took I'd expected it to have done something to the
> output, and the above is not going to DTRT given that it's pulling in
> linux-kernel.  Probably the program should understand that linux-kernel
> is special here.

Done. kgl now filters out the following catch-all mailing lists from subsystem
queries by default:

- linux-kernel@vger.kernel.org
- patches@lists.linux.dev

If a subsystem only has these lists and no others, the mailinglist query
is skipped entirely (only patches query is created). The list can be
customized via main.catchall_lists in the config file, or set to [] to
disable filtering (though I don't see why anyone would want that).

> I'd also have expected MAINTAINERS to be read from the current
> directory if it's available and not otherwise specified.

Also done. The -m/--maintainers flag is now optional. kgl looks for
MAINTAINERS in this order:

1. Explicit path via -m
2. ./MAINTAINERS in current directory
3. Fetch from kernel.org (cached for 24 hours)

So you can now just run "kgl track-subsystem 'REGMAP'" from your kernel
tree without any extra flags.

Cheers,
-K

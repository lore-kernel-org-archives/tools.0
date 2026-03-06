Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC3481AA4
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 21:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831397; cv=none; b=ZokMpgGK4R3MIYROAWmrSSCpEnY0PeXwf7rWlQoUN957/ZURvqbiaObWCM5yrR60zf2nX+NjlxvGjmYkXokVprIZZgA2OUrXdd51r3pWsf8QglPD9h5l1haTx/ApcBo6lPaJ9TgGMCl8hLmn/dA9HeIgt5mrRdLs2/3odH3jn+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831397; c=relaxed/simple;
	bh=kk92JiRhc549Y9ctOM/OuDkejrAD9UmBUgFKCGoyYbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAdMBrMmIUmeGTfQSJT8Asm0rGtsFCOGCR2JXWDDLwCIqf9qnZAylohZ74JCzvfMB/0yQyY3lHhhedzfb8wet3ISG58DZgH9DYzBHwRx+QSst/a5afkk5tbqdcO2mdDQ2CdMS/zi5fzDe17Yzg4XIV+e8LZDNNOz6WHeWnYFUOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MciweESn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MciweESn"
Received: by smtp.kernel.org (Postfix)
	id 08A6AC19425; Fri,  6 Mar 2026 21:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DFCC4CEF7;
	Fri,  6 Mar 2026 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772831396;
	bh=kk92JiRhc549Y9ctOM/OuDkejrAD9UmBUgFKCGoyYbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MciweESndGnAL9tlNk3IFvpVUXEp1WSP6+WEO109CgIEvhIE2LdE23jTpKcXgvLiO
	 HcQQ9+k6yDTli+OD9i5gN4Mj7TpUMPdyDnX/m/d0Q63tafYgPm9zSD5Y/MxPOlFAwM
	 jq8IQupHfY43TOkfaDZrel9HZYnNTy69qiJtUE4c=
Date: Fri, 6 Mar 2026 16:09:53 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org, kernelci@lists.linux.dev
Subject: Re: b4 pr checks for KernelCI results
Message-ID: <20260306-steady-tunneling-asp-7febfd@lemur>
References: <aTj6C69JzDUJUVP4@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aTj6C69JzDUJUVP4@sirena.co.uk>

On Wed, Dec 10, 2025 at 01:41:47PM +0900, Mark Brown wrote:
> Hi Konstantin,
> 
> It'd be really handy to have integration in b4 for querying the KernelCI
> APIs for test results when both sending and pulling in PRs to see what
> the testing state for the head commit for the PR is.  There's some docs
> for the API here:
> 
>    https://docs.kernelci.org/
> 
> Possibly this could just be pointing at the dashboard if there's result
> there, that'd be a start - there's a bunch of UI issues with starting to
> get more complex.

I'll look into this as part of the "check external CI systems" support in b4
review.

bugspray tag b4/review

-- 
KR

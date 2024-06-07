Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F09133EE
	for <tools@linux.kernel.org>; Fri,  7 Jun 2024 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717790478; cv=none; b=P2+X1hh5qdntwxSxUhDorxMaN/cZkQdRgEHGWrhH4kqoGdFkubPoblLwWXsRZlKInq8q/p61Rd1XNBpno6iAi6E5BVPzDRaxcjpdAMfkGIr8Kzwmsw3K4skgAF1Fek1UnWQAD3m1NXHhkba34tDabz30fWuYA7wvtO/kXAwX0EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717790478; c=relaxed/simple;
	bh=rChurD4TrI9FeMwQIl2+FebLifthBnml1L2cPtJbj5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpZBQR3u7RJwy8o0jI3PmrkFePjNGIrkUsb73vR8zPg7XXP4eN9+rMPgm5DfvenU+503E788KTmfqgvpP0mm7YFaRN69qChGyXu0iitCDlrnUX7lrwsvGz43IJrT7fjn/YgbNlWpT6TKGf8bPOzEpiQWGDUgBbbCHWs//Us1N84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dAlobsEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dAlobsEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E6FC2BBFC;
	Fri,  7 Jun 2024 20:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717790477;
	bh=rChurD4TrI9FeMwQIl2+FebLifthBnml1L2cPtJbj5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAlobsEv7438GhW8VmtK2LF2HR0vBOI4ChG5q5I25l0ZR6qNcxVTtLB7EhEljJQw+
	 d4bsgqZHwqWcGec4nr0NIoyHx1hxrqo4dtzCJlUba7++NFvPkEIv507MQ/FH6fYG1j
	 ny4lcj6fl9pd7VqRH7hd1E12eAvqnaZSEDtGs084=
Date: Fri, 7 Jun 2024 16:01:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <20240607-charcoal-bobcat-of-valor-ef78ce@lemur>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
 <20240603-opal-wolverine-of-tempest-7a8939@lemur>
 <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>
 <20240603-frigatebird-of-unearthly-satiation-62b1ff@meerkat>
 <020408d3-4918-47bd-b8de-5ca89de72935@sirena.org.uk>
 <20240607-practical-aboriginal-lionfish-b8b4ca@lemur>
 <ZmNmFeCL73-EBBS1@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZmNmFeCL73-EBBS1@finisterre.sirena.org.uk>

On Fri, Jun 07, 2024 at 08:57:09PM GMT, Mark Brown wrote:
> On Fri, Jun 07, 2024 at 03:30:28PM -0400, Konstantin Ryabitsev wrote:
> > On Mon, Jun 03, 2024 at 06:51:36PM GMT, Mark Brown wrote:
> 
> > > Yes, exactly.
> 
> > Okay, so with the latest master you should be able to just do something like
> > this:
> 
> >     b4 trailers -u --since-commit [commit-ish]
> 
> > You don't have to specify anything else -- we'll query lore for any matching
> > patch-id's and bring them in for any commits where you're the committer.
> 
> Great, thanks - I've updated my scripts so it should get some use on
> Monday.

There's a "Ctrl-C to abort" step in the trailers process now, so you may need
to run "b4 -n" to auto-skip any interactive steps in scripts.

-K

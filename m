Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9956E3BCD1C
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105714; cv=none; b=NSIVH6VtMOlAe72mB/zkCJvUN9yyXGoYcIHRMi7jxp9wbcDwU8fjmmwb6OeibliD6gDOPv8JVhvSlby8ewbLgVaw/49Dpp8DnWzlKIsWgMl/JZmnHPujQ7yKnVf+jjF4SR+B8cOl/tgcA13JUN22idh9b4FjgGI/6ydBS4u2UPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105714; c=relaxed/simple;
	bh=bjSvh3nliz9aLeYRTPn9OPwvZ2UDbLJoncCCN/0UyI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etP/iCfxFaOrjyTz0aDIotrDcoo2HF6k2aZhkU1mF/vxEGBAr6yoUADffmh7vYiquIG3Gj8RDJv+phU/irR3yWk+jBP7vTFM0hzg7QQ4coIRf/sPiieIQtGzvfEEZOMIBoM77mrD+yzP6sGJGCQEF4K9adAEFzpREs6wYTVWnDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hdSarVm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hdSarVm2"
Received: by smtp.kernel.org (Postfix)
	id 239F01F00898; Wed, 10 Jun 2026 15:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AEC1F00893;
	Wed, 10 Jun 2026 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781105713;
	bh=l+fmWxxk1ZfSvOG03FEnOrslFFcHTP5Ta9+xUcqWfQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hdSarVm2xIun+cnXZOaw8IXZz3KcFcqdqGeKkntDNH4PDkhjTmGSyGj1SXZG5gKjN
	 iIjm561GEtDXYAQKxmn9Tdvnb1CtFdm8zf9xh+2q2MCae1ICS8fKUA9cU9ogfzo0eP
	 aTj8cUqP7eXgxyxUxACf9oG+zfuisfIfpXEeYc00=
Date: Wed, 10 Jun 2026 11:35:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review workflow issue with partially accepted serieses
Message-ID: <20260610-premium-congenial-beaver-2af169@meerkat>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
 <178104250404.112711.2880594121343252200.b4-reply@b4>
 <ailGd8akixhx_GHg@sirena.co.uk>
 <20260610-influential-wolverine-of-improvement-f01d0d@meerkat>
 <aimB2DACiXv6MIQk@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aimB2DACiXv6MIQk@sirena.co.uk>

On Wed, Jun 10, 2026 at 04:25:12PM +0100, Mark Brown wrote:
> > OK, to help me properly model the workflow, is there ever a situation in which
> > you would:
> 
> > - accept patches 1-3 from v1
> > - request changes for patches 4-5
> > - wait for v2 with those changes
> > - apply patches 4-5 from v2
> 
> > In my mind, this was always a "send a follow-up series with just those 2
> > patches" -- should we even support the workflow as described above?
> 
> Yes, that's a thing that happens - usually in that case the early
> patches are bugfixes related to the work done to enable some new feature
> that is the main thrust of the series.  You can ask people to split
> things out and model it as two separate serieses but that's a bit of
> faff for something that's broadly a tooling issue.

Ok, thanks for confirming. So, a partially accepted series falls in these two
workflows:

- waiting for next revision; a v+1 should wake it up and put the series back
  into review mode; additional patches may be accepted from follow-up
  revisions (partial+more)

- done and dealt with, thanks sent, series archived; a v+1 should be
  completely ignored (partial+done)

I'll see if I can disambiguate these two workflows.

Thanks,
-K

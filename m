Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DD3093BC
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 21:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746920; cv=none; b=X5HLxzUeVuh0E2lUB1+L/qVHx9ZgJXxCcWW5xAtKEUdAtwi9YrAQwuzMkeWyGG+oV9mFaQ0a86kT2DTY5Xyu5Dk8roTE9bPBaExIAfimMfLEkjDMDUiYRCLqBcK4X1OmBNHq/R2smIu1Hx3QLg6QOJqsLHOVpVpaT7PTXhcPdZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746920; c=relaxed/simple;
	bh=+6CNumGRnwOZnUVy3BD6ekDk+vfk5z2HwXNZ03PQUds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTGj593g9rkVWXvmnz06PSC4Fj8ryQVJAfP5PjCGxZyr1xBUnWeXl8/AORikDoGB6rtGjIz+lc9Y/O/sN2zTQ72OBZ1k5X3IbzKilmxsStogTvMzr3K8snEox707ipvgFn7bgEaZr6t2J7z7FsvHNOVipbpZKreSd8IR/qedgiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dLIVyfUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dLIVyfUW"
Received: by smtp.kernel.org (Postfix)
	id 3E608C19425; Thu,  5 Mar 2026 21:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFE6C116C6;
	Thu,  5 Mar 2026 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772746920;
	bh=+6CNumGRnwOZnUVy3BD6ekDk+vfk5z2HwXNZ03PQUds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLIVyfUWbRBLoGzitPIrnZMh6gP9mmD9yVn32zMQaNJFJocykblv530pukV9e9qPJ
	 XT5/dWEsBxt3HxbN4ZK2/Y++woX68QHzHbLRD61Rb6vCV7MEAF7XDJ5nWOiIZuHIm0
	 sHTL8VpKRSJACMH5wrCqM9zqRg1A454iRU++D6sI=
Date: Thu, 5 Mar 2026 16:41:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 dig not finding commits due to alternate sender emails
Message-ID: <20260305-walrus-of-unknown-engineering-ae11f6@lemur>
References: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>

On Fri, Feb 13, 2026 at 05:53:17PM +0000, Mark Brown wrote:
> Hi Konstantin,
> 
> I'm seeing a bunch of commits that b4 dig is unable to locate on lore
> due to the sender using a different email address to send the patch to
> that used for the commit.  For example with:
> 
>   e48e16f3e37fac76e2f0c14c58df2b0398a323b0 f2fs: support non-4KB block size without packed_ssa feature
> 
> the posting looks to git like a non-author send from daeho43@gmail.com
> of a patch from daehojeong@google.com but since b4 constrains based on
> the commit author email address:
> 
>   q=(s:"f2fs: support non-4KB block size without packed_ssa feature" AND f:"daehojeong@google.com" AND d:..20260118)
> 
> we don't match once we get beyond the patch ID searches.  I'd expect
> this to also hit for actual non-author sends but the examples I'm seeing
> pop up are all one person with multiple e-mail addresses.  Not sure what
> the best approach is here...

Using this to test the lovely new git-bug integration via bugspray.

bugspray tag b4/dig

-- 
KR

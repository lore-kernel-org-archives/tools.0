Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168882877CB
	for <tools@linux.kernel.org>; Sat,  7 Mar 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892674; cv=none; b=MzWtEI3/SnczxcT52JhuOvx677C3NAULGterSEJgStN3DqsIXff5lCqRfNWhP9jrREweo9neGV+tiqTBVrtALUvDFnTVTZRlQLrhWNml2anvp2e4o3mslu6xhBNFklxlrrLOL+qvMDHriKhHKF1lH4AfFwIBodVAOrFDwsPa+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892674; c=relaxed/simple;
	bh=q9KQ1Ef6vaUt20M47sJMNTeF57W8lc6FaDWbLQMbu9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCvBq8OH9dXttqZI/E7fSBOoDPyCsW1D65RMWL+HZgS+aSs710wEjVUTXg5+Vhx36suuRfJhaAKqEYOpV2DEcf2yftP6UjC6LKmOxePoPqxDPU4FBn1SPetcWyXUwo0NotVQCy+URRY9Fh9ubHmZvNUQFMaWjbw6m+lhSFvp3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXCRbCyF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXCRbCyF"
Received: by smtp.kernel.org (Postfix)
	id D3A1DC2BC87; Sat,  7 Mar 2026 14:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D31C19422;
	Sat,  7 Mar 2026 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772892673;
	bh=q9KQ1Ef6vaUt20M47sJMNTeF57W8lc6FaDWbLQMbu9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXCRbCyFmxO4vvrQ6Sr01p45dOasjOdf7yKsh+WA0xMFdvIUGLWhwg7M4MIKbV59F
	 rlNYYx6WxWhUF8vLxiuAmzV7CIuDF+qR8FgSSuubF9LAXwnHrQIIWE6Za7pQ+v/b6v
	 nyo/bipy4IdUlCvNVii7IN18mmnEI/PLhTEZgfFU9AOVuh9N1ATJr4ocp1lsgb3bzp
	 iyoI07sk0DlrSHQsKIihgbwD4tLFgBp7LoSYbBNALtBx+8PiB2OIV2quphKEtSgnnx
	 6s6+69XL2zQbL/HPrE2FZQXEXxdQb5+wJjp3F8610IvdaEf9naoaoSoTdnBnD7q90N
	 FU0fN+bubUYdA==
Date: Sat, 7 Mar 2026 15:11:09 +0100
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Christian Brauner <christian@amutable.com>
Subject: Re: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Message-ID: <20260307-umfassen-gemahl-b93cf51ff11c@brauner>
References: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
 <20260306-cherubic-electric-bullmastiff-bcb0da@lemur>
 <20260306-seepferdchen-ziffer-c69d1d90fc16@brauner>
 <20260306-grumpy-jade-bulldog-a6f004@lemur>
 <20260306-biobauer-mondfinsternis-cc602b2b9c3e@brauner>
 <20260306-rare-spotted-wasp-adc84c@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-rare-spotted-wasp-adc84c@lemur>

On Fri, Mar 06, 2026 at 12:26:57PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Mar 06, 2026 at 05:17:57PM +0100, Christian Brauner wrote:
> > > I don't see a way to reconcile what you're trying to do and keeping automation
> > > working reliably, do you?
> > 
> > Yeah, I wasn't aware that this is a limitation. If this isn't super
> > uncommon, than it is broken with similar mail chains. Good to know that
> > this breaks b4.
> > 
> > Maybe what Vlastimil proposed would serve at least a similar purpose
> > where it adds the people on the bug report to the Cc and automatically
> > inserts a Link: to the report in the message or the commit.
> 
> Right, so if I understand it correctly, we want to be able to post a "here's a
> related patch" but without it being confused as a patch within the same
> series. I think one way to accomplish this would be to post the patch under

Yes, absolutely.

> the scissors, like so:
> 
>     Hey, how about this patch...
> 
>     -- >8 --
> 
>     From: ...
>     Subject: [PATCH ...] Unrelated Foo Patch
> 
>     This is foo patch for bar.
> 
>     git --diff ...
> 
> I *think* this would do the right thing, but I need to test it first. From
> your perspective, would this do what you're looking for?

Yes, I think this would work great.

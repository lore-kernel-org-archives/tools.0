Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9B36FBF
	for <tools@linux.kernel.org>; Wed,  6 May 2026 16:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778085938; cv=none; b=KpPwRH5TSoJxtCLcqNS4bvIySoKJj4dWLUtH4MO9hPtymTzf0+HHh9adh36FjOYPIaHo1XMN89dGFFskZ2SkU4OchITDhyh89MTGBZCG9a7+Jzi7fPUNaGvrryYx5pB0NZTBDMRIytu6VN2EDyv6HcF9ctNhTWZ4po2p8ZYZ+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778085938; c=relaxed/simple;
	bh=FgFsGj1DVO9Ta67QnHxIL4hL22BAW8hUHUlA/k1uHvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH585j5YPz1fGwXe7kowLrvr04UIWBZ1gAvu0/kd+CRPtJZTCaUTD5hobuA+0AD0Mcxdj3CwQ1bQ+TrvRTPbkei3ehwKXCaLPQDIDgS52FN3EdFwCtcDUr1Bkhv9CcWIo9d1lstg2+Hsge3iCof3c1Zopd35x3qiYVJGu197Dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Svu/8Ga4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Svu/8Ga4"
Received: by smtp.kernel.org (Postfix)
	id 96940C2BCB8; Wed,  6 May 2026 16:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26944C2BCB0;
	Wed,  6 May 2026 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778085937;
	bh=FgFsGj1DVO9Ta67QnHxIL4hL22BAW8hUHUlA/k1uHvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Svu/8Ga4SiLMWxLX48iMlFeBhrNrlQUHYWqCGEzxkdsaiuShDkX+QNuMl1vBGB3kz
	 Fi7MGzS1RQygSFDRKIrXFEq+J9qDfPlLDz94Nk/qzRQlwT4LCY8OAPv+OHRd995i13
	 xKkoixWcUZgUluXjwWt1f9Kk5P5IkJusk0UvZZVcAcrwwLbe9VS3kSUjxTj8VU4TF2
	 I3YEgVaFknXb3smMukN9GOQeMApolVMAZ+s4z0zYdB83dHXlPCQZ32a44ayo3j9PoV
	 3kH6KuC1T7Eas22nCD06o9QCzetYIfNLXEEV1+OypZ4RbtAiENaneAZhYcmQ3rQVFH
	 wNpI483lC/hZg==
Date: Wed, 6 May 2026 12:45:36 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Ackerley Tng <ackerleytng@google.com>
Cc: tools@kernel.org
Subject: Re: Patch series sent via b4 relay have a duplicate/shadow tree?
Message-ID: <20260506-helpful-jackrabbit-of-essence-bfc5b0@meerkat>
References: <CAEvNRgHEoAujWnf_bjPEvntMGMwng6TEMgDyZGuon7SR2=HfCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEvNRgHEoAujWnf_bjPEvntMGMwng6TEMgDyZGuon7SR2=HfCA@mail.gmail.com>

On Wed, May 06, 2026 at 08:53:07AM -0700, Ackerley Tng wrote:
> Hi,
> 
> I used the b4 email relay for the first time recently and noticed that
> the email tree on lore [1] has a duplicate/shadow tree.
> 
> In the "Thread overview" section, other than the tree with emails
> suffixed with "via B4 relay", there's also the second tree, which
> appears like I replied to each of my emails on the patch series.
> 
> There's a line that says "WARNING: multiple messages have this
> Message-ID", and the diff is [2] just the From email and the message id.
> 
> Is this intended?

This is a side-effect of from-header rewriting. We write all messages we get
via the relay directly to a "b4-sent" feed:

lore.kernel.org/b4-sent/

However, we must rewrite the From: header to actually send the messages out,
because otherwise they will not pass DMARC checks. For this reason, there are
usually 2 slightly different copies of the message on lore.

It's completely benign and the tools will do the right thing.

-K

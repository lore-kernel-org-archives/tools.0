Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63439182A
	for <tools@linux.kernel.org>; Thu, 13 Aug 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642548; cv=none; b=YZnr2UTtEIsj40LmJzaQr5VARGexknr6zVsvUJq8pP66fhBHf9uXQxn4cbmNm+FldBVazlbO36gtxhNanN0kDMNqvkluMVZSgPsUSyPvwHgSC3mOp3r22JSrhqnrCPp1INKMhkzno3epLi0nnphrtD3EinQO/OTCwhVwAmdeooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642548; c=relaxed/simple;
	bh=/svFMQ1JN6ob8N93vGrPoBXGlBJQIv8ne2//7t9ePUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEIgfJyIDAHYP4VJVKin0QI7QUyZQCCd7Z6rp0yDC8CP6/yLRhLHB0KQtNiz3m9w8wysOH7nY3K5cc4RUfQPxzHf0gOeJpMQgwjWrjiFiz28uX9wnKHmp1ZhryZJ9h6RcCZAr5esk+faAIPhz2usgFJb422fKIyZ3NWqEfIkdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zs0jL0eV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zs0jL0eV"
Received: by smtp.kernel.org (Postfix)
	id BF6D01F00A3F; Thu, 13 Aug 2026 17:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CAB1F00A3A;
	Thu, 13 Aug 2026 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786642546;
	bh=qIAcOjd+Ie2RkOCvwHO42Bh/tqpwZdQ/tNL3RFEV5gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zs0jL0eVJF4/4zGPmTzoqNTucWs/WEG6pwov7BgeGxeQNfsIHQVlgqzeTeRMnH8oS
	 qLn3B6Djr8EgdBQ3LetLf8gUF5A7Ge34UmXjzE92st7dM/9OUwYfgVkeP754q8NjJR
	 nEtLNcIjh7vS4uWAdgsdXuo6fBqEgu7pQFBWk6xI=
Date: Thu, 13 Aug 2026 13:35:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review crash
Message-ID: <20260813-athletic-therapeutic-armadillo-cdd2bf@meerkat>
References: <1bcfac04-3a85-4d8d-a0a1-094abe5dd807@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bcfac04-3a85-4d8d-a0a1-094abe5dd807@sirena.org.uk>

On Thu, Aug 13, 2026 at 05:54:25PM +0100, Mark Brown wrote:
> Hi Konstantin,
> 
> When attempting to review:
> 
>    https://patch.msgid.link/20260813021450.1897-1-baojun.xu@ti.com
> 
> which does not have a branch created yet I get:

It's a legit issue -- a suspicious unicode character in the patch:

    $ b4 am -o/tmp https://lore.kernel.org/all/20260813021450.1897-1-baojun.xu@ti.com/
    Looking up 20260813021450.1897-1-baojun.xu@ti.com
    Analyzing 1 messages in the thread
    Looking for additional code-review trailers on lore.kernel.org
    Analyzing 0 code-review messages
    Checking attestation on all messages, may take a moment...
    ---
      ✗ [PATCH v2] ASoC: tas2783-sdw: add firmware download status check
    ---
    WARNING: Message contains suspicious unicode control characters!
             Subject: [PATCH v2] ASoC: tas2783-sdw: add firmware download status check
                Line:    80-character limit.‌
                ----------------------------^
                Char: ZERO WIDTH NON-JOINER (0x200c)
             If you are sure about this, rerun with the right flag to allow.

It's benign in this case, but that check exists for a reason -- we just need
to catch it better in the TUI.

I'll add the fix.

Thanks!

-K


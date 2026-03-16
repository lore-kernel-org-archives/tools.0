Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1291527FB18
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 23:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773704510; cv=none; b=iMpLwBZxOB3Xj4NWR6eOBxfeIr75j/6pSqcjBUYMe2nVzJDw3jhHMVNdzlogaPXt/MSmom+/YYyVLsIzVSDRvh7XrJxjQttRRDZOHYuBLftxlGCUDBiavmyJz6krZxDzz0u4sy1wgz2hV+95yWFvGBtH6d+L4MMpMxAvwaVA+7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773704510; c=relaxed/simple;
	bh=jJU7al3Uy2eFfWjvPMTk6mgvmangcczA4ZUFyD6/lbc=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PKNGdKqLPaazDZ/IfdafJWeFgcKzYZsuTXEaWkx35olQsoYk9Hba5n+bo3f2h4ukWonj1MBTZC+QpH8228FCtTezSbI62ScpMwKcgnncX1i0rv1HocPFo+WJRDdmHkr0ifj9mvvAqy12TUYBjW5XYL4TPOvSlEbcc0q89QKqZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dpvCRXGO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dpvCRXGO"
Received: by smtp.kernel.org (Postfix)
	id CD22DC19421; Mon, 16 Mar 2026 23:41:49 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEA46C19424;
	Mon, 16 Mar 2026 23:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DEA46C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E1F4940423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773704508; bh=f4b93TGZKqSfey65yl4jZtK90CPvtC8bZAgjW6oeqKY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=dpvCRXGOdbBDla8c8Z8GC/Tz0lNH5AgSWHlj+K4yLsZaCa6vZKlua95PRfdN0xahK
	 dj0zw7P617TpRykgvDTv/JtVOskAuFIwYnq0kYvPjbu1W+91lf69bWdKsp8Y4yhozG
	 jiltihAiusEWP5e+XrPKDZL3CqVrzh1CSnDlIgFgplASVPYZUEqSVS2lGeXNdFTEWl
	 qwTwmvYTCY0bTxk/RHo03AX88QwbGP408K1e3miOZfGg5V46ebPwAWvwDfuwTCpY9u
	 wmNcipg80/pRmtJ91Dr7ZTX/zTq/z6+CyZaXhysH7KjX5auaFq4fbP+HfkGDdbS6la
	 k42CBWL0UmTvw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E1F4940423;
	Mon, 16 Mar 2026 23:41:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>, users@kernel.org,
 tools@kernel.org
Subject: Re: b4 review available in master
In-Reply-To: <87tsuffj7h.fsf@trenco.lwn.net>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
Date: Mon, 16 Mar 2026 17:41:47 -0600
Message-ID: <87h5qffikk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Konstantin Ryabitsev <mricon@kernel.org> writes:
>
>> Hi, all:
>>
>> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
>> maintainer duties. A getting-started guide with screencasts is here:
>> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
>
> So I've been playing with this a bit - fun stuff!  A few initial
> comments.

One more...  somehow it totally mangled the placement of the comments in
the first review I did with it.  See

  https://lore.kernel.org/all/177370220974.1754131.9642805524574261129.b4-review@b4/

...and the followup with the intended placement restored.

Thanks,

jon

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F2A369960
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 23:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773703686; cv=none; b=blCWdqM3lSHmxQgK2bqK03xi+Oq/A8K7RlkqlCa4iAfWN9xJ13LrLqS4YDUf22/RqQx1tllX9i21X7lsd3yyuUhMlrLNcJ7xfBdzu/Fpdrxb765KMUDsR/F0myiEyAmB7V9OuyxaRVUwvkuvusHL784ZZTcoMcHFNS4iYebf4lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773703686; c=relaxed/simple;
	bh=CV6olZ6abbO2oJJLcIDbpI3HktRarkTsmetmfkTrE0A=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HRIPHhSPlkngKB2D6KGwOLvsnWSHqtvTdmbzz7X7qnYaJzSmVvvZ1G5l1U+L4/pN846zpho4qSoEnSwMrTrjVUymwRJEsFFrjAa5iqTIrGiEjDlFm2GhXru1kP20LT+BQvB5txJDhJ7CCzHHEbImGJupTx162D9emmlwExAExYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qd5/oNHS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qd5/oNHS"
Received: by smtp.kernel.org (Postfix)
	id 37F7AC19424; Mon, 16 Mar 2026 23:28:06 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27B22C19421;
	Mon, 16 Mar 2026 23:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27B22C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3379A40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773703683; bh=B3TMyeDPuyAmPShbq5+whFMyD2DD+hU7PvElzPKx3ys=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=qd5/oNHS0WO6JY2OpZjSe4MVPmV/EXdpXMtL7k61D0TVrdprDrcC2wvF/P7cL9Nl+
	 b0rfctEz2N5smoTMH8AjzEgqn6vgfdjNTX8PLnXWVjl4a1kFQ7+KtiEO8S6ynHxXXA
	 MOB2yMdNjiVeuIUC3q33oC4icOJ5bbX2LhVqj5msXfGiM7IXAcrHl9P93Q+bQQF4n1
	 kGfk3+bqmR4QlQCVAsn2yTIknI5g4uVGNtz4aGyTI/+BAwJGSdL5xzJU2HZQB3qiJ0
	 jYpOXh6LEQAw58A27xm9U9wcEQVBfRshBPKL3SiBp3nr80lwn9huhHSoUbyGQk7ObY
	 k3syHFuvgbSvw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3379A40423;
	Mon, 16 Mar 2026 23:28:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>, users@kernel.org,
 tools@kernel.org
Subject: Re: b4 review available in master
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Date: Mon, 16 Mar 2026 17:28:02 -0600
Message-ID: <87tsuffj7h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <mricon@kernel.org> writes:

> Hi, all:
>
> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> maintainer duties. A getting-started guide with screencasts is here:
> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html

So I've been playing with this a bit - fun stuff!  A few initial
comments.

Let me be the N+1th to complain about the color scheme.  Dark mode just
isn't my thing...  and whoever designed "textual-light" has drunk
copious amounts of the low-contrast koolaid.  I see some of the other
suggestions in the thread, haven't tried them yet.

I used it to bring in a series and comment on a patch.  Nice
but... there doesn't seem to be a way to comment on the changelog?
That's an important part of the patch as a whole and I, at least, often
have things to say there.

Having descended onto a 30-part Mauro marathon, I can't a way to get
back to the main screen showing all of the tracked patches...?  "q" just
drops me out entirely.

When can we have it as an Emacs mode? :)

Thanks for all of this,

jon

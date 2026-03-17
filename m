Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA133E3C73
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757415; cv=none; b=BgYHHuO6Co4JBodWDiOSR0GtQmDNbrtKOzoGuVDga77o5EkNl0H1aT2AqtBk6tswC0PJYKIqooVI3GteBbiBvCyxoHbB08sOKxOlI/9Rli4UkQwZv/YPEuxRC6pFzibx5IKQ7P5LqWVCwM9W+79FDayieKKHeFCHXmOA8k+DfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757415; c=relaxed/simple;
	bh=eKOQjjlG4G7b3uvRg4Ievecnu64I0lLDFtHx8WPCfq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbB9kLZ49w79xPe1bboq2MYIwcWXJcQ+u3TAMze/ahSWOmGGLNkW5mqtIC2tdcQ2L7+A1O61U0GSYkuXYjir1qwdjc9smN7SjZ1BteFfArSoHUKm61gAhxQtRME3bw7nNPv114YAbntHU5VG27XrwS9zMtfuOiyhiTZP4yG5BUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5bYGxX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5bYGxX7"
Received: by smtp.kernel.org (Postfix)
	id 19EB7C19424; Tue, 17 Mar 2026 14:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43C1C4CEF7;
	Tue, 17 Mar 2026 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773757415;
	bh=eKOQjjlG4G7b3uvRg4Ievecnu64I0lLDFtHx8WPCfq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5bYGxX7Bse2fHSDoGTobKfRM2+PD5ewTpgS+CDPCT24AE1dMsSEj9TqAWZpjLABO
	 qoDPKoMPpEIhn4ZcBIbHaz+n9OPItSDvtlJveeb2M9ZWi5ihffr5tlfi4ftA6JzhE9
	 zYSzBC6F3UieWKhTWQpwoigMqmgiUA1vkAUomfrNaEkA8W8qBjlFdtxciRQt6PM7+x
	 J96DUTIRj3cYacyW1XNWOJbgXxIUME3wu0LOUvHmpsPN1gnUXO766vBnP56XIeuizy
	 7Iq6NlsZc9v4yZggicmcfiNkkcAs1qCcsS1jTw0eu3n7B9zbIPXZPLQhQ6CykGJIo0
	 1rf7np6Wj5Fsg==
Date: Tue, 17 Mar 2026 10:23:33 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260317-starling-of-delightful-exercise-3472ce@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87qzpieeb5.fsf@trenco.lwn.net>

On Tue, Mar 17, 2026 at 08:11:26AM -0600, Jonathan Corbet wrote:
> > Thanks for both of these. Can you possibly share the review branch so I can
> > see the tracking commit from there?
> 
> If I've done everything right, you'll find what you're looking for at
> 
>   git://git.lwn.net/linux.git b4/review/20260312-kernel-doc-use-a-c-lexical-tokenizer-for-transforms-0e0e9e143327

Yep, found it. *sigh*

Unfortunately, it's not an easy fix. I think I'll have to
abandon how we currently do inline comments -- the diff format is just too
fragile to try to intersperse it with comments. I think I'm just going to load
the diff using standard "> " quoting instead of trying to be creative with >>>
<<< markers. Maintainers are more used to seeing that anyway.

I'll let you know when the new code is ready for testing.

Thanks!
-- 
KR

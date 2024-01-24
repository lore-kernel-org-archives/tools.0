Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12617160
	for <tools@linux.kernel.org>; Wed, 24 Jan 2024 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706054473; cv=none; b=pRhCzKuF6L665bKQSZBelWXmSm19scJTxzhK7B50j1UzBn2EYT4EtfZXmOEScaxGMg0ODmh6byOcYJAI2V3nKgIGatPnnJJgNbzLND6+FBCn2DiVgs7pnl0g7J0f0dwlWfi9Q5u+sGwk6v2pWEXHjlcME27rT9xkDavC3QJlwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706054473; c=relaxed/simple;
	bh=6w/myrOT1I5HPUiTL//p8p1I/mfXKwkW6nAcRs7XTTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFtZHfX201I0sF4HZ+Pg0T9rIJ4p26myThOJdUZZeT4wuzN0MSghidtwhNnR/lv6N5aAWM0C0++scZWqa4pB3sPy0i2kY2yRVX7xKBJtdwl4snigu93M6wzjvwg4MoQ8iUgNTPGXOp+EpSyDGwzxv/MbhTEm1YehlWvFHmTiB9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KAnRPJ5K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KAnRPJ5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F22C43390;
	Wed, 24 Jan 2024 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706054471;
	bh=6w/myrOT1I5HPUiTL//p8p1I/mfXKwkW6nAcRs7XTTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAnRPJ5KFMe5er1F4TXvgzuuFWAgVEfD6TsywjiiRkpqy357+lZDqk1GxOnySPYGB
	 jBq6UD3weMnCbeD4cycMneVNttvy7kHonjFTpkssunEwFTqMuq/iSWmy5iXCnz78o1
	 c68dkQqAivlc8SCRdaR5SqEIwjeSwt0bjqy9cPwg=
Date: Tue, 23 Jan 2024 19:01:10 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Scripting support for telling if a b4 series is sendable
Message-ID: <20240123-amethyst-goat-of-passion-ba852c@lemur>
References: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>

On Mon, Jan 22, 2024 at 05:21:35PM +0000, Mark Brown wrote:
> b4 has logic for detecting if there is an unedited cover letter which
> would be used in sending.  It would be helpful for scripting around b4
> if it were possible to query to see if this check will fail separately
> to trying to send a series.

I've added 'needs-editing' to the output of "b4 prep --show-info". It will
also probably include 'needs-checking' and a few other 'needs-*' entries as
the feature set grows, at which point I may add a separate summarizing
'send-ready' entry.

Give it a whirl and please follow up if it's not what you were looking for.

-K

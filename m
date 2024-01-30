Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7CC605A6
	for <tools@linux.kernel.org>; Tue, 30 Jan 2024 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628943; cv=none; b=IdeSgFt2AYpTNLqSt3XV5dQirWEKNC9cUvNeQztOQ7yeTze6+49ICglkFG1gkUsvTYoBxzC6cu6fTuccjBx90meVqEBx3/kf+29w4Gw7JDwUcLeiA3YfwwiqCnGFzKt1bCQg/gObGXyvIKgO3bXDjy1LhkZN16GOUwbY3bhYka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628943; c=relaxed/simple;
	bh=AKDKnXpSCyYwdhQ6ve4H7/ByyJmeA0c4pVpuxiYr9l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmBl/gkpM2Y2Gx06U2jLqDpBRvq1JHPCsiXdoGbekw5UtFo+sno3pfMFpwte5f8oW/OnYL0a7L5kWyEjN4aiCvhHXICjK5RQAABRcdErD56SPZHhyYIhROxKxNnwf7iRM2sG0xaZSOXD59IKjql7dA/Bs62lfCGj+orUtUapNXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x2y+F5HD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x2y+F5HD"
Received: by smtp.kernel.org (Postfix)
	id 37E8AC433F1; Tue, 30 Jan 2024 15:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8EBC433C7;
	Tue, 30 Jan 2024 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706628943;
	bh=AKDKnXpSCyYwdhQ6ve4H7/ByyJmeA0c4pVpuxiYr9l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x2y+F5HDSP+KNrausKkMnxt3cjxsf6QnkKJlsMP9O3E3TL0ytp/sVnjRNxfLappL8
	 qqFFVZQbmYZNtuzdXsSAhMUJxerB3pyasbEmq7VpV5SsN83IOSWFxm6ZeTFRAq3lqw
	 /ngBPudqbDwuhxtUeNyWvY9uwtYcx1O2le1D/Egs=
Date: Tue, 30 Jan 2024 10:35:40 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: tools@kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, 
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: b4 won't add trailers in chronological order
Message-ID: <20240130-humongous-snobbish-gopher-f6ab81@lemur>
References: <18021e23-8f6f-4cc8-a331-64f490b47424@arinc9.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18021e23-8f6f-4cc8-a331-64f490b47424@arinc9.com>

On Tue, Jan 30, 2024 at 05:12:00PM +0300, Arınç ÜNAL wrote:
> Hello.
> 
> I see that with "b4 trailers -u" and "b4 am", trailers are not added in
> chronological order. I've seen a fair amount of discussions [1] arguing
> which is the correct approach, moving the author's sign-off to the end or
> stick to the chronological order the trailers are submitted. Could we agree
> on one?

This has been rehashed multiple times with the basic conclusion that everyone
does it slightly differently:

https://lore.kernel.org/tools/20221031165842.vxr4kp6h7qnkc53l@meerkat.local/

My final choice was to stick to the "chain of custody" logic, because it makes
most sense in the vast majority of settings -- the "Signed-off-by" trailer
indicates where the responsibility boundary is.

Basically, all trailers are added chronologically except for the Signed-off-by
trailer of the person who is working on the series, which is always placed
last.

Happy to discuss this more, if necessary, but I don't think this should
change.

-K

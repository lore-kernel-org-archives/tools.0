Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D21C0059
	for <tools@linux.kernel.org>; Fri, 28 Jun 2024 14:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585437; cv=none; b=nUgJ74/r/6WRHiKGdLYRoikINP3CkHkSjkuwxmuhvJEArRlR2+G6vMhN9j91uCAyunrVaZwT2YBGZ1xc11xniXvsN5bdn9mU2DSX6j/04LJWl1Bi7DTMbV80K6HgJt1oaI5D9wAg0iTtls+91J32A/9gLsslqpHZdkBge6tsDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585437; c=relaxed/simple;
	bh=o0I92PsXazFn/EAO/RqOrSRDsoXB0wS06fke7zYyixs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uG/lyVMBOxEKwZR0hZk4eYp+zXrO41+oEEjHzvkz4C4WlmcYMha0LwzTCWmjuGgBCnHQ2Dtp9hQog+16ZH2qmlt/VlaUnJlYKWPQdmbtFNaaPcf5rMz9GfBMPwZ+EZEQsJ5LFMmuvTugPo91DCIWT8zHI8Eeqlyv37fAmaxQ6ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WLIE6zyF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WLIE6zyF"
Received: by smtp.kernel.org (Postfix)
	id DD541C4AF0A; Fri, 28 Jun 2024 14:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43AEC116B1;
	Fri, 28 Jun 2024 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719585436;
	bh=o0I92PsXazFn/EAO/RqOrSRDsoXB0wS06fke7zYyixs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLIE6zyFBH2/Y8vQDM330dUoMe6ttPzqGBzbyLObVq/BJFftpO7iukKKRe61lJZ6+
	 7OPMpCwyRAz0FATSl2qW9wT7Ss/j4kxI3hZsnwoOZo0mZEvDVaG2f03DHGV5QBgEa0
	 POMp8gdcWnrbKWuMXD7y3jzdQvlgZ1IAooXbIGkQ=
Date: Fri, 28 Jun 2024 10:37:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: b4 wish: differentiate between signature problems
Message-ID: <20240628-portable-tentacled-bobcat-63dc7c@lemur>
References: <wxyjcpushnvpdrv42dijurk76oh3qny3y4mihnopof6fnwhwik@jk4tnftk6cds>
 <20240627-miniature-hysterical-hoatzin-22461a@meerkat>
 <mw7wx2wpwefefml5g4lcfwwq3udfhok7o7iteb2vnmj56edw5w@exb6tviwiert>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mw7wx2wpwefefml5g4lcfwwq3udfhok7o7iteb2vnmj56edw5w@exb6tviwiert>

On Fri, Jun 28, 2024 at 12:50:17PM GMT, Uwe Kleine-König wrote:
> > > instead, which would IMHO greatly improve my user experience. But that
> > > isn't easily determined using the dkim python module, so no patch here,
> > > just a wishlist report.
> > 
> > Correct, this is impossible without the following being implemented first:
> > https://bugs.launchpad.net/dkimpy/+bug/2047054
> > 
> > Unfortunately, the comment on that bug is not very encouraging.
> 
> I'd not want to skip expiration check. Just want this represented in the
> verification result. It's still an API change, but in the output, not
> the function's input.

With the way DKIM signatures work, there is no way to do it without the change
I requested. The expiration is specified in the x= parameter of the signed
content itself, so there is no way to check if the signature would verify if
the x= parameter wasn't there or was set to the current timestamp. And I don't
think anyone would welcome b4 adjusting your system date to the time in the
past just to verify a DKIM signature. ;)

-K

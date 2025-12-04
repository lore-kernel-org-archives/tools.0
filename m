Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0E72C21C5
	for <tools@linux.kernel.org>; Thu,  4 Dec 2025 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860520; cv=none; b=dAIxsViBh/yv3fwRwstaqTqg30w0XkETgjCPGsy3SQYIMz2oWqFelHs7xUDVFp3F8zSgSinKXs0DR60iag+WZMMLG6ouE7b2wSEMDjQXIQpqwmlDUdSh6ZqV4jf/G8+fidq0oBqiUvLslNJMFuaNiczjygo+bGbs8WzhliIvsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860520; c=relaxed/simple;
	bh=YkBbPTDMtRmBGBko7DgY0wXAGBOIWC7jRU66P5vJ1z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eK8a0+xvXunCsWpxH/Z+OSNHA4HTdC6mYeXGdMJ/iSxhCCygafWdFuBCiYDfSF438bDb6wrflVo1G8alCD0hJ/+1LoypSP/D2eBojSnMe/1HBw9L5oZcpS6E3otzMPENB+56Cwd1LPQS4Dhq60viTWciUTzWXUY/lfv+//C/PU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g35sg+Fn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g35sg+Fn"
Received: by smtp.kernel.org (Postfix)
	id B1792C4CEFB; Thu,  4 Dec 2025 15:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCD8C116C6;
	Thu,  4 Dec 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764860519;
	bh=YkBbPTDMtRmBGBko7DgY0wXAGBOIWC7jRU66P5vJ1z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g35sg+Fn9jnXiiQilvql6NawBF/GQVykEPX1p3k16xm5vSVH2cmNMGEHXDRLiyXZH
	 3CAZIbsqyuWuIEDAcDqFMvPvd0a+ewo2fHghl3Y7/FYa2C/zqzs5Fo5BXc7m9XKc5u
	 oauEnjDynujqMm7d78sOjB4GOWPbmSTRTup56GYM=
Date: Thu, 4 Dec 2025 10:01:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4] b4 diff on multi-patch series does nothing (and fails)
Message-ID: <20251204-prudent-free-partridge-ea14b9@lemur>
References: <3f1646bd-3802-4bd3-8ecd-2ea6ffb16e4d@cherry.de>
 <20251204-quoll-of-sublime-skill-8a039c@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204-quoll-of-sublime-skill-8a039c@lemur>

On Thu, Dec 04, 2025 at 09:41:37AM -0500, Konstantin Ryabitsev wrote:
> > I'm flabbergasted, the same command I believe I ran a week ago doesn't work
> > anymore. (the same series can be applied with b4 shazam still today).
> 
> Yes, I can confirm that this broke with the migration to the new servers.
> Somehow the search for previous revisions now only uses the first patch in the
> series instead of the entire series.
> 
> I'm investigating and will follow up shortly.

Looks like there may be a bug with search threads download in v2.0. I've
reported it upstream:
https://public-inbox.org/meta/20251204-modest-jaybird-of-will-9d55dc@lemur/T/#u

Meanwhile, I will repoint lore.kernel.org to the old servers until this is
fixed.

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184BB2D8390
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758717; cv=none; b=FqcDpA0dLfhAkERCMlIbG58KMBIyUWbDhocKNw+WSabp91y/h12zZKa0GSNRYMVRDWrKv/9RiS5pRMGbGJBCChrd73Y6y6UL17xkRUH7YshUiF7mn1vkbnVoysDDmz1XK6R0tP4rcrUzA5xEE9NqYlbLhIC7cDZKiCGrklvy97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758717; c=relaxed/simple;
	bh=0mfisFfUKHguAWeRZVp4t8Up56DNuSBztTJUKF575Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKoe+/NBVORRJKxHqTDZ959sKz0LpWhdRon4oYy2C5ZfgMwgqoQ6NTB0ORIFeEGV9IEXjgpMM9lf5NgqHzQrGkutgjYHyf7T6Ek/rN4GkcsSMVYh2qEOZUOMovKFfnY6NJu7gEsubyPKCk0HBl8dCLq9EETqU8iqs4hO1fij1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mhCF/zMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mhCF/zMc"
Received: by smtp.kernel.org (Postfix)
	id C9BB5C2BC9E; Fri,  6 Mar 2026 00:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90767C2BC87;
	Fri,  6 Mar 2026 00:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772758716;
	bh=0mfisFfUKHguAWeRZVp4t8Up56DNuSBztTJUKF575Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mhCF/zMcsmpwhbs++kcDl+dCM/nEbTkmY8vH5r5Nw+R7sILb2Urj/rKTBc2EeTGHS
	 8OT55EyJd9ljrZTxX0c+jffeGLGeVsU7/PLZh1SDUK1lCvjg+90lgdH2KuifX4RLBb
	 aAF2S4Q4ZhYmKccedRecHrLWOY8BJB9Ecxz5ET9U=
Date: Thu, 5 Mar 2026 19:58:33 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: tools@kernel.org
Subject: Re: `b4` drops added trailers with peculiar patch
Message-ID: <20260305-courageous-peach-badger-5edcfb@lemur>
References: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>

On Sun, Jan 04, 2026 at 09:10:44PM +0100, Miguel Ojeda wrote:
> I just noticed that trying to use `shazam` on:
> 
>   https://lore.kernel.org/rust-for-linux/20251201165601.31484-1-atharvd440@gmail.com/
> 
> would not add the trailers, including Link, SoB, etc.

Thanks for the report. I haven't ignored it, I swear!
(Well, I have, but not permanently.)

bugspray tag b4/shazam

-- 
KR

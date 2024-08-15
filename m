Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED6218CBE1
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732105; cv=none; b=oMwbvd3ABu2T5oAC5ZUi3NsBz+pmt3cNihT2u3ibHLYZjHDTJaLKm8/blnhtFua5webUXmfi08ktBEJP9eSFd57lH0MmFp174mvmDK/Z/jt+5aXvfm99M7Hofn+gwjisjSnhlIaR2oSKIQNyrPuUudbj0DXAS/kQgVTc5mUX/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732105; c=relaxed/simple;
	bh=duWq9m81fNDK7rEEHaH5JGfDU2K8zruwxEn5fIlUJ58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwcunabVe0DG85pl9V6JxaPXacAnfX1MptB93Zd1OrU01nZ7A5UKMmBNbQiupsHHzPRQJDX9fogqeSRS8it7KHDfD6KaPIoSivgEPghUDA9BwKh/XESWV88Ls52t2nh67ojn2h4MXrqMIIkDgxS+uK6D42MXnbyECM8M14Ulpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rtNF1gVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rtNF1gVH"
Received: by smtp.kernel.org (Postfix)
	id 0399BC4AF0D; Thu, 15 Aug 2024 14:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05E5C32786;
	Thu, 15 Aug 2024 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723732104;
	bh=duWq9m81fNDK7rEEHaH5JGfDU2K8zruwxEn5fIlUJ58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtNF1gVHU8Z4daYUG4bxgTGlwuktTolD9TIS2B3i3N8fXS9OKnU8IYkGi5mc6IiUd
	 xa652wFqDPZ9iU9trP5YR+wO6ts2nrvf5RQm7ZwPZuXN/he0JGjI1FtgE4ef6/OLby
	 Pa56gI1MFre0eXkgLSKrvZW66T06DZaZzCgBGXIc=
Date: Thu, 15 Aug 2024 10:28:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: tools@kernel.org
Subject: Re: b4: prerequisite patch-ids generated in wrong order
Message-ID: <20240815-warping-watchful-dogfish-beace2@lemur>
References: <7h4j7y32gk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7h4j7y32gk.fsf@baylibre.com>

On Mon, Aug 05, 2024 at 05:43:55PM GMT, Kevin Hilman wrote:
> Hello,
> 
> In this[1] recently submitted series, I specificially listed:
> 
>   message-id: <20240801195422.2296347-1-msp@baylibre.com>

bugbot assign to me

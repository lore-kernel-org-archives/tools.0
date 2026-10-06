Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808F541E6CD
	for <tools@linux.kernel.org>; Tue,  6 Oct 2026 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292355; cv=none; b=KdR/90E3//tLnSn/dZV0RVx4L8RfKFViL3o+HRJWO9ult60phzDtu53Dqp6bWsyeUK7WRF/X3uNAMQBDLlH8Em7CqA+YWfdpqlgBTsKd+JbtxsWYrvS/2/f14YOIoahlH6fP9s1UT/W8t0JqWUE+WRPHHRHscnNz50bjT7pxr54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292355; c=relaxed/simple;
	bh=Tqob2A9g1cyvCPaPyqiUZE+XIYLIJmjuGlDELR8/wec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rThydOQVKu90vrS+uKOo3VURxV9H9uNF7wp6CfSITHAzWJGWYdu+foB6kDR/rO1wtgSL3wkzM0Oz4np7ZyYL804DXvRWh79NwmUgjKNJ6CVZg1rDvwtMIJsCAkRtkJ4GDrEU032W3kbMin+lFhs+PzisjATwybM/Bm5BNrrtKbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qwW/YwbH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qwW/YwbH"
Received: by smtp.kernel.org (Postfix)
	id 429B71F00893; Tue,  6 Oct 2026 13:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F36A1F000FF;
	Tue,  6 Oct 2026 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791292354;
	bh=i3E4jYihrl6oASpDQV0cgT1aOYyyD6xMlgnVwHlg2jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qwW/YwbHxHy5lGcMGE60NtcxA+2wki4FTiRi4VHs0amysV9KdJUqi3gpgW1Ica2L4
	 OSefJDwKLf1pJMCDY9Z2pEPJw3Ke/DYdkpYfstpxBm4lMp/rvSA7xRVUXKapnKLJK2
	 UdppBzYuvXOP2zzwsv3uPJaZMk2yqVYHRfhGyU2E=
Date: Tue, 6 Oct 2026 09:12:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH] COPYING: Update to current FSF address and boilerplate
Message-ID: <20261006-imperial-lavender-sparrow-0fbd34@lemur>
References: <20260916070306.2361370-1-mripard@kernel.org>
 <179119181264.1730306.3029163794938630210.b4-ty@b4>
 <asOVyMd-gNIqFWF7@penduick>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <asOVyMd-gNIqFWF7@penduick>

On Mon, Oct 05, 2026 at 02:19:50PM +0200, Maxime Ripard wrote:
> Hi
> 
> On Mon, Oct 05, 2026 at 09:16:52AM +0000, Konstantin Ryabitsev wrote:
> > 
> > On Wed, 16 Sep 2026 09:03:06 +0200, Maxime Ripard wrote:
> > > COPYING: Update to current FSF address and boilerplate
> > 
> > Applied, thanks!
> > 
> > [1/1] COPYING: Update to current FSF address and boilerplate
> >       commit: b3f89f0bdeb7854a1c3fde1c57edff20e1fb83d8
> 
> I saw you also fixed it for liblore, it also affects ezgb

There is now ezgb-0.2.1 out with the fix as well.

Thanks,
-K

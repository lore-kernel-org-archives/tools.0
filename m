Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92F367F5F
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041289; cv=none; b=DA26jbyd45I+KwnfX5rz/qoX2mUUAU1k0PJv4MyDm4HwzSQJJu3SCzNp00OeaKOi+m8bIkUCyH6h+vsM0tY1CDFLXryTtBapqRb8tTvOKiiMeW6tnD+IQkyD382ziGIsnt+Ogw4gRi/LJK3f1bxFe16YY0dgRopcMoYWXmPtjF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041289; c=relaxed/simple;
	bh=TnydVR/Yo2B/VqBN7NHtu68z9JluwK/y1z1Z9U9Ks7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bu/1MilSci9/0OcfzUrIoSZ7Mac7nA8dMUcG36edcIsFu//mVXXI3NqRSg1IqPTaFAqLGYyb5yUFvn5KncP/hqw79SwQCi00xtMXmSt2mLrPHA2q9wyiLwwpdZArzMYR8QxfeZ7TicuOHLK2RPqLixTZeHHNU76OSOYIPvc7qT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y9RW/613; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y9RW/613"
Received: by smtp.kernel.org (Postfix)
	id F0912C2BC87; Fri, 20 Mar 2026 21:14:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9340C2BC9E
	for <tools@kernel.org>; Fri, 20 Mar 2026 21:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9340C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7026BC56694;
	Fri, 20 Mar 2026 21:15:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B010A600E0;
	Fri, 20 Mar 2026 21:14:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6989410450CEE;
	Fri, 20 Mar 2026 22:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774041283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fM09tCpaQxXyt7q2xzhSqH0ulAnRO92uXJ7HWZukRfY=;
	b=y9RW/613DkTwmx3cW0r+5eem7wnPaF/MSVKsvmoZqriEIrNC601B6WpFvI+oWFPmbo+Xk+
	R/DiNb8gcSQKY6meEke5rTFfEewJZSTmeG32vh66gwmnjcE0zgTFBSOqGmpAxBFUX5oHwU
	tiKZksiWWfMJ6Cb1r77wb70QOl7dv7ZrDcz07wp6YrLwLUDslSNpSNMIgMSn15E1pilrzA
	qVZqhvSqBHjyju6Xzh/fZ9BClRWrcYJp6TwR1fZ9wKsi9akuzqxnJ4v5mQInOsI3+Zj+hE
	hngingBTmnXFnZxZ+k3mJVuUE5sbWsjNCVxMAMm4fjLoqnZlf3AovIgPW13hMA==
Date: Fri, 20 Mar 2026 22:14:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, users@kernel.org,
	tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260320211441bdb20f47@mail.local>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <24351d92-3f8c-412b-807d-ed7ee0b1ebf6@bootlin.com>
 <20260320-puzzling-pig-of-opposition-a8b61a@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-puzzling-pig-of-opposition-a8b61a@lemur>
X-Last-TLS-Session-Version: TLSv1.3

On 20/03/2026 15:31:06-0400, Konstantin Ryabitsev wrote:
> > - Copy don't work in the tui
> 
> This is a Textual framework limitation -- when mouse support is
> enabled, the TUI captures mouse events for scrolling and clicking,
> which prevents normal terminal text selection. Launch with
> --no-mouse to get normal copy/paste, or make it permanent:
> 
>     git config --global b4.review-no-mouse true
> 
> I've added a visible tip about this to the getting-started docs.

For this, I replied privately to Louis but shift+mouse should allow
copying, just like in neovim.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

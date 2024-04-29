Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3D28398
	for <tools@linux.kernel.org>; Mon, 29 Apr 2024 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714385844; cv=none; b=dCuxA7llpIrTWU/H/md48E4N5bXFQR9JP+InQ/ydch7ltD2ad+lEvpKObd0uaHLmUQVX/iR1I9/DNz+rrp2zHmwT3pS0oQAautFF+sIKm8fsLGlYG5MSmrXzReyf0I1U8I34+RI1u1p9+I9UZHlDEyRyGESXg6DQgTNAoAGlOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714385844; c=relaxed/simple;
	bh=MTEpomz4NacoVcriOajKQ83pXD50PzYHyP1KLwSZatY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ib45eCS8Bxh7pHISxAph5E4WhyrUI1zOpL8S42Yg1SZl2XzC5/6k9WKUE+mkVRxx45r2AisAUcGqJ0pNtYwKYtm4LkokASAgihdH9sYUKyYQGwaoYK8uG4/ygsZD4IFToURnmaA/9srmNEpPwlPwyc+cXk7Ufkd+5zGgOOG62SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KmlITrlH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KmlITrlH"
Received: by smtp.kernel.org (Postfix)
	id AD76DC4AF17; Mon, 29 Apr 2024 10:17:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7445AC116B1
	for <tools@kernel.org>; Mon, 29 Apr 2024 10:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7445AC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C67FFF802;
	Mon, 29 Apr 2024 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714385834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VTa6n8hqJMwmD/f6103XKZfQPDzzxDG+EkzrQXTyS8U=;
	b=KmlITrlHUkLK3vKo42kMVGlbJB9SsQZ27VxfsSjCdwRHsSvWL8l41ezowKeXLo6k7Hv3nF
	F9HngkyxgjHwkbZCQOuVh3CS3ZtRdBJAEbHOmVz2fibmu66nz7SPMSfJEwt/bAh2dNEcSf
	nF/0CpB/XdBn8IwDFf9UTDhNul5kMYt7w7GXmomx98e+cGjvlW+fBPZSE5PeU6X6oj3eiv
	RMH6lcR3sWaffCegvQGfdeZc6A9+ifAmxEMj42Rk/791YggJahBVGMZ3+JiOOcBG3H6tGc
	2wFFdQiYX9f4AAVGbpTvsoYgqdbWpeAfDUfFlgaPHUICb4U+7KnTSrDXpqWHyg==
Date: Mon, 29 Apr 2024 12:17:12 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4: use new trailers in 'b4 send --resend'
Message-ID: <20240429121712.1b54f5fc@booty>
In-Reply-To: <20240426-tremendous-rhino-of-assurance-ad5e99@lemur>
References: <20240426140157.349783d6@booty>
	<20240426-jasper-sloth-from-neptune-82a6f7@lemur>
	<20240426184425.23b606bf@booty>
	<20240426-tremendous-rhino-of-assurance-ad5e99@lemur>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Konstantin,

On Fri, 26 Apr 2024 14:04:49 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Fri, Apr 26, 2024 at 06:44:25PM GMT, Luca Ceresoli wrote:
> > > It's not really necessary to resend a series just for trailer 
> > > changes anyway. The maintainer will most likely use b4 to retrieve 
> > > it anyway, and that will pull in any new trailers.  
> > 
> > I cannot recall exactly when it did happen and provide a link right now,
> > but I clearly remember having been asked by some maintainer to do
> > exactly this, instead of pinging.
> > 
> > The rationale is that sending a new version just to add review tags was
> > considered bad because one can expect the patches or commit description
> > to have changed somewhat, which it hasn't.  
> 
> Yes, to be clear -- I wasn't suggesting that you send a new revision 
> just to add trailers either. We're both aligned here.
> 
> > OTOH resending without new trailers can lead to applying a patch
> > without those tags (not recognizing reviewers time), or even worse to
> > discard a patch because it does not show the needed tags.  
> 
> I expect this is one of those "every subsystem does things slightly 
> differently" situation. If the maintainer uses b4, this entire step is 
> unnecessary, because any missing trailers will be applied anyway when 
> they run "b4 am".

Ah, interesting feature. I had no idea about it as I'm using b4 for
sending patches only. Thanks for the clarification!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

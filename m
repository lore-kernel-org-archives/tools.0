Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A313B5A9
	for <tools@linux.kernel.org>; Wed, 11 Sep 2024 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043962; cv=none; b=mTh00eIfzI0DAAVxdS/XaLLtP/MFPhlh6nuRowf1WWaw/yt8thqQtO0TsLq8q+gbzCdE9s8koP9UQwNLVK8E7mCEQ7Ar/B4i2wblbrRMs8h4EfoVsHmEv30j90Gy3/tRrL2I7bcs9VqXrVzWugqQuniaTaf2APx1i5nS08HZl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043962; c=relaxed/simple;
	bh=X88lT9QhMcBcq7pqQqCPWMR4Xx40C7MBxGA51PkwdAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR+3Nv8aZnQGwbRKx/9Hmk6YIexGw/xQ5WMfS4lEpaSOmtwqV2pPK12miRrI+KbPGQgbS5SLczHENJJg6jZmjcTcHOJZPUutkkS+ba6ZkoeeYvWFjX/YsupQkhIvSRCbpL0aPSxsOnS/Nm3FGuXAwypKuUKJo+fiRDGA1yhkhC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mpO2hcXt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mpO2hcXt"
Received: by smtp.kernel.org (Postfix)
	id E5FB5C4CEC6; Wed, 11 Sep 2024 08:39:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37007C4CEC5
	for <tools@kernel.org>; Wed, 11 Sep 2024 08:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37007C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 451D41C0008;
	Wed, 11 Sep 2024 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726043958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYGhh59YHuplk6LpgBzMwXdwDAiICr7vaCwYo+SHf/0=;
	b=mpO2hcXtRFsSBVS0xbcBDOo75geydMF8eXeHXb14jo+5GIwpuvBFO4csVNEzC4hPp49v0B
	vIc4NYElLkbDs6gQBRUOGiDBDoxPs8+Y0h82lF/LiQw7RGfV1hPw28PkZ0rKFqYFv2sOZu
	3rOkWl1naOgLLXcKw7FwCnLfk9Sq9pFLhbtoERN+mGomkFD8PJ8InKExRo6rleuI1ahbVv
	LM/x1pWb8tVB267oKGV9CY7FvehsLgCPupv59ZXVK8sOXsSzw2JjW/cRZEnEK5mI2zBlGB
	Don/XUZ7j0o0Gn+6KS1nyCP5iHeirnjQLZmblQmoQ280apNJSW4ynBmb3EA6ZA==
Date: Wed, 11 Sep 2024 10:39:16 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH b4] send: Add mail header to identify reflect messages
Message-ID: <ZuFXNJmPplL4dbB_@louis-chauvet-laptop>
References: <20240910-reflect-header-v1-1-99d3b6eb0bcc@bootlin.com>
 <20240910-ubiquitous-onyx-hoatzin-3d4fba@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910-ubiquitous-onyx-hoatzin-3d4fba@lemur>
X-GND-Sasl: louis.chauvet@bootlin.com

Le 10/09/24 - 16:41, Konstantin Ryabitsev a écrit :
> On Tue, Sep 10, 2024 at 09:52:46AM GMT, Louis Chauvet wrote:
> > Series are often send with reflect before actual submission to check the
> > To/Cc and the content. Those reflected series are difficult to identify as
> > they are intended to be exaclty the same as the real mails.
> > 
> > To allows people to write filters for those reflect mails, add a
> > b4-specific header X-B4-Reflect.
> 
> I think we should actually put REFLECT into the subject, same as we do with
> preview. I know the messages are supposed to look exactly as if they're
> actually sent to the lists, but we can put "except REFLECT in the subject".
> 
> That would be a lot easier to identify than a header for a quick visual "did I
> send this series yet?"
> 
> -K

For me the whole point of reflect is to have the exact same message, 
including the subject, so other tools involved (at least web endpoints 
for example) can treat it as a "normal" patch, that why I added a header 
and not a prefix.

I agree this is not very "visual". If you think adding a prefix is not an 
issue for existing tools, I can do a patch to add the REFLECT prefix.

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B911F31B83B
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818018; cv=none; b=Yovpwx02ZN+heDc/UGopOctv0SXENoW43fv8tIjoLtFsNp6O0DKXq4dTGSTxgj5kPGADBwTSvcI8zdxqJOj6smfMCDcpTCGb29RSeu52DlGf7sDG7ycYCOy91FLZc3YreocfQcThVcmyhay/YRB8cOK4KnsUxzsB3j8Ecv5GWDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818018; c=relaxed/simple;
	bh=/AJ2ZGcAfKkzrHI0ifcYGaf+GEOiu1SL+g+h6wQ5sCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzjGE69bLA6DLSk7LBckzMEARHRBSnZHE4VYPNTdOGPDgJsolHCk0pWXeJgaicYJLVT/vKFiSgtAbHc7kKLrEsNoDBiBosqkO7tHIpXGoD1a3kLpfa5XyzHHqqfjQR+XB/dlSohBhrjGV1/V4MIfR55MjrtFbjMjM9aX0ptxdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sQS+Bcd6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sQS+Bcd6"
Received: by smtp.kernel.org (Postfix)
	id 89C07C19425; Fri,  6 Mar 2026 17:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F5CC4CEF7;
	Fri,  6 Mar 2026 17:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772818018;
	bh=/AJ2ZGcAfKkzrHI0ifcYGaf+GEOiu1SL+g+h6wQ5sCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQS+Bcd6ahXK4xPerlV7L3S544+xUaEdPezFXJvdZxjmZAImFNF5nJ7Ly4RKnyQEH
	 NbvTiKw3UHc6MuP5OCYcduMgiZJ2j76PhWUPkoD01J99vG7tSB3Zrifg8mAbH+EjvS
	 OW92dNdYOICXNH+5Q1pbtZfNWdeHt5IsMU4p1Ua4=
Date: Fri, 6 Mar 2026 12:26:57 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Christian Brauner <christian@amutable.com>
Subject: Re: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Message-ID: <20260306-rare-spotted-wasp-adc84c@lemur>
References: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
 <20260306-cherubic-electric-bullmastiff-bcb0da@lemur>
 <20260306-seepferdchen-ziffer-c69d1d90fc16@brauner>
 <20260306-grumpy-jade-bulldog-a6f004@lemur>
 <20260306-biobauer-mondfinsternis-cc602b2b9c3e@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-biobauer-mondfinsternis-cc602b2b9c3e@brauner>

On Fri, Mar 06, 2026 at 05:17:57PM +0100, Christian Brauner wrote:
> > I don't see a way to reconcile what you're trying to do and keeping automation
> > working reliably, do you?
> 
> Yeah, I wasn't aware that this is a limitation. If this isn't super
> uncommon, than it is broken with similar mail chains. Good to know that
> this breaks b4.
> 
> Maybe what Vlastimil proposed would serve at least a similar purpose
> where it adds the people on the bug report to the Cc and automatically
> inserts a Link: to the report in the message or the commit.

Right, so if I understand it correctly, we want to be able to post a "here's a
related patch" but without it being confused as a patch within the same
series. I think one way to accomplish this would be to post the patch under
the scissors, like so:

    Hey, how about this patch...

    -- >8 --

    From: ...
    Subject: [PATCH ...] Unrelated Foo Patch

    This is foo patch for bar.

    git --diff ...

I *think* this would do the right thing, but I need to test it first. From
your perspective, would this do what you're looking for?

Regards,
-- 
KR

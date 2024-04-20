Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C88C10
	for <tools@linux.kernel.org>; Sat, 20 Apr 2024 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713630590; cv=none; b=X5hZ03RSxBX6k4chSEiWCJHfAzZ9ECfh55H+2uIOD4Pu8jR8dK+p4wC2rgGyDn+Dmszj8Ac2oxx4oA0W8sS0l3ljz2ww406PfOPRSpmaqfUJy8e2XGPxHkPoI7hAKplqWf02qyuV+6PFFtfafRLhYQWVT4pgXEr5j6LsotwM4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713630590; c=relaxed/simple;
	bh=2hlb1anDKEYkefp9KrZOqEUNUolknuSwZ8cKHj4P7no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEb/c3+SEnSLy07dV6KEfrrr7yWGCw6KCS0fT5+kPm35H2hamjaLrq1t3LUseyL2fEBxvaVrGVL3Tt6OHyzmn6yw9QjnKxb1Qp5mVyMY2RzM/BJr++7OAOVnyeEoK5HEKHt82qud9RR/fFWanP4hC4oWeQsIVDngVCL9LnjRPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0Eu+Xt3U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0Eu+Xt3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FC3C072AA;
	Sat, 20 Apr 2024 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713630590;
	bh=2hlb1anDKEYkefp9KrZOqEUNUolknuSwZ8cKHj4P7no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0Eu+Xt3UxTWsPhkg7dIlsJ3JjCOblc+u2ankMmNourj/GFEqC6s6yUOXhD5b5ErlZ
	 41GvgzwyPBuf57kKStr2U8Fp7jnSqvyq4uofB9BQYyqvH66zWPhDRjZUvtYMrj2iAK
	 MtcGNTCeAh2YWZkmytqRGX0tIDqGZBnOOm2CRsOQ=
Date: Sat, 20 Apr 2024 12:29:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Checks for recipients
Message-ID: <20240420-arboreal-natural-sambar-ff61bc@lemur>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
 <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
 <ZiPBx36go0AYBWO7@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZiPBx36go0AYBWO7@finisterre.sirena.org.uk>

On Sat, Apr 20, 2024 at 10:23:19PM +0900, Mark Brown wrote:
> > I added some stuff today that introduces "pre-flight checks." I'm 
> > not
> > sure if it's quite what you were looking for, but --show-info will now
> > give you the following data:
> 
> > - if prep --check needs to be (re-)run
> 
> I can see this being useful but I am not personally going want to
> incorporate this into my scripting as checkpatch is just far too prone
> to false positives, especially with anything that isn't a simple C file.
> 
> > - if prep --auto-to-cc needs to be (re-)run
> 
> I similarly wouldn't want to to do this as there are cases where it
> pulls in too many people (mainly cases where you only want to send
> things to submaintainers rather than including everyone that gets pulled
> in automatically).
> 
> > It doesn't try to be very clever -- basically, if the tip-commit of
> > your series changes, we assume that you'll want to rerun the
> > prep-check and prep-auto-to-cc, -- but it's effective. I just hope we
> > are striking the right balance between "useful" and "annoying." :)
> 
> > Can you give it a try and let me know what you think?
> 
> I think for the issue I was reporting above just showing the recipieints
> in show-info would be enough, all I'm looking to check for is that the
> list isn't empty.

Thanks for your feedback. I'll make these two changes next:

- add a check/report for "needs-recipients" that will be separate from 
  "needs-auto-to-cc"
- add a way to turn off pre-flight checks via b4.prep-pre-flight-checks 
  = off

-K

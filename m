Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C354235AC12
	for <tools@linux.kernel.org>; Fri, 17 Apr 2026 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414487; cv=none; b=Wc/D4V4ZOpevO/gmywv8PuOjTsngeRFus7VEqzOUsvhLDc9giKFen7i3HEwnwbEIFXfkXP9QQlnhHHiY17OKuWIixqE+wQSza/k6foOE/4nmyeVNQF1p0dSnJgiEtJTwCp8hDWtp0GAKXcdvvtDiCxZhEKyxzp99XSLc4ogkPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414487; c=relaxed/simple;
	bh=JIDKmvCMvHN45OwMhyivDYhM/aFHm1reYsHanfk0Mdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcbX5cHGXlE+10UkO+JNW8838PJBEtT5AIUrDaQ5Gr0GR35sLnHmGBqD4KmIH6aJoLcB3FVklmcP9KYzDRD0Rt/LXGHvePqtMbqDatR4urgVC49EYfKLfqwuUn0oRufJoXIKE2XTFGxzNaaqtnxj2sl6lZWbwgdRH2Gn4ngePqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvgHV2Jv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvgHV2Jv"
Received: by smtp.kernel.org (Postfix)
	id 73032C19425; Fri, 17 Apr 2026 08:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD91C2BCB5;
	Fri, 17 Apr 2026 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776414487;
	bh=JIDKmvCMvHN45OwMhyivDYhM/aFHm1reYsHanfk0Mdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvgHV2Jvvv6hwDxaU7fPtOapi1VEjlkas4jzTVQBD5GrmAVunqwBoYJCi97gtJ6oO
	 pUbLVPDmvyhwwmSuKtdGOaBRKpRux0Tr3Mcp4ug6zg3RUtKjVecE1gIWJb3tzxSHXg
	 s2EiT3BLshf6+vMiT6hMppLhFu/uiW8cuIFUzyc1o9Rrsy8eQVBJt2/HkusXK21hOD
	 gxbmvGX24LobUe5c+NkvX5EhfCxHgRrs+ba8aUDeOu46lwV9wYDo1JzFGNtFqa3AlX
	 0Ou1f73X9Xr79iRTck9Yu/9qicO7LngbeSE6bTH8X1ogD+du0+L9kCpLnYeKbNwx5O
	 zPsoF/3DksqKg==
Date: Fri, 17 Apr 2026 09:28:04 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dan Rue <danrue@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Subject: Re: [PATCH] add sashiko URLs
Message-ID: <20260417-umber-oxpecker-of-brotherhood-3a26cc@sudeepholla>
References: <20260416112156.1059032-1-rppt@kernel.org>
 <20260417-original-smooth-heron-96be80@sudeepholla>
 <aeHjbOXjWWzFnAuV@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHjbOXjWWzFnAuV@kernel.org>

On Fri, Apr 17, 2026 at 10:38:20AM +0300, Mike Rapoport wrote:
> On Fri, Apr 17, 2026 at 07:50:09AM +0100, Sudeep Holla wrote:
> > On Thu, Apr 16, 2026 at 02:21:56PM +0300, Mike Rapoport wrote:
> > > sashiko is gaining traction and it's easy to add its URLs along with
> > > lore ones.
> > > 
> > > Signed-off-by: Mike Rapoport <rppt@kernel.org>
> > > ---
> > >  lorifier.py | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/lorifier.py b/lorifier.py
> > > index be7294b..96529bd 100755
> > > --- a/lorifier.py
> > > +++ b/lorifier.py
> > > @@ -25,6 +25,7 @@ import sys
> > >  from email.utils import mktime_tz, parsedate_tz, formatdate
> > >  
> > >  LORE_MASK = "https://lore.kernel.org/all/%s"
> > > +SASHIKO_MASK = "https://sashiko.dev/#/message/%s"
> > 
> > Just curious on the choice of
> > "https://sashiko.dev/#/message/%s"
> > over
> > "https://sashiko.dev/#/patchset/%s"
> > 
> > As the latter points to former while the reverse is not true unless I am
> > missing something.
> 
> Patchset URL does not include message id, e.g:
> 
> https://sashiko.dev/#/patchset/20260417223004.1-evm-xattrs-v2-pengpeng%40iscas.ac.cn

Yes it does not directly specify message id, but it does presents links to it.

For example, above patchset link has links to these:

https://sashiko.dev/#/message/20260407153002.2-evm-xattrs-pengpeng%40iscas.ac.cn
https://sashiko.dev/#/message/d95993e3d879bec4c9e3416906d409cca9c8ffeb.camel%40huaweicloud.com
https://sashiko.dev/#/message/20260417190004.4-evm-xattrs-reply-pengpeng%40iscas.ac.cn
https://sashiko.dev/#/message/20260417223004.1-evm-xattrs-v2-pengpeng%40iscas.ac.cn

> 
> I talked to Roman and he said he'll add links to patchsets from messages
> Really Soon.
>  

Cool, that would be great.

-- 
Regards,
Sudeep

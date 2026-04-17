Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C471377014
	for <tools@linux.kernel.org>; Fri, 17 Apr 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411506; cv=none; b=fluybItxiaLVA9tOSM0S3YQ0z09Y+v5Lq8NMEcGNdxw3THX7gC4rJxNrnXyAnaRD475P1+Q0cRwssEo8TmVRuiL9EX2OkydP36+9l/UKmj/7/2ZXamynUsrj3ndt5YR5YBvwo/x4ktmneRdV+3kBiGJXHDl12mcbXMRNL9lSd24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411506; c=relaxed/simple;
	bh=qJS+1jJQL8155P42owIJoNu0sPrX4BGRB4I9CL6TAXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4976N7Ai46LF1v4maPEjxwDy98CbJpWR3eeupDFa9eGZyiJBlLAUWZ6t/DTptcxohX+HG6DUqkmOgt21UJBBuPoxxwxD4GcWgtlJch9GfKa19ylf+wk9LKD0wAeSWrepJMK9iHrmigSRsoMdmqVhm8O2CcVfoJxJFRLutZ47uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1ODd2EE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1ODd2EE"
Received: by smtp.kernel.org (Postfix)
	id 47F3FC2BCB4; Fri, 17 Apr 2026 07:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65760C19425;
	Fri, 17 Apr 2026 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776411506;
	bh=qJS+1jJQL8155P42owIJoNu0sPrX4BGRB4I9CL6TAXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1ODd2EE/DaXJHwqGAbV/5CpR7WHAgdoCLiNBIRNXpkp5t0/CUK0gaqEtdgLiZ0Ax
	 LKmPtiTgDqkVPHd9bi5RAJAwptFjW0ywJXImfQzj5ai/L1F2TXUbRg86O7xW2BePrN
	 i+DwaYV/iDByC/Vh90TtvKzjrrZOmSzdqzjAr/lDA1jXTJIgOMbuVvZJY8dTfhx+e0
	 anZzn1BhA0yYgRHYj3LV0HMqpeqCg9sVBKss+2a1QxhYEqzl5SXTyeciIMC6pJVZCT
	 +JVkRQ6pzZgf1m1zN3lMyeRPgprojS/By63vWekwAepW/h2fv1MPldeKppzC4zsAfT
	 15xcs3M9Urh0Q==
Date: Fri, 17 Apr 2026 10:38:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Dan Rue <danrue@gmail.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Subject: Re: [PATCH] add sashiko URLs
Message-ID: <aeHjbOXjWWzFnAuV@kernel.org>
References: <20260416112156.1059032-1-rppt@kernel.org>
 <20260417-original-smooth-heron-96be80@sudeepholla>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-original-smooth-heron-96be80@sudeepholla>

On Fri, Apr 17, 2026 at 07:50:09AM +0100, Sudeep Holla wrote:
> On Thu, Apr 16, 2026 at 02:21:56PM +0300, Mike Rapoport wrote:
> > sashiko is gaining traction and it's easy to add its URLs along with
> > lore ones.
> > 
> > Signed-off-by: Mike Rapoport <rppt@kernel.org>
> > ---
> >  lorifier.py | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/lorifier.py b/lorifier.py
> > index be7294b..96529bd 100755
> > --- a/lorifier.py
> > +++ b/lorifier.py
> > @@ -25,6 +25,7 @@ import sys
> >  from email.utils import mktime_tz, parsedate_tz, formatdate
> >  
> >  LORE_MASK = "https://lore.kernel.org/all/%s"
> > +SASHIKO_MASK = "https://sashiko.dev/#/message/%s"
> 
> Just curious on the choice of
> "https://sashiko.dev/#/message/%s"
> over
> "https://sashiko.dev/#/patchset/%s"
> 
> As the latter points to former while the reverse is not true unless I am
> missing something.

Patchset URL does not include message id, e.g:

https://sashiko.dev/#/patchset/20260417223004.1-evm-xattrs-v2-pengpeng%40iscas.ac.cn

I talked to Roman and he said he'll add links to patchsets from messages
Really Soon.
 
> -- 
> Regards,
> Sudeep

-- 
Sincerely yours,
Mike.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABED25771
	for <tools@linux.kernel.org>; Thu, 13 Aug 2026 21:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657151; cv=none; b=PIpIZmUkycvJrR6qQVGfN2WQpSBZgoxl/T2+Uk/iIs0iiFliG9/0xS7PcKidPhT7unzSl7Oud+1FLRGUuEcYU03s77i9OEL+G4MHm/vHFAIR5wzSb3ne+jI93sxw9q5IUk4oE56dVHjb/9ZcMcVAHyjw2UuFJWemtvhiEwLWtnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657151; c=relaxed/simple;
	bh=ght4w38NZXkhngWOOS9uoJMioy+WzSSN4OGS9p4uNNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVr1IQEgsMWvxnIN4nrq+yvcNtnQayqctDiQb75DRKHNfppdjh8d4lCZ6pLHndeKwDXSM0JfstL+D8SmThN+WcYTrqeRCGStSPYtGe9w1GHl1tITYWM7csk5sdBgEve7M4P1iFUJ3ssu7GfVzvDJcDjncAfaF+DmYRd4UuZbVcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fYl6yhjV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fYl6yhjV"
Received: by smtp.kernel.org (Postfix)
	id B15BD1F00A3A; Thu, 13 Aug 2026 21:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515CA1F000E9;
	Thu, 13 Aug 2026 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786657150;
	bh=QuzA0EKnw5BhWDchgEWWQC5BzyOUQ4a9eygXnzbpQnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fYl6yhjVcZcxplkxyAju1juVnDrFUeqigBTVsbhCJk/29LUrVkpHkSVLQbtqNXWdu
	 BTXc/6i2hZ/531EfIxxBk0q2WYJSfO1wgcGglYRtD0tObrSH0Vjxf2FbK1fuSVpkEt
	 KSTSC4VM3RNoutz8tUv4q2b+0nJ0MqtlATGq83r8=
Date: Thu, 13 Aug 2026 17:39:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review crash
Message-ID: <20260813-garrulous-jaybird-of-advance-c2efbb@meerkat>
References: <1bcfac04-3a85-4d8d-a0a1-094abe5dd807@sirena.org.uk>
 <20260813-athletic-therapeutic-armadillo-cdd2bf@meerkat>
 <20260813-rigorous-sawfish-of-protection-1aecb4@meerkat>
 <0026503d-6adf-4c22-8785-6a17cf8252d7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0026503d-6adf-4c22-8785-6a17cf8252d7@sirena.org.uk>

On Thu, Aug 13, 2026 at 08:17:55PM +0100, Mark Brown wrote:
> On Thu, Aug 13, 2026 at 02:04:48PM -0400, Konstantin Ryabitsev wrote:
> > On Thu, Aug 13, 2026 at 01:35:44PM -0400, Konstantin Ryabitsev wrote:
> > > I'll add the fix.
> 
> > The fix is in now -- it will pop up a warning message with an override option.
> > Please try it out.
> 
> Gets further but still splats:

Yep, take 2 in the master/stable-0.16.y branch now. Not sure why this didn't
show up in my test.

-K

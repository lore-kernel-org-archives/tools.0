Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D743FB1B
	for <tools@linux.kernel.org>; Wed, 17 Jul 2024 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236506; cv=none; b=jXkV9xtSkpURPPdR5Ti3uPrROJpCixQKRLKsri3vK4Meh/ktOh6tsc48YFyPlou2SfoiQBgHwUUAB4We8SV4rYv9D0DAgQ73Yb8nOPfyZNMVtge7IS8QpkSlsW2QIbenxGuMYx2BUReZte3DimUsFFAq5/Bz92Gbd2jm2B+j7/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236506; c=relaxed/simple;
	bh=nDRQo5eWtZ498i/UI6OAdXA3ltAZibjYSPdkeihNNa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDc/qsZAOsi4AbltjJfnl32eTFyIr+7DuEVedGw76+yKWZiYPpfqwGPR/TOtEJvCPLgteo/eEoEjge8zppXnnEcYKaIIMGeWkSsfoFfHwJK6aUm3Y3FbDcEvn0eTqAcGssjkSjb5jcWfagBjwWWb4Mv67T8347NY6pynBO5UaXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WYzBVPaN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WYzBVPaN"
Received: by smtp.kernel.org (Postfix)
	id E2FA7C4AF10; Wed, 17 Jul 2024 17:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D40EC32782;
	Wed, 17 Jul 2024 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721236505;
	bh=nDRQo5eWtZ498i/UI6OAdXA3ltAZibjYSPdkeihNNa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYzBVPaNRvfrvAO7ZTJ9JR6loEoEXNKnVcDzJztsgoWNGK6FIAzQ+coQunGVmTq4u
	 p1ZsR1WWcB3zl7LXo694vAj7TewLdBgmYwa07gQyHwb/p+q43KdAmlYfF812sgfMCM
	 R1y3F1u625frAsjk8jFNfCBe3IAIJFRp2JBjRPkk=
Date: Wed, 17 Jul 2024 13:15:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, tools@kernel.org, users@kernel.org
Subject: Re: b4 0.14.0 available
Message-ID: <20240717-dark-noisy-copperhead-3ac7cb@lemur>
References: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
 <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>
 <20240617-ancient-newt-of-art-6d2b27@lemur>
 <20240717-curious-earwig-of-argument-ee5dae@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240717-curious-earwig-of-argument-ee5dae@houat>

On Wed, Jul 17, 2024 at 02:59:33PM GMT, Maxime Ripard wrote:
> > Sorry about that, I've now excluded the tests subdirectory. I'll publish
> > 0.14.1 in the near future.
> 
> It looks like it wasn't enough, with current master (131835a44c63)
> 
> $ python -m build --wheel | grep tests
> copying src/tests/__init__.py -> build/lib/tests
> copying src/tests/conftest.py -> build/lib/tests
> copying src/tests/test___init__.py -> build/lib/tests
> copying src/tests/test_ez.py -> build/lib/tests
> copying src/tests/test_mbox.py -> build/lib/tests
> creating build/bdist.linux-x86_64/wheel/tests
> copying build/lib/tests/__init__.py -> build/bdist.linux-x86_64/wheel/tests
> copying build/lib/tests/conftest.py -> build/bdist.linux-x86_64/wheel/tests
> copying build/lib/tests/test___init__.py -> build/bdist.linux-x86_64/wheel/tests
> copying build/lib/tests/test_ez.py -> build/bdist.linux-x86_64/wheel/tests
> copying build/lib/tests/test_mbox.py -> build/bdist.linux-x86_64/wheel/tests
> adding 'tests/__init__.py'
> adding 'tests/conftest.py'
> adding 'tests/test___init__.py'
> adding 'tests/test_ez.py'
> adding 'tests/test_mbox.py'

I believe I made the right incantations in the latest commit. Please check and
let me know (you may need to run "git clean -fdx" before "python -m build" to
get rid of all caches).

-K

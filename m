Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC618CC13
	for <tools@linux.kernel.org>; Thu,  6 Feb 2025 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864041; cv=none; b=K2Rdi6N+TM/lgiZd23fwHcjiVVix3uXxUmIGu/SnuXj3RVqDeEvOxsm5nTJFtC6BhIdrCIFOjVb8+Eh2Y2rmEAlWaFuMRnjg3cM6hB6Cd+yMMidVe/iDBzf+Ggww/StAuIDoGPINtdLiKWaqNIWpf+J0mwi8d6vu3puskTGIpMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864041; c=relaxed/simple;
	bh=KAr5iSe4tcus/WcBjwcxIsZYndH5xJSnAMXDgU0gYWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPnQrvtlNqUg/XgFLua7sh0TTBpcXd1knFFqtXdHIWSDcy8Z9HhBrKxKy0t6ipMAivYA4XFNL2B7m8DEYakkvWAWt4bVtGyj1eKGM10tPzrJgZW4NPuUKSfoFtTlzu0KO4+9qLnG8DUl49rjOY/5LSUiMJnw9myE6p9mfGJ3zPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Cx9VzfxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cx9VzfxB"
Received: by smtp.kernel.org (Postfix)
	id F0128C4CEE2; Thu,  6 Feb 2025 17:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B810CC4CEDD;
	Thu,  6 Feb 2025 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738864040;
	bh=KAr5iSe4tcus/WcBjwcxIsZYndH5xJSnAMXDgU0gYWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cx9VzfxB7poAzrqV79I9jvuJh6QifmFtGQATIicHfeV2YnOuXuljGJ4O2Scx3Pzh8
	 wFvP6p5fCajubd/U2kF0oEhusAnrxERX2oauHhdSf1vT2DispdYyNDh3q0MfYXIe+M
	 99P06jFVgDF+JlSsQEm6gepANQyQIA+nNEk/xIfs=
Date: Thu, 6 Feb 2025 12:47:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
Message-ID: <20250206-yak-of-majestic-relaxation-dffffa@meerkat>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
 <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
 <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
 <20250123-macho-sidewinder-of-acceptance-8dea0f@meerkat>
 <e6c6f928-bae7-4509-9410-42e4bf7d9252@kernel.org>
 <20250205-polar-spiffy-baboon-09cd5d@lemur>
 <8f145a14-d876-4a81-9c1e-cdc61dab2ef0@kernel.org>
 <20250205-shrewd-wolverine-of-examination-dea5c0@lemur>
 <16783231-108e-485a-8db5-f40f9c6bee9f@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16783231-108e-485a-8db5-f40f9c6bee9f@kernel.org>

On Thu, Feb 06, 2025 at 06:23:58PM +0100, Matthieu Baerts wrote:
> Sorry, I have one last question about this. When reading this part of
> your commit message ...
> 
> > The consensus is that we *do* want to apply mailmap updates to the
> > actual addresses going into to/cc, just not to the in-body From:
> > addresses generated during the "git show" stage.
> 
> ... I'm wondering if there is still a need to look at the
> sendemail.mailmap config: it is now only used to modify the behaviour of
> patches generation, and not how/to who they are going to be sent. In
> Git, this config option is supposed to act only on the second part.
> 
> Don't get me wrong, the current version fixes my issue, and I'm happy
> with that! Plus I know I suggested looking at sendemail.mailmap as a
> "workaround". But now that the confusion around my issue has been
> cleared up, maybe all we need here is to always use "git show
> --no-mailmap" and forget about sendemail.mailmap? :)

I'm okay if we keep it as-is right now, but we'll keep this in mind for later,
should this come up again.

-K

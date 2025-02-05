Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA2193436
	for <tools@linux.kernel.org>; Wed,  5 Feb 2025 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771992; cv=none; b=FuIt5guwMdlV1ZUxV3JtLWnsMig0djiHnUUkaOFEZaQ+wlnAw6pCkJbSQSl6CoQbvH/+VkIqWxwe0FZCIOMvuacmJtTx8cEbtFOdZOjmS6sA4VzTbnpXjN7tinyLWdQ1rWYOj61gp4O1o3Kga93UZLCs2JCFWadBdtMGfafMRTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771992; c=relaxed/simple;
	bh=rt7rPPTvJLjtdeKR/MUPNd3gD9N4fDDgda0M2/vkvUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OozsyejdylR4Yw45dcMAzK8sYQdp4QHbVgkSHNUKU7ulQhCz1uMJBaP6WwFKExa/gr/lTM/XO3Zfg2WbQELdsPjt5rB5fPmxSYenW2Whjoc6+u/TcADemZP+XJvKCv1GMyh5attFfkaNQyQEq3DYChKXD6h+xCrjSUlgSjotH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X/H+gjRD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X/H+gjRD"
Received: by smtp.kernel.org (Postfix)
	id E44B2C4CEDD; Wed,  5 Feb 2025 16:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0329C4CED6;
	Wed,  5 Feb 2025 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738771991;
	bh=rt7rPPTvJLjtdeKR/MUPNd3gD9N4fDDgda0M2/vkvUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/H+gjRD3tyF+zAXP08d+OLXkv3I2sPV3BBgxcae74a6NVV/q/P3R1EsoSo1SLsen
	 yXWFKxRV3wCG4ymV3Z46f15XX5ZlkdpcpzQKL4yDEb5qtLlzLhiyAlO4VO7ECH/8gJ
	 O4la7NI0Ctzgt3cK6ETKCJoVzGjycUzJRgcazyIE=
Date: Wed, 5 Feb 2025 11:13:10 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
Message-ID: <20250205-polar-spiffy-baboon-09cd5d@lemur>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
 <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
 <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
 <20250123-macho-sidewinder-of-acceptance-8dea0f@meerkat>
 <e6c6f928-bae7-4509-9410-42e4bf7d9252@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6c6f928-bae7-4509-9410-42e4bf7d9252@kernel.org>

On Wed, Feb 05, 2025 at 04:46:16PM +0100, Matthieu Baerts wrote:
> b4 prepared this patch:
> 
>   From: Me
>   Subject: Foo
> 
>   From: Dev <MailMap>  <== Modified :(
> 
>   (...)
> 
>   Signed-off-by: Dev <Original>  <== Unmodified (good)

Thank you for explaining that -- I wasn't actually fully understanding the
problem. I thought it would only affect the to/cc entries, therefore my
confusion why would anyone *not* want that. :)

> => I don't think b4 should modify the From (due to "git show --mailmap")
> by default. This can also happen when sending an "old" patch to stable
> for example. Your recent modification fixes that in
> __init__.py:git_range_to_patches() by using "git show --no-mailmap" by
> default, thank you!
> 
> Now there is a second part in your patch: the modifications of the To/Cc
> fields. For me, it is OK and maybe better to send the patch to "Dev
> <MailMap>" instead of / and "Dev <Original>", because that's what "Dev"
> wants according to the mailmap file. This behaviour has been changed
> with your modifications in ez.py. Maybe the emails should continue to be
> updated to use the mailmap version by default, if sendemail.mailmap is
> not set?
> 
> So doing this in cmd_send():
> 
>  -    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'false'))
>  +    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'true'))
> 
> WDYT?

I'll just roll back that part and simplify things back down to just pass
--no-mailmap to the git-show command.

Thanks for the clarification!

-K

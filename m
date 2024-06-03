Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1725622
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 17:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717436965; cv=none; b=PO/h/5OImrtI1vBPeA7ppwQE/AfM/v3rfU3LXOTht7+djsGJmz4tXvRDA0Ly7Vo53Glzeh1XF6MVahSMGUsyWrG+UN9Xh06n80z22YBRnsmSDg4D8S9wTr5oKIZfngZQo+nZiIxjrZr1gBxgfgCQyVMetZa5W0o/KD3fD0X7H9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717436965; c=relaxed/simple;
	bh=cJlWsoUpzkVbMTw5wDjn/6dsM9KyiVQ24tBtyyFJZj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuZdy+84XMyjz069m+e/coMLSfVmGVrnAcEnqge2SxWgSJbOdC9ItwkeFLdKY8Uks8gNgmHsARWf0+WsyW/zdD0TZCE5YjGdSWswgVXEBTSaabmzNhTKCxOoFctGzIYB094af4ZCQmmIOgy56VXdi02D0UDQmINBI77ppZDfeFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TZ/3ccLJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TZ/3ccLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB7FC2BD10;
	Mon,  3 Jun 2024 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717436964;
	bh=cJlWsoUpzkVbMTw5wDjn/6dsM9KyiVQ24tBtyyFJZj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZ/3ccLJlSWNN6EWkxUNRgQ6o83VucEGUSHwRLlSgfQP7mdr26WokACc18wh6ZXzY
	 3kfh/h8bWxcEfMcm8mlQvAwlwVlXJTGt2KSNtL2OvfcDLpnnFvJbqK+W6iyziV9gtl
	 boVDhhspoqLSK5TX85jDc9ow0g4/R2JuGmFBUr0o=
Date: Mon, 3 Jun 2024 13:49:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <20240603-frigatebird-of-unearthly-satiation-62b1ff@meerkat>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
 <20240603-opal-wolverine-of-tempest-7a8939@lemur>
 <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>

On Mon, Jun 03, 2024 at 06:30:14PM GMT, Mark Brown wrote:
> Ah, that's me being confused about what --since is supposed to do!  I
> had been under the impression that it was letting me specify a commit
> from which to apply updates (now I look at the full help I do see that
> it says that the default is a time range style thing).  I didn't realise
> it was a passthrough to the git log option.  In that case this is a
> feature request for a way to specify which commits to update trailers
> for, the use case is collecting tags as I apply patches on top of
> already published commits.

So, like a --since-commit [commit-ish] ?

-K

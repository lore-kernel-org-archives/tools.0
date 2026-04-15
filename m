Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908545CDF1
	for <tools@linux.kernel.org>; Wed, 15 Apr 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260661; cv=none; b=JhsDI+1d/tvwFBBDg+AFjRns1488tj5pj7TKBrTkTO2UxO2okTASquGG5yCbDhCE5R/eErRebMALpcTcK2nvQJHJnp8a/ftveDHtapFEu+AUrhqB/qoesW4DmTIkIboN/sSEjjNNxluEaeZ6XmqNeexlz52lvXRCS4bmF7Cw9gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260661; c=relaxed/simple;
	bh=mzw8zrrmjXme4YzxhYHUbF8ujFoHFwLdaOmCeOKm/EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhxfTCESxsE0+tiIoW9aP/6GkVt66F/aAHnxx9L+2Ie5pyeNU+QTNEOUhEteTmUgCRlEmVzcD+x+QnpuYi2sIv7UsT+oZZepFeMkIsNDsrLlG5OoATN+N5J8/jeN/yjOiSTEcicVbklA4QqW3bfvGSMIfpZWixtEDbsJmIqHBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGb09sEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGb09sEU"
Received: by smtp.kernel.org (Postfix)
	id 3511BC2BCB4; Wed, 15 Apr 2026 13:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29F9C19424;
	Wed, 15 Apr 2026 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776260661;
	bh=mzw8zrrmjXme4YzxhYHUbF8ujFoHFwLdaOmCeOKm/EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGb09sEUB6ypLNTF73udgRFLnORiwjqpOCQZugA4YGNf5Nq5UYQsN3rjwBb4GNsTX
	 /VVyUxaXnBeznwHXn9I/emE5GdpMYIZUwFCziPnTmsbD+TdsGAkukOvAKfrTYIWN3P
	 9VfB6Vt2cph7NR46jKaH97FkNxq3GenMWqisb2B8+oRLIygy0Ki5qNl4iu8USzZTfk
	 tP8CAfuZibNO0fw2Pi7y/mcNTSkwjqu7orOnB4GcL0y/phJhXTcRQiFwk3M4hyV4pL
	 8/oPa/aL2x/p/stG6YG5w+lAZDscacvZw02I17lqHYGzXfEQlSAAcRLiJrgqI55IY8
	 fxFuL2DfCrIhA==
Date: Wed, 15 Apr 2026 09:44:19 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: tools@kernel.org
Subject: Re: Overriding editor with b4 prep --edit-cover
Message-ID: <20260415-caped-lemon-beaver-bab9ae@lemur>
References: <CAH5fLghw=fjJoWe3pt0QWVKpYXc_SzKmhYZdapkfWBOD9=1+rQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAH5fLghw=fjJoWe3pt0QWVKpYXc_SzKmhYZdapkfWBOD9=1+rQ@mail.gmail.com>

On Wed, Apr 15, 2026 at 11:51:56AM +0200, Alice Ryhl wrote:
> I want to invoke b4 prep --edit-cover with a different editor than the
> one configured by default for automation purposes. I tried various
> things such as changing configuration variables EDITOR, GIT_EDITOR,
> etc. I also tried
> 
> b4 prep --config core.editor=<cmd> --edit-cover
> 
> However, no matter what I tried, b4 just opens up NVIM as is
> configured in .gitconfig.
> 
> Is there a way to override the editor?

Looking at the code, it would appear that if there is a core.editor set, it
always overrides any env variable passed. Passing --config to the b4 command
won't do the right thing, because the above would set "b4.core.editor" as the
variable, which is why it's not working.

The right course of action here is to reverse the logic and follow git's
preference:

    GIT_EDITOR -> core.editor -> VISUAL -> EDITOR -> vi

I'll make a bug out of this.

-- 
KR

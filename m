Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B0430B8F
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 20:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772309195; cv=none; b=QntmUJvlxX3w8fKHgmKb3fzf7sLwPeOko8xcfenk6ROxUTx+yI/roGZeZMkqus9vU5MPram01lPwGfo+3Cyr0Y3X+KAumWfYwaJKYO9YNOjHC8IX3dCo3nZXoiMRc8nfJsNh6fk3MEy5PtyXNJNP1a6l3y9tt9Br5cLSKa17LBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772309195; c=relaxed/simple;
	bh=JfVk+I53l7NpyTU54xaaTTvEJ4qjy4vi2T+MrMIzdFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVFoibDI8gT1/GTa2it/xyH88IXu2CAm0ppWO9iVJaYVYZhlnlCeaZG24aNUVQOBTky7At3t6HPrdh4R7PiQoDNb5uwbynTn/t4S4nIB9n6aER8HVAIAHEhb9r10lftnvvW86/koLZrNPdF+GIWDL0htYBmO5ucUJM6O+u9qzzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9BRzDd3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9BRzDd3"
Received: by smtp.kernel.org (Postfix)
	id 51098C19425; Sat, 28 Feb 2026 20:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1468BC116D0;
	Sat, 28 Feb 2026 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772309195;
	bh=JfVk+I53l7NpyTU54xaaTTvEJ4qjy4vi2T+MrMIzdFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9BRzDd3HWPZxMFCag7lGB/5IHj39S2LijhCctU9XIz91SPX4DGNDwiokMGPv8Ibb
	 niKGkNl0uKRLEnnrB+ZDRaAhJQ6Ug1WsmOK+kHe4a69x4pvNRqGaa5jipa87G2aoVK
	 Ptf/APznIclCRmgel8rFGyOPvehtpMSM7Dphf+blIS87M2nu46ZVL0gXxknP8tZZCK
	 e1+3+k6eXzpc8gMrS8aXa2cgrJCXZgZTRKReHXosm3NWMbviEybd4oTg2Hhzjt3heg
	 pY52AxbIocDfnTuhkcW069MGmqSy2iGN/P0isA7nm6GHz92z5rlf9lx4mQA/tJ4rE8
	 n1ZvSyQOtsI9A==
Date: Sat, 28 Feb 2026 15:06:34 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-sparkling-beryl-kagu-8c34c8@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228125823-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228125823-mutt-send-email-mst@kernel.org>

On Sat, Feb 28, 2026 at 01:31:04PM -0500, Michael S. Tsirkin wrote:
> Amazing, thanks for working on this.
> 
> 
> But I could not get it to work with gemini:
> I have:
> 
>     [b4]
>       review-agent-command = gemini --sandbox --allowed-tools 'Bash(git:*) Read Glob Grep Write(.git/b4-review/**) Edit(.git/b4-review/**)'
>       review-agent-prompt-path = .git/agent-reviewer.md

Thanks for testing it out. My most salient recent experience with gemini-cli
is staring at:

    Trying to reach gemini-flash-3-preview (Attempt 6/10)

and

    Agent reached max turns limit (10)

(Sorry, Google people -- just stating facts.)

However, I know the following things:

1. Gemini really doesn't like reading from the .git dir of the repository.
2. It also doesn't like writing to that dir.
3. In fact, it only likes writing to the toplevel of the git dir you're in,
   and into ~/.gemini/tmp/dirname/

Gemini itself just recommended me to run with "gemini --approval-mode=yolo"
which seems like a pretty terrible ideas. However, I'm now looking at more
RESOURCE_EXHAUSTED stack traces from gemini, so cannot test this further. If
someone with a more reliable access to gemini-cli can recommend what is a
better approach, I'm happy to implement it, otherwise I'll try again later
when Gemini is less cranky.

-K

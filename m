Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D73A6412
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246877; cv=none; b=Ev//WY2vnceLW3TKwMgyxliaFupptMBLGwERQIYkm2HR3sdAMuqjGN1USumhfEpfjnM6/6so+vHVvIRGDjmT+fOt1Mq2vc9SGH0G7vVQEabH5BfUFKA3AONtJ/Gm4sdTXQBYKoed+5HUFUjujDue7Y7kn+fHe1QYAUrZIInc0WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246877; c=relaxed/simple;
	bh=JIWukXmfL3iaLYQB7KzFZQUoE2VJU31Lmwgec2MOmTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMt7oVgwPMz95d+e/0LZFvNariGidBZNwErMab+CuBr5WdWWGwXojHFfUxeCPSJ05xA8uEVioFrgJUaU5R9Hn2YH9Xc8IlxyncainBl4Hk0Kn+GCIt9gmK4KBedsZTbp3CnZUYL67CQKsQaflKDOUI73g1Zf/oWfytCsju3pJbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GDUD1qgf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GDUD1qgf"
Received: by smtp.kernel.org (Postfix)
	id BA9311F00A3A; Tue, 23 Jun 2026 20:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730DC1F000E9;
	Tue, 23 Jun 2026 20:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782246875;
	bh=C22mv7+Ap08eNimdgrRDVJzYoCjUJk5gaJBQN16dFSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GDUD1qgfasbWv/FxKi4yVYqRm1HlIRwCpZISG/1zYObxnyDgE1FVWcf2je/PO68F2
	 cWS4BQn4mc15FpQHRoKYqB9aZ1pktWwWoQSbSItnTH9YCmf1wZYnRvVEWQAc4rZqwp
	 h0JULykTbfbK9cGOtmeriwxrpNuN8M2sX9z9IlsI=
Date: Tue, 23 Jun 2026 16:34:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 0/6] review-tui: worktree-aware takes, resolve
 take->merge conflicts in place
Message-ID: <20260623-ancient-artichoke-mandrill-9c7ed8@meerkat>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
 <178223858665.1539887.18387233629212425068.b4-review@b4>
 <20260623-habicht-helium-pragmatisch-686af4fe7167@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623-habicht-helium-pragmatisch-686af4fe7167@brauner>

On Tue, Jun 23, 2026 at 10:18:40PM +0200, Christian Brauner wrote:
> Sure. I fixed all mypy errors. There's a bunch of pre-existing ones:
> 
> - ty (121)
>   all in 11 untouched files (misc/send-receive.py, __init__.py, the
>   other TUI modules...) . Pre-existing on master, newly surfaced by
>   ty 0.0.52 release and the all = "error" config.
> 
> - pytest (9)
>   test_ez::test_trailers ×4 and test_mbox::test_shazam ×5. They exercise
>   ez.py/mbox.py code byte-identical to master, so they fail identically
>   there.

Oh, interesting. It's all green on my side, but let me see if I can dig up why
we're getting different results.

-K

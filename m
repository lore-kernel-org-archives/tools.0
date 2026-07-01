Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCB3B52FA
	for <tools@linux.kernel.org>; Wed,  1 Jul 2026 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898902; cv=none; b=iFxS1xMzfFKLpd4Ef6eLimk7J6uCKFzptkva6pdlYAnd6i3kiNh3v2KQineySJ/wJ/FwuOBImABkjut/A7HLqTpSWouF8d7qcc4fXyyg274gE6BsBuqNR1G1gz0EuDtXH5GkeBT4WpnFzmLnJYv5q97ykAC0qy6jcWIBXVwvxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898902; c=relaxed/simple;
	bh=UzXDZDK7UEbOH6Uzzi0+8o1EEjbrM+QpdnH4mrbtUNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wsk/lelXzMs97DFKCp16RpLyhu4HGmTpbgcVJoxbHeiS74ZgnuvOnvXHc4DcaifLb/u1joqFW+FkpPVw/Gq3eTp3DrZGy0/9Ew/tWk/hNwTS9dpMK3nB/UJDHkL46wavraM4v/EMFCSwAjmXbbEyEUM9WkC8kNBT9aDnhQBr/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Firz6bbL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Firz6bbL"
Received: by smtp.kernel.org (Postfix)
	id 930921F00A3A; Wed,  1 Jul 2026 09:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E51F000E9;
	Wed,  1 Jul 2026 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782898901;
	bh=Sah+U50Nzx5dZpGncDEWF+D16sQaPKpFLHLupkwSQ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Firz6bbLFphsyZmU7SOQcZAF6ui0NYDGeQ74NzAwiAFaEKGsbffmfobP1PuBS2T6V
	 ypSHVKCOVETKubL+PUNxUhCjH1UlrFHD+TXVKskvlMUmttwi9R1IY3F0kXqWdIEpHS
	 qr0HUDJZ7Uj41ORCmzkbcsRPtCGuj4J1WiD2Pqsuh6Wfd+XrH9Sg6vkYyfvgPtHxHt
	 7khiKi9yUpMBlwikkLDTWCUOU3Irm2kRwBqtbXW8ExAXLTHk/76Yml0Wh9lnOLHD7z
	 cHySdgfkDWp05PbPDxjMnpOABvnWy7UQacuMx/WregDBMkLs0/MAVM3uKbtVguxnMv
	 W+FHHgfCG3mng==
Date: Wed, 1 Jul 2026 11:41:38 +0200
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review tui + lore/lei/korgalore
Message-ID: <20260701-bewerben-einjagen-pensum-3b864edd765e@brauner>
References: <20260630-einhundert-bauamt-atemlos-5b92514a1443@brauner>
 <20260630-spectral-tan-bull-c935e3@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-spectral-tan-bull-c935e3@lemur>

On Tue, Jun 30, 2026 at 11:19:53AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Jun 30, 2026 at 04:12:47PM +0200, Christian Brauner wrote:
> > Hey Konstantin,
> > 
> > So I've now been working with b4 review tui exclusively for a while and
> > have added a bunch of extensions that put it on steroids for me. In
> > place merge conflict resolution when applying individual patches or
> > series is just "chef's kiss".
> 
> Great to hear. Please feel free to share all your "on steroids" changes -- if
> it's useful to you, then it should be useful to others as well.

Thanks, will do!

> Are you using editor integrations (vim/emacs) at all?

So for b4 review tui it falls back to my git neovim default editor and
it just works very well. From your message I gather that I missed other
integration so now I'm busy finding them... Oh wow, no. I didn't know
that. Let me try them immediately.

> > I also do like the patchwork integration which is very nice and allows
> > me to pick series from patchwork into b4 review tui without much effort.
> > 
> > One thing that I'm missing is a companion to the patchwork app
> > integration for mailing lists. Here's what I mean. I want to be able to
> > browse a mailing list the same way I'm browsing the patchwork app ('p')
> > in b4 review tui, then mark them as "tracked" etc (ideally it would
> > de-duplicate by message-id or something between the patchwork app and
> > the mailing list.
> 
> Yes, we're thinking along the same lines -- check plan.otl. You will find a
> "consume a public-inbox archive" section under 0.17 that is admittedly just a
> stream of consciousness right now.

Lovely! I cannot wait for this!

> 
> > I'm not well-versed enough in lore/lei/korgalore to find the correct
> > integration point for this so this makes sense.
> 
> It doesn't exist yet, but the idea will be to set up korgalore to get the
> stuff from the list you want, and then just throw it at a "b4 review consume"
> pipe, and let b4 figure out the rest. The end-result should be a sort of
> "maintainer's dashboard":
> 
> - bug reports
> - outstanding series

Perfect!

> - general correspondence

I have dreamed about this specific feature. Just two days ago I started
tracking a thread outside of b4 review and was wondering how I could
make the case for having this inside of b4 review tui natively. Love it!

> This effectively reverses the current b4 flow: instead of going from a mail
> client to b4, everything goes to b4 first, and then you can yank things into
> your mail client that you actually want to view there. The mailing lists and
> lore in general become mostly a sort of a distributed messaging bus.

Love it.

> > Here's some proposals that I came up with talking to an LLM:
> 
> Thanks for sharing! I'm away for 2 weeks, so I deliberately skipped reading

Enjoy the vacation!

> the rest, because it requires a fresher brain. :) I'll take a look and
> cross-reference with where I want things to go once I'm back.

Absolutely. :)

Thanks!
Christian

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370DA279329
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832797; cv=none; b=dmNDHUhCjYwapGlDdwjgGWodZNqriqMzn5lf212P21/yLqnCUJ33iIyOnnQSS8/SkWthEhI5RZhqA2f3jZHIgQc2ClEvUdG8cguaEMq8sPjlCpwGNM0JxzR9CkgaUi+RFFSR++o1H3eSgAIYMWfw2hHTOwq3Lc42r4TVqPiXCsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832797; c=relaxed/simple;
	bh=E7JxiW0len9R0AtVlGT/0QhLOW4p1h/oOdQzNLgBXwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjEfmmsscmM5gipGYaCZnsFq64A61zxRE5jMofk1V3qwBP55tAWoXSZ3hQtb84qR2S/qgdcT0wjTC1wQsTRokKOrpdm/ruBSDpt05aDNVSIYUX6zyWVTXTQrYlQmo0WZPJMCdlUqwE5oyQUKhQuRVJf4LpIyumFPbKalxu7lzH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=trgiSdLc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="trgiSdLc"
Received: by smtp.kernel.org (Postfix)
	id D641C1F000E9; Tue, 30 Jun 2026 15:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8991C1F00A3A;
	Tue, 30 Jun 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782832795;
	bh=J80eu3rCQRS4KujQRA6E4WakuJm+kQmC6jKrhNYqGXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=trgiSdLc2jUufS2Ja5wTN1GDvYDvMH4zcIjBDY13Ch12Re+l9/YBJlg5ZfEfPNKaO
	 zh3MsIZzJW3xV0PqZW2u/+w4b/32960A7WVLwnxJI2UivOYRSrb3Z3EEHjyKU5u70w
	 ETlbd4RwRERYAE2wqT3EKDkMqK9Zp8F12aRe7xMY=
Date: Tue, 30 Jun 2026 11:19:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review tui + lore/lei/korgalore
Message-ID: <20260630-spectral-tan-bull-c935e3@lemur>
References: <20260630-einhundert-bauamt-atemlos-5b92514a1443@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-einhundert-bauamt-atemlos-5b92514a1443@brauner>

On Tue, Jun 30, 2026 at 04:12:47PM +0200, Christian Brauner wrote:
> Hey Konstantin,
> 
> So I've now been working with b4 review tui exclusively for a while and
> have added a bunch of extensions that put it on steroids for me. In
> place merge conflict resolution when applying individual patches or
> series is just "chef's kiss".

Great to hear. Please feel free to share all your "on steroids" changes -- if
it's useful to you, then it should be useful to others as well.

Are you using editor integrations (vim/emacs) at all?

> I also do like the patchwork integration which is very nice and allows
> me to pick series from patchwork into b4 review tui without much effort.
> 
> One thing that I'm missing is a companion to the patchwork app
> integration for mailing lists. Here's what I mean. I want to be able to
> browse a mailing list the same way I'm browsing the patchwork app ('p')
> in b4 review tui, then mark them as "tracked" etc (ideally it would
> de-duplicate by message-id or something between the patchwork app and
> the mailing list.

Yes, we're thinking along the same lines -- check plan.otl. You will find a
"consume a public-inbox archive" section under 0.17 that is admittedly just a
stream of consciousness right now.

> I'm not well-versed enough in lore/lei/korgalore to find the correct
> integration point for this so this makes sense.

It doesn't exist yet, but the idea will be to set up korgalore to get the
stuff from the list you want, and then just throw it at a "b4 review consume"
pipe, and let b4 figure out the rest. The end-result should be a sort of
"maintainer's dashboard":

- bug reports
- outstanding series
- general correspondence

This effectively reverses the current b4 flow: instead of going from a mail
client to b4, everything goes to b4 first, and then you can yank things into
your mail client that you actually want to view there. The mailing lists and
lore in general become mostly a sort of a distributed messaging bus.

> Here's some proposals that I came up with talking to an LLM:

Thanks for sharing! I'm away for 2 weeks, so I deliberately skipped reading
the rest, because it requires a fresher brain. :) I'll take a look and
cross-reference with where I want things to go once I'm back.

Best wishes,
-K



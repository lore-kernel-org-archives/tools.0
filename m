Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16652FD1DC
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606787; cv=none; b=R7QCJaq2EpPfnmpalVVgd76Lyzd7PdH/MjzZxpTtJnkSmRzilyBbD4F4os4+4rRbVA6MMSSyXF2HVPsKxzG1tpgncwuyTlXyA3qReSOu8wxYrPwxNxWGeBDFk1GNJcEGG5Lo9CjP2E4ka/8FGXrnXAPL294U37hvcbCcJMiA5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606787; c=relaxed/simple;
	bh=Akx/pIIqDwQGjQe5zh9OEAv9v2obUxx5clkt8BbZsRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ro/6OsVL5EOtKZRvX7u0dDIVA6of0cSnCN3BLHBo27MJbB7uELj1LmYtvLAkkfIdNVoBjbr/7ADFQLQR2EJy0hzn4KKH63OKJdpBr/wwH5TaXOQoouZLj1G+jKpYf6BvgJRqwgqRp7gsOd7vAG4i9YgWN6Ewj4mg4hcZa6JgbYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M2I3Kr2Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M2I3Kr2Y"
Received: by smtp.kernel.org (Postfix)
	id 395EDC116C6; Wed, 28 Jan 2026 13:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FE9C4CEF1;
	Wed, 28 Jan 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769606787;
	bh=Akx/pIIqDwQGjQe5zh9OEAv9v2obUxx5clkt8BbZsRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2I3Kr2YyVHl0BSqkqL/q359YEfVygdCqu/x/28lXgzBpG+IIlleaE8YkKGTPOWVm
	 F1IaK1ckmVjwrM5KQR1Eiezi7q07y7YO7PzYt791Ct2GtgTMJF43LhHWAcfy2psFOH
	 2YlJwdOrNLu2Zjy415i3l1vYUPt4EOwwsvyPgMXg=
Date: Wed, 28 Jan 2026 08:26:23 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: tools@kernel.org
Subject: Re: korgalore: Mail directory keeps empty?
Message-ID: <20260128-wild-honest-cougar-c002de@lemur>
References: <5fd95298-afc1-4789-8b15-2b24e8886edd@de.bosch.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5fd95298-afc1-4789-8b15-2b24e8886edd@de.bosch.com>

On Wed, Jan 28, 2026 at 12:29:05PM +0100, Dirk Behme wrote:
> But even a second pull some time later when new mails arrived on the
> tracked list still leaves it empty. See full log below [2]. There are
> some errors "maildir ~/Mail/rfl/tmp/ doesn't exist". Of course,
> because it was not created in the first run.

Thanks for the report. This was a bug in how we initialize maildir
targets. Python's mailbox.Maildir with create=True only creates the
maildir structure itself (cur/new/tmp subdirectories), but not the
parent directories leading up to it. So if you specify ~/Mail/rfl and
~/Mail/ exists but rfl/ doesn't, the initialization fails silently and
subsequent deliveries error out.

You can make things work with 0.4 if you run:

    mkdir ~/Mail/rfl/{cur,new,tmp}

This creates a valid maildir.

I've pushed a fix to master that ensures parent directories are created
before initializing the Maildir. I hope to have v0.5 out today or tomorrow,
which should contain this fix.

> My basic idea was to create a ~/Mail/rfl/ with the mailing list
> traffic and feed this to Thunderbird. Is this idea wrong?

No, that's exactly how it's supposed to work, we just didn't have enough
testing for the brand new Maildir target as opposed to existing one.

-K

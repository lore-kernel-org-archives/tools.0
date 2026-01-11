Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FE219F121
	for <tools@linux.kernel.org>; Sun, 11 Jan 2026 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768162560; cv=none; b=hXBZcB492LfSBwPCneVaB06fOqvgNgoWbFwxWIwOIgnonvBCV8c9LElPcWxNCAo0pO34XpLoHt/lMnAWxP4EDz4k0q+/2twaaay0A2nDt1tKLz/6gOKKD3l+AraThjjLUNUy685OtT7dlvj/bDTAS+/hnL1IAaZ6LXzYbzkG/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768162560; c=relaxed/simple;
	bh=lHJEOZ7fwBp72F72chmavCLCaDmMXEnDuJKJS4qLju4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKsckRqgrblZB5e8xCDXFuDV5ZZfAf03xinYNEgLtLmtNzpSWkT2zIP4tBcswk27JatXMxudX5H090eAzOnzAtaq9RcGyzejBEwlDjz/+gZGnPYq8IKU5K9HUSNPXOXi/WlSz7p97TtwJgxZ6MoPuC+Sk/jY416Z419zvTF3mO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nf7PUytL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nf7PUytL"
Received: by smtp.kernel.org (Postfix)
	id 7EB22C116C6; Sun, 11 Jan 2026 20:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31459C4CEF7;
	Sun, 11 Jan 2026 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768162560;
	bh=lHJEOZ7fwBp72F72chmavCLCaDmMXEnDuJKJS4qLju4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nf7PUytLHQcqmplt5Ly2Xn+eNc6RPB+b3nJBjOJhjghXJcbu72uvwwQLDrSRNtkAJ
	 NFW+WT5u1G1BFQ3/V5eROM/EOwIBRcSrQzMjjICiI/vSkAKDEfLA/pCGUn/Xw/Psp6
	 et03bzukQs0NHIqK5TnIWwZ4Yh2qLLdlX4h+3rTI=
Date: Sun, 11 Jan 2026 15:15:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, 
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20260111-hilarious-spicy-cobra-ad26c6@lemur>
References: <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
 <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>

On Sat, Jan 10, 2026 at 12:31:15AM +0100, Linus Walleij wrote:
> > >     [deliveries.to-me]
> > >     feed = 'lei:/home/user/.local/share/lei/to-me'
> > >     target = 'work'
> > >     labels = ['!TO-ME', 'UNREAD', 'STARRED']
> >
> > I like what I see, I will try this out!
> 
> It works pretty well. I set up a script like this:
> 
> #!/bin/bash
> 
> echo "Calling LEI to get mail..."
> lei q -O https://lore.kernel.org/all/ \
>     -o v2:${HOME}/.local/share/lei/to-me \
>     --dedupe=mid \
>     'tc:linusw@kernel.org AND d:1.month.ago..'

You only needed to do this once -- there is no need to run this before each
pull, kgl will automatically handle updates for lei queries.

> I would almost set this up to run as a cron job if it wasn't for the fact that
> the Googly API wants to reauthenticate every now and then. Other than
> that it is smooth as butter to work like this!

I've not actually had to redo my gmail authentication again, but I do hear
that it's less smooth for others.

-K

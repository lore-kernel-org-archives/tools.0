Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4FA4207A
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309422; cv=none; b=T4+Y70gAis17yjG7Ek7agFgQJq2bTEKMITanUNGLPjZ8xWX2OPbl7pweM5GeUEtxsgrd4RCDyFtlkah9gxbm7J4OBdpoHd8fcVmaC8ZpXByfUnqbSftsnIc9f1FVUAR1ZPnD8jVIC2d+D/HbyZFkHPMNNG2dxLARmuVDm5FGoPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309422; c=relaxed/simple;
	bh=ZOPOVmarv+Xj0sqx99/EXbMyyUvqdK7/ZsuujPwJN0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ie9KdDNC9N+uChJ1u06WrYol07HQOYvvOhm3OzIDoOxhjiGs1kNVoVMb3Z9zmVPrZLZbdOV9pEaGNFUwEzJ21BurFmJ232MuwKcfIrazw9q//GPNojCIJoi1ICQ095GUukowDzZczwapuf+sWw/Z23WeUpMULfvNFKZKQuUs1vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 94AF5C16AAE; Tue, 13 Jan 2026 13:03:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D90C9C116C6;
	Tue, 13 Jan 2026 13:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D90C9C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35899497;
	Tue, 13 Jan 2026 05:03:33 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A1983F5A1;
	Tue, 13 Jan 2026 05:03:39 -0800 (PST)
Date: Tue, 13 Jan 2026 13:03:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org,
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <aWZCqXlJcMEQU-J9@bogus>
References: <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
 <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
 <20260111-hilarious-spicy-cobra-ad26c6@lemur>
 <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>

Hi Linus,

Thanks for reporting this, I have been postponing it for a while.

On Mon, Jan 12, 2026 at 08:52:45PM +0100, Linus Walleij wrote:
> On Sun, Jan 11, 2026 at 9:16 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> 
> > > I would almost set this up to run as a cron job if it wasn't for the fact that
> > > the Googly API wants to reauthenticate every now and then. Other than
> > > that it is smooth as butter to work like this!
> >
> > I've not actually had to redo my gmail authentication again, but I do hear
> > that it's less smooth for others.
> 
> I've had to do it twice, second time today.
> 
> About that!
> 

For me, it's most 1 week and I can see that it matches the expiry in the
token.

> What happens when the token expires is this:
> 
> $ kgl pull
> (long splat like the one below)
> 

Yes I too get the same if the token has expired.

[...]

> 
> This isn't very pretty, the reason is that korgalore seems to have no idea
> about overwriting an existing authentication token.
> 
> Some try-catch thingie is needed here, right? If it's hard for you to reproduce
> I can try to do some Python hacking the next time it happens.
> 
> You have to manually do this:
> 
> rm .config/korgalore/gmail-personal-token.json

Indeed, I do this too.

> linus@Fecusia:~$ kgl auth personal
> critical: Log in to Gmail account for personal
> Please visit this URL to authorize this application:
> https://accounts.google.com/o/oauth2/auth?Authenticated target:
> personal (type: gmail)
> (...)
> Authentication complete.
> 
> Maybe this could be made more smooth, as in prompting:
> "Do you want to delete your old expired access token and get a new one?"
> 

That would be nice.

> Yours,
> Linus Walleij

-- 
Regards,
Sudeep

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC5138A727
	for <tools@linux.kernel.org>; Wed, 14 Jan 2026 10:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385167; cv=none; b=rUI5JubWspcBHluhmGO5MsN3/4tM26ZWX6q9Xrxs88PtERF2xF7nH7Ns8xnzV/L3BrncJWrWyCsZuWTdNxNplv1G48UkSED459v/RKntKuSWmAqzwRido35SF7jNaLewXdfn8JG5JUdZhPCqX2XfFEcyHR1fRMUqPUxK7KQ8mxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385167; c=relaxed/simple;
	bh=HXKQBZDAIrZ1f9++5SRmVaB65smUs2jGRoHtZjvoipc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/LTJT/wGmKOMaY+nxc7UC9Ub8R3voWMedd+FXdz5ytBQZ3vZ9yzQqydc3Il+iUNHAWe1B8E+isA80lP2UOXLboSLkLvmtElfceA6mjOfLz+H5euaUcW6Y7EZlmJHt5hj8QS5zvU6KzuB0b/VcGVTcNyHeBiw6QBJHqAJ3cHG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D8826C19423; Wed, 14 Jan 2026 10:06:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id DB5A5C16AAE;
	Wed, 14 Jan 2026 10:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB5A5C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF150339;
	Wed, 14 Jan 2026 02:05:50 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3C543F632;
	Wed, 14 Jan 2026 02:05:56 -0800 (PST)
Date: Wed, 14 Jan 2026 10:05:54 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org,
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <aWdqgqo7HzYo51u_@bogus>
References: <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
 <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
 <20260111-hilarious-spicy-cobra-ad26c6@lemur>
 <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
 <aWZCqXlJcMEQU-J9@bogus>
 <6f7ba903-147b-4779-bc0c-f1b2db67a98b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7ba903-147b-4779-bc0c-f1b2db67a98b@app.fastmail.com>

On Tue, Jan 13, 2026 at 10:52:08AM -0500, Konstantin Ryabitsev wrote:
> On Tue, Jan 13, 2026, at 08:03, Sudeep Holla wrote:
> > For me, it's most 1 week and I can see that it matches the expiry in the
> > token.
> 
> Apparently, this is because your project is set as "testing" in the Google
> Cloud Console. Tokens are issued for a week and then not auto-renewed. If
> you set your project as "Production", it will be issued for an hour and then
> auto-renewed (which matches my experience of never having to reauth).
> 
> I'm told to try this:
> Go to Google Cloud Console -> APIs & Services -> OAuth consent screen
> Check "Publishing status"
> If "Testing", click "Publish App" to move to production
> 
> You shouldn't need to do verification if the project is marked as
> internal/personal use. However, the project I'm using for this in my
> personal Gmail account is old and is grandfathered in a number of things, so
> I can't test this part out.
> 

It does not appear to be trivial. It seems that verification is required to
publish, and I am missing something that is preventing me from completing the
verification.

> I may create a Linux Foundation project so we can make this suck less at least for official maintainers.
> 

I see you have already done this, will give that a try and see. Thanks!

-- 
Regards,
Sudeep

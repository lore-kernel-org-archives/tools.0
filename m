Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E673C1FC0
	for <tools@linux.kernel.org>; Thu, 15 Jan 2026 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498028; cv=none; b=ig3jO/9PkopJxw+UvpYWgtpmIhKq1coXIGrof6KpHSNlwyZosqD6dT8J/9dBj6eOKJwXTzsQvGlTDdZld9r5TfWyGGlqLLN+LoMUfvry6b2zbi3DSxYNbepPKccbgyJqAabqyaN8XrOUMoAWod3/miX0E5u7UynqElFuo3wbmy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498028; c=relaxed/simple;
	bh=JPdnzBZacwL7aGCvoiT63aPnRxTSmTfdX+eojlPjGEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxDpk/AXk9vHHUfPhjP/RxWmNs3gZ2L3UNMNxyzwKADXMr8lpkV5dumP0M1oDl4CQJrPoXv49+Hjxi4oVdprmet8/EZSVYVQ7OuGn0NyB3u4msIIMX92sSIfQLQU67TsdG6p/ihKO9bCANvQX7ueJTKiM7LmyiJnLze872DKZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 87609C2BC86; Thu, 15 Jan 2026 17:27:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id C74BDC19425;
	Thu, 15 Jan 2026 17:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C74BDC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FF3F1515;
	Thu, 15 Jan 2026 09:26:59 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 172F43F59E;
	Thu, 15 Jan 2026 09:27:04 -0800 (PST)
Date: Thu, 15 Jan 2026 17:27:02 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org,
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <aWkjZkI-sKqeM6ua@bogus>
References: <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
 <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
 <20260111-hilarious-spicy-cobra-ad26c6@lemur>
 <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
 <aWZCqXlJcMEQU-J9@bogus>
 <CAL_Jsq+f6A4zn6Ea-jK4YuP6RkY1syHEPwf-jGN3iPSOD5fL1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+f6A4zn6Ea-jK4YuP6RkY1syHEPwf-jGN3iPSOD5fL1w@mail.gmail.com>

On Tue, Jan 13, 2026 at 11:29:02AM -0600, Rob Herring wrote:
> On Tue, Jan 13, 2026 at 7:11 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > Hi Linus,
> >
> > Thanks for reporting this, I have been postponing it for a while.
> >
> > On Mon, Jan 12, 2026 at 08:52:45PM +0100, Linus Walleij wrote:
> > > On Sun, Jan 11, 2026 at 9:16 PM Konstantin Ryabitsev
> > > <konstantin@linuxfoundation.org> wrote:
> > >
> > > > > I would almost set this up to run as a cron job if it wasn't for the fact that
> > > > > the Googly API wants to reauthenticate every now and then. Other than
> > > > > that it is smooth as butter to work like this!
> > > >
> > > > I've not actually had to redo my gmail authentication again, but I do hear
> > > > that it's less smooth for others.
> > >
> > > I've had to do it twice, second time today.
> > >
> > > About that!
> > >
> >
> > For me, it's most 1 week and I can see that it matches the expiry in the
> > token.
> >
> > > What happens when the token expires is this:
> > >
> > > $ kgl pull
> > > (long splat like the one below)
> > >
> >
> > Yes I too get the same if the token has expired.
> 
> In case you missed the earlier discussion, you can also just use IMAP
> with gmail and avoid all this. I just moved over to IMAP and it works
> fine. The only limitation I see is you can't set multiple labels on a
> message if you wanted to do that. I only used multiple labels for the
> UNREAD label, but that seems unnecessary for IMAP.

I had missed that discussion. I will give that(IMAP) a try too just to see
which works better for me. Thanks for pointing that out. I saw the discussion
in the thread now.

-- 
Regards,
Sudeep

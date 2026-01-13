Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274438FEF9
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 17:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326089; cv=none; b=XmPAqTDBvUCpsTn9beMTpT3Px3ZNEJOsgVqRcpGky49guiIBPFejh7z9OWP/WDyZFRI66sVLu28DUODkjjg3RONzbEiC3Na5P4Qk/vcyVT7S6CwSndNZjM0RPGby88G7QeykF7fiOZbw7bkfctQ34GOTFqoqJoQVtnnQw4W98rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326089; c=relaxed/simple;
	bh=eWGfV+NWt0ProHidHZo5XD2ZioVs6AWMrc5qL9Q/Xtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKPamJKPQVDmoFMO2k+ykROvDzUig6ZZvkeQysDd/0QFGyN9amE50BWw/kcY2yyeK8vKsrhiGe44cPLD3EcD4mlxR8/jOEOAksaJeGrksYtizwJ9Ex5huT3j4xGNqclpKHAVdK4YXr7V1EmauRvhIAwFwz2gXKn5Gl4Zi5vtrFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D2Wi3dr3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D2Wi3dr3"
Received: by smtp.kernel.org (Postfix)
	id 94D96C4AF09; Tue, 13 Jan 2026 17:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A7AC116C6;
	Tue, 13 Jan 2026 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768326089;
	bh=eWGfV+NWt0ProHidHZo5XD2ZioVs6AWMrc5qL9Q/Xtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2Wi3dr3L3WRrkI4/A6RIwEv7UM8+5V9WbnUj8CcT5Ttsh+j/6ii0Sr3mYBxJnzT0
	 2Mt0x5vrpE1I7qihil4PWF+xBhq5x2X/ngKL1GqX6lfikevdo3B9jMhSN8Z/dzkCAV
	 NlQvBRZDg9vD1F6yIf4h5Ml5uRBZHLSL6IQpa7mw=
Date: Tue, 13 Jan 2026 12:41:28 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij <linusw@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20260113-lush-frisky-terrier-1dd135@lemur>
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
In-Reply-To: <CAL_Jsq+f6A4zn6Ea-jK4YuP6RkY1syHEPwf-jGN3iPSOD5fL1w@mail.gmail.com>

On Tue, Jan 13, 2026 at 11:29:02AM -0600, Rob Herring wrote:
> In case you missed the earlier discussion, you can also just use IMAP
> with gmail and avoid all this. I just moved over to IMAP and it works
> fine. The only limitation I see is you can't set multiple labels on a
> message if you wanted to do that. I only used multiple labels for the
> UNREAD label, but that seems unnecessary for IMAP.

It does work, but I'm getting strong vibes that Google is slowly eliminating
features for its non-Workspace users. While there is no indication that
Gmail's IMAP functionality is endangered yet, it wouldn't shock me if this is
restricted to commercial users at some point.

Gmail's API does work well, it's just a pain to set up against plain Gmail
because you have to jump through 20 hoops to get API access to your own inbox.

-K

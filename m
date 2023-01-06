Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EB395C1
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 19:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3760C433D2;
	Fri,  6 Jan 2023 19:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673034241;
	bh=E65ZcyKgLV4DF+k/86ImPfBIF+mSUt/D+L+79H57xoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mReRS/7dAAiwFepnwGOLYd3ExgDOeZqQICdtSADyPphUKKun492HqxqkozlXkwz4T
	 UEPnry2F9b8YaIrHYQC7QQQ68NY7SvWhjsi4ukkxqPZxi3FpLi75hLPb9pwhK5ctaz
	 IAlHZ1FNPTV+I0d7J4vvqOg+zY6tQcBo8k7jvuW9G8MHIFZe2X0F5vQI0xSEMzMixY
	 rmrYVvKy7kw8lA5Eiuww0+oJLXvGevoqfUuJx+3hTUjaDXPSbTJ4bPWoVnB/ZJ4Vvq
	 4c2yn8mIyJYrBxq8HBaYPuvcMRn1wGRNV0rZIO+qLO1iSo4GT/wI0YOc28kT8p3l/Y
	 IpCoDT26smsNA==
Date: Fri, 6 Jan 2023 12:43:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Address from trailer on individual patch is sent entire series?
Message-ID: <Y7h5/xItaBke0WbE@dev-arch.thelio-3990X>
References: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>
 <20230106163442.aziaoa3tndqtyisp@meerkat.local>
 <Y7hSRwJd8GbNUNeW@dev-arch.thelio-3990X>
 <20230106192018.ho5yfvj5xirh3ugy@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106192018.ho5yfvj5xirh3ugy@meerkat.local>

On Fri, Jan 06, 2023 at 02:20:18PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Jan 06, 2023 at 09:54:31AM -0700, Nathan Chancellor wrote:
> > I am sure you are aware this contradicts what git send-email does, which
> > is obviously fine in and of itself (I understand b4 is not a git
> > send-email clone), but I am not sure this difference will be for the
> > better.
> 
> Yes, thinking about this some more, it's probably best if we emulate the
> most-expected behaviour of "what would git-send-email do". This still does
> both, in a sense:
> 
> "b4 prep --auto-to-cc" collects addresses as returned by get_maintainers.pl
> and will send these people/addresses the entire series. However, it will no
> longer add addresses from trailers found in individual commits.
> 
> "b4 send" will send patches to any to/cc addresses in the cover letter, plus
> any addresses mentioned in individual commits. The cover letter will still go
> out to everyone, so an address from Reported-by in [PATCH 4/15] will get two
> messages: [PATCH 0/15], [PATCH 4/15].
> 
> Will that be closer to your expectations?

Yes, I think the 'send' change sounds completely reasonable!

I do not use 'b4 prep --auto-to-cc' since I already have my own
'get_maintainer.pl' workflow so I cannot really comment on how much of a
change that suggestion would be. I could imagine a Suggested-by: from a
maintainer on one patch in a series is not uncommon, which would mean
their Cc: would not be added to the cover letter with your suggested
change, meaning they might miss the whole series. That would not be good
but I am not sure if that is just paranoia or a real problem.

Cheers,
Nathan

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C2EDB
	for <tools@linux.kernel.org>; Sat,  7 Jan 2023 00:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C783C433EF;
	Sat,  7 Jan 2023 00:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673051948;
	bh=q53yST30QCoqWGUcDSce2YJrdCi8u1LQ3PnF0n4AQso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfQ2Iis7NQHGCTwDA+4m1XnMbOL4vH3srf7PFnw/TfYWasQe7po0JHM9d2RkWMZrq
	 cAfeAHmA5pJGJwMYGf7/5TEk66CzG1CtdAZFy0lk0WBrIJ7DmEakyicW++4I1thwBQ
	 fYjMDWTQYKz/K/oKxV3zB9ASnxyzQZMDt1sK8NY7ftgpyfen+ZXlzmbese8eknrZcu
	 sGhvMeMQvHSVZMbVPa5xO/WybJBnklRONGLcC0d/yLgKYyAg6g41Abwo85QXmBNTJl
	 aHLXjQ8w4Tfa7IMP16oTxnB/Kb25CDAQ2UY15GzI/36pW8pFvLGcaSHsmP24FVVjCN
	 TqpIRyoWSKtTw==
Date: Fri, 6 Jan 2023 17:39:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Address from trailer on individual patch is sent entire series?
Message-ID: <Y7i/Kn9ismmly4JY@dev-arch.thelio-3990X>
References: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>
 <20230106163442.aziaoa3tndqtyisp@meerkat.local>
 <Y7hSRwJd8GbNUNeW@dev-arch.thelio-3990X>
 <20230106192018.ho5yfvj5xirh3ugy@meerkat.local>
 <Y7h5/xItaBke0WbE@dev-arch.thelio-3990X>
 <20230107001254.g6n5szh7cnkybng2@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107001254.g6n5szh7cnkybng2@meerkat.local>

On Fri, Jan 06, 2023 at 07:12:54PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Jan 06, 2023 at 12:43:59PM -0700, Nathan Chancellor wrote:
> > Yes, I think the 'send' change sounds completely reasonable!
> > 
> > I do not use 'b4 prep --auto-to-cc' since I already have my own
> > 'get_maintainer.pl' workflow so I cannot really comment on how much of a
> > change that suggestion would be. I could imagine a Suggested-by: from a
> > maintainer on one patch in a series is not uncommon, which would mean
> > their Cc: would not be added to the cover letter with your suggested
> > change, meaning they might miss the whole series. That would not be good
> > but I am not sure if that is just paranoia or a real problem.
> 
> Okay, this change is in master. I'll probably backport it to 0.11.y based on
> testing feedback. Please give it a whirl.

Thank you so much for the quick turnaround! This appears to work how I
would expect it to, based on both 'b4 send -d' and 'b4 send --reflect'.

Cheers,
Nathan

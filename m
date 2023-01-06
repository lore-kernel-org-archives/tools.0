Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F532770E
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 16:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A7FC433D2;
	Fri,  6 Jan 2023 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673024073;
	bh=eVicTkgxEaeiA2WF2TcXDJKfd7XBXZApq69ZjYjp/CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqXcDB/kmXNHBXPgBL+s9XP8BfIzWv6rCT2BM8euMx7ov0k+qEmVFdpETlatIZVeV
	 DeCnDGL67k1EooRzdZcx0MPwr4q3X5xpAg2uJIl8rO8srKpwLhNiy9MYkSOArDZ1do
	 4YBbePH4eq+BYWaDZafTT5sxruPH3fN5Di72JC/hRGNPfIDD/R0A3bzaVehitNnwO0
	 jyXvWWhh0yWJM+BthK4Hxt3TObQ8/ji7EN+EzJ4ri2+5roCBKTWla5i38d+oNwDmpk
	 EjxZOxytM1L0OZC5FHhx5e+6jeesBKmzeYI73j+LovaqmtgDWDjJhOsnFxTdIsDpFG
	 oh2gMnzXcSIfQ==
Date: Fri, 6 Jan 2023 09:54:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Address from trailer on individual patch is sent entire series?
Message-ID: <Y7hSRwJd8GbNUNeW@dev-arch.thelio-3990X>
References: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>
 <20230106163442.aziaoa3tndqtyisp@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106163442.aziaoa3tndqtyisp@meerkat.local>

On Fri, Jan 06, 2023 at 11:34:42AM -0500, Konstantin Ryabitsev wrote:
> On Thu, Jan 05, 2023 at 06:27:09PM -0700, Nathan Chancellor wrote:
> > Hi Konstantin,
> > 
> > I was going over my recent "sent with b4" series and I noticed that the
> > kernel test robot, a Reported-by: on a specific patch in the series, was
> > Cc'd on the entire series.
> 
> This is one of those time when people's expectations diverge and either way
> you do it, someone will find that it's not how they want it to work.
> 
> Originally, my polling suggested that everyone always wanted to receive the
> entire patch series, even if they were only responsible for a single patch.
> This was later changed for in-patch "Cc:" trailers, because there were actual
> CI workflows based on that and sending them the entire series was causing more
> harm than good.
> 
> However, every other trailer will still receive the entire series, because I
> believe it's still more correct than just sending them a single patch.

Understood, thanks for taking the time to explain your rationale!

I am sure you are aware this contradicts what git send-email does, which
is obviously fine in and of itself (I understand b4 is not a git
send-email clone), but I am not sure this difference will be for the
better.

For example, take the series I just mentioned in my previous mail. There
are only three patches that are relevant to the s390 folks, so
previously I Cc'd them on just those three patches along with the cover
letter so that is what clear what I was expecting (tags for those three
patches so they could be carried via another tree). I promptly got a
review and ack from Sven and Heiko respectively, which I added to the
relevant patches in my local tree.

If I have to send a v2, Heiko and Sven are going to get Cc'd on the
entire series, which is now entirely irrelevant to them, versus getting
just those few patches, which they can recognized as ones that they have
already dealt with. I suppose I am going to get bit by this more often
than others will because I work all over the tree so perhaps it is not
that big of a concern in practice.

> If that's not the actual consensus and we decide that all other
> in-patch trailers should be handled the same as Cc: (they get the
> cover letter plus only the individual patches where they are cc'd), I
> can certainly implement that as well.

It would be good to poll others to see what they think, as I could be
way off base here.

Cheers,
Nathan

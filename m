Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17932E6B6
	for <tools@linux.kernel.org>; Tue, 21 Oct 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057508; cv=none; b=AJJ2BhiF9FlDPocOfHuojy48QM4qbFm2/lWyBbvjJUAzcPEwFyrEE+0uJ376J1ndFXzeEYs4dy8EJ4HXNH3gcBX5P845m375ej7bcuEYw+2LE91nY7eVrEQPq3Mar81Ki+b1QLdeL619uoWL3W1via3zUGGtO/MBwKr0oHU9ktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057508; c=relaxed/simple;
	bh=h3Ehf0k0rasKqpTFPvbHb6hY53DikDBX1uvYMHF2pAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiDcFYy+4Cmg4uZlTE9EjA9YASuCtcq5vsaWeZvV9DonQwn5G9xe1spScBgidHl1SOLWmO6JXoXly2WqR3VOanuU2H0Iu77snUF6AKDovNXNzEtt/s5geJpITVohpXbT6IBuPGnkdO89h9ARuD5Uca7VfdEM28/EmP6rLRVg+Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVe3Th2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVe3Th2x"
Received: by smtp.kernel.org (Postfix)
	id 986AFC4CEF5; Tue, 21 Oct 2025 14:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6ADC4CEF7;
	Tue, 21 Oct 2025 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761057507;
	bh=h3Ehf0k0rasKqpTFPvbHb6hY53DikDBX1uvYMHF2pAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVe3Th2xpJhAHZwI7zC0wNl2iZa0IpKKWLZtRumTJePcHGrtAX/zBjJDWSnlcv7YU
	 avIkoHqEoNdWYM+Ey8kaE6icwXYOE+yt8IVyy0ytEpwojrRLh39eY63wqgffgoBugI
	 geinvVmZDut9TXrk6NwZHqMIHRJXCvOCdTr5EoI55vLfnW4UyuQBEfpzDDAOZNUQes
	 fy5jMmA8UXm792BX/Zct/bmcIzzghJhrm7YUGEkJJOl2TY2I+PduNHNkIiy8TSqa/R
	 cq+qwwuO3NLDEVMd4hWhEHukn1QaHKuvZ2qhKmLzf8bA4RNeAHmp0omX6xZMa3EQMz
	 xAwLQv9ICesqw==
Date: Tue, 21 Oct 2025 15:38:23 +0100
From: Lee Jones <lee@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251021143823.GH475031@google.com>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
 <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
 <20251010143452.GH2988639@google.com>
 <20251010-feathered-pastoral-woodpecker-de863d@lemur>
 <2025101155-coauthor-backboned-e90b@gregkh>
 <20251021105645.GE475031@google.com>
 <08cb2b99-187e-46e5-8921-bbadd2a66636@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08cb2b99-187e-46e5-8921-bbadd2a66636@kernel.org>

On Tue, 21 Oct 2025, Vlastimil Babka (SUSE) wrote:

> On 10/21/25 12:56, Lee Jones wrote:
> > On Sat, 11 Oct 2025, Greg KH wrote:
> > 
> >> On Fri, Oct 10, 2025 at 10:37:22AM -0400, Konstantin Ryabitsev wrote:
> >> > On Fri, Oct 10, 2025 at 03:34:52PM +0100, Lee Jones wrote:
> >> > > > Next question is -- have you recently stopped adding Link: tags to your
> >> > > > commits? :)
> >> > > 
> >> > > Oooo, yes!  Yes, I have!
> >> > > 
> >> > > Why would that make a difference?
> >> > 
> >> > When patches have been altered by the maintainer, we can no longer match them
> >> > by git-patch-id.
> >> 
> >> Which is the primary reason to keep the Link: stuff.  Many maintainers
> >> manually change patches to fix up minor things all the time, and without
> >> the Link: it's a major pain to find (the LF sponsored a whole project
> >> just to do the backwards mapping for many years, but no one used it...)
> >> 
> >> > In the past, when we found a Link: trailer, we could still
> >> > match their provenance by message-id, but if that is gone, we can no longer
> >> > fall back to that. I am working on making the "ty" mechanism being less
> >> > dependent on that -- hopefully the master branch should become more useful to
> >> > you again in the near future.
> >> 
> >> message-id is important to track somehow, we need that link.
> > 
> > It turns out that going back to manually thanking contributors is too
> > much of a regression for me ATM.  For now at least, against Linus'
> > wishes (sadly), I'm putting Link:s back in.
>  
> Linus later said he would tolerate them with the https://patch.msgid.link
> domain:
> 
> https://lore.kernel.org/all/CAHk-=wj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyBSpTKR+=Vtw@mail.gmail.com/

Okay, this works.  Looks like b4 now supports that in `master` as:

52d380965c71 ("Set default linkmask to patch.msgid.link")

-- 
Lee Jones [李琼斯]

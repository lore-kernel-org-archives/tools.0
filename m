Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924632C93C
	for <tools@linux.kernel.org>; Tue, 21 Oct 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761044209; cv=none; b=HOB2wKYjZl+AGQa8A9SJtM3vTy0bFuZ+qqxAcTJZYmt+ZFJXvjAmbeIkEafQJbxSlCHYts5Tg5cVw9aqcCrJPXWhfLHttqy8MMwgsxzJ0VImcvNG+cmb7c5CpC+EMj66abnvDh3XulD5OrJIkbWXWqNIs01Ex+J810tWTvQLk4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761044209; c=relaxed/simple;
	bh=nQAjVSXPZx5canQHvkWowycYDCtqTMmZbv7yKwH1h9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UF7Jm+aH0p86ndSdH5/ztUeNXYUSl1jZTVTD5ciK2FXvV0vEbjjW0Eaz60X02xqG5t7FmCKjkLk15DMHI8V3Liop9vtFNRy/EYZBdYTkbJiGuh1gd/CaWLdRnJQZ94dJD7HBadJao5FYDUvKbxLPtZeGsRE3rOl0iCl67ndCssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLRv6xYG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLRv6xYG"
Received: by smtp.kernel.org (Postfix)
	id 38856C4CEFD; Tue, 21 Oct 2025 10:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14EB3C4CEF1;
	Tue, 21 Oct 2025 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761044209;
	bh=nQAjVSXPZx5canQHvkWowycYDCtqTMmZbv7yKwH1h9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLRv6xYGtpK49wpXWppiiUrntY+CkGTM11EILsamHMSQQFu6ppqRoGRYXK/oPtLLA
	 sIl7uZFdoP3pPeEvkmXR2G1O8pdaOJnbKvCHQgMrIdU1hLC8Oy9UgC0cJLPjxLfdaA
	 8Ws8lej/v76XQSk4UjIQMp/blZQeYaeERSgQ2Oovv2IKcbvoFKfeosloAJ5KKQsF2t
	 ovH0XoIoq8AMcZJFOvIWK2VaRaiyGQoVVwviAMpnuJwW8HJfcJo5W4hhHy++Ut89Yx
	 iL8Rk5fAkiDVRmuGSmE8UdhN3ZYx03lQvFWZ9NBRkVxpHXVqIywB/06A6MkaIFwMMW
	 r2m3VciwHcXrg==
Date: Tue, 21 Oct 2025 11:56:45 +0100
From: Lee Jones <lee@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251021105645.GE475031@google.com>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
 <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
 <20251010143452.GH2988639@google.com>
 <20251010-feathered-pastoral-woodpecker-de863d@lemur>
 <2025101155-coauthor-backboned-e90b@gregkh>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025101155-coauthor-backboned-e90b@gregkh>

On Sat, 11 Oct 2025, Greg KH wrote:

> On Fri, Oct 10, 2025 at 10:37:22AM -0400, Konstantin Ryabitsev wrote:
> > On Fri, Oct 10, 2025 at 03:34:52PM +0100, Lee Jones wrote:
> > > > Next question is -- have you recently stopped adding Link: tags to your
> > > > commits? :)
> > > 
> > > Oooo, yes!  Yes, I have!
> > > 
> > > Why would that make a difference?
> > 
> > When patches have been altered by the maintainer, we can no longer match them
> > by git-patch-id.
> 
> Which is the primary reason to keep the Link: stuff.  Many maintainers
> manually change patches to fix up minor things all the time, and without
> the Link: it's a major pain to find (the LF sponsored a whole project
> just to do the backwards mapping for many years, but no one used it...)
> 
> > In the past, when we found a Link: trailer, we could still
> > match their provenance by message-id, but if that is gone, we can no longer
> > fall back to that. I am working on making the "ty" mechanism being less
> > dependent on that -- hopefully the master branch should become more useful to
> > you again in the near future.
> 
> message-id is important to track somehow, we need that link.

It turns out that going back to manually thanking contributors is too
much of a regression for me ATM.  For now at least, against Linus'
wishes (sadly), I'm putting Link:s back in.

-- 
Lee Jones [李琼斯]

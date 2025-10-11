Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32833257835
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178871; cv=none; b=UO+47gLl8DEpdHSpePw8tICaR5+Cpa2KRiu7j85gJkU+xuFXTam0xVcE+6pS3V98baSCHbbRGhzOJSbUAd45RdRhsO9MGcSdBQgt29ZXNahqNEoXnx0B1Y5XgpoHHgBuJTko8ZADJC7Ao0/S2B0uK5WhXpQOkXVajHcVr70tO8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178871; c=relaxed/simple;
	bh=G8y5rOU05/09Kg4N/I/76nl4CQhXWvFTbR1z4cPJvl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBDq0nMsxA3UyNQjKR1+CN81gh01OAKpaTwSG6kFFWNQ7t5OttZOF5FwAaL5atcGk8UeP1e2d1wl89EHSUtf26LkfzBEEqgfaGITOGFkbRnGBp9nZjwbMdf38EEvCoECOMa/OmAZ70wChdlXUwGlWVIY07mZdFKCs0B+v2d5MXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zBcsiXvA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zBcsiXvA"
Received: by smtp.kernel.org (Postfix)
	id DF448C116B1; Sat, 11 Oct 2025 10:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C5CC4CEF4;
	Sat, 11 Oct 2025 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760178870;
	bh=G8y5rOU05/09Kg4N/I/76nl4CQhXWvFTbR1z4cPJvl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zBcsiXvAw0m/h8ulmsO7/BW8TlwvbZi3HBH1W2e6KGpJRu1frRnBqwnL/1P3dOq6o
	 ONSu81gGiKtRaYNVhBSdaE+/vZD8AcYHqiIaiHAS7ZVm/bZi3Yymeej2Pi0rfo7eiX
	 bUtFCtgG0sY8eF00hKmLvfsJbeUgYJCrGPSs6LNE=
Date: Sat, 11 Oct 2025 12:34:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, tools@kernel.org
Subject: Re: b4: ty: User-flow regression
Message-ID: <2025101155-coauthor-backboned-e90b@gregkh>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
 <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
 <20251010143452.GH2988639@google.com>
 <20251010-feathered-pastoral-woodpecker-de863d@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-feathered-pastoral-woodpecker-de863d@lemur>

On Fri, Oct 10, 2025 at 10:37:22AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Oct 10, 2025 at 03:34:52PM +0100, Lee Jones wrote:
> > > Next question is -- have you recently stopped adding Link: tags to your
> > > commits? :)
> > 
> > Oooo, yes!  Yes, I have!
> > 
> > Why would that make a difference?
> 
> When patches have been altered by the maintainer, we can no longer match them
> by git-patch-id.

Which is the primary reason to keep the Link: stuff.  Many maintainers
manually change patches to fix up minor things all the time, and without
the Link: it's a major pain to find (the LF sponsored a whole project
just to do the backwards mapping for many years, but no one used it...)

> In the past, when we found a Link: trailer, we could still
> match their provenance by message-id, but if that is gone, we can no longer
> fall back to that. I am working on making the "ty" mechanism being less
> dependent on that -- hopefully the master branch should become more useful to
> you again in the near future.

message-id is important to track somehow, we need that link.

thanks,

greg k-h

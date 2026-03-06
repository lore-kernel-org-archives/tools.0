Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCD327CB35
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813882; cv=none; b=Bdl9GFo8XBZd0K9fIGtN8uRJaI+zKmnPZok8H/lrQWSabzkHgVnNveldzSE1A2AhaskdOwn+CzCusUr7i47FXguH6YkYXRvrXJkZlPbLaPquIRNIfks8mbhJptsSWecHvPWzTblAw6LgyMeQhjhP7hAotjSCoA7+2uItvUYGfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813882; c=relaxed/simple;
	bh=BHZDNvjETDTVEQvdqg38LvqWtEqQ069oghts9DpOdsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdHGYUCvYRHGSdlHhimT8ReGSp4KfgU9nR3iWSKIqkOmL+KZU0Wk2uW6wfq+bb9HjVAToOqrobSpMKsXm6KcWv2GrC92I4GZ1Eoj1Pog6jXoKxFraajQeyE0ISCKJ2J0bAPVRiibMYWjSILdjUucF/d8yTuMFwrnsPbZ1LcuPQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0VspkXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0VspkXM"
Received: by smtp.kernel.org (Postfix)
	id 1D695C2BC86; Fri,  6 Mar 2026 16:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C8FC4CEF7;
	Fri,  6 Mar 2026 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772813882;
	bh=BHZDNvjETDTVEQvdqg38LvqWtEqQ069oghts9DpOdsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0VspkXM9NT4NNkTpO0BetwC74mEmrdXSXgJnITlPm1KDgKLqdymsgg8XFa2JexJj
	 zocOXHg01PuxNEBXqyukxEKyuJHcz5cLiCvKKCrCrvbaSy81Led8XSqNXnASkZ87Q0
	 lPXbCn9eCiaeaXc673S6E/KM9RHE2j3L+n5sEZpv6kv4AsRkndt7Y4QbhZ6xzHiXaO
	 SwP4Uwr0I02FHnZDqh8dNNr0lyYzi+f5Bsg+cAsgI6t1Blpdz1CscQwhol6sRGiH3X
	 YaSxI7mIarTMCrEopgebCUTHFq38AtaGP+IOHXdZdBFnPPWpD/uKd779f6VObTe0ml
	 Y0ZyeJJBWAudQ==
Date: Fri, 6 Mar 2026 17:17:57 +0100
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Christian Brauner <christian@amutable.com>, "Claude Opus 4.6" <noreply@anthropic.com>
Subject: Re: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Message-ID: <20260306-biobauer-mondfinsternis-cc602b2b9c3e@brauner>
References: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
 <20260306-cherubic-electric-bullmastiff-bcb0da@lemur>
 <20260306-seepferdchen-ziffer-c69d1d90fc16@brauner>
 <20260306-grumpy-jade-bulldog-a6f004@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-grumpy-jade-bulldog-a6f004@lemur>

On Fri, Mar 06, 2026 at 10:41:38AM -0500, Konstantin Ryabitsev wrote:
> On Fri, Mar 06, 2026 at 04:26:52PM +0100, Christian Brauner wrote:
> > > > Add a --in-reply-to flag to b4 send that sets the In-Reply-To and
> > > > References headers on the cover letter (or single patch). This allows
> > > > sending a new series version as a reply to the previous version or to
> > > > an existing discussion thread, which is a common workflow on mailing
> > > > lists that b4 did not directly support until now.
> > > 
> > > Isn't this already implemented with send-same-thread?
> > > https://b4.docs.kernel.org/en/latest/config.html#term-b4.send-same-thread
> > 
> > I don't think so. At leat not for what I want to use this for.
> > Here's an example where I used b4 send --in-reply-to already:
> > 
> > https://lore.kernel.org/all/20260306-work-kernel-exit-v1-1-8f871f6281cb@kernel.org
> > 
> > I wanted the bugfix to be a reply to the original bug and I didn't see a
> > good way of doing this.
> 
> I see the desire to do this, but this is also the kind of pattern that causes
> all sorts of grief:
> 
> - you have to pass --no-parent if you want to retrieve your patch
> 
> - you can no longer retrieve the parent series at all. Try it yourself:
>   b4 am 20260120-work-pidfs-rhashtable-v2-1-d593c4d0f576@kernel.org
>   You will only be able to retrieve your patch now, not the original patch.
> 
> I don't see a way to reconcile what you're trying to do and keeping automation
> working reliably, do you?

Yeah, I wasn't aware that this is a limitation. If this isn't super
uncommon, than it is broken with similar mail chains. Good to know that
this breaks b4.

Maybe what Vlastimil proposed would serve at least a similar purpose
where it adds the people on the bug report to the Cc and automatically
inserts a Link: to the report in the message or the commit.

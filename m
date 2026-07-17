Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1339418A32
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296806; cv=none; b=cgramHM52TWwDUyvELKnUxZXOkL71RCqLmPYqvwEWbxlyM3tNoqCAVBHlPkSCox9mSSyMGU8ycfbqDwUs02azWGBbAXGzKgRcAIoXx+qQvoN5Y1/9E+zIcyClEEW8P5mZWW9CZoleWPcwcicgf9sypbnlFWT/0XI6UejmWbhOPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296806; c=relaxed/simple;
	bh=TTCCyu1gNayEXzhj+axetbcpsLSAY/BLrYC3102STTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7t8iZGCjGIvrkjb0kvh0E9LkKtM1v4VfYflgsgvmviV75YeAX4nFD8ENtm2A/dmKaa1NcLa5L3eCGmk8D6KSM6s9hJHFXBMUs9MB6DIctwZ407buyXPzhqZ6MyWuZAGEZb43pc2HI/w6NzHrhITJ8Z278zojZwTgIoJa68CrNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mg9thlFZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mg9thlFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890A01F000E9;
	Fri, 17 Jul 2026 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784296804;
	bh=5/eY7rnojDN4MSWUFwKx1jIp/6GTfOyqpmsdF21A4Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mg9thlFZuzr3udL7az1A85YJarx7AecS9ggnj5OFx1BR/lnajKQseEUVtoAolsjEY
	 lHaz2qjRKLJdALF2nuKk1y3e18x+E6BjIbL64Kw711RVjc9cFi0rh8v9ABVGG0RWUW
	 kDO9pW9o6oLtCk2yIk8tLQ/rFWcaqtWpbc85KNpo=
Date: Fri, 17 Jul 2026 10:00:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 review not picking up v2 with prefix?
Message-ID: <20260717-admirable-red-dragon-6b411e@lemur>
References: <alNzLxOk2V04cNgo@lucifer>
 <aleTasCAYAvzz6cU@lucifer>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aleTasCAYAvzz6cU@lucifer>

On Wed, Jul 15, 2026 at 03:05:25PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Thanks for b4 review is a great tool that I'm now integrating into my workflow
> > (alongside b4 for sending series which I previously... resisted :)
> >
> > So maybe an edge case here, and sorry for lazy report vs. patching (just so much
> > to do elsewhere) but for series [0] I set a mm-hotfixes prefix via:
> >
> > $ b4 prep --set-prefixes 'mm-hotfixes'
> >
> > Which is a convention in mm used sometimes to highlight that a series/patch
> > is a hotfix.
> >
> > I have the v1 tracked ([1]), but when doing an update via 'u' or 'U' in the
> > review tui it doesn't seem to find the v2.
> >
> > To make things more complicated, I sent patches separately previously ([2]
> > and [3]) which I decided to combine into the series sent in [0].
> 
> Ohhh this may be on purpose. I noticed with v3 that it picked it up, but kept it
> at v2, and prompted me to do 'a' (action) then 'U' (upgrade) so possibly PEBKAC
> here :>)

Yes, we want to avoid a rug-pull scenario where you're working on reviewing v1
and then a new version arrives. We just mark it as "upgrade available" and
then you can do things like range-diff the series before you upgrade, in case
you want to decide if you want to send your review for v1 at all, or start
fresh with v2.

I'll see if we can make this a bit more obvious, since the fact that you sent
a message about this tells me that it's currently doing something confusing.

-K

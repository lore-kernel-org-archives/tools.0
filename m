Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF681F936
	for <tools@linux.kernel.org>; Sun,  1 Feb 2026 05:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769925165; cv=none; b=jvNpF+gCgHUgKTTpAZinKo407FWRST40AljEGeLxIQpMRI89ee29OY/vlSk++TkHOx91d7ckeqkgAS7Y1sm84M+j3hL+PtFt6Mm/kl6KsYxtQTFN8bFGj6Xq5M1GtsmC8PX0m8Lcd86fDF0wJk3Qipb7580yNrIU/Eg9qykAHlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769925165; c=relaxed/simple;
	bh=K1m1qV26MCUsoGfwfTcIGqIrcW16O/POxKzIqHNXmac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av61qUmJgBqPyL8t9pq4bjPidn0TgPeU6pUAq8NoF2ib3dOWgobEtVCAgNjcn3g9T1cL1auNb+DUT9Jrwa60ii8voNO5y5+K2UuVjUi97j1HaVF26EGL4VxHJzl7JwWyB8g/8BSQCH3zkcg/NQ07ToMlzi42YyIBc0PI1MS4xM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i6gw4UwP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i6gw4UwP"
Received: by smtp.kernel.org (Postfix)
	id 1E6AFC19425; Sun,  1 Feb 2026 05:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF836C4CEF7;
	Sun,  1 Feb 2026 05:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769925165;
	bh=K1m1qV26MCUsoGfwfTcIGqIrcW16O/POxKzIqHNXmac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6gw4UwPWQyG0lvuDIQVg6cEjM5tWBTvy1oAMJY/7gZWNtVz5NWnvU53kxhlQEDQe
	 zcaoyOgbwbyXsqpEljZUFdld1ko64PqWVzbD+4Untyy5TBaVNLcrVRF/Qr3iLer3g8
	 P8j1/h1pCVYKgjV5laqkna3yx5D0ElvP5/cx9LUE=
Date: Sun, 1 Feb 2026 00:52:43 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Tomas Melin <tomas.melin@vaisala.com>
Subject: Re: [PATCH b4 0/2] Add support for oauth2 SMTP authentication
Message-ID: <20260201-sceptical-resolute-curassow-43ab98@lemur>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <176992425473.611611.15176471580489636701@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176992425473.611611.15176471580489636701@lemur>

On Sun, Feb 01, 2026 at 12:37:34AM -0500, Konstantin Ryabitsev wrote:
> On Thu, 29 Jan 2026 11:10:28 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
> > Add support for oauth2 authentication with SMTP server, integrating
> > with git credential helpers for retrieving tokens. With this approach,
> > the same configuration as is needed for git send-email can be used
> > to send patches using oauth2 with b4.
> 
> Thank you for sending this in! I'm using this series as a guinea pig for 
> the "b4 review" functionality, using agent-assisted reviews. I know it's 
> not everyone's cup of tea, but there is enough interest in it to at 
> least support it.
> 
> I'm sending per-patch followups with the problems the agent has 
> identified (combed by myself -- I'm not just blindly relying on the 
> agent here).
> 
> I am also screencasting this whole process, so hopefully this will be 
> educational as well. :)

This is the screencast:
https://asciinema.org/a/777545

There are still lots of improvements to "b4 review" to consider it useful and
remotely maintainer-ready, but it's at least doing useful things already.

Cheers,
-K

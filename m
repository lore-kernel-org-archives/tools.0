Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB304C94;
	Tue, 21 Jun 2022 17:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A91C3411C;
	Tue, 21 Jun 2022 17:49:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Lu2QRAzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655833761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqi3AbKhd3giBFe7bZZyyH/tn4SsE5sysjShOtnRgKQ=;
	b=Lu2QRAzReIal4hMqcraZOAfqTA8GX8DFgfGsWyOBVFLfyNdr5qEw2nYA+wQq9hAuFYgFFA
	Bns3wgFm9LJ5jNah0pbY1qtg4yuERd2tBYFf4jslv8M8nYrpXKGDJShyXWhdUidPnuaohy
	lvvd95F68COhDPis/3lCAJCJtU0mNnw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52309008 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 21 Jun 2022 17:49:20 +0000 (UTC)
Date: Tue, 21 Jun 2022 19:49:18 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrIEnmt5vDMcbOiG@zx2c4.com>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621165953.z25hwos7gom6bp6s@meerkat.local>

Hi Konstantin,

On Tue, Jun 21, 2022 at 12:59:53PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Jun 21, 2022 at 06:03:30PM +0200, Jason A. Donenfeld wrote:
> > Very much so. But if you look at various commits from the last 2 or 3
> > years, this is now disregarded pretty regularly. It'd be nice to see
> > the tooling preventing this kind of error rather than encouraging it.
> 
> The default for b4 since version 0.6 (2020) has been not to preserve the
> existing trailer order and append any new ones at the bottom.

Huh, interesting. Is this a stable-distro or Debian thing, I wonder,
where maintainers are using an old b4? Or perhaps more likely, b4 still
has that option, and so people are using that option, even if it's not
the default?

IMO, you should remove both the "sort S-o-b into meaninglessness" and
the "add a useless Link: trailer that wastes my time when I middle click
it" options, so that it's harder to make these mistakes.

Looking at the man page, it seems like you make these mistakes very easy
and give people some example configs even:

     # When processing thread trailers, sort them in this order.
     # Can use shell-globbing and must end with ,*
     # Some sorting orders:
     #trailer-order=link*,fixes*,cc*,reported*,suggested*,original*,co-*,tested*,reviewed*,acked*,signed-off*,*
     #trailer-order = fixes*,reported*,suggested*,original*,co-*,signed-off*,tested*,reviewed*,acked*,cc*,link*,*
     trailer-order = _preserve_

Just remove the functionality?

Jason

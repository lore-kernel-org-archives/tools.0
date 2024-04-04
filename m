Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADDE1CD03
	for <tools@linux.kernel.org>; Thu,  4 Apr 2024 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712240984; cv=none; b=ZlSAAdifw6V2lcqg3E11k1usvzSxjHeat0ljLxw0OqOL9Fx+timkqlI2BYFHu7geJjPRowFT5jg+tJcnlpCmVtsIDZ0xwM+4QoJxC/OTxchz8FEjdx3cVrESkmfCE7xbfl6E6QsR+AN9wLjSla9DSPi9ZKZFOcA6Ibg9WPtIHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712240984; c=relaxed/simple;
	bh=Q7gT9GLW3RVEBE5Ac94ufB4DZdSx575baCqW7XUMyl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMBMEmXjDc7E7Uj+wGe6f9t/juxk9gjt5z81+1uHCin2Zrb/VgM7q+tb++nplGIoa8EjhixK4cC3TK+4dJObg4Pbqfg+iAoWaHD+de4UURBh3c3ck2t/RDaO6ylSFqxcVj0EIkPilHwWYTwghtjdokPLZyI2beHzMGBaTKVF+1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 5D460C433C7; Thu,  4 Apr 2024 14:29:44 +0000 (UTC)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.kernel.org (Postfix) with ESMTP id 64991C433F1
	for <tools@kernel.org>; Thu,  4 Apr 2024 14:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64991C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id B3C4F72C8CC;
	Thu,  4 Apr 2024 17:29:34 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id AC4FC36D0160;
	Thu,  4 Apr 2024 17:29:34 +0300 (MSK)
Date: Thu, 4 Apr 2024 17:29:34 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: grokmirror from kernel.googlesource.com
Message-ID: <20240404142934.e5djlrkaorufl6lc@altlinux.org>
References: <20240330142439.7qjcbbhnqxf2ta3h@altlinux.org>
 <20240403-real-acrid-bug-df6dba@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20240403-real-acrid-bug-df6dba@lemur>

Konstantin,

On Wed, Apr 03, 2024 at 05:02:07PM -0400, Konstantin Ryabitsev wrote:
> On Sat, Mar 30, 2024 at 05:24:39PM +0300, Vitaly Chikunov wrote:
> > Is it OK to mirror git.kernel.org from it's mirror
> > kernel.googlesource.com using grokmirror?
> 
> I don't recommend it because kernel.googlesource.com doesn't publish its own
> manifest, so you are always going to be in a race between our manifest and
> their mirror.

Ah, good to know!

> 
> > (Recently we getting 502 Bad Gateway from git fetch from git.kernel.org
> > directly.)
> 
> Well, at least grokmirror should recover from such conditions. It doesn't
> happen very frequently, but every now and again a CI farm will try to use
> git.kernel.org directly and that tends to cause problems.

Good to know either. I noticed if I press ^C while grok-pull run then on the
next run it thinks work is already done and it looked racy.

  $ grok-pull -c grokmirror-korg.conf -v
   manifest: fetching https://git.kernel.org/manifest.js.gz
   manifest: 2 relevant entries
     search: finding all repos in /home/kernelbot/mirror
     worker: started (1 running)
      fetch: /pub/scm/linux/kernel/git/stable/linux.git
  ^CExiting on signal 2
  Exiting on signal 2
  $ grok-pull -c grokmirror-korg.conf -v
   manifest: fetching https://git.kernel.org/manifest.js.gz
   manifest: unchanged

Perhaps, with frequent runs it will self-recover. But this brings
another question - what is recommended minimal cron interval for
grok-pull for git.kernel.org (I only want to mirror torvalds and stable
repos)? I have seen in some articles and old READMEs example of every
minute (*) and once per 5 minutes (*/5).

Thanks,

> 
> -K

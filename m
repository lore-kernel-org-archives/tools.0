Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260551BF40
	for <tools@linux.kernel.org>; Thu,  4 Apr 2024 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712248469; cv=none; b=lPZ/1+0SJEYkk60W1kuGZv7negJXeYu1f9w3Nmwd4terwERYGd/Atve18rjA1uSUjIrJePtss/+MvEZc9Lt6B8uy2HRjeW3rYGOEmebiyuvACDi6SFVNrFYBzVAe55UV8EBb4Og2J4ZQY8iqoCeqgzz/jbCTmswk4gBKaLhA2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712248469; c=relaxed/simple;
	bh=X4Lw/dih49IW+PWkdCAeI85+hWxo8PM9kQPQUdXpBtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCB4vLAbuVh8cLnxNCVQ6NafgfQjUqRhlsPrpB7DcA64Eac+BFYdR47+63XUCyPB+xBlVrH/UAIiX0pBkewCT3XnjvZVF+B3QzRRNLP23UA6NqsBEq2yrCVaZTIPicnuSLXWcSRU2EJJnq5ol7jCbSuB6ye8Eti8rd1i/naFwHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id BCBE0C43390; Thu,  4 Apr 2024 16:34:28 +0000 (UTC)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.kernel.org (Postfix) with ESMTP id 691BDC433C7
	for <tools@kernel.org>; Thu,  4 Apr 2024 16:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 691BDC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 8628272C8CC;
	Thu,  4 Apr 2024 19:34:24 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id 0A60536D0160;
	Thu,  4 Apr 2024 19:34:24 +0300 (MSK)
Date: Thu, 4 Apr 2024 19:34:23 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: grokmirror from kernel.googlesource.com
Message-ID: <20240404163423.md5wiz2jsb76jjh4@altlinux.org>
References: <20240330142439.7qjcbbhnqxf2ta3h@altlinux.org>
 <20240403-real-acrid-bug-df6dba@lemur>
 <20240404142934.e5djlrkaorufl6lc@altlinux.org>
 <20240404-outrageous-locust-of-refinement-f9ada3@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20240404-outrageous-locust-of-refinement-f9ada3@lemur>

On Thu, Apr 04, 2024 at 10:49:02AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Apr 04, 2024 at 05:29:34PM +0300, Vitaly Chikunov wrote:
> > Perhaps, with frequent runs it will self-recover. But this brings
> > another question - what is recommended minimal cron interval for
> > grok-pull for git.kernel.org (I only want to mirror torvalds and stable
> > repos)? I have seen in some articles and old READMEs example of every
> > minute (*) and once per 5 minutes (*/5).
> 
> If you are running grokmirror 2.x (and you should be, hopefully), then you can
> just set "refresh" and run it as a service. You can continue running it as a
> cronjob, though -- it can be once a minute if you like. It just downloads a
> static manifest file, and only if it's changed.

That's good!

Thanks,

> 
> -K

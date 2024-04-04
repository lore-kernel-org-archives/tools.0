Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2F18E10
	for <tools@linux.kernel.org>; Thu,  4 Apr 2024 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712242145; cv=none; b=c4n0H2kxe/qCFrTjaY6jqG6oCrh1YxTQI1flrM5BrKid2sLY8cd9MUobJ/ARSz8qrA5dnYlZqZWIsueJD4Ke0aB+hnlecw2vdnJTU18vziG4oi89Zo9CcRPcXK5sNii+UQrQkNdi/KIOAGrY8iRTjqHjiG7h2xqnY5iNsAnlcGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712242145; c=relaxed/simple;
	bh=WdvyMsiryIxGltg+aAo4bJQgDgKqVBg7kwWKBubUMY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLjz6ZGeQ9sDOpm0nLqMsaDhL3QUjV2JixBMHM3ZxEVc7k1nY2sHaX7icBC+GL0JzP8aordB/jyi+djKi3sBhCZkewium/klhawkX6dJQKO6Sd0nTEThWl2GsJ2GqwyDVgDDNv6f9OGMrbdh/D515JlXUqzhpDvmq0MPCf50UNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E9r92M5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E9r92M5v"
Received: by smtp.kernel.org (Postfix)
	id 5A516C433C7; Thu,  4 Apr 2024 14:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0995C433F1;
	Thu,  4 Apr 2024 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712242145;
	bh=WdvyMsiryIxGltg+aAo4bJQgDgKqVBg7kwWKBubUMY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9r92M5vnZxY2Of0oVOvLqHA0xJTwasgTgzOOMV6/K9fbsXW/BY0/P0xCSpZ4cOYG
	 amBiDiYc3GWaq6wPysOp+DUE63QRC5BvjKLdOqjiweXNIUlC3ulrLt2YZZcb4GHLv8
	 u7Cq+XmnSLQIom/STNs55R/4vOf/JX7XUj1Fp6+A=
Date: Thu, 4 Apr 2024 10:49:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: tools@kernel.org
Subject: Re: grokmirror from kernel.googlesource.com
Message-ID: <20240404-outrageous-locust-of-refinement-f9ada3@lemur>
References: <20240330142439.7qjcbbhnqxf2ta3h@altlinux.org>
 <20240403-real-acrid-bug-df6dba@lemur>
 <20240404142934.e5djlrkaorufl6lc@altlinux.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240404142934.e5djlrkaorufl6lc@altlinux.org>

On Thu, Apr 04, 2024 at 05:29:34PM +0300, Vitaly Chikunov wrote:
> Perhaps, with frequent runs it will self-recover. But this brings
> another question - what is recommended minimal cron interval for
> grok-pull for git.kernel.org (I only want to mirror torvalds and stable
> repos)? I have seen in some articles and old READMEs example of every
> minute (*) and once per 5 minutes (*/5).

If you are running grokmirror 2.x (and you should be, hopefully), then you can
just set "refresh" and run it as a service. You can continue running it as a
cronjob, though -- it can be once a minute if you like. It just downloads a
static manifest file, and only if it's changed.

-K

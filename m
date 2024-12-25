Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694A4B5AE
	for <tools@linux.kernel.org>; Wed, 25 Dec 2024 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735146809; cv=none; b=Pb2C9QC26+w70xGQlSF7dI90p8cfjVexb3Uero/Hnw5Bp6HS5ienMInuXXdR5M/hnZfyN+lzrsccuYrDaxyrKA1hpOjD9p9QArcHMgiQ4LNOVe+fS1c03Cwz2GWkwCs913fsuy66y1Ig7vHx74GkjAeCf6bgLhN8KungO9TbJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735146809; c=relaxed/simple;
	bh=tD+4zVpO6amgeM4Zv7bDZaJHlsL9v1kJXPY1jFYCMag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cs/Uc9egMSIPiUC51ntbUlzkX/VrhyQ6smVx8sD/yQ/JDTBYu23eSpziki896ZiexJmPFnX9ea1baDsul0YFNuoIFEaSWTCgKNx873ldb0d++6L5nV4NTSVh+yykMZu3e7ZAy1jVvlu9lTzFHAFMRf9hXAUXZXDVUJYzCRJvmh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oNTqw904; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oNTqw904"
Received: by smtp.kernel.org (Postfix)
	id 4028DC4CED2; Wed, 25 Dec 2024 17:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4D8C4CECD;
	Wed, 25 Dec 2024 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735146809;
	bh=tD+4zVpO6amgeM4Zv7bDZaJHlsL9v1kJXPY1jFYCMag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNTqw904Ak4AA718lMR/XX6tVM8TYfQ84+Kes6G00zJB6WJm64silbydXLVyogVI0
	 g2I8fgqEM1p8IIpyzBpNYGN9ErIXeVFGHNbZoz5cRqZAEk7fz7Ke4C2MuB/nwTt9Wf
	 xMSFqLzuK1O4+LV1a+I9DKj4SaxKc5IJuyYTvSMg=
Date: Wed, 25 Dec 2024 12:13:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: tools@kernel.org
Subject: Re: b4: Should send-series-to supress send-auto-to-cmd?
Message-ID: <20241225-premium-peridot-jaguarundi-b92c46@lemur>
References: <af457861-6d07-451a-a4a3-9f52062f95b4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af457861-6d07-451a-a4a3-9f52062f95b4@app.fastmail.com>

On Tue, Dec 24, 2024 at 01:06:27PM +0000, Jiaxun Yang wrote:
> Hi all,
> 
> This is a question (or possibly bug) raised from QEMU's .b4-config [1].
> 
> In QEMU's workflow, we have a fixed To point to the main mailing list, while
> Cc is gathered from get_maintainers.pl.
> 
> However, at least in b4 0.14.2 specifying send-series-to won't suppress send-auto-to-cmd.
> In such .b4-config configuration:
> 
> ```
> [b4]
>     send-series-to = qemu-devel@nongnu.org
>     send-auto-cc-cmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback
> ```
> 
> b4 prep -c will still cause default send-auto-to-cmd to run
> ```
> $ b4 prep -c
> Will collect To: addresses using get_maintainer.pl
> Will collect Cc: addresses using get_maintainer.pl
> Collecting To/Cc addresses
> CRITICAL: Running /[...]/qemu/scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol failed:
> Unknown option: nogit-chief-penguins
> /[...]/qemu/scripts/get_maintainer.pl: invalid argument - use --help if necessary
> ```
> 
> My current workaround is to specify a dummy send-auto-to-cmd (i.e. echo).
> 
> I wonder if it is an expected behaviour?

It's not, it's just an unexpected condition. I'll figure out the right way to
go about it.

bugspray tag me

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953E23A99E
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535898; cv=none; b=sRNl+Eelw2PHDhJDiBtKZf9V4XXTP8UGoaGtH4HNPRUbyeIFtWvVm/NvXMmFeJoJM1YxMGolHP0xa87dRgzl9vad25Cuu1FEPL9zrCSi8zhCaW1ovYrxbuZClunLs6EqPbjaMQ9amX4o5MCMYomBfx18hg6mULGCZhtAPZNdCFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535898; c=relaxed/simple;
	bh=iNO715mSXwbpgNUIjWewiwpDfge5LJ6lbLs1D7zxx98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzlN+xocfsaUolUHmuTyI0ztv9ZM1+a3MQMLgfuOsHd9Tm6ud8MM8l/ObpkfmUwdhkXQWAZB3xBhYZy9k+VTjoLOa8wSMCu4Pu1VzIWRZsYTy8s5lTtar7gCGvDsPcHt8idBFJ0mHiDtcUme25TFxa/Ydc0ZVUcWPCmx2j+6IoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RJZpXVQS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RJZpXVQS"
Received: by smtp.kernel.org (Postfix)
	id 9FF9DC4CEFE; Wed, 15 Oct 2025 13:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE8CC4CEF8;
	Wed, 15 Oct 2025 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760535898;
	bh=iNO715mSXwbpgNUIjWewiwpDfge5LJ6lbLs1D7zxx98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJZpXVQSGY1Cq7/hLKz9U1d7rI6adhrw86ls1mOKCcAZExpqeejlPgdDRbFk74H5L
	 lq0K9c6Wf+3qjg42MrHfiTAPxlvtOnIKRmG211mJ2z39pgPJxyzsE6inOALwxXQmXT
	 NQXkZYZ1hYA3kMRGmCLLcNQA1CeffdMHlIBCecN8=
Date: Wed, 15 Oct 2025 09:44:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <20251015-arcane-lyrebird-of-ampleness-aec27c@lemur>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
 <741ab86b-753d-40ec-91b5-e1b8bb4a3de1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <741ab86b-753d-40ec-91b5-e1b8bb4a3de1@sirena.org.uk>

On Tue, Oct 14, 2025 at 11:13:00PM +0100, Mark Brown wrote:
> On Tue, Oct 14, 2025 at 05:17:43PM -0400, Konstantin Ryabitsev wrote:
> 
> > "b4 dig -c [commitish]" will now output a single link to stdout (all other
> > output going to stderr), so that it can be piped to other commands. It should
> > be the latest matching patch received by lore prior and including the "author
> > date" of the commit. This weeds out all ensuing backports and cherry-picking
> > efforts.
> 
> It would be really handy to have a --mbox (or something) option that
> will download the mailbox like b4 mbox would, my main use for this (and
> for the existing link tags) is to pull the message ID out of the link
> and feed that into b4 mbox to get a mailbox which is what I'll actually
> look at and work with.  Obviously that can be scripted locally but it
> seems like it might be a common enough need to automate directly,
> especially given that the scripting will be going right back into b4.

I just added a --save-mbox option to use with -c. It is currently exclusive
with --all-series, but I can also make it be non-exclusive, so that someone
can save all revisions.

-K

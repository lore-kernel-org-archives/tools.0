Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0112432C924
	for <tools@linux.kernel.org>; Fri, 23 Jan 2026 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769184847; cv=none; b=g6aUI8oQszKMRMfU6zOakD/ZJ0Sp8te5/0xIfK6O9KxqGqJCEyseS8X/O2aGyaw1eVnQ1PSo8SyYlaFt5RzmrU024/OONsHqRlpyIZo8GwktNrQHJ+w+y/ef2Zw1QEdSfO8BP+8mKOcIpgtnUBZ1hpiiO2AozcL8g/0SpT1x4Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769184847; c=relaxed/simple;
	bh=fg0VnVgzTbP6gu2wwVvJSkyThKJpc6iD/mXV9AFx+a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUsgnFavqYwap4lSNg8/ZcKYQfhAeIXdfddCZSgJQPm1/RY3r00oN2Cj8b0w3volgMcVF/kCjAsFBFX5cX2KMivCYrw6mmEtCqYtAzfDFR/5Uzx6neM2qliPNTvPU8xt28Uay8eD6LiFBdRuVJjro0la9xN0XLTK9Ol1Kx/DsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKGc3J1T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKGc3J1T"
Received: by smtp.kernel.org (Postfix)
	id ACD98C19422; Fri, 23 Jan 2026 16:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A39C4CEF1;
	Fri, 23 Jan 2026 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769184846;
	bh=fg0VnVgzTbP6gu2wwVvJSkyThKJpc6iD/mXV9AFx+a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKGc3J1TiHJ8klTcGRmH8LBtsHfMa7ZsxRfZsSrsUhdqHBoNzoFl/2bBgqUCyFFc0
	 0W6csnfVnllKGvtf0XarHlto5UN6YDVrNVJ+2lM94XiBfXszggC5tr9tmNYhCJ9Ghm
	 Exk7zA1t8BiyL8qA9NY5Rc1nJR92Cfk828IAnd51i5MK9rdnAefm4eyIRzXYo00Rcf
	 VZ+AU+T+ZHaTzsarH2oy/v2PbJy7m33YZaOUoHZWQcxVrzGLFvGZ4kTPfdBlR3fzvC
	 mKW/gZc/eSZrTHLoD8XcNm6ByslrmOKnW+mync3ceZTplq6+29jE6cGOsWrjSoeMIW
	 OoHPnOgCXyRGA==
Date: Fri, 23 Jan 2026 11:14:05 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.4 now available
Message-ID: <20260123-brawny-gregarious-pig-edcca1@lemur>
References: <20260120-proud-energetic-pigeon-72bcec@lemur>
 <20260123125949.01381d1f@foz.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123125949.01381d1f@foz.lan>

On Fri, Jan 23, 2026 at 12:59:49PM +0100, Mauro Carvalho Chehab wrote:
> One thing that I missed is that "kgl pull" doesn't really pull
> e-mails inside the mailbox, even when used with lei to pick the last
> week/month of stuff: it just sets it to pick newest e-mails from
> now on.

Yes, for now it acts just like joining a mailing list -- you start receiving
any new mail after you've subscribed. This is mostly to avoid starting off
with delivering a potentially large number of messages to gmail on the very
first run. It takes about 3-5 seconds per message (verily!), so if you are
just setting up and your initial delivery is 1000 messages, you're sitting
there for an hour looking at the progress bar crawling forward.

> IMO, the default should be to populate maildir with the contents
> from the lore git trees, when "kgl pull" is called, as, if one
> wants to pick stuff there is because they usually want to look
> at the most recent messages - eventually replying to them.
> As such, IMHO, the mailbox to be sync altogether with the
> already-existing messages from the specified period.

This is the behaviour we have with "track-subsystem" -- it will deliver the
last 7 days of messages right away. At the moment, I'm loath to do this with
arbitrary lei searches. I'd rather people manually yanked the threads they
actually want.

Thanks for the feedback, though -- I appreciate it.

Regards,
-K

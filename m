Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5E456E10
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823520; cv=none; b=M7A51r2wjN3NckVmzNsccyaUTVKgyYNtqlp3HV2cfrYC0af7lEJJyJ0uyaiqnqpVtNaySnNPsMD7GujX+goR8Nor6+c/xgJKkhPJvBPwAtH+INcm2O0ae+Gbfd+LStY4WmGXCHjaUxS+h/e7FtuyA0yDywl3mhLNzMkTNAiRt78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823520; c=relaxed/simple;
	bh=lFcsa8AbIx21NRozfsTawdOEweZHNRQBChYwjwIf4O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqkAkTKXrz1I2xZi4g7UNMtb7mkn0K55ifjXI+En+s8O004FES4kAzQyGV0bIAgBBjU0x/bm2yeVFHqMLKtTNWG7ui2YyL8kAkG9W3TQNowzbHvYe3k4Dl8POifnbHNiGysEur/QICZS7/eLwhFxFy1d9fqtwI1u7vNFI6Dkqog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVS+KkZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVS+KkZI"
Received: by smtp.kernel.org (Postfix)
	id 2160E1F00A3A; Thu, 23 Jul 2026 16:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7F5051F000E9;
	Thu, 23 Jul 2026 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784823503;
	bh=9ZLPT99w2/2qzY8jo0JrwghwVCo87W/V4+cfZCbLZtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AVS+KkZI6hPnn/mtniSuDND0ltENjS3v/IZU+xpFg83JswcfomQhSIh8cAwpwyNUP
	 V8ZiJTT246uqiTxw+wLU6jBV52cWOc08ziRnLkM9D/yInpm8dMJOrPBHiRkmZRNMVd
	 5OqJfh07TmPdgc2gPJuYCkHijTSN82U49ErBZJVFT5lmuRSWnJNRPcmAzFrzqgvGEF
	 5Fvlkcp+1o0xjUzur6kBSwHpwkHufMejIk8RwutyrcyHvlDRQ/9TpzpcHGOM2r8l/+
	 8x/GCr7e42h5MYc6iMCzkeukK27Jtz6A4MRssWbV89v0IJxen7hj9LIl9Ba5LK2bMR
	 r6ziXAX77C9Gg==
Date: Thu, 23 Jul 2026 17:33:15 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4 0/2] review-tui: don't gpg-sign throwaway test-apply
 commits
Message-ID: <amI0O4M8Ie4qK9Yk@levanger>
References: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>

On Thu, Jul 23, 2026 at 10:33:34AM +0200, Christian Brauner wrote:
> The take/rebase/target/base modals check whether a series applies
> cleanly by running a real git-am into a temporary worktree and rebase
> additionally probes with a cherry-pick. The four modal probes run from
> worker threads while the TUI keeps the terminal.
> 
> With commit.gpgsign=true and pinentry-curses git tries to sign every
> probe commit. pinentry then pops up on the tty that Textual owns in raw
> mode. The TUI repaints over the PIN dialog and its input reader swallows
> the keystrokes and so gpg never gets the PIN and the apply hangs. With a
> card-backed key this reproduces on every take.

yes, thanks a lot!

Tested-by: Nicolas Schier <nsc@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320B2D0606
	for <tools@linux.kernel.org>; Mon,  3 Nov 2025 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762205657; cv=none; b=L0hUg4ecmEWYPC2HIG2Pr1DwmdBvfXgSNsog+tVK6QCXgCZKSYAfsMkLL1IJnxJ6nzfS7YXiedFTm1JT9LyRQxx8jGGPtCHgpkC4cHdUe5yaQ/tD4nz9kzxAE4PJsf7kd63WmCGGF4cZUDt82ZTZOrr34/nmjna9PMupiXaDNq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762205657; c=relaxed/simple;
	bh=K81Y/vzASmiTyJ2nppza77D+YzBzjPMG7efBXxBsSXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbDchQekmv3n8voM/i0CA9BfLjHUWjcqQX54mtdrLy/rRjWXKiTTK7DcDlchm5FSUrSDBPI+4r3IWGw/jvMM2uGYaw/cBMZyOnT+pBGeUpsQnAMDWOaGVR+ipE3254nTFrwdyG/yhGNU6/ju0YPur08GRSpVMjWTyKLf6081Uww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hVLoSSCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hVLoSSCO"
Received: by smtp.kernel.org (Postfix)
	id DF8F9C113D0; Mon,  3 Nov 2025 21:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90B1C4CEE7;
	Mon,  3 Nov 2025 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762205656;
	bh=K81Y/vzASmiTyJ2nppza77D+YzBzjPMG7efBXxBsSXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVLoSSCOHXQ+YlZo07xnqb+ZyFpgTs7rrNq1QbnEOTRJin+nivyIL5vlZCjiiQcDU
	 PuusHcvUJY4cyQ3IiGc2EgTcUtVh5VbTXSgCMAg/2KnF9yN5302nmzgVp72xq2chpn
	 DZ9AKftAk+JOlo5KqF8swHb9Br/amjB2V7Lr6Yzg=
Date: Mon, 3 Nov 2025 16:34:13 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] main: ez: add option to use git notes for prep and
 send commands
Message-ID: <20251103-outrageous-rainbow-sheep-e2b0b3@lemur>
References: <20251103-notes-v1-1-6c5a561e4ba6@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103-notes-v1-1-6c5a561e4ba6@gmail.com>

On Mon, Nov 03, 2025 at 12:46:59PM -0800, Daniel Zahka wrote:
> It can be useful to keep a per-patch changelog using git notes. Allow
> git notes to be added to commits during export from the b4 prep and
> send commands.

Hi:

This has come up multiple times:

https://lore.kernel.org/tools/20250130-rich-orangutan-from-eldorado-04f621@lemur/

The answer is still the same -- until git-filter-repo does the right thing
with git notes (as in, actually preserving them on rewrites), any solution
using git notes is too fragile to consider using.

-K

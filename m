Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A624284690
	for <tools@linux.kernel.org>; Tue, 27 Jan 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552790; cv=none; b=jf3o7DHII2QgShbTJzM1vnIlQgmeZOPXw3xX3ibsBPuOBtA6KOT5/GYSZn5BbrmFjsr0OOILrGPJls/n6fu+zSOOB1mkyd/fCUOYQCY4s5/nLYh8xqSC41qjRKLFfUyF5KROgaKAXIodYiRJmSohoHZPh+S8B2eq6DE/aDEWGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552790; c=relaxed/simple;
	bh=ZRJzJOE1BXuwUwjNsfUhT5xqbYe5HeeN+aSnEni3BGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZLlq+8NJLmm1d9VI1pwU+FM17ww4cY2/DaEn20G4RkO8TYP/ftayu/mYHbRhZAFcoNsF+cihIabe0ArPavbW81GKiRfBIywQ5cuZWZH8LbKUyOklvXkf/DBaY6UfIc1CobOBupWPVPE+KjkasBeXfO0G55X0c/6ksTpYuMoF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFbsO8iU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFbsO8iU"
Received: by smtp.kernel.org (Postfix)
	id 4B814C19425; Tue, 27 Jan 2026 22:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C30BC116C6;
	Tue, 27 Jan 2026 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552790;
	bh=ZRJzJOE1BXuwUwjNsfUhT5xqbYe5HeeN+aSnEni3BGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFbsO8iU0NS7wHavpnHtlTMuUU83CpnBXaInjUm6W5fHtE4yvNp/O0ERRBOdC2P8z
	 xFaXsHg4+gc8pWZZf28APFQOswq3k4AdX2GtOIsWtv7PNAEl9ESt0hyiP2c5RwFCKm
	 yYe/e056hiEsG4iU3t3BONDLRfrdBFZ8WP6AEe7ed4zHLAbWtcsuwxyQ1eI2uJZGze
	 +Eor1JOGxMSj7qHFmJ0JsRnCATnwYnRp4bdgAJIgOj2eUe/SVJgBiKP2jVJpZq/YiW
	 c+eVhpjvnY9bFZ3EYdEe09JT32BtCI8g8frcqCooz2mwANDLiGOCXUam506qkGPUjA
	 HrWUAQI7bV7Hg==
Date: Tue, 27 Jan 2026 17:26:26 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: tools@kernel.org
Subject: Re: korgalore delivering duplicates
Message-ID: <20260127-polite-literate-koala-4c8ccb@lemur>
References: <26435143-82c8-452b-a06c-e47de6772802@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26435143-82c8-452b-a06c-e47de6772802@app.fastmail.com>

On Tue, Jan 27, 2026 at 07:18:18PM +0100, Ard Biesheuvel wrote:
> - messages received directly that are also pulled by korgalore, potentially
>   multiple times if they were cross-posted to multiple mailing lists;
> - outgoing messages that are cc'ed to multiple mailing lists, which are then
>   looped back and delivered by korgalore in the same manner.

Okay, for JMAP and IMAP targets, korgalore now checks if a message with the
same Message-ID already exists in the target folder before attempting to
import it. This uses JMAP's Email/query with a header filter for JMAP targets,
and IMAP's SEARCH HEADER for IMAP targets. Gmail already deduplicates
automatically via its API, so no changes were needed there.

Not doing anything for Maildir targets for now, because I don't want to
iterate through potentially thousands of messages.

I've also added an X-Korgalore-Trace header to all delivered messages, e.g.:

    X-Korgalore-Trace: from feed=lei:myquery for delivery=fastmail
      by korgalore/0.5-dev; Mon, 27 Jan 2026 17:10:09 -0500

This should help you identify which messages came through korgalore and
from which feed, at least.

The changes are in the 0.5 master branch and need more testing, if you are
able to do that via the git repo directly.

Best wishes,
-K

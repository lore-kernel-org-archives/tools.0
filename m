Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF2623770A
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535782; cv=none; b=NyYgKTqubrkPs82TkhuukKhYv2R0eaO+UInBsycYKPkFxhAirwhvyYKGvQcEqDZ5cKqtTUsdx2pXHT7LsrtOdcYyue25q1H3soiwJBUlvmJ+eMi2ZAbSYQFE5eoNCvmVxLFwfCuUfhdBguUGX0OC2+lRtk+lDbzclzqxYOyJ/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535782; c=relaxed/simple;
	bh=lRm0Ni/r3M2AxTlMP8QotJyvpeEJccGwCPhtfbjfuAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH52ajTOKNxykL2+Z7JaIXq2qVyq+5ofrES4JW7I/QDRhDLcqZerEcGeoedhry/QxPvnPA572nar3ZmRSpE9Yfty7LATB97dL2B5+irLMwDo0kOxOqGw6ijWFro23vmF9v7IQRozgZGIbH8v8p4UMNG4Jl3npNllMHK9701WkUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rCE1SjW2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rCE1SjW2"
Received: by smtp.kernel.org (Postfix)
	id 0A86BC4CEFE; Wed, 15 Oct 2025 13:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49DCC4CEF8;
	Wed, 15 Oct 2025 13:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760535781;
	bh=lRm0Ni/r3M2AxTlMP8QotJyvpeEJccGwCPhtfbjfuAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCE1SjW2lOHLJQKY9ke/sdBNcpHvxJSStvDP3OA0jvHZ+o64R/PFEE8bU0JoHdS3+
	 tRBQYF15aOX/2eTHms8EkS4L2nY8HhzfFtjZtxCNYTnMyfQVVCyS125pp+KcDYu6Yv
	 wxObkMPernaaF8kjjpGMpQzY/Chk0KWlbyB7eYPc=
Date: Wed, 15 Oct 2025 09:43:00 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <20251015-screeching-porcelain-chupacabra-4d8c0a@lemur>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
 <yq1347kc3bu.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yq1347kc3bu.fsf@ca-mkp.ca.oracle.com>

On Tue, Oct 14, 2025 at 10:52:42PM -0400, Martin K. Petersen wrote:
> There is some funky stuff going on with the date range limit. b4 dig
> currently misses some messages for which the patch-id can be queried on
> lore:
> 
>     ecode, out = b4.git_run_command(
>         topdir, ['show', '--no-patch', '--format=%as %ae %s', commit],
>     )
> 
> The resulting %as cdate will be in the format "2025-10-07". However,
> specifying a query date limit of "rt:..2025-10-07" means the patch mail
> will be missed:
> 
>     Full query: patchid:3c67a3033590c511bc96819aa2fdc6376c2799e1 AND rt:..2025-10-07 (nocache=False)
>     Grabbing search results from lore.kernel.org
>     Nothing matching that query.
> 
> Whereas my own script finds it:
> 
>     $ check-lore 3c67a3033590c511bc96819aa2fdc6376c2799e1
>     Found 3c67a3033590c511bc96819aa2fdc6376c2799e1 on lore.kernel.org
> 
> Bumping the cdate to 2025-10-08 makes b4 dig find the message.
> 
> I don't know anything about Xapian and how it indexes. But I assume
> there might be some fun with time zones and DST lurking here...

Yes, this is probably what's going on. I tweaked the filtering to add 24 hours
to the author date just so we don't bump into timezone shenanigans.

-K

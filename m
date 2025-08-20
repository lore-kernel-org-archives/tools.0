Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EEC28489B
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724347; cv=none; b=eahQgL3KN7OkSLVPjGqeyN8+fV3VhHuiH+5upMI5N/PrSXBObgwMqtYpD1VsumG5O/i9YFeUkcnRtZ7+oTH7gJiNrVVnTajEh+uBEdjp1DAsD1OL6Kg7k054iSuraTq8uU1M6IcKP4jME4NiMkF9Yb3c/qG02t5YvLgxkflviWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724347; c=relaxed/simple;
	bh=cG69HnsuixgKN7wKgez+ORqjZmqqosOLXyNZ/bL7/Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOc/ohLQAZZcOX58Qv4opge9sLP+rQmCyh1uke6mGCiuOumC8+6btr/Q/opFZvdPTgRZ+pbcVJancYhcKVp8BbY8lVnZA0pk03Vh0h9d1bWrSG13FXElB1aXFhKPh7rjfPjoOoNUDY5Gr/iXKEFD1jCI3Fyz+D/iUpVjsLe/8OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EprCjFv7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EprCjFv7"
Received: by smtp.kernel.org (Postfix)
	id A6318C113D0; Wed, 20 Aug 2025 21:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7C6C4CEE7;
	Wed, 20 Aug 2025 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755724346;
	bh=cG69HnsuixgKN7wKgez+ORqjZmqqosOLXyNZ/bL7/Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EprCjFv7bU8jbK0vfvMbMjDCwe/bSaLa1hvmqokfm+s3XT6jjyjdkMWQspLOSbBJz
	 98lXyo5CVR1lsg2hyMZBES+usGiZfWSvOFjw4+aTUjrXqBdizQueGHdqi91Ky200u6
	 jkobGRHMXKManJlrvnw81Th6s5fvu4wI4LDU4vc0=
Date: Wed, 20 Aug 2025 17:12:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 0/3] prep: add --auto-list-unreviewed option
Message-ID: <20250820-congenial-groovy-collie-cce23d@lemur>
References: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>

On Wed, Aug 20, 2025 at 05:55:02PM +0300, Manos Pitsidianakis wrote:
> Imagine you have a >v1 series with over 50 or so patches, and only a few of
> them lack Reviewed-by: tags.
> 
> You want to help other reviewers in the list help you, so you manually
> point out which patches still lack reviews in your cover letter. This
> can be easily automated with the new b4 prep --auto-list-unreviewed option,
> which uses a new "auto-list-unreviewed" dict key in the tracking json in the
> cover letter commit.

This is is a neat idea, but I think this would be best left to a system like
patchwork. There are multiple benefits to doing this in patchwork instead:

- stays off the mailing list without generating more noise
- allows tracking trailers like Tested-by
- allows collaborating between multiple authors

I realize that not all projects run patchwork (or its derivatives like
patchew, etc), but it does have its undeniable benefits.

I do agree that we need better visibility into what's happening with a series
from the point of view of contributor, so maybe we can take this work in a
slightly different direction. I expect people would love to have a way to see:

- which series are being ignored (no comments or follow ups)
- which series have been merged (but this is tricky, because we don't have a
  standard trailer like "Merged-by" or "Accepted-by" that is sent post-fact
- which series received a NACK

I just don't think this necessarily needs to go into the cover letter.

What do you think?

-K

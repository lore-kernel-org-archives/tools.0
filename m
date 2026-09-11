Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318733203B4
	for <tools@linux.kernel.org>; Fri, 11 Sep 2026 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135524; cv=none; b=kaXlXQK8qYiRLqruQD0SDhRKxOywLRYO7TNtMTnj6q+z4FdN/9I6vihDjC5n/PiIoKEM+XQ3JZL/r6v06l1wzbKg87/YjE9cV9qnJ/x8wQ1T0+ybM5Cl/esRato4yeXi11NKNOX+p09k4kMgIO5UYquYgxOlXtAcdvv9VY03CoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135524; c=relaxed/simple;
	bh=61XsMMjG6p4rItNHInTo7QTfsJ3XNE3SnKJCRmssbps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAl9WGq6lj7hT51vxVI4Wnm2VgfZSUeaZSTJW9jVhleVo2WPaGHUA1QAkTpQrrkP15k0QtqCp3kQc4+mVmAZVeJ3QxhcSkH9r3zG/m9MtQUMA+8ICrlHQh55Mz53+Eqh0Bww/9RQTQL9X0Ncq4Kl7qqzROTItWBdf3tp8EUB/2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nM5Bsg/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nM5Bsg/p"
Received: by smtp.kernel.org (Postfix)
	id BAD891F00893; Fri, 11 Sep 2026 14:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7101F000FF;
	Fri, 11 Sep 2026 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789135522;
	bh=61XsMMjG6p4rItNHInTo7QTfsJ3XNE3SnKJCRmssbps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nM5Bsg/pmuQ3d3vACz9pYAasgSpPGtAhAI5M51qw2L51pcPR4C1ZSW742C9sRWBRu
	 dVF26pyooYETNIPLGQ/c5a8I7T0n9cU73mhUX5i+3m2TgTdvSU4W8OWew3uJKpsF0J
	 myEqJgW9ZNj1f+clVhz4otjKEM8H4/78EfzCth38=
Date: Fri, 11 Sep 2026 10:05:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4 PATCH 0/3] config: fix stale defaults left by the liblore
 migration
Message-ID: <20260911-woodoo-pink-barnacle-dbfe65@meerkat>
References: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>

On Fri, Sep 11, 2026 at 02:47:27PM +0200, Baptiste Le Duc wrote:
> Since db4cd69 ("Migrate lore access to liblore library"), search queries
> are built by liblore from the server address in b4.midmask, and nothing
> reads b4.searchmask any more. Setting it has no effect, and b4 prints no
> warning to say so.

Hmm... this is actually a regression. Let me take a look and see if this was
deliberate or just an oversight.

-K

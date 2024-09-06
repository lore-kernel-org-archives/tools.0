Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32175322A
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725640973; cv=none; b=h48lIhIhTrZk3qNHU1HQoYgebFIGFMPvgjRVrXOVtBv9ngYPKpGuBQ5qW/RjHFQjr4QUgaw2KU8XTYWzjN5jxmMmlhIPXIhvrbauq1UkpyT2pQVeupzwKSd+7Vc7Rq649W/M6tIjw+OOSu7D+5pZ5R1Quqn2KXtXhJ9tINxeXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725640973; c=relaxed/simple;
	bh=uDviWqu4VUYWq7ugNcYpONlDtljtuYMSZ/KnZsKE9T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feK1Ot5BTNi1oPpm6qtuKeken7eGYVWq6nduDBt9G6a3EpKJVfQOVNEbIrNh8AENapPYwD6E/Xp9EkyuwRTUOPQdqXZTMtPjXw+Z+MheryaxdMPbXo0+k9U6D3vSNDUBUd6wPXmlr8jtopW9aF2f7/H8lup7jJPadCAt4lRTNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q2GrZhU/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q2GrZhU/"
Received: by smtp.kernel.org (Postfix)
	id D89E9C4CEC7; Fri,  6 Sep 2024 16:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D53C4CEC4;
	Fri,  6 Sep 2024 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725640972;
	bh=uDviWqu4VUYWq7ugNcYpONlDtljtuYMSZ/KnZsKE9T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2GrZhU/Jucp3xzXpUMPHTc/EIbuHo/rbGReAob+pX1EOH/qhkK+BeW1AjTa2mZ2v
	 tCWqe+RKrFybe0Qpe7CHc1uPIomlUET6irHHcCT1garotGFfqPo9q0lHGaBBm21qPh
	 8tJ+FK7Zqa4dgXLOmxBi+D3LX871P4lPo8+ZYnXc=
Date: Fri, 6 Sep 2024 12:42:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: tools@kernel.org
Subject: Re: b4: prerequisite patch-ids generated in wrong order
Message-ID: <20240906-quizzical-mule-of-security-175bd7@lemur>
References: <7h4j7y32gk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7h4j7y32gk.fsf@baylibre.com>

On Mon, Aug 05, 2024 at 05:43:55PM GMT, Kevin Hilman wrote:
> Also, a dumb Q: why isn't the prerequisite message-id enough?  Why does
> it also try to generate all the prerequisite-patch-id fields?

This is because the only "official" mechanism of specifying prerequisites is
via prerequisite-patch-id trailers (see git-format-patch(1)).

I also expect this mechanism is much easier for CI systems, because looking up
a dependency via the patch-id is the simplest and quickest way to retrieve a
patch, which can then be safely cached locally without having to re-query lore
again.

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF01B85DB
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725660105; cv=none; b=gJdM+QQ8Mr+aD/nXMrx+i3iOss417srDaltb+Y19Iva5nfSjDm+sGquhfc4mMDGJPPu5g696sJu7v+utXJZ5Ydxdgc2c22a9QIB8QejRlcOvOBfZQAENo/ASlKVZQ58h73Z28K0yeRG1+IOws6UtBNYdJo/6tzx1wTXU8TEL+bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725660105; c=relaxed/simple;
	bh=erNHz1/C3tvvitBaN70mvoRsevZGqlihpzLBAxS/Fr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBvcCALUHF+V/3rTZmYCQoqWQYkUbWKmIao5xgbsCXPML6/TwfvAOXbYuwd0cnY+TkoYlj39o2FsPcVJ8iAQafS8N/ieSbWdhAbwpPSHu55RsEmuF4rKnveR4oZS6dJJpX9/qxsS9kI64i0O8pVN45WcJFhSeX3+aOQvkRdFJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ztEOyH5s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ztEOyH5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1FBC4CEC4;
	Fri,  6 Sep 2024 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725660105;
	bh=erNHz1/C3tvvitBaN70mvoRsevZGqlihpzLBAxS/Fr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ztEOyH5sC4nUcoKLV0NFheC3Sp2jl5cLRshG5hDR6TV0nU1glno7r3sYiCerVrwGU
	 vlBN7HzG+butgiQ/ZRGYSP+f/yQaDklKZq3+qogAMdVUTIKTgpyDcr5HD7AUvwwWGA
	 XsJoNFs8LzyYrzX+My4ySIxlYHUgI3dvvdzRa3Ek=
Date: Fri, 6 Sep 2024 18:01:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 send: pre-flight checks: add reminder for "b4 trailers"
Message-ID: <20240906-denim-cricket-of-honor-3e05e4@lemur>
References: <38790e98-d814-4b15-9c1d-0e8bfc5fc654@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38790e98-d814-4b15-9c1d-0e8bfc5fc654@kernel.org>

On Fri, Sep 06, 2024 at 11:50:32AM GMT, Matthieu Baerts wrote:
> It is great to have 'b4 send' warning us when we forgot to edit the
> cover-letter, add people in to/cc, and do some various checks.
> 
> Do you think 'b4 send' could also warn us when we need to execute 'b4
> trailers -u' when we send newer versions?

I've thought about it, but I'm not sure it would be as useful. As opposed to
all other pre-flight checks, this one is not something you need to do after
your tree changes. It's the kind of thing you probably want to run right
before sending the next revision, so we need to cache the check based on time,
not on the state of the tree.

> When I need to send new versions, I don't often have to do fetch
> code-review trailers, but then when I should, I tend to forget :)

Even if the submitter forgets to do it, the maintainer pulling in the series
will get these trailers anyway (assuming they use b4, of course).

So... I'll think about it. :)

bugbot assign to me

-K

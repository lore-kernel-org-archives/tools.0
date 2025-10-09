Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55CF28489A
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048098; cv=none; b=saalz5FQ+7wXfXjt7mRbbNW5FAsKZzGA1hRSjw4M7XagCjxOwEAOgTzrQ+JgiE37xd3POJbm3HpjMxrvbwV8A9IDIx8gvV52GKyPAQ/2hqLqDAsUW42I/ZbVsKdiZncNxu9cdbNaQVO9Dke6OxB6uEFt+QBKlYtAXg8qtE/aj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048098; c=relaxed/simple;
	bh=rV7SmdhMpE23XGm37x0Oymn6McJ+nbm/Nyq8RXbWHwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRTLqGZ0cY6OET3SSi0yylOHjIA2LcZSJqcJxum0zeFXIyWRGIYsB+CwVsCb6zlGLyuWTxihRaBSU9RPC3hNCvRlp+w1tOnxt1llvLln5fM5t+jfzTxhCq6vMFH9YtWSQvXaeH3ADmJaT4ySQGElebmbEgJfYlHu9Uuwlw7yvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i0adJPio; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i0adJPio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5B2C4CEF5;
	Thu,  9 Oct 2025 22:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760048098;
	bh=rV7SmdhMpE23XGm37x0Oymn6McJ+nbm/Nyq8RXbWHwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0adJPioAsCEtXSYfL6XXE1QgTWmFtDjOYL801lvyMgLfoZCD9KhfOvneD5/b72LC
	 UyDRP+QRYOKQraCQb7LLcNwg3EbkUe4tooJUr8NgLxe+Wngr8kNJDN9FpoorOVXmsl
	 esbEdPKfRxVhgskc0Ahm8scXYx+ECbIvPpFGh3dU=
Date: Thu, 9 Oct 2025 18:14:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Konstantin Ryabitsev via Bugspray Bot <bugbot@kernel.org>, 
	tools@linux.kernel.org, tools@kernel.org
Subject: Re: b4 shazam base-commit handling
Message-ID: <20251009-amorphous-origami-cricket-199fcb@lemur>
References: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
 <20250930-b219672c2-c7e4ae042365@bugzilla.kernel.org>
 <CAL_Jsq+Jxxyo=A9DtywQShk-LJ6x5QjwJ1D5+5-Y5CdYk--Ynw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Jxxyo=A9DtywQShk-LJ6x5QjwJ1D5+5-Y5CdYk--Ynw@mail.gmail.com>

On Thu, Oct 09, 2025 at 10:36:59AM -0500, Rob Herring wrote:
> > This is now fixed in 8c0f498752924b3d8ae9ee12bfdc2471c6e64515, but I forgot to tag this bug. I'll also backport it to stable-0.14.y.
> 
> This broke some of my scripts. That's due to my parsing of the b4
> output to get the base commit which changed. I can just fix it, but
> that's obviously fragile. So what's a better solution?

Would it help if we had something like `b4 am --show-info <msgid>` that would
just output details about the series in a column format, like:

    $ b4 am --show-info foo@bar.baz
    cover-subject: Apply something to something
    change-id: some-change-id
    base-commit: abcde...
    patches: 10
    author: Some Dev <somedev@example.com>

etc?

-K

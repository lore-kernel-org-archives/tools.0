Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8384928E16
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nvFtaaOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA931C433C8;
	Fri, 22 Dec 2023 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703268555;
	bh=xe/amY72nSkkJ1sbCkgSjelZVU7QCqAAa8PxCdYYroQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvFtaaOoaacIsLEdWB0+s5K9BE3r3iDI6Y4/mKcoemQIntMQAauJye4GGzLiYqFhj
	 rTwG/sMnDJAjJ4K1/T/gzDKu9m3N5WRYvULlYNDW4GmC/fLgYztbWGd4bxUc6WXtbH
	 9rBwVE4k1xI0WJfMhU29mg0e10UUwOcE4H3MaG4I=
Date: Fri, 22 Dec 2023 13:09:14 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paul Moore <paul@paul-moore.com>
Cc: tools@linux.kernel.org
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
Message-ID: <20231222-secret-thoughtful-zebu-fedba6@lemur>
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>

On Thu, Dec 21, 2023 at 05:55:25PM -0500, Paul Moore wrote:
> Hi Konstantin,
> 
> I didn't see a place to file issues on the patatt GH, and I'm not sure
> which mailing list was appropriate, if any, so I'm only sending this
> bug report to you; feel free to forward if appropriate.

Sounds good, cc'ing the tools list.

> I'm a little surprised to have run into this, as I believe there are
> other kernel devs using stacked-git, but perhaps I'm the only one
> using stacked-git in conjunction with patatt, who knows.  The good
> news is that things seem to work just fine when sending single
> patches, or patchsets with no cover letter, however as soon as I try
> to send a patchset with a cover letter, i.e. 'stg email send --compose
> ...', I run into an error caused by a missing 'from' header:
> 
>  % stg email send --to=listname  -a --compose
>  ...
>  error: `git send-email`: patatt: E:
>    The following required headers not present: from
> 
> ... which appears to be caused by the cover letter not starting with a
> "From <hash> <date>" line.

No, this means the actual From: header, like:

    From: Foo Bar <foo.bar@example.com>

We require two headers to be present, From: and Subject:, because they make an
integral part of the git commit. Signing a message without them doesn't make
sense, which is why we err out.

Can you verify that stgit creates cover letters without the From: header?

Best wishes,
-K

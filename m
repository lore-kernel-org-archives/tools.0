Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B9B27F732
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 21:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760043985; cv=none; b=aVhmkIgx1UHzR0n/LTiX6LBgTkRFoSlwPprx2yZe9xYfrlrCwwPsjC9gQtm4jH3T07iZUE2yWjUxbGNYzJzmZJtYs6WOfdDxwPg/CaDcFJJJjJIERICEQpJk1OK2KzOx/av5xIqR3lPPQ8au5ECa3V6mh8gTTq2ZA6kL24Q78hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760043985; c=relaxed/simple;
	bh=yb1hsTHb5Mx4Bmi85UJD7k95O6dTo8jbV1078+9qibU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAVEr0c62mYakqouUaQ4JWNoC+UEK6KrkK1uoU0YzEcc0uGfPiCcBjAeAvqFE9xTJ+3bK+Cbn8HZ0R8/s03KXr0a30c/umiPk18sRZaaWKKc4p/Ars5RmbQ7mp8ahle8ppAUEU27QLWCSrGS73AWr3Rn9IYF/pdH4qsh4dYKr0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2vWDuqtw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2vWDuqtw"
Received: by smtp.kernel.org (Postfix)
	id 0D1E6C4CEF8; Thu,  9 Oct 2025 21:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6ACC4CEE7;
	Thu,  9 Oct 2025 21:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760043985;
	bh=yb1hsTHb5Mx4Bmi85UJD7k95O6dTo8jbV1078+9qibU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2vWDuqtw6OzFEtTQkNQ3T2LBf/ggwNShONztfjUiOHmAjARIMnPWzd+hj7EXWk7iA
	 QLRMw6tXMg3FdWkqa6SY79hGhWaMXDCJ/mHfGveyiQG04CKW1RyLjzgl+IIMGNJ1M7
	 ZFRS6SGTdBdj1z5xzh1yguL6JoY3SnRccRc6WrMA=
Date: Thu, 9 Oct 2025 17:06:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH v4] b4: support send-email aliases
Message-ID: <20251009-voracious-calculating-gecko-adfe48@lemur>
References: <20251009-jk-email-alias-support-v4-1-16f458de996e@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251009-jk-email-alias-support-v4-1-16f458de996e@intel.com>

On Thu, Oct 09, 2025 at 01:19:13PM -0700, Jacob Keller wrote:
> - Use a dictionary for unqual_addrs to handle duplicates while preserving
>   order.

This seems hacky. :) I still like set, but perhaps we can do:

    unqual_addrs: Set[str] = set()
    ...
    if unqual_addrs:
        tocheck = list(unqual_addrs)
        ecode, out = git_run_command(gitdir,
                                     ['send-email', '--translate-aliases'],
                                     stdin='\n'.join(tocheck).encode())
        ...
            ...
            for alias, entry in zip(tocheck, translated_addrs):
                ...

This seems more pythonic and you're not continuously running .keys() on the
dict.

> +def replace_aliases(entry: Tuple[str, str]) -> Tuple[str, str]:

I would make it an underscore function inside the cleanup_email_addrs function
itself (yay python!).

    def cleanup_email_addrs(...):
        global ALIAS_INFO
        ...

        def _replace_aliases(...):
            # No need to global ALIAS_INFO, as it's still in scope
            if entry[1] in ALIAS_INFO:
                ...

        addresses = list(map(_replace_aliases, addresses))

This seems cleaner, as this function only makes sense within the context of
cleanup_email_addrs() and not in the larger b4 scope.

-K

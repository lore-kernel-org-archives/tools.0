Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020F38D
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 18:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760034263; cv=none; b=P2T8fifkTPg4fmcSYdFLYuVkswwm4DhgtGI8bPO5Z3zKptciz3KMd93EX7m2/+Ez3nLUlufSs76923aoaxrTB/YwLM+FbJ9D0wWFgAu4oUEyC9fezAOBAmgwpAlWiBJ/xsDHOXbPHdvqHdaSaLOFFT/rPhFXya0uWkPqMifPrXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760034263; c=relaxed/simple;
	bh=ENLFNr2uW+nhk+wHbKuy0Mf+su7e5Yslv0d69YrA5k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqvHj9ZSQ8QNtS7+197CWR+PQ97KfyIAlrFVOl9YeLDBqzotFQUIRTR9lkJ0rQI8Ncu3yzg+uFilRNct13cshG6L3tDqy5ScJN+q29RyeXFdyfdR3L3PS4Y9cWrWUnlZww48gVxOQN6iFgq2ibKMf3Z7w8hgT1gJxGFHd/4hmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ugEC5uSy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ugEC5uSy"
Received: by smtp.kernel.org (Postfix)
	id E11EBC4CEF9; Thu,  9 Oct 2025 18:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91A3C4CEE7;
	Thu,  9 Oct 2025 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760034262;
	bh=ENLFNr2uW+nhk+wHbKuy0Mf+su7e5Yslv0d69YrA5k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugEC5uSyrfS150G5BjXJhSogzIcWVywMJgnDUrg7PySmX6XV5T+DblDdRuxCfQlz9
	 HmQC1AOLNks3e+kAwuuqngid4VYwkM/Ks0YCNwfOyMb0YZ8jjQ0BgCVDALGMsNKbR5
	 7gcF0RbPjCXp+R9zx1iR/PGjit+W9K1BXc37Gn7A=
Date: Thu, 9 Oct 2025 14:24:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH v3] b4: support send-email aliases
Message-ID: <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>

On Thu, Oct 09, 2025 at 10:01:09AM -0700, Jacob Keller wrote:
> This implementation minimizes overhead by only requiring a single git
> send-email process, and by only translating addresses which are not yet
> fully qualified.

Great stuff, thank you for working on this! I have a few improvement
suggestions below.

> +    # Translate aliases if support is available
> +    if git_check_minimal_version("2.47"):
> +        logger.debug('translating aliases via git send-email')
> +
> +        qual_addrs = []
> +        unqual_addrs = []

We're trying to be type-clean, so these should be:

            unqual_addrs: Set[str] = set()

We don't need qual_addrs (see below) and we can use set() here that buys us
uniqueness by default.

> +
> +        # Assume aliases won't have '@' and are always unqualified
> +        for e in list(addresses):
> +            qual_addrs.append(e) if '@' in e[1] else unqual_addrs.append(e[1])

Two things here:

1. we don't need to wrap addresses inside another list(), because in this loop
   we're not modifying the addresses list itself. We only do it further on
   because in that loop we do modify the addresses list, so we have to make a
   copy of it first. So, what you want is just:

        for e in addresses:
            if e[1] not in MAILMAP_INFO and '@' not in e[1]:
                unqual_addrs.add(e[1])

   I'll explain the MAILMAP_INFO check a bit further down.

> +
> +        # Pass unqualified addresses to git send-email
> +        if len(unqual_addrs) > 0:

You can just rely on implicit booleanness of python and `if unqual_addrs:`
here.

> +            data = '\n'.join(unqual_addrs).encode('utf-8')
> +            args = ['send-email', '--translate-aliases']
> +            ecode, out = git_run_command(gitdir,
> +                                        ['send-email', '--translate-aliases'],
> +                                        stdin=data)
> +            if ecode == 0:
> +                translated_addrs = email.utils.getaddresses(out.strip().splitlines())
> +
> +                for alias, entry in zip(unqual_addrs, translated_addrs):

Clever use of zip()!

> +                    if alias != entry[1]:
> +                        logger.debug('translated alias %s to qualified address "%s"',
> +                                    alias, email.utils.formataddr(entry))

Let's not bother with formataddr in a debug call, because it will get called
every time even if we're not in debug mode. Just put entry[1] here, because we
really just care to know about the address, not the name.

> +
> +                addresses = qual_addrs + translated_addrs

Let's not do it this way. We have MAILMAP_INFO, which is a global mapping var
we're keeping around for the lifetime of b4 command run. It exists
specifically for replacing email addresses, so how about we do this whole
chunk as follows:

                        if alias != entry[1]:
                            logger.debug(...)
                            # Stick it into MAILMAP_INFO so we cache this lookup
                            MAILMAP_INFO[alias] = entry
                        else:
                            logger.debug('"%s" is not a known alias', alias)
                            # This saves us from having to look it up again
                            MAILMAP_INFO[alias] = None

This has the following benefits:

1. If the same alias is used in 20 patches, we're only looking it up once.
2. It'll be automatically used in the following block of code without needing
   to modify the addresses list here.


Cheers,
-K

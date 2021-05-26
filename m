Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7902FB3
	for <tools@linux.kernel.org>; Wed, 26 May 2021 19:56:45 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id o3so1592168qke.7
        for <tools@linux.kernel.org>; Wed, 26 May 2021 12:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DHbuLPQQvw0bevu74VA7SOSR2yjM4NDCg3ED1GQje4I=;
        b=B2B1sZMflOGCr2XbKqAAN7BfnHwwwbBzAFOCCDq3FYE00Dwk4JjvIWgzqZR4MQFgnB
         Ke/IN/2pRVsLPjyypKatKz+79vWSKC5xXfm6JIqNaYQqqpVM71kNwZSewnv7z3EjL0NW
         xHYLdnF/s4WnhUz8rh1AJUEk7nGBhz3z1NkME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DHbuLPQQvw0bevu74VA7SOSR2yjM4NDCg3ED1GQje4I=;
        b=K02k0flWmcvv1IZt7fHtdmTlqbVbC6uFzflKcZvxXvlb7ZrmsAJwM+PkwhwCJMXcXx
         p7CNQxA3RJG97DlvFfHOWrMPedTvvXbQu17iMfBGXmKFAippY6poOgfJYTFJao1ZLehK
         7u8UWv6wuwyCpmhnVzq7rf0Tb4hfqjJKnYBynIMmYxV2Tba+TnZNwvoHmTVxAW0eZ33B
         xdpfgAhFbYf0p0DLcvJVL9+BEoZzbfgpsVZ4z9tsW6acRUestoi3nBap9pLxB+I489Ug
         y/IP8b+W4m0uJddN09a0/za4UHcu6CkFf8du+mj3zcN/vrT+2Czw6SgbkTCZ31FqnhVC
         abqw==
X-Gm-Message-State: AOAM531d/HEs/XfvroGsHgPKus7CeP8CqfrIpcG+DsCO5KOH0x9+h29b
	JUODuwVcvCA6Kud8cxL4FUVMfA==
X-Google-Smtp-Source: ABdhPJwo0suahk4Xcl5R2uuB6PjZvCktZ5koEQByVZQzmYsY+kd3biK2XyTb9mw4BuqoGCgCF0LeEQ==
X-Received: by 2002:a05:620a:1339:: with SMTP id p25mr39885535qkj.297.1622059004634;
        Wed, 26 May 2021 12:56:44 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id g63sm2263392qkd.92.2021.05.26.12.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:56:44 -0700 (PDT)
Date: Wed, 26 May 2021 15:56:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.7.0 is available
Message-ID: <20210526195642.h4yzvykpopuckffz@nitro.local>
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
 <20210526194117.GF1096940@ziepe.ca>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210526194117.GF1096940@ziepe.ca>

On Wed, May 26, 2021 at 04:41:17PM -0300, Jason Gunthorpe wrote:
> > It is very easy to start signing patches with patatt, so I invite everyone to
> > test it out. If you are using git-send-email, you can automate the whole thing
> > to happen behind the scenes via the sendemail-validate hook:
> > https://pypi.org/project/patatt/#getting-started-as-contributor
> 
> Any thoughts about connecting this to the patchwork instances?
> 
> As I patchwork user I've been wondering if I should be switching to
> fetch patches to apply via b4 instead via patchworks - would
> appreciate some clarity :)

The main difficulties with making it part of patchwork proper is mostly due to
it breaking the end-to-end nature of attestation: if we change patchwork to
perform the attestation check on the backend, we're back to trusting
kernel.org infrastructure. That is specifically something we want to get away
with. :)

We already do use patchwork-style patch hashes in b4, so perhaps a better
approach would be to closer integrate b4 with patchwork -- if simply on the
level of:

- list outstanding series in a patchwork project and retrieve them from lore
- automatically recognize patches that got applied and set their remote state
  to "Accepted"

I think this alone will help closer integrate the two workflows and avoid
needing to perform the attestation check on inherently untrusted
infrastructure.

-K

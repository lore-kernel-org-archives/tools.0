Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA1B3FC9
	for <tools@linux.kernel.org>; Sat,  2 Oct 2021 00:15:19 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id h1so5203167pfv.12
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RkGjbmTsLALvEIXhHD8aAsa8ZmPd6mz99i95kVll+ZE=;
        b=n3orfRk2Bjsm1HlRgk1HX/uH3+e4FIk8cHn4R2Q36yeFaG3BNN+0TMgmiqqoj1wDd/
         7ZlPFB/9t2Yf3wdg9iE96tiB3zO/5sH+X4/FpowTcA6mN0PaBhVWrI0H/pSA4mSfYItp
         ODOLzNwoqn/yOuYcYcIZ6UQn9Jr0CIQvId93A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RkGjbmTsLALvEIXhHD8aAsa8ZmPd6mz99i95kVll+ZE=;
        b=BOZWRUh/k3nGGpY+4w/ivALxp42bJumSJK8JficpYZT1qDRjTcVNPPTrlz1NIoUq0l
         yucBPRa9e6T5g1QVX8QWghOen5OVyjfKIbQqp+caZ4jxIuJpyJTLDyADvZY18IjDNxlT
         8yovWLNA/IG0EF6CXkjrdF2PyjPE33lM74PwNbI46XEAf8PDxA+n51soo6STZAIUvjo1
         x8d9N6jLLkV32SXDbSmGnHQ2wYBmyhHUt/0WonfP3QNLL9SdUEisrVSk4GTX+VjfwJhz
         kVi55D3fz4ViwCj82O/bTuSVV8wIZVNG01tZvcgxhRGaVkxxxbqqNf5PwJorcxC52n6n
         wnAg==
X-Gm-Message-State: AOAM532NM+XT6rJjTEhJaz17Y2tclY8jUbNOnBZMo11Nzy8UJ8oc7yzV
	Cov2NA7me5ENXALy0ss815QXWg==
X-Google-Smtp-Source: ABdhPJxFmofX5PT53NL13aR5ZW2akdXu1c4XA9v9KZYS62wNJ9wF6Fhzb3QEhHOjqCXFftzgCRs6+Q==
X-Received: by 2002:aa7:8686:0:b0:44c:102:a57c with SMTP id d6-20020aa78686000000b0044c0102a57cmr9722388pfo.44.1633133719245;
        Fri, 01 Oct 2021 17:15:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y23sm624003pje.34.2021.10.01.17.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 17:15:18 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:15:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202110011712.E01892340C@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001092914.4738513b@canb.auug.org.au>
 <202109301630.C2646F8B5@keescook>
 <20211001115948.GK3544071@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001115948.GK3544071@ziepe.ca>

On Fri, Oct 01, 2021 at 08:59:48AM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 30, 2021 at 04:42:58PM -0700, Kees Cook wrote:
> 
> > The only "hole" I see with the integrity checking is that since only tags
> > or mbox headers are signed, and those aren't part of the merge, there
> > isn't a easy way that I see to follow the integrity chain for a given
> > resulting tree. (Which is technically different from the "trust" chain.)
> 
> The git tag and signature are part of the merge commit:
> 
> $ git show --show-signature v5.15-rc3-151-g78c56e53821a7e
> commit 78c56e53821a7ec3462ce448c1fe6a8d44358831
> merged tag 'for-linus'
> gpg: Signature made Wed 29 Sep 2021 09:57:42 PM ADT
> gpg:                using RSA key 7C1EC530B87EF10C4BFBA8B7386DF7157E209B1A
> gpg: Good signature from "Jason Gunthorpe <jgg@nvidia.com>" [ultimate]
> gpg:                 aka "Jason Gunthorpe <jgg@mellanox.com>" [ultimate]
> gpg:                 aka "Jason Gunthorpe <jgg@ziepe.ca>" [ultimate]
> gpg:                 aka "Jason Gunthorpe <jgunthorpe@obsidianresearch.com>" [ultimate]
> gpg:                 aka "Jason Gunthorpe <jgunthorpe@gmail.com>" [ultimate]
> gpg:                 aka "Jason Gunthorpe <jgg@kernel.org>" [ultimate]
> Merge: 02d5e016800d08 e671f0ecfece14
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Thu Sep 30 12:00:46 2021 -0700
> [..]
> 
> You can see the raw data like this:
> 
> $ git cat-file commit v5.15-rc3-151-g78c56e53821a7e

Ah-ha! It does! Thank you; I couldn't figure out how to find the tags
internally.

-- 
Kees Cook

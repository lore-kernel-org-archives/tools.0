Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06353FDF
	for <tools@linux.kernel.org>; Fri,  1 Oct 2021 17:19:45 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id a13so9635571qtw.10
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+NE24SuTZIjZYJIf5h4DouOOcA7yuUDArnQoxKeFvqQ=;
        b=A/rNlwmVzNWXKVqJ14CvFC88A5T4pPCzhzFPvhJuRyxaecIkSQnlf1wAbvtNKAi6WK
         dz0AovgMWBBCcjTF2Sh6DUfCMCnzE+XZEH1IrevTOL06DJB7OqS7aCcmNqq/QjAZflSV
         crGmR88Lx0nfPO6ecafb7qgh5VpWcMe/d0D7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+NE24SuTZIjZYJIf5h4DouOOcA7yuUDArnQoxKeFvqQ=;
        b=7XYVNxAmL4sJdSkTD7n65DJc7T0aSrBzlvs8B30+qgU+Y8e6pKItcjgYSi6xP9WNtG
         ZuIOKupfi3SfJnq1dPLyVYa7xi0JRGhpAQDuB000qopZWWIOalAsLJaNoiV7qZq+zzjb
         bGxdcmbJQFfph3o85dPUo7e75Nyl2Ln3AfhbHqhSXSSvauBy5F3d4gk4qSc5a9I8GhBc
         +DkNAXQn2pr9ZL62fsYeQVhxou+Crn0B5e0iYOqQSIyiEHJajxCB3OX6HhO6LK+nolTf
         AtSiqCVerm7JoeFSyi26ZgKgKhKePcxi/R/+uu4B8ZOpv1sxIe7TUUOIc44bQfjReM5J
         L6RA==
X-Gm-Message-State: AOAM5301Ea9GXZxpGerST9x3DHXUX4XXh8hDf/1jPtkIyXm/XLXmnTa4
	LYXxjXpLZtC0yxFzzcpruk8FfA==
X-Google-Smtp-Source: ABdhPJxTNNLmO9GP14cEnpfHjIc6H7hvsXuyUfh1g4d/FRn7PyWnkWHwg39vC8+MlH5pUYtDlYVcSw==
X-Received: by 2002:ac8:4052:: with SMTP id j18mr14335151qtl.77.1633108784676;
        Fri, 01 Oct 2021 10:19:44 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id h5sm3369747qke.1.2021.10.01.10.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:19:44 -0700 (PDT)
Date: Fri, 1 Oct 2021 13:19:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211001171942.oyq7qtly64tyqi72@nitro.local>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001092914.4738513b@canb.auug.org.au>
 <202109301630.C2646F8B5@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202109301630.C2646F8B5@keescook>

On Thu, Sep 30, 2021 at 04:42:58PM -0700, Kees Cook wrote:
> The only "hole" I see with the integrity checking is that since only tags
> or mbox headers are signed, and those aren't part of the merge, there
> isn't a easy way that I see to follow the integrity chain for a given
> resulting tree. (Which is technically different from the "trust" chain.)

This is unavoidable with the current workflow because commit messages will
necessarily get modified when S-o-b and other trailers get injected. I do not
think attempting the "commits must remain immutable" approach is worthwhile,
as I think there's more value in allowing maintainers to tweak the code they
receive.

> For example, for stuff going into my tree:
> - If it's from an mbox, I can easily check that the patches haven't changed
>   in flight when the author used b4/patatt to wrap the email delivery.
> - If it's from a remote tag, I can check the tag signature.
> This is all fine.
> 
> Now I publish my tree, and sign a tag for it for a pull request. Whoever
> does that pull can only check my tag and has to trust I checked what
> went into my tree.

I think there are two different attestation targets here. What I've been
working on is in-transit attestation, with the goal to make patches
tamper-evident. What you're describing sounds to me more like
cryptographically-backed signoffs. I think tools like sigstore [1] and
external attestation documents are actually better suited for this.

I don't want to wander too far down that path at the moment, but it's perhaps
something to consider in the future. With patatt in-header signatures, you
*can* perform attestation if each commit includes a Link: to the original
patch message (and that message is cryptographically attested).

[1] https://www.sigstore.dev/

-K

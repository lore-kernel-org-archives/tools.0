Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF13FCA
	for <tools@linux.kernel.org>; Sat,  2 Oct 2021 00:11:42 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 66so10415129pgc.9
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 17:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ASeGm5oSvEcNa3zkMt7/OeRnQqdUuoNi7/NQEZHVncs=;
        b=MQs15a7EbIksm+vM79g/EAsy9f4gBAq/0OzbiJOntE0+TGlYqPy4Jn8yx7Wkf0bXrc
         wmhFKa2tAuDjVDxgYllJmDtd+QpWZ8rOIxWK2Q+0HlIJea6kj4zF34BqlhuB8K1aLvRE
         wh52U1ZtDb+tCVUcE620u7ZH9rbOSA2KAYgTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ASeGm5oSvEcNa3zkMt7/OeRnQqdUuoNi7/NQEZHVncs=;
        b=4+aYn1b68CSVIt2YNZB7xedIHQpMqXiBIO9k4bOT06xworOaV9LXAlknKkwXBBSObN
         7+rJ+rqqN/fF+wMX2CB2l+fJSMK5RnE1PCtiK3cfEfQ8JGWnrsDNeyQr+vLIm8R3LxZU
         XkLQKZSTg0Fh+KTJAbxCHobQ9HeBGR236a4pupbo8PY3JI6LTwAe5mE/jWRbcreE6Slr
         uqBAec3zu62qSka2VPRxeK3NWdPf5/mEp35D/FGRpv2Z7M6lobpzVkuceTnRc6dU6DrL
         Eej3dE/btiwSKjGBMIRD1XNpn9fBqZdwx83qlKkznrMhX5y/EhGWQ/Nz0G/GezPdFjJz
         lvCw==
X-Gm-Message-State: AOAM533QG/SDo417/vqjYp3AKyW/1JkSNBnj0FyrwrF8+Zm8DUWDx4c/
	e4cZoWs7oZwsJTS6hjX2C03cAD8a8SglJw==
X-Google-Smtp-Source: ABdhPJyv/vllurZcO38qNE1hn9bIz0N76ss2wfKCMVruA1E4pkALkRwx/JjdiSbfaB4zMvBLe5TSUw==
X-Received: by 2002:a05:6a00:16d4:b0:44c:22c4:eb88 with SMTP id l20-20020a056a0016d400b0044c22c4eb88mr3206930pfc.75.1633133502012;
        Fri, 01 Oct 2021 17:11:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z8sm7150372pgc.53.2021.10.01.17.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 17:11:41 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:11:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202110011709.1E20209@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001182615.bcyuag7vfrkzhefj@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001182615.bcyuag7vfrkzhefj@meerkat.local>

On Fri, Oct 01, 2021 at 02:26:15PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Sep 30, 2021 at 04:09:13PM -0700, Kees Cook wrote:
> > I think so -- that seems to be sort of what Linus does? There seem to be
> > a few templates (tag, branch, and "patches from Andrew"), e.g.:
> > 
> > Merge tag 'char-misc-5.15-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> > Merge branch 'misc.namei' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
> > Merge branch 'akpm' (patches from Andrew)
> > 
> > Though I'd love to know why there's a distinction between "tag" and
> > "branch" here. Are "branch" pulls not checked for signatures?
> 
> That's just what git does when you merge FETCH_HEAD. It takes the contents of
> .git/FETCH_HEAD, which describe from where the last fetch happened. If you
> fetch a tag, it will say:
> 
>     [tipsha]\t\ttag 'tagname' of url://of/remote/tree
> 
> if you fetch a branch, it will be
> 
>     [tipsha]\t\tbranch 'branchanme' of url://of/remote/tree
> 
> When merging FETCH_HEAD, git will just say "Merge %s" with the contents of
> .git/FETCH_HEAD file for that tip.
> 
> When you merge a local branch instead of FETCH_HEAD, it will default to:
> 
>     Merge branch 'localbranchname'

Gotcha. I remain curious about the process of between the pull (which
puts it into FETCH_HEAD) and the merge (with merges FETCH_HEAD into the
current branch), when I would expect there to be an intermediate step of
checking FETCH_HEAD out into a branch for review, build, test, etc.

But, I guess, nothing would actually move FETCH_HEAD in that case, so
that's why it shows up that way.

-- 
Kees Cook

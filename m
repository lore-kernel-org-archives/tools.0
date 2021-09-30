Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF2168
	for <tools@linux.kernel.org>; Thu, 30 Sep 2021 23:09:16 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 145so6304205pfz.11
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 16:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZKMtB8lax55CjVXH96lWx1sPPhhh9uHH03IPL00t0yI=;
        b=CEh1EjnwX0gZe+OmJCdNqaX7fXtHrO4E9ThnmgYJfnQUro58ZabNUpBFTU/x3u1BeC
         dfpimia5gbqwKFG4sulL8lPFALPIMJvn/GbRPBvzXc3jBDwIYxKMPSw14lBNJGwEiWTG
         10UF32gPE5PPqpC/+1bjblyO75qZwbV9Kp+eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZKMtB8lax55CjVXH96lWx1sPPhhh9uHH03IPL00t0yI=;
        b=sLSoVgXP0X1DEku5hgzqYXB1+KYXC6+01uzlb0ludis4XYBYgd5MjxtBO6XX4PsnBx
         Elef9o3cQAejokmnjDFP00saed1h5Ba6bbd23DipO08y3I4VwtOrQFvACDJ5bGr2WMLB
         WfpZM8c+89SgA+VvCSQwjEI+kwQFKVZeFh+6z9+g7nyE1TB8t8TKtZJD+ml3lkaRcl+t
         Pj5MTJlTx5QvZs4vbovQ6v6oXL5BUIJs1fTqlD7O5QFFXr5ORC561mOX8U3+6kk6534J
         t/tD1d/HxyP7eCwSDoUQlKbC2j3wPXSf7i0hAoUA1gZZmsSyihGF8S+cKxio3E/jQF8c
         B0cQ==
X-Gm-Message-State: AOAM5334efLAgsBC1KR1+107Y7YkJ4IU4nNycmpP9N03ULgXhTs011GT
	zP+de2xWGIB/Cz43WD0MVsnOgDbKBHDjqA==
X-Google-Smtp-Source: ABdhPJy6BFJtKefB5+uqShGTmCa8zKPA7qifqVwuLnPmOvFwgohkN6owQdRN5Sz1KWlaUohArhzzZQ==
X-Received: by 2002:a62:7a8e:0:b0:447:df71:48b2 with SMTP id v136-20020a627a8e000000b00447df7148b2mr6699059pfc.22.1633043355183;
        Thu, 30 Sep 2021 16:09:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g2sm3998118pfh.188.2021.09.30.16.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 16:09:14 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:09:13 -0700
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202109301559.A9BFB03@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930200002.67vxbowvegso2zhg@meerkat.local>

On Thu, Sep 30, 2021 at 04:00:02PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Sep 30, 2021 at 10:33:56AM -0700, Kees Cook wrote:
> > Hi!
> > 
> > I'm just realized that all my workflows have been entirely mbox patch
> > sets, and I finally have a pull request to take, and ... I have no idea
> > how to do it "right". :P
> > 
> > I see "b4 pr", but I was hoping for some kind of three-step process:
> > 1) get the code
> > 2) read/verify/test code
> > 3) merge code into main brain
> 
> Glad you're still around and doing well, professor Nightingale. ;)

3 weeks of virtual conferences is wrecking my branch.

> I'm going to cc this to users@, since it's likely to reach more
> maintainers' eyes (and brains) there.

Good idea; thanks!

> > And that it would end up looking like what I see from Linus (i.e. naming
> > branching after the tags sent, etc):
> > 
> > 6e439bbd436e Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
> > a4e6f95a891a Merge tag 'pinctrl-v5.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> > 62da74a73570 Merge tag 'vfio-v5.15-rc4' of git://github.com/awilliam/linux-vfio
> > e7bd807e8c9e Merge tag 'm68k-for-v5.15-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
> > dca50f08a03e Merge tag 'nios2_fixes_for_v5.15_part1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux
> > 
> > It seems like "b4 pr" does part of step 1, but doesn't build a branch
> > from the tag (though one can use "-b").
> > 
> > And for step 3, when I do a "git merge --no-ff $branch", all the tag and
> > origin (e.g. "tag 'pinctrl-v5.15-2' of git://..." is missing).
> 
> It shouldn't be if you leave it in FETCH_HEAD, which is what b4 does by
> default. So, if you do "b4 pr" and then follow it by "git merge", it should
> retain the pull request origin and make it the default subject there.

I guess it depends on the expected order of operations. What do other
maintainers do to process a PR? I would think it would be:

- pull remote branch (to FETCH_HEAD)
- review (in FETCH_HEAD? in a "real" branch?)
- merge into my topic branch (where the commit subject should retain details
  of the pull location, body has notes from the signed tag, etc...)
- review, build, and test
- push to public tree

> I just added some merge message template processing for "b4 shazam", so we can
> probably do the same for "b4 pr" if that makes sense. Should b4 grab the
> contents of the pull request and pre-stuff them into a file you can pass to
> git-merge?

I think so -- that seems to be sort of what Linus does? There seem to be
a few templates (tag, branch, and "patches from Andrew"), e.g.:

Merge tag 'char-misc-5.15-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
Merge branch 'misc.namei' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
Merge branch 'akpm' (patches from Andrew)

Though I'd love to know why there's a distinction between "tag" and
"branch" here. Are "branch" pulls not checked for signatures?

-- 
Kees Cook

Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE073FD5
	for <tools@linux.kernel.org>; Thu, 30 Sep 2021 23:29:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id e7so7773596pgk.2
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lEuL9qbYsMmeUxKrpzYQjMGkfWBk8bizhN1iBtGICco=;
        b=GRXaNOviOnVfXkUHgOkiVrhTiW2LezVRyhcgV1uNBu+2o6fECglJbYKWXwr4SH/838
         173ONz4HAD1tUHlfK9N9JdAkcnH7QBXJN25kvvkxGNkmlsRGqMANRX0k9dhHSanN+2/T
         obgzAS1lT0rAkgkVfljGrk6/rRKETCvui93G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lEuL9qbYsMmeUxKrpzYQjMGkfWBk8bizhN1iBtGICco=;
        b=umJUm1N57SuKbS/L5iKN4ibCd3sORxp2owG/QylDlvY75Pq43eOphuyihC8UsLSZaL
         /DIvRt6RSny0XBC+x4s7RMLEPz+cBkt5Dh3BJDU5NCH3wUkRueuROSJ++HzYb4R92heF
         FfF9iUPzAmDskbjZAxzgKMH/AJd7fC9oMy8keGRHUmZT17w1X1bzqva3SwkJt+lGntN7
         KbMDQJvvkKBXBxThJKU/ACpQWkZXt4cOhof2bG+Lcg+RZWNNf6tG5PEEIpMBanIgmZpl
         PRNspyZ7Fk7ZlRGk1+Z9XvVDsBG7A37Ey8M0mZi2+e8abPEzxfmf+1tp/alBgTwXjtIe
         zPUQ==
X-Gm-Message-State: AOAM533cbc882/HiOp2WpHiKsmSHzA9oZfuOTXHC1/9xz21FnOxKpxQN
	KZ0celGeZTH4/RMMDw4JuXEkM3XQGXhDNQ==
X-Google-Smtp-Source: ABdhPJwVj/xvyOdElCaLrx9dn7WqXd3RKGIVj/T2rd16R1ay9Fyk5NhBY12OmVkB7H2CFQdNKiXpnw==
X-Received: by 2002:a65:55cb:: with SMTP id k11mr7177125pgs.100.1633044575430;
        Thu, 30 Sep 2021 16:29:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n26sm4255934pfo.19.2021.09.30.16.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 16:29:34 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:29:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202109301625.34D0D489B1@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001092231.6fefb6c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001092231.6fefb6c7@canb.auug.org.au>

On Fri, Oct 01, 2021 at 09:22:31AM +1000, Stephen Rothwell wrote:
> Hi Kees,
> 
> On Thu, 30 Sep 2021 16:09:13 -0700 Kees Cook <keescook@chromium.org> wrote:
> >
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
> I assume it depends on what Linus is asked to pull/merge.  i.e. if the
> pull request refers to a tag then Linus will just merge that tag.  Some
> people just ask Linus to merge a branch from their tree.  In Andrew's
> case, he sends patch series which Linus would import into a local
> branch ("akpm") and then merge that.

Right, I assume for akpm's it's a local branch populated by an mbox,
etc. For the others, I guess it's just a retention of details? i.e. while
a tag points to a branch, it's name usually contains more information.

> The messages seem to mostly be the default git message for a merge
> (sometimes maybe editted a bit).

I couldn't get git to put anything like "git://" in the default subject;
it looks like "git merge" always works against a local tag/branch.

> For linux-next, I fetch all the branches into remotes in my tree and
> then merge them later.  I have recently changed my merges to include the
> source tree and branch in the merge message (previously, all you saws
> was the local name of the remote branch).

Yeah, this is what I was thinking -- a maintainer would have some kind
of mapping of remote tag/branch to local branch, and then do the reviews
and merges from those.

-- 
Kees Cook

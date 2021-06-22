Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471C71
	for <tools@linux.kernel.org>; Tue, 22 Jun 2021 14:23:27 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id g19so6414351qvx.12
        for <tools@linux.kernel.org>; Tue, 22 Jun 2021 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=btoww6t5C6qCLwrNm/OANlh9jadHnyBpvadRrNeZ2qg=;
        b=fK52ejpsNC0Bkog17UBo4hp+m4ZbxLw1jm+5jvQhUuM6de5yRawnP+S1Uloao+/5YF
         gEY2NesvKhOIDZLgeQtqo01l3oHe8df8c/YNIgVdEIg6NMzqWx8CTs9xzahC3SFsw0au
         hKGECpO+d99yDA/j/aRMnWeKYoLDkGz1w1Hdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=btoww6t5C6qCLwrNm/OANlh9jadHnyBpvadRrNeZ2qg=;
        b=rmBFy5QdCK025LePOzx3X0yW+arBxqfUfvbvSCmybxB3YHFZlS3BRbQKzUSAKNEWnE
         MLCcfYia9pDJGqoATrEvewnc8UdTZnbl96FVyZvDkErlK3wiJDWZdZFbdPOjJCX++o+d
         2WiySvtE+H8VjwsEImvBTukTqolmv7aid497tW9GF2BcaulBnHpcHtuH3FNM1mVBx5JB
         dqqC8JyGNDZR2cnTIkJcxdnrWfoPLFjqVUlO8ITRH3Z7krfftEGHTccTrmdwtRo70I4W
         R2kQ6r7JQP7JQ4KgDrlURiljIu82f5X1aheRY3yOQYWu4WNVnPw4IqLiANyiw9OEmDId
         XeuQ==
X-Gm-Message-State: AOAM533PYNili5v7T6Lmv0tKAOw0qlice3FBG/T/giPkmLRqhki5GKVH
	3+DkuuaXP9VAKDhZMUNd3Cp74Q==
X-Google-Smtp-Source: ABdhPJynWB93X6J1vptRKIhZQIA5AhqI8BcL5zEPu0mQc2o/M/tKWa6tcDUnQcoMZPVuQQCkf7COIA==
X-Received: by 2002:a0c:ff25:: with SMTP id x5mr26039674qvt.39.1624371806030;
        Tue, 22 Jun 2021 07:23:26 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q199sm12869907qka.112.2021.06.22.07.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 07:23:25 -0700 (PDT)
Date: Tue, 22 Jun 2021 10:23:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 2/2] am: Allow specifying a base to check applying series
Message-ID: <20210622142324.kotqghzxxro736fl@nitro.local>
References: <20210618182452.2577871-1-robh@kernel.org>
 <20210618182452.2577871-2-robh@kernel.org>
 <20210621200325.zgz4eibneuchus5d@nitro.local>
 <CAL_JsqKntMMa7PjkxJQjK+YTykEtLbpMc=Hj+YhHCbMGguQ+EA@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqKntMMa7PjkxJQjK+YTykEtLbpMc=Hj+YhHCbMGguQ+EA@mail.gmail.com>

On Mon, Jun 21, 2021 at 05:07:34PM -0600, Rob Herring wrote:
> > I just pushed a reimplementation of --guess-base into master -- can you see if
> > it does closer to something that you want?
> 
> Yeah, it works. It's a bit confusing that the result is 'Base: current
> tree' when it's not HEAD.

I've added some refinements that will hopefully improve both the matching
algorithm and the output when using -b.

> The more I think about it, the more I think '-b' needs to be a list of
> refs or should be a separate sub-command and the user can iterate thru
> branches themselves. It would work as-is, but it's kind of pointless
> to repeatedly go thru all the 'b4 am' steps each time. A separate
> sub-command would keep with the unix way of commands that do 1 thing.

By default, we'll use --all when matching blob indexes, but if -b is
specified, we'll pass it as-is to --branches, which is actually a pattern (see
"man git-log").

> I don't know that the guessing algorithm is any better now. When I ran
> it with my current tree being something a series doesn't apply to, it
> gave me some pretty arbitrary ref: v5.13-rc1-69-gcfe34bb7a770 (which I
> think happens to be the base I just did a rebase on)

I believe I've improved it in the latest commit.

NB: I think it's important to recognize that "all blob indexes matched" is not
a guarantee that the base we find is actually accurate or useful, at least not
for the purposes of CI -- a patch may be dependent on another set of changes
that modify totally different blobs than in the patch we're looking at.

E.g.: imagine that you are looking at a patch that changes files lib/foo.c and
lib/bar.c, but these changes are dependent on lib/baz.c. If you apply a patch
that modifies lib/baz.c, then the indexes for foo.c and bar.c would still
match the current tree, but the correct base-commit would actually be *before*
the baz.c modification.

We already try to handle this situation by not considering changes applied
after the patch was submitted (we force --until to be the date of the patch),
but providing an actual base-commit info in the patch/series is always going
to be more precise and reliable.

-K

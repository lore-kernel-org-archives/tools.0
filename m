Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02C33CC;
	Mon, 18 Jul 2022 17:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D91C341C0;
	Mon, 18 Jul 2022 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658164513;
	bh=73feTqj11LSDAfKYDkg9YFW6xzdRvUEIVZDpKDNXF5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X+9LyCv3kNU7y49g99u/LYxZtpK8z5v83Aa4LgXHeK5no8W5PsBmjeGa6q5KkuQsw
	 jdbAzvEni6s+MQyLKUcp4jKxe3YdFbCfRQMhhqUcvXQIz27NHdPNwEkyTZwPC2TDrC
	 tOCsWLTMYfWINSiyulkafOzgJZqkFSLVS9xmXR6vsplzLaOBqXNxsbZ7D3/PwszPSF
	 QFupXas/fYb4NdqIjE3Q2UD+BqrNRDtVv1/lelQt06YvxkhJ8uuNagyxPh+TfODItT
	 fmdJ1uZYUPoF/TmK98xtm1YbKQ6akYry9SdLIglrKeJ8eyih8vL9uTiJ5Skl9/yxEh
	 4fXOIC4E45D7Q==
Received: by mail-vs1-f41.google.com with SMTP id 185so1388652vsi.2;
        Mon, 18 Jul 2022 10:15:13 -0700 (PDT)
X-Gm-Message-State: AJIora9Lew1VVMVUJXR0l5BLiMdUskS5MSYhSqs68z1NSgknpQiQDsy9
	u2zfjYC1tE4ps1WNkqOR7NjLSPHWmIL2dNeCEA==
X-Google-Smtp-Source: AGRyM1s3GDtyyCYPkVwn54lettHMN15yQpizDk/zWw29iIdUAtIo+3PzYXbZHDZf1t79AaOIEx8x4TM8ukQ2jkqDf1c=
X-Received: by 2002:a67:c082:0:b0:356:eccb:f5c9 with SMTP id
 x2-20020a67c082000000b00356eccbf5c9mr8889585vsi.85.1658164512751; Mon, 18 Jul
 2022 10:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
In-Reply-To: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Jul 2022 11:15:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKSU6RkynTPyqM9uqdccjRxT1WmVYq4CWLvq0+_TXN+yA@mail.gmail.com>
Message-ID: <CAL_JsqKSU6RkynTPyqM9uqdccjRxT1WmVYq4CWLvq0+_TXN+yA@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 16, 2022 at 8:30 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello, all:
>
> I've committed the initial b4-submit features to the master branch, and I
> need some volunteers to test it. If you routinely send patches to the Linux
> kernel mailing lists, then I hope that volunteer is you. :)
>
> ## What it does
>
> The goal behind "b4 submit" is simplifying the submitter's workflow by
> automating away a lot of menial tasks, such as creating cover letters,
> collecting trailers, rerolling new revisions, remembering all the flags to
> git-format-patch and git-send-email, etc. The main workflow can be described
> like this:
>
> 1. b4 submit --new my-new-feature [-f v5.19-rc6]
>
> This will create a new branch called "b4/my-new-feature". If -f is not
> specified, the branch will be created from the current HEAD (but this is
> rarely what you want, so you'll want to pick a tag to work from).

It would be nice if an existing branch could be used. Either as an
enroll this branch as-is with b4 submit or create a new branch based
on the existing branch. Often, I start working on something for a
while, and then start thinking about submitting, how to split patches,
and a cover letter some time later. I guess that would involve
rebasing the branch with the empty commit approach (which the branch
description approach would not need).


> After the branch is created, b4 will create an empty commit that will serve to
> store the cover letter contents and some tracking information. You can view
> the raw commit with "git log" just like any other commit, and you can even
> edit it with "git rebase" but it's not recommended. It's much better to use
> "b4 submit --edit-cover".
>
> 2. b4 submit --edit-cover
>
> This allows you to work on the cover letter using $EDITOR or core.editor
> as defined in git-config. Once the editing is complete, the empty commit will
> be updated and the entire branch rebased using git-filter-repo.
>
> 3. use regular git operations for the rest of your work
>
> You can apply, rebase, edit, squash, etc -- just avoid touching the cover
> letter commit. You can also push the b4/my-new-feature branch to any remote
> and pull it from anywhere else if you want to switch computers.
>
> 4. b4 submit --send
>
> When you are ready to send off your series, you can review the resulting
> patches by running:
>
>   b4 submit --send --dry-run
>
> or
>
>   b4 submit --send -o /tmp/somedir
>
> The first will print out the patches to send on stdout, exactly as they would
> be fed to the SMTP server, and the second will output the patches into the
> specified directory a-la git-format-patch -- useful for running "checkpatch"
> or any other checks, as necessary.
>
> When you are satisfied that the patches are looking sane, you can fire off the
> actual --send command.
>
> NOTE: when we find a scripts/get_maintainer.pl in the repo toplevel, we will
> automatically run the most-recommended (that I could find) combination of
> flags to automatically populate the To: and Cc: list in addition to whatever
> we get out of the cover letter and commit trailers. You can turn this off with
> --no-auto-to-cc.
>
> NOTE: at this time, a working SMTP server and a valid [sendemail] section are
> required for sending patches. The web submission endpoint work is not yet
> completed.
>
> 5. b4 submit --reroll
>
> After you send your series and when you're ready to start working on a new
> revision, you'll want to --reroll to increment your tracked version. This will
> automatically update the cover letter commit to add a "Changes in v[N]"
> section that will also contain a link to the v[N-1] series, creating a
> historical breadcrumb of revisions.

As you are rebasing anyways, an option for a new base would be useful here.

>
> 6. b4 submit --update-trailers [--signoff]
>
> As you receive feedback on your patches, you can retrieve any received
> trailers from lore.kernel.org and apply them directly to your branch. This is
> accomplished by retrieving any threads matching the unique "change-id"
> submitted as part of the cover letter.
>
> One thing to keep in mind here is that actual trailer matching is done by
> comparing the patch-id (see git-patch-id for details). This has the following
> important bonuses and caveats:
>
>   - You can rearrange patches or modify summaries without it affecting the
>     match.
>   - If you modify actual code (even as much as fixing a typo in a string), any
>     received trailers will no longer match. This is as designed, because if
>     you change the code, it's no longer reviewed (but we won't remove any
>     existing trailers that were already applied).

A Reviewed-by would typically stand for something like a typo fix.
Often minor changes are pointed out by the reviewer and a Reviewed-by
is given assuming those are fixed. At a minimum, I think we want an
override option on this perhaps with warnings or confirmation prompt.

Knowing what to do here is a common issue for new submitters. Both
just knowing that they need to run update-trailers and when to keep or
drop them. It's common enough that I run checks for not adding tags.

>   - when you use --signoff, this will move your own "Signed-off-by" trailer
>     below any other trailers in all series commits, which is commonly
>     recommended for the chain-of-custody purposes.

I would think that is more commonly desired than not, so I think that
should be the default.

>
> 7. b4 submit --send
>
> GOTO 4.

It seems like you are mixing sub-commands and options. Wouldn't 'b4
submit new|reroll|send|update-trailers ..." or a new executable/link
for 'b4 submit' be better? This is fairly disjoint from the maintainer
side of b4 functions.

Rob

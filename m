Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D07A
	for <tools@linux.kernel.org>; Sat, 16 Jul 2022 14:29:58 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id m10so1727562qvu.4
        for <tools@linux.kernel.org>; Sat, 16 Jul 2022 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=P/VdNp4hEqnU1+pOX4WT9AeG5r0NKHfub0DGmx2Nu6w=;
        b=TzvODleLZPr3pklzTxjnOMED6+LIuBOfpH5Ow3ImGktE4+sx6NQftL7qZ2mQUn0HOc
         oAZEGq066Rse+oS7OWdYKYHrYJjwOd1ayzWNZMMVTglQnFTqQlCr02lX1kbUdJGoX3Zy
         vR4weJ4ISAm1LfoHfrYvXXQF3yvaLJmP9qBLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=P/VdNp4hEqnU1+pOX4WT9AeG5r0NKHfub0DGmx2Nu6w=;
        b=bPxF67ewldYQHnU1LuITsSDycqUqXXmx85S6uLCqJ2v3vusbdNmdaGRGDrqAMeDBp5
         OkgehO+wabuA/zD+rafgkfuZG+8SqVq9cr5xpT8+CcSchStc7irLDCZC4J5gbj/yoKIy
         cxUgFnoUn/y3YpGpL70b9p+F/fmiToaICvuweCEC1P/rtqIayDwfhlL+rYhqryrug9EJ
         Qet1815oMDP4gTgMlT0QyflJQzjGtR8ncdknS5ocSVw2tXiPUhN/fiIZNEqgz+QCYy2Z
         ka0eWgkNQbHd82h+O/URnYz6ajLPCZI/VMjeOoTO6xC6XZn6xo2/GP8P3//7cG7LhEW2
         wXwA==
X-Gm-Message-State: AJIora9W9qW1JfLUl6FxhKxB9YjqDlvGPeEko5fQaOttnkHX2iRzmgSp
	FTqvE3fUGng0VcGVm8PrLG7LWg==
X-Google-Smtp-Source: AGRyM1v5DBvyLvSmSJfx+fZQHX9oi5THMBacS6tqPJrN6OqySFuFwUGgC87lYBf4raa40NH+3xOPLQ==
X-Received: by 2002:ad4:5be6:0:b0:473:9831:541a with SMTP id k6-20020ad45be6000000b004739831541amr13854685qvc.118.1657981796969;
        Sat, 16 Jul 2022 07:29:56 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id w18-20020a05620a445200b006a37c908d33sm7116927qkp.28.2022.07.16.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 07:29:56 -0700 (PDT)
Date: Sat, 16 Jul 2022 10:29:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 submit ready for beta testing
Message-ID: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

I've committed the initial b4-submit features to the master branch, and I
need some volunteers to test it. If you routinely send patches to the Linux
kernel mailing lists, then I hope that volunteer is you. :)

## What it does

The goal behind "b4 submit" is simplifying the submitter's workflow by
automating away a lot of menial tasks, such as creating cover letters,
collecting trailers, rerolling new revisions, remembering all the flags to
git-format-patch and git-send-email, etc. The main workflow can be described
like this:

1. b4 submit --new my-new-feature [-f v5.19-rc6]

This will create a new branch called "b4/my-new-feature". If -f is not
specified, the branch will be created from the current HEAD (but this is
rarely what you want, so you'll want to pick a tag to work from).

After the branch is created, b4 will create an empty commit that will serve to
store the cover letter contents and some tracking information. You can view
the raw commit with "git log" just like any other commit, and you can even
edit it with "git rebase" but it's not recommended. It's much better to use
"b4 submit --edit-cover".

2. b4 submit --edit-cover

This allows you to work on the cover letter using $EDITOR or core.editor
as defined in git-config. Once the editing is complete, the empty commit will
be updated and the entire branch rebased using git-filter-repo.

3. use regular git operations for the rest of your work

You can apply, rebase, edit, squash, etc -- just avoid touching the cover
letter commit. You can also push the b4/my-new-feature branch to any remote
and pull it from anywhere else if you want to switch computers.

4. b4 submit --send

When you are ready to send off your series, you can review the resulting
patches by running:

  b4 submit --send --dry-run

or

  b4 submit --send -o /tmp/somedir

The first will print out the patches to send on stdout, exactly as they would
be fed to the SMTP server, and the second will output the patches into the
specified directory a-la git-format-patch -- useful for running "checkpatch"
or any other checks, as necessary.

When you are satisfied that the patches are looking sane, you can fire off the
actual --send command.

NOTE: when we find a scripts/get_maintainer.pl in the repo toplevel, we will
automatically run the most-recommended (that I could find) combination of
flags to automatically populate the To: and Cc: list in addition to whatever
we get out of the cover letter and commit trailers. You can turn this off with
--no-auto-to-cc.

NOTE: at this time, a working SMTP server and a valid [sendemail] section are
required for sending patches. The web submission endpoint work is not yet
completed.

5. b4 submit --reroll

After you send your series and when you're ready to start working on a new
revision, you'll want to --reroll to increment your tracked version. This will
automatically update the cover letter commit to add a "Changes in v[N]"
section that will also contain a link to the v[N-1] series, creating a
historical breadcrumb of revisions.

6. b4 submit --update-trailers [--signoff]

As you receive feedback on your patches, you can retrieve any received
trailers from lore.kernel.org and apply them directly to your branch. This is
accomplished by retrieving any threads matching the unique "change-id"
submitted as part of the cover letter.

One thing to keep in mind here is that actual trailer matching is done by
comparing the patch-id (see git-patch-id for details). This has the following
important bonuses and caveats:

  - You can rearrange patches or modify summaries without it affecting the
    match.
  - If you modify actual code (even as much as fixing a typo in a string), any
    received trailers will no longer match. This is as designed, because if
    you change the code, it's no longer reviewed (but we won't remove any
    existing trailers that were already applied).
  - when you use --signoff, this will move your own "Signed-off-by" trailer
    below any other trailers in all series commits, which is commonly
    recommended for the chain-of-custody purposes.

7. b4 submit --send

GOTO 4.

In addition to the above, please see "b4 submit --help" for other flags you
can use with these operations.

### Editing the cover letter commit manually

If you ever need to edit the cover letter commit manually (e.g. to fix
something about the tracking section json), you can use regular "git rebase
-i" with the "reword" action. When rebase bails complaining about the empty
commit, just run "git commit --amend --allow-empty" to edit the cover letter
and then "git rebase --continue".

Again, this is not recommended and it's best to always use "b4 submit
--edit-cover".

## Getting the b4 dev version

To install the b4 development version, you will need to run it from the git
checkout:

  git clone https://git.kernel.org/pub/scm/utils/b4/b4.git
  cd b4
  git submodule update --init
  alias b4="$PWD/b4.sh"

You can find out more details in the README file. You will also want to make
sure that git-filter-repo is installed (either from your distro packages or
from pip).

If you're already running b4 from the git checkout, make sure you run "git
submodule update" to pull in the latest unreleased patatt version.

## Feedback

I hope you have a positive experience using b4 submit. I will be happy to
receive any feedback, as I have to make a lot of assumptions and they aren't
always the right ones. :) The best place for this feedback is on the
tools@linux.kernel.org list.

Best regards,
Konstantin


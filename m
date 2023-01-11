Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E8BD1D
	for <tools@linux.kernel.org>; Wed, 11 Jan 2023 20:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D7CC433F0;
	Wed, 11 Jan 2023 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673470585;
	bh=gtE34QWu11f7JiIfhupe0E28jUaMLdy/3THx811pP+E=;
	h=Subject:From:To:Cc:Date:From;
	b=W6HvBby1f1R2JQQqz8w5/bgmYBMA7exOX/hGSjkLEpIvAVcWj7UBtv5webxynM5OO
	 POzJ4h0zsU/nTCyoKKlcbXLWyKq0hdzni8mw6+rYqHnpfq10JFvbAv8v/jWJIf9uQm
	 cXeS1HjLC4OmzAp8TdaAO7HC3tiabNNYys8Go78UYK5oUsjMOmvtA++UCV12KSXfRk
	 5dE14iJbDTDHQ7uBqF/qrQOYxJMEqTkztcg5GcI/71Nn1EVPPGlJY6cB+S2Wl9SAH3
	 2N6HGh8nzuzfT9zU5T6scSya6U8bsg42dgViVqDwod3iP4w5OZA63ANam598SXvE1S
	 hr/jERmJYFa1g==
Message-ID: <ad77e06d2cb9ba322abad4f27865d4d6f79f6644.camel@kernel.org>
Subject: b4 prep -e oddness
From: Vishal Verma <vishal@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Date: Wed, 11 Jan 2023 13:56:24 -0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

Hi Konstantin,

I'm seeing some odd behavior with b4 prep -e.

A common workflow for me ends up looking like:

- current branch is master
- make some changes, commit on master
- realize this is turning into a patch series
- git switch -c new_branch (this pulls in my new commits to new_branch)
- reset master to where it was before my new commits (say v6.2-rc3)
- b4 prep -e master (I expect this to enroll new_branch, and its new
commits, with master (v6.2-rc3) as the fork point).

At this point, I get:

   NOTE: No new commits since fork-point "master"
   Created the default cover letter, you can edit with --edit-cover.

It seems to grab the state of master prior to me resetting to v6.2-rc3.

Here's a terminal log of this:


   $ git log --oneline -1
   b7bfaa761d76 (HEAD -> master, tag: v6.2-rc3) Linux 6.2-rc3
  =20
   $ git commit --allow-empty -m "new_commit"
   [master 9652673e06ea] new_commit
  =20
   $ git switch -c new_branch
   Switched to a new branch 'new_branch'
  =20
   $ git log --oneline -1
   9652673e06ea (HEAD -> new_branch, master) new_commit
  =20
   $ git switch master
   Switched to branch 'master'
   Your branch and 'linus/master' have diverged,
   and have 1 and 21 different commits each, respectively.
     (use "git pull" to merge the remote branch into yours)
  =20
   $ git reset --hard v6.2-rc3
   HEAD is now at b7bfaa761d76 Linux 6.2-rc3
  =20
   $ git switch new_branch=20
   Switched to branch 'new_branch'
  =20
   $ b4 -d prep -e master
   Running git --no-pager status --porcelain=3Dv1 --untracked-files=3Dno
   Running git --no-pager symbolic-ref -q HEAD
   Running git --no-pager config -z --get-regexp branch\.new_branch\..*
   Running git --no-pager rev-parse --show-toplevel
   Running git --no-pager config -z --get-regexp b4\..*
   Running git --no-pager config -z --get-regexp gpg\..*
   Looking for the cover letter commit with magic marker "--- b4-submit-tra=
cking ---"
   Running git --no-pager log --no-abbrev-commit --grep --- b4-submit-track=
ing --- -F --pretty=3Doneline --max-count=3D1 --since=3D1.year
   Running git --no-pager config -z --get-regexp user\..*
   Running git --no-pager symbolic-ref -q HEAD
   Running git --no-pager symbolic-ref -q HEAD
   Running git --no-pager config -z --get-regexp branch\.new_branch\..*
   Running git --no-pager symbolic-ref -q HEAD
   Running git --no-pager show-ref --heads master
   Finding the fork-point with master
   Running git --no-pager merge-base --fork-point master
   Fork-point between new_branch and master is 9652673e06ea84926e3be7c5cef0=
285c60fe31ff
   Running git --no-pager rev-list 9652673e06ea84926e3be7c5cef0285c60fe31ff=
..
   NOTE: No new commits since fork-point "master"
   Running git --no-pager symbolic-ref -q HEAD
   Running git --no-pager config -z --get-regexp branch\.new_branch\..*
   Looking for the cover letter commit with magic marker "--- b4-submit-tra=
cking ---"
   Running git --no-pager log --no-abbrev-commit --grep --- b4-submit-track=
ing --- -F --pretty=3Doneline --max-count=3D1 --since=3D1.year
   tracking data: {}
   Running git --no-pager config --replace-all branch.new_branch.b4-prep-co=
ver-strategy commit
   Created the default cover letter, you can edit with --edit-cover.
   Running git --no-pager symbolic-ref -q HEAD
   Running git --no-pager config -z --get-regexp branch\.new_branch\..*
   Got strategy=3Dcommit from branch-config
   Running git --no-pager commit --allow-empty -F -
  =20
   $ git log --oneline -3
   c8be0da650a2 (HEAD -> new_branch) EDITME: cover title for new_branch
   9652673e06ea new_commit
   b7bfaa761d76 (tag: v6.2-rc3, master) Linux 6.2-rc3


The problematic step seems to be:

$ git --no-pager merge-base --fork-point master new_branch
9652673e06ea84926e3be7c5cef0285c60fe31ff

It looks like --fork-point uses the reflog, which has an entry for, I
guess, a stale new_commit on master. (Maybe a gc will clean this up?)

Instead, if I did this (drop --fork-point and just do a vanilla merge-
base):

$ git --no-pager merge-base master new_branch
b7bfaa761d760e72a969d116517eaa12e404c262

This is what I'd expect (-rc3).

I'm not sure if switching to this breaks other expectations though?


Thanks,
Vishal


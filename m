Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7F2207D
	for <tools@linux.kernel.org>; Wed, 13 Dec 2023 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mKiMDYvG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BADC433C7;
	Wed, 13 Dec 2023 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702501800;
	bh=yFTUj4dxV93bxOiAvJr+HKN4LsJ6h3EPqiY8qakpQ6U=;
	h=Date:From:To:Subject:From;
	b=mKiMDYvGtvQCP8KE3s01UHv9vUpFY+hQbA++/z+2U7lyjfBCqhadeW/oJ77GVmOxq
	 xIDFqh+6HfloUYDNnOmTNVyflJwWEN53hrRfGljQhBt23r5eR5sOu16JdWu0yQtRDM
	 FPo1fyNAHjyqip75pJYXjHWhKgwgBJgxEpzIAhAI=
Date: Wed, 13 Dec 2023 16:09:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, jarkko@kernel.org
Subject: RFC: Bridging GH workflows with b4
Message-ID: <20231213-fluffy-roaring-capuchin-8024ac@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

One of the goals of b4 is to help bridge forge-based workflows with the
patch-based development model used by most kernel subsystems.

There is already some initial work done in that area, for example you can
fetch a github pull request into your local tree:

	$ b4 pr https://github.com/torvalds/linux/pull/802
	  Fetching https://github.com/laserjobs/linux.git patch-1
	---
	Successfully fetched into FETCH_HEAD
    $ git log -1 FETCH_HEAD
	commit fd3dd3b5d7dad9ddc52b007c62f3abe75ac7cd2b
	Author: laserjobs <github@flemingink.com>
	Date:   Mon Feb 24 10:34:00 2020 -0800

		Remove Intel unavailable hardware from SDIO IDs
	...

This is obviously not very useful by itself, but at the time I was aiming to
implement a specific workflow:

- a developer prepares and submits a pull request against a tree hosted on GH
- GH automation can run some initial pre-checks on the submission and notify
  the maintainer that a new pull request is available
- the maintainer can opt to do some initial code review via github, if they
  choose, or proceed directly to the next step
- the maintainer tells b4 to convert the pull request into a patch series,
  runs get_maintainer, and send out the series for additional review (e.g. via
  the b4 web submission bridge)

That was the initial implementation goal, but I never fully completed or
documented it, because there are important hurdles past this stage:

- the original developer then has to follow further development via email
- submitting v2..vN requires some external way of tracking revisions
- this workflow requires a lot of effort on behalf of the maintainer, making
  their life more complicated, not less

So, I put it aside for a while, choosing to focus on the b4-prep work.

Earlier this week, Jarkko Sakkinen (cc'd) was mentioning that he wanted to
better bridge GH with Linux subsystem maintenance, and it seemed like a good
time to restart efforts in this area. There have also been important changes
since the last time I worked on b4-gh integration:

- we now have a web submission bridge
- I'm already working on a mechanism to auto-cc patches to the reviewers by
  running get-maintainer on the backend (to make it possible for someone to
  just send a patch to linux-kernel without having to worry if they cc'd the
  right people)
- we are now able to retrieve code review trailers based on patch-id, so a
  trailer does not need to even be sent in response to any specific thread for
  b4 to find and apply it (WIP, not yet released)

So, my new GH integration workflow is as follows, and here is where I need
some input to check if I'm going in the right direction:

- a developer prepares and submits a pull request against a tree hosted on GH
- GH automation runs some initial pre-checks on the submission and applies
  a specific label if all checks pass (or, this label can be applied by the
  maintainer after some additional checks/initial code review)
- kernel.org automation monitors labels on pull requests sent to specific
  GH trees and discovers any new PRs being available
- kernel.org automation converts the pull request into patches and sends them
  to the right people for additional review
- the original developer receives the feedback via email [*] and makes any
  changes, eventually resubmitting the pull request if necessary
- kernel.org automation sends that as v2..vN when it finds updated pull
  requests (assuming we can do this in a way that doesn't send a new series on
  every minor edit -- remains to be investigated)
- when the maintainer is happy with the series, they apply it using "b4
  am/shazam" and b4 automatically retrieves any code review trailers received
  during the entire code review process (using the patch-id matching described
  above)

[*] potentially, we can try to bridge GH comments with emails, but I'm not sure
how well this will work without trying first -- I know it works to some degree
for GitGitGadget

So, this is the RFC part -- I must confess that I'm not familiar with GH
beyond hosting repos there. Please chime in and let me know if you have other
thoughts or directions you'd rather have things go.

-K

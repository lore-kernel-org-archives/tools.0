Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324DB3D388
	for <tools@linux.kernel.org>; Tue, 11 Jun 2024 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128449; cv=none; b=hYmz5T8VNiwSViIO9gL9k5ijLPxT2Hh7gUeiuuqNdk7usd3QhS5feVChly7yShmTm9c5ZJa80zld4S59dC3Djc+kldzofI3eACgRZBO8jj/Fu8H/CRmXPd8N89zJzL4VtSZVYbnRKn45j1wQa/np7rWGOfaWMtujiKq2+avNqeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128449; c=relaxed/simple;
	bh=WvcW8UaWweBurVkw0V28PBjtJPYyWW25M/FxDGfDqik=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R3MXOpNeXAnPDKJ01sXJeQXC/sRYLIQkNS0ivsAzu2ha5zDQfc/E0e/a60JZiKz5/Or+p8tzdaZ0G9HYanG9MvH8D1jvmQEk35ON8t7Rk7ZQpwrOPx0m6UaPreNfgYvQc0/ueHNP/7/fn6ZTucX8pQihTUzJmB56s5ZaBPXiL3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ol/sn7S+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ol/sn7S+"
Received: by smtp.kernel.org (Postfix)
	id DDE4DC4AF1C; Tue, 11 Jun 2024 17:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEC8C2BD10;
	Tue, 11 Jun 2024 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718128448;
	bh=WvcW8UaWweBurVkw0V28PBjtJPYyWW25M/FxDGfDqik=;
	h=Date:From:To:Subject:From;
	b=Ol/sn7S+6O2skm52K9RNg0RKU6FmTM5Z06QQQburO+Fui7ZjdsmaUPs31M0hCWBZc
	 VBRzNSwOT2cTqhEcDAL6odh+zN/i45vG/UVSRakP3zsU289mMYTNgfFOMT2KIOKwX3
	 DJhU56k9deUAQPudvZjrGLc2XgToAQgOJlXIM2Qo=
Date: Tue, 11 Jun 2024 13:54:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org
Subject: b4: imminent release of 0.14
Message-ID: <20240611-meek-gentle-vole-eedacf@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I've branched stable-0.14.y which will likely become 0.14.0 closer to the end
of the week. The focus for this feature was on the following major features:

- specifying and resolving patch/series prerequisites
- incorporating checkpatch into both "b4 prep" and "b4 am/shazam"
- showing pre-flight checks before "b4 send"

Here is the plan.otl for 0.14:

    v0.14
    -----
    [X] Switch to using pyproject.toml
    [X] Automatic dependency resolution
        [X] Retrieve dependencies using the standard prerequisite-patch-id
        [X] Define the prerequisite-change-id trailer
        [X] Expand prerequisite-change-id into prerequisite-patch-id for locally sent series
        [X] Add b4 prep --edit-deps to open an editor with dependencies
        [X] Add b4 prep --check-deps to report if there are problems or updates available
        [X] Expand non-local change-id and message-id deps into prerequisite-patch-id
        [X] --check-deps should check if everything can be cleanly applied
    [X] Checkpatch and other pre-submit checks
        [X] Configurable checks to run on each patch
        [X] When checks are not defined, use Linux kernel defaults
        [X] Display checkpatch checks using output similar to CI checks
        [X] Cache checks for commits that haven't changed if the check command is the same
        [X] Add --check to am/shazam and display checkpatch report
        [X] Run b4-specific checks automatically (needs-editing, needs-auto-to-cc)
        [X] Refuse to send if checks haven't been run
        [X] Allow turning off pre-flight check all together, or by individual check
    [X] Document new features
        [X] prep --check
        [X] Series dependencies overview
        [X] prep --edit-deps
        [X] prep --check-deps
        [X] Pre-flight checks overview
        [X] How to turn off pre-flight checks
        [X] Document config file changes (am-perpatch-check-cmd, prep-perpatch-check-cmd, etc)
        [X] Update manpages
    [X] Miscellaneous enhancements
        [X] Add prep --add-prefixes
        [X] Add trailers --since-commit
        [X] Automatically no-parent standalone patches in the middle of long threads
        [X] Prevent overwriting cover letters when the tree changes while editing
        [X] More bug avoidance in send-receive for python SMTP implementations
        [X] Add ability to specify DNS resolvers for DKIM
        [X] Add tab-completion generation with shtab
        [X] Allow inserting a range-diff into the cover letter
        [X] Use hashed requirements for added security and reproducible installs

If you would like to test it out, please either update to the latest master,
or switch to the stable-0.14.y branch and report any problems you encounter.

Best regards,
-K

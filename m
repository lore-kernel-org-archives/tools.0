Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7529B8C7
	for <tools@linux.kernel.org>; Thu, 15 Jan 2026 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768510756; cv=none; b=QGHe3m81lqKTeuKgz3m22RIQJo6EiiutFx9Xek2IdqOY3Y0BtpEm8fgP4lgrHeixEYxhQfaZ7tEOXBf7j2cns1tmhjEQrXZzEtFr6IGcK1NmyG98DmXcJruUlboqfM2wpMqWz6bU8vNHNtixYoFO9MmBinkYY500MnbQA3U3otw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768510756; c=relaxed/simple;
	bh=11Rxem80SweTCHNPsEG5ZkNzrt4dCnT9usu/GSa9Ebs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLZoZw2ppCYvV5x+0hr1UKe8kl6biXFZRIanMHaP847fS/DYvQGeaJ+e96p4rqhKsP2mTKjUu3Fou3YG9B9D6IWaq5FiMcjx9vY3ZJ3n+ru4o/wf1fTzFHJ2Jr/8MdapAqVuqYR9Y90RKSiCGU1v5kj3wSbTpNSxJnRXpToLP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wqjb45zN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wqjb45zN"
Received: by smtp.kernel.org (Postfix)
	id 7C682C19422; Thu, 15 Jan 2026 20:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46536C116D0;
	Thu, 15 Jan 2026 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768510756;
	bh=11Rxem80SweTCHNPsEG5ZkNzrt4dCnT9usu/GSa9Ebs=;
	h=Date:From:To:Subject:From;
	b=wqjb45zNKh9FuhudQB1EpyC9fGnG2fdHlUREqIEvECTICXw4MedEOcWJ9NDWELp+e
	 WSoTUnRuYTvHGH2vmpW6IK+kvsGXIdDhL37SjKm6Ur4At/5RowzfvHvNbO5bQgiaJv
	 WZtXv2GueWDplGQkL8ELE8UcI6UUtAz8GLVsx2Uk=
Date: Thu, 15 Jan 2026 15:59:11 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore v0.3 now available with lots of new features
Message-ID: <20260115-economic-uncovered-nuthatch-36e35b@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Korgalore v0.3 is now available with several new features that make it easier
to track kernel development activity without subscribing directly to lists.

This remains mostly useful to users of gmail, though there are now features
that others may find handy as well, and we can now deliver to IMAP, JMAP,
maildir, pipe targets as well.

(No OAUTH2 IMAP support yet -- I need a way to test it first.)

A lot of functionality is dependent on lei, so make sure that is installed for
the full set of features.

New features
------------

GNOME Taskbar Application (kgl gui):

This release adds a GTK-based system tray application for automatic background
syncing. It shows real-time status updates during sync and supports manual
"Sync Now" and "Yank..." operations without needing to open a terminal. If
your Gmail tokens expire, the GUI will detect this and offer to
re-authenticate via the browser.

Thread Tracking (kgl track):

You can now track specific email threads for ongoing updates without needing to
subscribe to an entire mailing list. Tracked threads are automatically updated
during regular pull operations and auto-expire after 30 days of inactivity.

Subsystem Tracking (kgl track-subsystem):

(experimental)

This feature parses the kernel MAINTAINERS file and creates lei queries to
track a specific subsystem's mailing list traffic, maintainer messages, and
patches. Configuration is automatically generated and stored in conf.d/ for
easy management.

Bozofilter (kgl bozofilter):

(loosely tested)

Block messages from unwanted senders. Blocked messages are silently skipped
during delivery. Works from both CLI and the GUI menu.

Bug fixes
---------
- Fix crash when initializing a new feed for the first time
- Fix feed_lock failing when feed directory does not exist
- Fix git commands failing with safe.bareRepository=explicit
- Drop dependency on python-dateutil

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Install via pipx:

    pipx install korgalore

Thanks to the following people who reported issues fixed in this release:

- Ard Biesheuvel
- Linus Walleij
- Sudeep Holla

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C087933B6C8
	for <tools@linux.kernel.org>; Wed, 17 Dec 2025 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765984889; cv=none; b=uEJP+ywjAk/XQnDyP5UTGsw0KFegBCT/nmPIvgCk/P4IUCBs0awB5rQu31pTaJjXiyg5STRWi52p1xFJCGAqx6DdA7crS1z84B8PRjP8QkvleIUBDq95yYMUbkQIQIT32g5hyYBNMsL4it4g/Fk4nmClvPKu7ZpD1ajaIOKBmA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765984889; c=relaxed/simple;
	bh=6DEoNJyIFqZUFwIa/I7XMxtFEAL3+7yethDcOJS3v0M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyGqHDQIwbgB9yFms5tAdLb36JvyXv07/VoCxacuVROlfegHM3gXv511uPiC3/6ZFEO7SnrPkgDK9a2ef8Jpr6PRmz+F2nyo+wWGYAD8S9VqhVj17f2TcrhIZF1kZRKHCjNGqQRRI8YYaLuba3dUIWgIfuL6MaKBW/q4txcLzVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aQvwNlnb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aQvwNlnb"
Received: by smtp.kernel.org (Postfix)
	id 60756C116C6; Wed, 17 Dec 2025 15:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C09DC4CEF5;
	Wed, 17 Dec 2025 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765984889;
	bh=6DEoNJyIFqZUFwIa/I7XMxtFEAL3+7yethDcOJS3v0M=;
	h=Date:From:To:Subject:From;
	b=aQvwNlnbdBCK7pmFJI2GOX2Boj8FcmhHRhKLKsNygwvg6CU5l4pr4PEo8gFGhF0k6
	 nIQ+OjIXoo41dKSoFYopE3pjYlvXkfg5k3IxhvzXIC+IQMPzf5wwbJLTcKmyLg9za0
	 mwg72vrlN5j21ul05hKopF4XaydYtHPyh++BtlqY=
Date: Wed, 17 Dec 2025 10:21:27 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, users@kernel.org
Subject: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

TL;DR: korgalore 0.2 adds support for multiple delivery targets beyond Gmail:
JMAP (Fastmail), generic IMAP, and local maildir.

Docs are here:
https://korgalore.docs.kernel.org/en/v0.2/

What's new in 0.2
-----------------

New delivery targets:

- JMAP support: works with Fastmail and, potentially, other JMAP-compatible
  providers. Uses bearer token authentication, so no OAuth dance required --
  just generate an API token in your provider's settings.
- Generic IMAP: works with any IMAP server over SSL. Simple password or
  password_file authentication.
- Local maildir: for those who prefer local mail storage.

Configuration improvements:

- Named feed definitions: define feeds once, reuse across multiple deliveries.
- Per-delivery state tracking: each delivery now maintains its own state,
  allowing multiple targets to follow the same feed independently.
- Hopefully, clearer naming for targets, feeds, and deliveries.

Reliability improvements:

- Automatic retry mechanism for failed deliveries, with 5-day grace period
  before marking as permanently failed.
- Atomic writes for state files to prevent corruption on interrupted writes.
- Better feedback during initialization of new feeds and deliveries.

Not just GMail
--------------

If Gmail's OAuth complexity was keeping you away, you now have simpler options:

- Fastmail users just need to generate an API token -- no developer console, no
  OAuth consent screens, no clicking through 10 confirmation dialogs.
- IMAP works with any provider that supports IMAP over SSL.
- Maildir requires no authentication at all.

The architecture has been cleaned up to clearly separate "feeds" (email
sources like lore and lei) from "targets" (delivery destinations), making
it easier to add new target types in the future.

Upgrading from 0.1
------------------

State files are automatically migrated to the new per-delivery format on first
run. Your existing configuration will continue to work, though "sources" has
been renamed to "deliveries" (legacy configs are handled automatically).

-K

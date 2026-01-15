Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F733D1CBB
	for <tools@linux.kernel.org>; Thu, 15 Jan 2026 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503373; cv=none; b=nqGkau8hX7fnooqjFukKC3LwnX02ww3ghMZmJAWp5zwpnu2/+mWpLrzWU9Fw9+bw1KHJXL/BZTC5klOrWZpIcfB88AwsVbV3dL2i3/f0rmcPdMPzFGnE3OtM2LTzFsRJwB0picrfkywUlrvdTyyQRoVWDRZD5ojwQBTB/2PUQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503373; c=relaxed/simple;
	bh=TwfU27DAdIuIhgiiaf9b+qQoKV1xPnyxLgKM7+jUzLs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GPVE8Nq9J46czCKWQ6l4kTFkCBXYZEsgKvNe3FH61x+mXJdbE7ulRh9qJA4Htcht+WvD4/+oh5L1wZIdDSakSUW1RSWxuSSj9JmnLZAbPMRuTtXsf/OJ5+VwwnFk5D+P5oOxkKb82ZdkVS0fUoDE/7EX0O8jYPHhjrvUdO82VF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J/lbdMz6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J/lbdMz6"
Received: by smtp.kernel.org (Postfix)
	id E9F65C16AAE; Thu, 15 Jan 2026 18:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2381C116D0;
	Thu, 15 Jan 2026 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768503372;
	bh=TwfU27DAdIuIhgiiaf9b+qQoKV1xPnyxLgKM7+jUzLs=;
	h=Date:From:To:Subject:From;
	b=J/lbdMz67o8/niV4Wa8DCk9jnN/d/rH+wRmqHWvR65UzPu11PlNOqj5Gtf1F8qcNx
	 1Cys0sQhx+6VDf9LFknHXLhFn3U3gVWxYjhajxZLMEBcj9UJxsCEltxLd3jPVBuIlg
	 xNxrnEmZVzdJJZ4fC6T0v6+XauFLwcVwckWbns2w=
Date: Thu, 15 Jan 2026 13:56:09 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore track-subsystem: auto-setup queries to track
 subsystem-relevant mail
Message-ID: <20260115-lyrical-glittering-toucan-b6e5ff@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi:

I added a new command to easily track Linux kernel subsystems by parsing the
MAINTAINERS file. If you're a kernel developer who wants to follow a specific
subsystem without manually setting up lei queries, this should make things
much simpler.

Here's what it can do:

- Parse MAINTAINERS file and extract subsystem metadata (mailing lists, file patterns)
- Automatically create lei queries for mailing list traffic and patches

  - Converts F:, X: entries automatically to xapian queries
  - Converts *some* N: and K: queries automatically -- xapian has no support
    for regexes, so it will only use full-word matches

Here's an example in action:

    $ kgl track-subsystem -m ~/work/git/linux/MAINTAINERS \
        -t work -l UNREAD,lore/subsystems/selinux \
        'SELINUX SECURITY MODULE'

    Found subsystem: SELINUX SECURITY MODULE
    Creating mailinglist query: l:selinux.vger.kernel.org AND d:7.days.ago..
    Creating patches query: (dfn:Documentation/ABI/removed/sysfs-selinux-checkreqprot OR dfn:Documentation/ABI/removed/sysfs-selinux-disable OR dfn:Documentation/admin-guide/LSM/SELinux.rst OR dfn:include/trace/events/avc.h OR dfn:include/uapi/linux/selinux_netlink.h OR dfn:scripts/selinux/ OR dfn:security/selinux/) AND d:7.days.ago..
    Created 2 lei queries for subsystem "SELINUX SECURITY MODULE"
    Configuration written to: /home/user/.config/korgalore/conf.d/selinux_security_module.toml
    Target: work, Labels: UNREAD, lore/subsystems/selinux

This creates two lei feeds: one for messages to the subsystem's mailing
list(s), and one for patches touching files owned by the subsystem. Both get
delivered to your configured target with your specified labels.

Running "kgl pull" after that will feed the results to your inbox and
automatically update them on every run.

You can customize the date range with --since (default: 7 days), specify
labels with -l, or use --threads to include entire threads when any message
matches (warning: can produce many results for busy subsystems and tends to
pull in stable patchbombs).

To stop tracking:

    $ kgl track-subsystem --forget 'SELINUX SECURITY MODULE'

It's not yet released, so you'll need korgalore master to try it out.

Obviously, you'll need lei installed for this to work (should be now on most
distros).

Happy to get any feedback.

-K

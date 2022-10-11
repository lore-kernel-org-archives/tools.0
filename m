Received: from dcvr.yhbt.net (dcvr.yhbt.net [173.255.242.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0552CA2
	for <tools@linux.kernel.org>; Tue, 11 Oct 2022 11:05:50 +0000 (UTC)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id EF3D31F403;
	Tue, 11 Oct 2022 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1665485945;
	bh=0AR3rGzOYzehX7WJEtazrIwY3CShYN1LLafXlHjUeDA=;
	h=Date:From:To:Subject:From;
	b=GUm4C8uVdYeEmE4VJnv5uKb6DgqMlHiHHtSpbfL5Yt9FOAjnlN6Pm9KuZ5sORr0m2
	 CVUrkgMKC/0w2Vxd+CHMSgRCjzvz+dU3tDte9weSMfK1AeaVLuGPpj6KkLR7RpNrnK
	 gDVPSM8niq531Z8zvuXBNP42LEYmbs/0t4xdZl4w=
Date: Tue, 11 Oct 2022 10:59:04 +0000
From: Eric Wong <e@80x24.org>
To: tools@linux.kernel.org
Subject: grokmirror: absolute paths and objstores..
Message-ID: <20221011105904.M713779@dcvr>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

One thing I noticed with grokmirror is that it uses absolute
paths everywhere.  That makes it non-trivial to relocate the repos
to a different FS location (e.g.: clone on my workstation while
on a fast network, copy to USB stick, copy to laptop, and work
offline)


I also wonder if using only URLs (and not FS paths) remote.*.url
in both objstores and non-objstores would be simpler and more
robust.  In that case, `git fetch --all' can be called from the
objstores to update all remotes.

The non-objstores would only store refs in nearly all cases.

That would completely avoid local FS paths from being in
$GIT_DIR/config, only objects/info/alternates

A lazy implementor can just call `git fetch' on the non-objstore
and let alternates + repack deal with redundancy in case there's
a small window where commits appear after the objstore fetch
but before the non-objstore fetch.

An implementor can of course avoid `git fetch' on non-objstores
by manually updating refs in the non-objstore, though.

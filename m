Received: from dcvr.yhbt.net (dcvr.yhbt.net [64.71.152.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C5F72
	for <tools@linux.kernel.org>; Wed, 13 Oct 2021 11:10:41 +0000 (UTC)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id 79D461F670;
	Wed, 13 Oct 2021 11:03:44 +0000 (UTC)
Date: Wed, 13 Oct 2021 11:03:44 +0000
From: Eric Wong <e@80x24.org>
To: tools@linux.kernel.org
Subject: grokmirror sleeps 5s in some places
Message-ID: <20211013110344.GA10632@dcvr>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I'm on grokmirror.git commit ceb53836b59c9464
(Don't force url to contain hostname, 2021-08-27)
and I see some multiple 5s delays from grok-pull.

It's probably not a big deal for normal users, but it's also
part of the public-inbox test suite, and the test which tests
against grok-pull can end up taking longer than all the other
tests combined.

I don't know Python well, but some sort of pipe/socket
notification could be used to avoid busy waiting.

If keeping busy waits is far easier, I've found ~100ms delays
acceptable for keeping overall CPU usage down (at least from
other scripting languages; Python can't be that much slower).

Anyways, I'm disabling the test by default, now; so not
a high priority.

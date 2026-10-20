Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792488529;
	b=Xs43hlv9TmOVmLpQFoff8sQQVIFOfs1jMRrtuntbK7LehbvW9wLoKL4yWS6xbqNnJO6X
	 0GgmrwTS3Nlnd+1ieSvBNWh1sMvh4MVrSeEZDUX3rXri6pE+agy6b4vYkxmej5Bgy9B5w
	 xAAoS3TNn0eByMLnzST6rMsSvmgB1CBSRQxonPM2txFQvmlE8eB5Hvk9bdaF64nslYRYs
	 3FOgt8OhTX10QGehYXtUK8fT8GUnOoIxk1YCneMJkOGdi5/aAeHBQPOwd2QW6HAKasywo
	 kjgp7spyCbzvTSFfEhvPXj1H4Om9Y9FXtlaBwAWGORTgzlfJyz2i/oYJfPZxDn3ie4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488529;
	h=Received:Delivered-To:Received:DMARC-Filter:X-Envelope-To:
	 DKIM-Signature:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Flow:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xdrxv4akkVUcs5UZuVSSfMSqnnHjRHjBC1FCCTiA3z4=;
	b=zfNv/zElm8apMuKz1mJwkEotZPhw3wYcInKAyrphHESxLQbV2sJDd/+BOfU6iQl5hUk1
	 RCW3qsgCJh07/e6GIIV3pmQLFSNsKms40gz+0VjG6k3ZwH+os79AtcFCjbMw64E+GQwUk
	 z3MNWxjSRAdUj+1H8GOvut6539InIevguq8vYWwmjiFu2dFvGsHYAegtnfgFKLEyeA35F
	 pybDrkd6iY63AWIMvAzkzYDAqIaH6iDjfU99MZagLi6NVXHiBQzFt5sfKRxbomf+mOQ2L
	 t8MySdakWDVtKFsFc/4f5NkMeN7IpnTry/M982OsRnan1Nc2KK4PTnY0ttpYhY/nQmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="kTCk/p9x";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CA606A319
	for <tools@linux.kernel.org>; Tue, 20 Oct 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kTCk/p9x
Received: by smtp.kernel.org (Postfix)
	id 051221F000C5; Tue, 20 Oct 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=91.218.175.31
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792488528;
	b=NsULqhQao4i7fus16CnxGJYPTL+XCk7HNZnUjoh4Y+6q2qSF9naPNku6bEU4iihBNQmw
	 zcxAgKQJNVVc1AZZH0msbB0Jl3b3QHFyUX7ZpSdR/yvPp45pjRcz2A4hG2mguXWTbo4SO
	 gE83aVTRs4IKGTSGCFQ2OGYAycekAxqWvGbLBgAd1NSktZIETeRj0Dt5oVU0z4x0EHZr2
	 7dYhUq7wkd0w5g+LItYOxApMtKz38Ej+PBrrkIlKy5JF8qRkxannfqzq1cK3/8eTHrebv
	 OmCSIOlFCWXh5Ys7qUr9I8L1LF8ssR3Ejpe5oL64sTP5r/ky2rKD5OLVakxxVOvlFxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792488528;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=xdrxv4akkVUcs5UZuVSSfMSqnnHjRHjBC1FCCTiA3z4=;
	b=OFrpb6ReKTPHp3GbarMip5r9AdD0JwWfkBXPHhzJGAZo7tNpxaVrMrtLRbKUCd+qs0t1
	 YLdKT10nb2OQLMymSN3AiQb3wsMYDe7El4tMIPn9bHhAdzehkcmQwLOxJtq1JgOvT67C0
	 gkEwKsve3e9pVsMPIY2iHVtGGUsQLkGXFVoSEslmAR6MC5bHmCdobelkvNX9Y9i0LFIyS
	 pPtHQC7CQ9Cf1xReiVMjFkg2v8milRnb1138LtkB3ZGGBtfgd2c+eCzZ2EY+d8G4iaqSg
	 w0eqf3np+SMJd9KYtV295YuzWn/2BvJnQlRbqf7MdWVA946tGvwLv0ZtGTDpYpiLEYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="kTCk/p9x";
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.31
Received: from mta0.migadu.com (out-31.mta0.migadu.com [91.218.175.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 306A31F000C4
	for <tools@kernel.org>; Tue, 20 Oct 2026 09:28:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kTCk/p9x
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 306A31F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=iMyST9li+6VOJd6ud+dUFgHjKbIhqR0funkI6vQfDOY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792488526; v=1; x=1793093326;
 b=kTCk/p9xVo+NPcIQFeQlaJ+xK6/UUbstLjuAhH1T5mXdWhvxli/VBf8T9RnbjG16pTRFKxWt
 Yd0P7IUuC5C0xjLp0mtLFdsh0MQpCyCIkXvw63YLfRshDlTljiNZXwPC0w1M9DzEzg5A9bujvcc
 5I3I6vmkX9lFs2wFfZa41HH4=
X-Envelope-To: tools@kernel.org
Received: by mta12.migadu.com with ESMTPS id 381a8dbccaf5437c;
	Tue, 20 Oct 2026 09:28:46 +0000
X-Mizu-Trace-ID: 381a8dbccaf5437c
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH b4 0/2] Fix .mailmap identity comparisons and the
 missing-cover KeyError
Date: Tue, 20 Oct 2026 17:28:30 +0800
Message-Id: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMUQqDMBAFryLvuwFjrGivUops4tquqJWkiiDe3
 Vg/Z2BmQ2AvHPBINnheJMh3jKBvCdyHxjcraSIjS7NCp7pQNq8Hkn6gSbExTUlcObobxGDy3Mr
 6nz1hc7wuF2bbsfudF+z7AbVMIY5yAAAA
X-Change-ID: 20261016-b4_mailmap-e33d8ae9ca53
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

This series closes two remaining identity/tracking problems in the ez
prep workflow.

When a tree's .mailmap gains an alias for your own address, git log
matches --committer against the mailmap-canonicalized identity
(log.mailmap defaults to true), and 509f56ff5c24 already taught
find_cover_commit() to pass --no-mailmap so the cover letter stays
findable. Two comparisons still read the wrong identity, though: %cE
comes back mailmap-canonicalized even with --no-mailmap, so
`b4 prep --claim` treated a series you committed yourself as someone
else's work and re-stamped every commit (patch 1).

Separately, get_prep_branch_as_patches() indexed tracking['series']
without checking that any tracking was loaded at all, so any caller
arriving without a cover letter -- `b4 prep --auto-to-cc` on a branch
that was never prepped, or a cover older than the search's
--since=1.year window -- died with a bare KeyError traceback instead
of the diagnostic every other prep subcommand prints (patch 2).

Run ci.sh, all test passed except one pre-existing failure
test_base_commit_in_remote_tree.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Hangbin Liu (2):
      ez: use raw committer emails for identity checks and diagnostics
      ez: exit cleanly when prep tracking data is missing

 src/b4/ez.py         | 11 ++++++++--
 src/tests/test_ez.py | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 2 deletions(-)
---
base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
change-id: 20261016-b4_mailmap-e33d8ae9ca53

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>


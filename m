Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BCE225775
	for <tools@linux.kernel.org>; Sat, 11 Jul 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783757994; cv=pass; b=Vn8gkZhpA0eFhFpymYWCEo1uR3+36TUoCmQGQPG1m9kvbW73yrworXRfRHARvKVaJ2Ik5KXXZppXxWZFN46KfHry6tlQ/1C2uz7ZIY2CYAh0DP+9Qbgi/hBFtU8aR4bY9qZWuH+bdUJHLCsaXitHp8gnBAVAMngsr4Tm70LKh0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783757994; c=relaxed/simple;
	bh=8hKwJfsj2GYGdJnoBuIs6IJUK01KKQJXrDJSkwqasys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DwA6i+a3Cx2g0YIqTazXt9oPCQEVV0BTuF1n7y2BFHBFDquxZ0h6noET7CO/ok+Mh2vHi+mj2EDVXLWIbdyGwTrZcET0Jm6Yf3KZaCB9M8X0VDjysSJfHzxwCqRF84Y67UcrrmAMPSsfR1zvD03LP/LmSEsySRuxxFgjvxkWFtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UbMhBWKf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=S1Fiq9tR; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UbMhBWKf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="S1Fiq9tR"
Received: by smtp.kernel.org (Postfix)
	id 027CF1F00A3A; Sat, 11 Jul 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1783757991;
	b=TiFHVZOnzldocfuMhnw1FOqMZBSVqJ8WW4SXzr80bhKltTqV2UxdRld4fqIfKm1CFT3t
	 iZMltTExdvnAilpACvxNLqOs88ubYxrX3OQPGS5ix1KbP/BHN/RlWr7lfXUc3zN6qiWvA
	 E1+u7xZv3LgtXdX49kSJDVDVPSy5dOvaj8nbcaTBR07i3RtdCSH15MP05VpVEf/thQrYV
	 k6QBjk41fNiVLbn+coiopDsFsYBGmEN2podkNhhLFNYNMwo6shFap06PepmBkcH8e2Rkj
	 3EAlUXIAAhRkIR4SIpVWnTm6rBuABB2/MUHkod1CaWaL6UDb4HaHEnlxWAz4fe54FPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783757991;
	h=DMARC-Filter:Received:DKIM-Signature:From:DKIM-Signature:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META:X-Rspamd-Queue-Id;
	bh=9wtnhk5ubZVMVG0DAG7OmDUvqJLoMFzpB//A5VzlJbQ=;
	b=M6z8BZW8OlQ0y+pea4KLaNjFefeUvwGsKQvLMDaS35qTauNB04hlWZ46MJlgRJeXOKBx
	 ctjaf5tEZVtY1VCqBTxDGA1p6LOElo0OQgfpurIbtxM0uaDOuaB0GSPl/xLDFvkFEBL5i
	 PmylM+jsCMlF0BEnJeSJsrKiIX29ZS/rYRMT0+M9dt4XkKb9kCQAArHVhMuzEckxbLExU
	 3XTbOgomeZLbmXk2sw+LW2HErj44/QC++lSDFukkLr5AUC1v3aoWCzjlmUmgv1fEDUp+C
	 vroOVlPEJW+MZYRnBFZy8zqHdFrzq58q1SwK15kPG/QTu1xVt82BN6QnC9IE3nfh9Tg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UbMhBWKf;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=S1Fiq9tR;
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B5561F000E9
	for <tools@kernel.org>; Sat, 11 Jul 2026 08:19:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UbMhBWKf;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=S1Fiq9tR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4B5561F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gy1pC4TgCzMlH6;
	Sat, 11 Jul 2026 10:19:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783757987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9wtnhk5ubZVMVG0DAG7OmDUvqJLoMFzpB//A5VzlJbQ=;
	b=UbMhBWKffXFj6LH1Vo3vecjvYajbuV/1LJ108V5PV0POEAuQvXskGW3RgYQXhQZOYT2J5o
	xI7OLRRsE+z6NJpEIQ8tc1UAXBGGxfrw1lEWdvtRuIC8EczmSv/3wIgljDVp8PfGd8J+aC
	7FKUsNX5ybqBJ0ELctlYDVSC++8EBN4tSU1nPwYR/DBEog7hogpanvRoxdnzyaySIXQCpR
	VGa55lo6HNq3vjoMDnKYuSwzRfplkLV5IW3lfevUZhIL6RJ5Q/LbNkKBzKTaXK8Mpk3s8E
	4c/sgWut8tWzSeNzQ9LdvCQBRKz+S3j/cJYwYLV9RTsIQ8GQkLONoGWsRWnrgw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=S1Fiq9tR;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783757986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9wtnhk5ubZVMVG0DAG7OmDUvqJLoMFzpB//A5VzlJbQ=;
	b=S1Fiq9tRbkW60/rZ15ebh2rgL8/iFuS2ziF3tF1X2wF6BrJYlN2ymFQytn51FhA9tXmvru
	Tm47qFcUMUl6F+O9MDyXmZBkOvAMJnXU2CAOpW1z2YomK9yvU8BUJl9fBr3E96ccniCTaO
	aYvJ9DOTKgUSwlT4UEyB0iKR/D56RwuMLgXCW4EZqudUv521gIWaY6wF0z1C0bRCbeMWp7
	7crDj7KiX/1/L0TsmalC5yPw7WyYLoRc7CHZX+V/qKybd33F4/VGUbIr4nrnHvAWIigzEc
	1s9bZtyY0UtiqMZsDoblouBvG1+DCssG8Q2ZygTf6v2TVzsv3MFLgwKeFwfHGw==
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Cc: Maurice Hieronymus <mhi@mailbox.org>
Subject: RFC: b4 prep --enforce-deps to materialize series dependencies locally
Date: Sat, 11 Jul 2026 10:19:37 +0200
Message-ID: <20260711081938.59972-1-mhi@mailbox.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0913f8881e5aefc2dd7
X-MBO-RS-META: jgm96k59k3n6oimznkouhz8zyjh8jjmj
X-Rspamd-Queue-Id: 4gy1pC4TgCzMlH6

Hi Konstantin,

b4 prep can declare series dependencies (--edit-deps) and verify them
(--check-deps), but it never materializes them: --check-deps applies
everything in a throwaway sparse worktree and discards it. If I work
on stacked series, I still stack the branches by hand, and re-stack
them by hand every time a prerequisite gets a new revision.

I'd like to close that gap with something like:

  b4 prep --enforce-deps

which reads the declared prerequisites, figures out what needs to be
rebased on what, and runs the git commands to bring the local branch
into the state the dependencies describe. Conflicts stop the rebase
as usual and are the user's problem. Since an enforce can involve
several steps, there would also be:

  b4 prep --abort-enforce-deps

which restores the pre-enforce state after a partially completed
enforce. That means saving the branch head and tracking state to
a backup ref before touching anything.

If this is seen as useful I can sketch a prototype and send patches.

Best,

Maurice

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87535675B
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245933; cv=none; b=tLr0Foc0uzrmKpqsC7h9os/5ZZf4Nox9zvdDTAtTbyBGf1kKGqXOU1GbqQt2ZUBrjVX2bqh1dd8rv5Qf7rEshhFn537qyihSf2FBqdy6DTqNalfASCKDDNn/uY/htO3gcbw1JZ5p3DO7oJ6XbuOf2jDcFtcl2ShMPKSvP9jJjU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245933; c=relaxed/simple;
	bh=y2gMX5ykkQ71upnMNgmHH1GD9pTjWy3+deTe3ipAY1k=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KzNDewYQMGMTFhIP68DBRJX+Im6qc7LOxWiar82uu93srds4mQm8GUSOJiJHn8BwKgCRjEZTr/DTFtOKIii+noMddYwpxtwnZNcgBk5/1UPE9xTskaVBJjJxQ66CpKjiXjVWwseLs/OedRhEpMiIJrCDorABjHdL9Zk6hdz//ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOEcdrC9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOEcdrC9"
Received: by smtp.kernel.org (Postfix)
	id 4427A1F00A3A; Tue, 23 Jun 2026 20:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0F81F000E9;
	Tue, 23 Jun 2026 20:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782245932;
	bh=eCEgyj5HARtZHRhNlfuWBgCx28+czOR4g8aTdzc9DkM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mOEcdrC9qcMqXXTJuwQaiQE5DpAaSQFqySgHqBW+DzM/b+bZz0OL7cWioL/FLZqbC
	 0bWrzXK94Td7b9hKHtrUB8FZEovSSG6y6/Uwj650jEZyoHkRkhn6aBfqZA+I3HJum1
	 tiGmowqk/jSykrpxj8ay7BO+sj7cvMz3uwU4aHME6ps11cIwe5G2fIJo0T8eMuLHWO
	 4GDqZXHI94fwxsw/TcVR8lspKhOhxfAQG3zgClG4Z61crP4Y6pvAmjAktIabnlyPE9
	 r0kWumaQZBm93jw848bET7O0FcjWW7rCcPoc0cvFToseO51zEFjaKcO4lSQnRIRLV6
	 8YaKGOrGT3giA==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH b4 0/6] review-tui: worktree-aware takes, resolve
 take->merge conflicts in place
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Christian Brauner <brauner@kernel.org>, 
 "Kernel.org Tools" <tools@kernel.org>
In-Reply-To: <178223858665.1539887.18387233629212425068.b4-review@b4>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
 <178223858665.1539887.18387233629212425068.b4-review@b4>
Date: Tue, 23 Jun 2026 22:18:40 +0200
Message-Id: <20260623-habicht-helium-pragmatisch-686af4fe7167@brauner>
X-Mailer: b4 0.16-dev-5fdb0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=brauner@kernel.org;
 h=from:subject:message-id; bh=y2gMX5ykkQ71upnMNgmHH1GD9pTjWy3+deTe3ipAY1k=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZvVJ+d8f8mJNX+ZMo3sz0zb3fuA/GFG6Qqt58cuOzD
 p/J2ub7O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACay7zcjw2/vrUw8nYmTVtpa
 h0xj3dTxVfQjK4OG8PwJS1VKU1Zqr2ZkWKxnEvPK/6z0y2MqycV7mJ4fTu4JLK6KfOF5PcIv4S8
 PEwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-06-23 18:16 +0000, Konstantin Ryabitsev wrote:
> > b4 review's "take" action applies a reviewed series to a target branch by
> > one of two methods: a merge (git merge) or a linear/cherry-pick apply (git
> > am). Review is often driven from a different worktree than the one the
> > series is applied into, and the target branch may be checked out in yet
> > another worktree, so a take has to run wherever the target branch lives and
> > never disturb the current checkout. This series makes both take methods do
> > that correctly and teaches take->merge to resolve conflicts in place.
> 
> No objections to this at all, but I do want you to fix a few issues that
> running ci.sh identifies (mypy errors).
> 
> I should plug this into .b4-config, really, but until I do that, can you
> run ci.sh and ci-matrix.sh to make sure they are all green?

Sure. I fixed all mypy errors. There's a bunch of pre-existing ones:

- ty (121)
  all in 11 untouched files (misc/send-receive.py, __init__.py, the
  other TUI modules...) . Pre-existing on master, newly surfaced by
  ty 0.0.52 release and the all = "error" config.

- pytest (9)
  test_ez::test_trailers ×4 and test_mbox::test_shazam ×5. They exercise
  ez.py/mbox.py code byte-identical to master, so they fail identically
  there.

I'll send v2 in a minute or two.


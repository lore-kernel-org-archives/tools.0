Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654124;
	b=VJZqP6GZDDJpSZX9sTsXg+F5kCu0oUrVxki7AZSEoNXpipmZysFWYPUfq3oUPjL6r/MN
	 iR4CxRgO4S9f/tqt6AiUnk/42EpdNdw7yZX72dxzTQB8UTPGthigr4QVtkoDv6uIaNcf1
	 ZT/DWhpZtaFb3vswo2SMOT2fdenRmZOZrJ3undnwRrpfxvKn7XEAE+URBg7GDgbw0eljD
	 k2dSkEqvL64fOp3pmM9ljq+XAfzUuwv2alCtGwTZbrFY9fWsA7wJUMey0/k6vHIQ1BOT6
	 GyEC3caNJFUJfjgUysO7zTqaBOAyel0iX3LETfgX1GRwVvdWdrzem6hvG+aJJmrUHag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654124;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sT2HMHdYH7BhaioLT/7fvN7hQuj4aII0OBMGpCgKfNc=;
	b=Z5+nqfvD1hSoAnaOHxNQ8akAgujzAUSbsVBvQs2+D8Q6V4A5qXPyIJiIQS3vnUn4HZpt
	 8qOzJTkZ00KP7MJypkX0zY8E/vGOOczUVlB4oFpdwMvuoLYmE+r1ek1cJsBedCNgax5fi
	 3OpL/viP5GWbbxTvMZSc4P5Sd8FP0NFurUQ/h2CfaT2gUWOgj9rMRm5od1cKQuKa9ftPZ
	 CIjiCgRsPgmfFYt36VQ9Jo8qDM96bm022i2lYXVOqH2fY1eC2Wbb17ZBUCeZCIDnREy+p
	 PPoIlOyGF8xCqVLuB1EVdj4E0hbV75qv7i3rdvm5TOSM/AwiK0zBue9xovpzZs1OPyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXtywapg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD6606A331
	for <tools@linux.kernel.org>; Mon,  2 Nov 2026 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXtywapg
Received: by smtp.kernel.org (Postfix)
	id A70841F00A17; Mon,  2 Nov 2026 21:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2341F00A16;
	Mon,  2 Nov 2026 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793654123;
	bh=sT2HMHdYH7BhaioLT/7fvN7hQuj4aII0OBMGpCgKfNc=;
	h=From:Subject:Date:To:Cc;
	b=lXtywapggN+5PBxHtrI6lUwUVoWkMK/9iwaJfaQiOEvhEZZ65zeGCmxbfNhAXyQEU
	 LIlQci+NEQ+KcqqbeFiov397JBb2DvLG3OMkxI02xhGeJQUsxZ8qyZ2bKPps+aslMy
	 xAuCWA5iM75VdMp+nzHXLjfHvp6lr5u414BrM/lfZdejRZj/jvju8614rB1+Px/0y6
	 82qtMl/drLKvlABDJ4ag3VhEz3AhEPxPxO3gu2Z4p/TN/Dnx9E8C79vjFvRIu7ktqH
	 dPSa5mrcfPlH9gkWmd4IsfPd8apqY+4NaCW+HAcHJcrkdzlx/LtI3beaHXq0/Z7VMB
	 gR6SuVuHK316g==
From: Brian Masney <masneyb@kernel.org>
Subject: [PATCH b4 0/2] review: fix agent review so that it works properly
 with git worktrees
Date: Mon, 02 Nov 2026 16:15:15 -0500
Message-Id: <20261102-b4-review-tui-git-worktree-v1-0-35a925d92023@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXYhCbGgVxEfzDqtq9DKJrVC6
 d1N7eM/DN9CGabIdG4WMnw06zjU8IeG5HEberDea1NwofXeBU6Rtx9mLpNyr4Xn0V7FAJaTTxL
 FofNHqsDb0On3j18oRbruW57SE1I2ldb1B/pAuL6CAAAA
X-Change-ID: 20261102-b4-review-tui-git-worktree-c91bc4c0ef15
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Maxime Ripard <mripard@kernel.org>, 
 Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-7426f
X-Developer-Signature: v=1; a=openpgp-sha256; l=645; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=tQ08iWJO252KXeAXib6zdL5lB1hYIaiYFybhaStFaQI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJe/E0N1LtxWzlhjvrGR8yH+xJDhPhezq6tOMcUfDa7r
 J1Nf7JpRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNRqmX4H1ewc+5DvVXnWKzW
 5EzUvnfPoXD7xUwvtfv/WzZrxRYusmVk+OaiyWXH8DGWWePo/0NPbeccTYzerzJ3SuaMzO/SS7i
 lOQE=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a minor cleanup that fixes it so that the agent review works
properly with git worktrees.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
Brian Masney (2):
      review: look up git directory using b4.git_get_common_dir()
      review: update agent-reviewer.md to take into account git worktrees

 misc/agent-reviewer.md   | 22 +++++++++++++++-------
 src/b4/review/_review.py |  7 +++++--
 2 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
change-id: 20261102-b4-review-tui-git-worktree-c91bc4c0ef15

Best regards,
--  
Brian Masney <masneyb@kernel.org>


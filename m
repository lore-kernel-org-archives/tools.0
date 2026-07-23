Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC03E1D13
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795619; cv=none; b=cFptKJa9L6/iSrGiH+X6otfhBrquRulMpXVGbYnwWWRZtOX/E8KGpHBiLG/4/rRPqfYo5qnDeLNkEK/NGDts2LTEGAX0IH0eKyt2hnHE248wokx++i4pi3WgNUU3Kg+ne2BgCb1trvaliOq5m5Gk3RE/KZn9wUL5EW2hLKrgrl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795619; c=relaxed/simple;
	bh=q2EKCJtLtL1i+W7hKqRmB3wQQ8pSWPV1Z3n/uzQFggo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eFVbCTYqaAE8bV+HQUxJRIHo6xk/iFr+asKgteok89Gmb1YQb9urxZxYWqHXVe5pL8GeH6K8tPmbf12UloKnt2VvF+zOADR+qw/DhvtoTiP8/ENAkiHUrfoDUR/cMQjOkO+IJ0WrVcnVavJPcEyqYsb0DvVeeVcKZr45ehC3WkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnKiG41Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnKiG41Y"
Received: by smtp.kernel.org (Postfix)
	id 91FE81F00A3A; Thu, 23 Jul 2026 08:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3C01F000E9;
	Thu, 23 Jul 2026 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784795618;
	bh=F/YgD1FgT8ok3rrFYCQGjlnp8RNc7IBD0HwegJ4mAyo=;
	h=From:Subject:Date:To:Cc;
	b=fnKiG41Y+TCWWdxIdmBb3q36LH8ouNUs9mw8Cm5+lDE2umaNbtcaQyh+5HK2jWndm
	 qLVwSZVelufwKyybIuCa3Ev7XXHXUy/9ogzcSGGWErXjMmqTPMiFkW9e3S3ZolW5RM
	 rGyFX07Tox5iXjotJR2DwGBxqNmAmYlplhsS8mm3c62UkGWEiLZaiZKnMHaETLb/Kp
	 S7tvBLlO1cRTuvuLUYCopICSMJgcwz/JAmdYDDuh2HF54ysYXkOLbozwZs249Pz5Zv
	 Zfbsl1gd1nmHUBWla8cMOmC/yT4u0iTjJfHWBqKE86eSr4DlGctxp1Qiu01BhRBwb0
	 ZjYrXwZ9RY52w==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/2] review-tui: don't gpg-sign throwaway test-apply
 commits
Date: Thu, 23 Jul 2026 10:33:34 +0200
Message-Id: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7RYWoC/yWMSQ7CMBAEvxLNmZHikAX4SsTBNkNiFtuaMZui/
 B0bjlXqrgWE2JHAoVqA6enEBZ9BbSqws/YToTtlhqZu+npotvgKfEXTYiJJOsbbB30QN3m01HX
 Dridl1B7yPTKd3fuXHsG0cPw7eZgL2VSaZWW0EBrW3s5F3bUkYljXL2X9sb+ZAAAA
X-Change-ID: 20260723-work-b4-testapply-nosign-ce55786e1b19
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 "str = 'test"@example.com'
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=brauner@kernel.org;
 h=from:subject:message-id; bh=q2EKCJtLtL1i+W7hKqRmB3wQQ8pSWPV1Z3n/uzQFggo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQlXnww8dsfO47S3iMS7NWs1/IFT3/4VrrfpaDq7GmZi
 fYZNkEXOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZyoZzhf8qnKWfmbEj5K2to
 PNVRdO/3LQWvchvri7Rv3+ec8v/Mp6mMDNOE/iXM3bb4e6KFsIfv0ufmlQrqnLWV+xbPXvw7d5L
 1YVYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The take/rebase/target/base modals check whether a series applies
cleanly by running a real git-am into a temporary worktree and rebase
additionally probes with a cherry-pick. The four modal probes run from
worker threads while the TUI keeps the terminal.

With commit.gpgsign=true and pinentry-curses git tries to sign every
probe commit. pinentry then pops up on the tty that Textual owns in raw
mode. The TUI repaints over the PIN dialog and its input reader swallows
the keystrokes and so gpg never gets the PIN and the apply hangs. With a
card-backed key this reproduces on every take.

The probe commits are discarded together with the temporary worktree
so signing them is pure waste. Let's pass -c commit.gpgsign=false to all
five probes. The rebase cherry-pick runs under suspend() and so cannot
deadlock. But its commits are just as throwaway. Real applies (checkout,
take, rebase, merge) are unaffected. They run with the TUI suspended,
where pinentry works, and keep signing per the user's configuration.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (2):
      review-tui: don't gpg-sign throwaway test-apply commits
      tests: guard the test-apply probes against gpg signing

 src/b4/review_tui/_modals.py       |  20 +++++--
 src/b4/review_tui/_tracking_app.py |   7 ++-
 src/tests/test_tui_tracking.py     | 113 +++++++++++++++++++++++++++++++++++--
 3 files changed, 131 insertions(+), 9 deletions(-)
---
base-commit: 0e65f947e4f98a3c48a47f280a86dd23845259b0
change-id: 20260723-work-b4-testapply-nosign-ce55786e1b19


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0F3B3BE7
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489713; cv=none; b=d7TBJOl8s3KTLK0aiQGAkhRnTCZbirJgZrSGBhwWDPKQwu63bV4fn6VZTTFGL1QpsqHkIpIMwTPd7+kPT8SYZxl3LMuEfTusFwQYGciDI/2Z3panhFZ3LxvO7xRDJ1glKl6DhLskVQrd1qMWyp0RBYa1SFFudSLhodIBlS2EB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489713; c=relaxed/simple;
	bh=KjUUzbNvMRMi7E97ENvj4g1Of6jWsL6T/jKR2JpNz4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYoMX8W/9n+b3Ut5bYPn5pkx22q2tXfcQb5Yghn2xePT+303MsNBDelQLMeLCiZhAYVIv6P3EG9bAUT3nBuRn9HNdHNI83r/PonqqOTYZWE9mruM4CkI7D87y9M7r6SmgLLy+1wTkXMEVSo90OftBr/C3CcLR26Bia2nh3l7Auc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LA4aptqz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LA4aptqz"
Received: by smtp.kernel.org (Postfix)
	id 610491F00A3A; Fri, 31 Jul 2026 09:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943001F000E9;
	Fri, 31 Jul 2026 09:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489712;
	bh=MLjk7tH3dp+nGAFduwi4iN3oC5xudDnfAVXVAo4ezt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LA4aptqzVGbVA3XfPwxkjscyHvoedwNus5LI91kr+IK64RnMYxJRhb1v8GBlD5aa/
	 UN2U63fhOKpywaEc36iU37uNVOjqoDMBIl6fvE35DjGM5NbrC28ifUg/O1IQARU/BA
	 LAM7yXWAACyAmuo9keLpdnpnaNFV1BCiFpLR2JRfEUbB1vC7Ta0gaCJeP0939WxZN3
	 rd7ke4SqgQzdofcq9Rp+UYtdua6Eh8iw+B50k9H5MeGQb5sARmlSBOKXiG32L7tW6c
	 pbUXhamyYAlcKC+sn5RKKJT5Y3ClkW7lNRvrjDdNFl/GKEBi0exY7wephsv7W1F72B
	 tkOwFM8T2JQ6A==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:20 +0200
Subject: [PATCH b4 21/27] review-tui: only put back a branch b4 checked out
 itself
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-21-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3092; i=brauner@kernel.org;
 h=from:subject:message-id; bh=KjUUzbNvMRMi7E97ENvj4g1Of6jWsL6T/jKR2JpNz4o=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrtZ9y/Pqb44HS1c9KXPD2n/A1T3Ht7v9i/L3PkS
 nm5tvGqdZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkWigjw4Pep9oCP5QbLydP
 a/rJGKj4Z8rlms9lpwLKtj6fHLB+306GfzqRV/w4pjrOCnxxqM7o+0SGBZqde1Mn+M6deOzOFB5
 9e2YA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The branch to restore is read once when the TUI starts and checked back
out when it exits, whether or not b4 is what moved HEAD in between. A
review session can sit open for hours, suspended into an editor or a
shell, and the worktree it runs in is shared with the user's other
terminals. Switch branches in one of those, come back and quit the TUI,
and b4 helpfully checks out the branch you left hours ago.

Make both places that restore check first. run_tracking_tui() only
undoes a checkout that landed on a review branch, since that is the only
kind either app makes. ReviewApp only undoes its own if HEAD is still on
the review branch it put there.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_entry.py      | 10 +++++++++-
 src/b4/review_tui/_review_app.py |  7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index ece97da..6dc71a4 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -174,9 +174,17 @@ def run_tracking_tui(
         # This covers two cases:
         # - ReviewApp checked out the review branch (shell suspend/agent)
         # - TrackingApp checked out a new series via create_review_branch
+        # Both land on a review branch, and that is the only case we may undo.
+        # Anything else means the user moved HEAD themselves -- possibly hours
+        # ago, from another terminal sharing this worktree -- and the branch
+        # recorded when we started is stale, not something to check back out.
         if original_branch:
             current = b4.git_get_current_branch(topdir)
-            if current and current != original_branch:
+            if (
+                current
+                and current != original_branch
+                and current.startswith(b4.review.REVIEW_BRANCH_PREFIX)
+            ):
                 logger.info(
                     'Checking out %s and starting tracking UI...', original_branch
                 )
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 778a8f6..0982f55 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -2164,6 +2164,13 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         """Switch back to the original branch after shell/agent use."""
         if not self.branch_checked_out or not self._original_branch:
             return
+        # Only undo our own checkout. If HEAD is no longer on the review
+        # branch we left it on, something else moved it -- the shell we just
+        # suspended into, or another terminal in the same worktree -- and it
+        # is not ours to move back.
+        if b4.git_get_current_branch(self._topdir) != self._branch:
+            self.branch_checked_out = False
+            return
         ecode, _out = b4.git_run_command(
             self._topdir, ['checkout', self._original_branch], logstderr=True
         )

-- 
2.53.0


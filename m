Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B035BDC2
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795621; cv=none; b=AybJZhO4EdaxGfU3yqHvgKtBWur5+ajIS399x2EFC+JdLZ1H25iMbL0bPUhiPCSv9GvFILcPfZ49VEcTvnweEpVNIhsI+i9eEjGzfCTF/zYN3zL12gyP9aoN7z8hrVq/netqTSWQtMkCKy3fPaJIFfaP7Yyv/Gn/iQzAxmvutXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795621; c=relaxed/simple;
	bh=Q8URl3qhn91LTNOh3jSlHQiSjD3ssIRPjyoePJJOk2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEh4FcrknPyE6khd/r4kFnpr7twLVbdF4etugVmXV+CLumBoLLZpGOD2VsoL2bYaZzBthh+xZHxS+l3pAm0Bd78/cFjnTmItleqLyftqnU8CbcZKDzJO3Cd2DWVQ1kD/GwU80nzOkPHhIlD/SOxBEML4b4xvev7d+VzQv/EGRy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDOlbSJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDOlbSJP"
Received: by smtp.kernel.org (Postfix)
	id E6F511F00A3A; Thu, 23 Jul 2026 08:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AB21F000E9;
	Thu, 23 Jul 2026 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784795619;
	bh=ZhrjuU2Zoi5ccaNwIzEt+Az+9TxBQ1hFoYpp6Dj7qns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oDOlbSJPSwzVaJlx37r/UWjM4sYtNzLbz1jiDdulc1PiObuyernXqJTbRcPu50JVP
	 AjElM67oKpXGvamiAb7KTebVvpXr0sQ+9hETLMxhfhhA/7gnAsZFe9SSdHyHCaDj+H
	 hS1CkEIqGOTBVD8/hBTYUY4+qagQHfS8t7rZ9p4Ul81jaM5KkBJPkUP2+fc+tjLscY
	 KZDdxHMuSFuzqJ6lBdZ3My0fJ5vHeTkJSJniG1Qr1KgmMT975PMpoOl3n6gUN9WkRI
	 NIMQlNUCL4XHAUX/NEkDyi4O6J220KM/gohr+61zWXRp32c6rubdt+U3v570w6/DuV
	 aMmd9NbcrBxUw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 23 Jul 2026 10:33:35 +0200
Subject: [PATCH b4 1/2] review-tui: don't gpg-sign throwaway test-apply
 commits
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-work-b4-testapply-nosign-v1-1-a7cb7105e06f@kernel.org>
References: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
In-Reply-To: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Q8URl3qhn91LTNOh3jSlHQiSjD3ssIRPjyoePJJOk2w=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQlXny4qUTry6Y9B16aWDYs+eqtFzPrk7wGj7ZJ6qL92
 U8v7cl831HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCR99WMDPsMfx1S3hcjs/j6
 j0cdrmFczzqDNWvrRdLmitj9/WY04x0jwxeJTeue3fZhsIq9f1T1sFBFWMuGwIWvbi0N5Ctz7FG
 tZwMA
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
 src/b4/review_tui/_modals.py       | 20 ++++++++++++++++----
 src/b4/review_tui/_tracking_app.py |  7 ++++++-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 51e6b4e..0a0c943 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -1066,7 +1066,10 @@ class TakeConfirmScreen(ModalScreen[bool]):
                     ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    ecode, out = b4.git_run_command(gwt, ['am'], stdin=ambytes)
+                    # No signing: gpg would prompt while the TUI owns the tty.
+                    ecode, out = b4.git_run_command(
+                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                    )
                     if ecode > 0:
                         for line in out.splitlines():
                             if line.startswith('Patch failed at '):
@@ -2057,7 +2060,10 @@ class RebaseScreen(ModalScreen[bool]):
                     ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    ecode, out = b4.git_run_command(gwt, ['am'], stdin=ambytes)
+                    # No signing: gpg would prompt while the TUI owns the tty.
+                    ecode, out = b4.git_run_command(
+                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                    )
                     if ecode > 0:
                         for line in out.splitlines():
                             if line.startswith('Patch failed at '):
@@ -2327,7 +2333,10 @@ class TargetBranchScreen(ModalScreen[Optional[str]]):
                     ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    ecode, out = b4.git_run_command(gwt, ['am'], stdin=ambytes)
+                    # No signing: gpg would prompt while the TUI owns the tty.
+                    ecode, out = b4.git_run_command(
+                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                    )
                     if ecode > 0:
                         for line in out.splitlines():
                             if line.startswith('Patch failed at '):
@@ -3044,7 +3053,10 @@ class BaseSelectionScreen(ModalScreen[Optional[str]]):
                     ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    ecode, out = b4.git_run_command(gwt, ['am'], stdin=ambytes)
+                    # No signing: gpg would prompt while the TUI owns the tty.
+                    ecode, out = b4.git_run_command(
+                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                    )
                     if ecode > 0:
                         # Extract just the "Patch failed" line
                         for line in out.splitlines():
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 7e7f142..594ecef 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -3310,7 +3310,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     )
 
                 # Try cherry-picking the commits
-                gitargs = ['cherry-pick', f'{base_commit}..{series_tip}']
+                gitargs = [
+                    '-c',
+                    'commit.gpgsign=false',
+                    'cherry-pick',
+                    f'{base_commit}..{series_tip}',
+                ]
                 ecode, out = b4.git_run_command(gwt, gitargs, logstderr=True)
                 if ecode != 0:
                     logger.warning('Series does not apply cleanly to %s', target_branch)

-- 
2.53.0


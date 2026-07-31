Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633937F8CB
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535189; cv=none; b=fly3UVr+6mUGNnzTddUYt0CKejpwbOyikuLEJAplKsDyQqMkrrm55LBDuH30AQ83FEBK+P+x9Dy0HvzPEURdeevkDwHO2xX1y2jk6DUUWy6j3ZHyPVYTHf++mLdsOqoILiDqxB0qs+qix7rpI0T1l8Gr6QzH70zbhu9BqYkNLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535189; c=relaxed/simple;
	bh=XFfNZFp1BwkxYmCVzaBCMW5RpuaRI5QMoeVzE2tlkIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNsHMAmz6/FI0YP5Xlol4VTuTw6ucoMB3qwRXGnNDmKnIjtcBklS+yMnvA93Is22iKOM//xgztUqz/Yl4fNFNJcv7CgnlINDykxufWCSlAOwkpDtXcXYINtTUAQZ3i4S1G8YqUDGejxq/H838tmllNHj3ovmoYul411mjzEKw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3qTmtwP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3qTmtwP"
Received: by smtp.kernel.org (Postfix)
	id 62BAC1F00ACA; Fri, 31 Jul 2026 21:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944F31F00AC4;
	Fri, 31 Jul 2026 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535184;
	bh=RzCZIDEjdo5uf/9FOqh/mXRdVRG0oJgPk0QR3oWt1hU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G3qTmtwPlDvWbBclS4buX6+uvXefkDvOm88+4XuiEpptj00+B1KC8wEkTMl2LxtO1
	 Qlhc/jw6s9lssi9AJzyD0lm+mnkUMJQGscnWLQuScVqr7rOJ7GXGWHLgK3F8vH71x2
	 J0X3tEo2i9F7d2vB50NpOSLH0y8h7+cHGoEBU1bnK3xfcSL5Rt+XGkzacCYAe4D5eU
	 ekfON94UjB33gOQcYilUNo1h6qjkWB5Ej7CAg2Php09lFI/A6sNnAxefVL4gC2QHrG
	 +4UBxtXIuBbIKR8zo5VlReqaRlph8NIybAtUnHOgX4iqhztLL8w8TOFwQmwMdp/bIt
	 Flf1ij6FoStMg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:23 +0200
Subject: [PATCH b4 v2 42/44] tests: cover a failed checkout leaving the
 tracking list standing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-42-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5323; i=brauner@kernel.org;
 h=from:subject:message-id; bh=XFfNZFp1BwkxYmCVzaBCMW5RpuaRI5QMoeVzE2tlkIs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs09bOX96Hj48ojanj9Xi6ferLnGHOn9/lf4FvUjj
 Oc/L8ua3VHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjAR8bWMDB1nji0Tm/1h3an9
 zCvc1tksXnPA2vNo5CUtXe0vK5IPT1vKyPB06rJl/f/zboZKP2ZWuyp6OKL27e+kvEMNX++l1QT
 L93AAAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Both routes into create_review_branch() report a failure and leave
the app standing. Backing out of the conflict shell must still create
nothing.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 104 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 25bf13a..5a8b914 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4405,6 +4405,110 @@ class TestUpdateRevisionWorkflow:
         assert b4.git_branch_exists(gitdir, upgrade_branch)
 
 
+class TestCheckoutFailure:
+    """A series that will not apply costs the series, not the session."""
+
+    @staticmethod
+    def _checkout(app: TrackingApp, dies: Any) -> None:
+        """Run _do_checkout with a create_review_branch that raises *dies*."""
+        series = {'change_id': 'checkout-fail', 'revision': 1, 'message_id': 'm@ex.com'}
+        with (
+            patch.object(
+                app, 'suspend', return_value=__import__('contextlib').nullcontext()
+            ),
+            patch('b4.review_tui._tracking_app._wait_for_enter'),
+            patch('b4.git_fetch_am_into_repo'),
+            patch('b4.review.create_review_branch', side_effect=dies),
+        ):
+            app._do_checkout(_make_mock_lser(revision=1), series, 'HEAD', b'mbox')
+
+    @pytest.mark.asyncio
+    async def test_the_exit_a_failed_create_reports_with_is_caught(
+        self, gitdir: str
+    ) -> None:
+        """create_review_branch() exits rather than raising, and SystemExit is
+        not an Exception, so it used to unwind through the suspend and out of
+        the key handler -- taking the session down over one series."""
+        app = TrackingApp('test-checkout-fail')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            self._checkout(app, SystemExit(1))
+            await pilot.pause()
+            assert app.is_running
+
+    @pytest.mark.asyncio
+    async def test_a_create_after_a_resolved_conflict_is_caught_too(
+        self, gitdir: str
+    ) -> None:
+        """The branch used to be created a second time from inside the
+        conflict handler, where the handler beside it cannot reach: an except
+        block is not covered by its own siblings."""
+        app = TrackingApp('test-checkout-conflict')
+        created: List[str] = []
+
+        def _die(topdir: str, branch: str, *a: Any, **kw: Any) -> None:
+            created.append(branch)
+            raise SystemExit(1)
+
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with (
+                patch.object(
+                    app, 'suspend', return_value=__import__('contextlib').nullcontext()
+                ),
+                patch('b4.review_tui._tracking_app._wait_for_enter'),
+                patch(
+                    'b4.git_fetch_am_into_repo',
+                    side_effect=b4.AmConflictError('/tmp/wt', 'conflict'),
+                ),
+                patch('b4.resolve_am_conflict_in_shell', return_value=True),
+                patch('b4.review.create_review_branch', side_effect=_die),
+            ):
+                app._do_checkout(
+                    _make_mock_lser(revision=1),
+                    {'change_id': 'checkout-conflict', 'revision': 1},
+                    'HEAD',
+                    b'mbox',
+                )
+            await pilot.pause()
+            assert app.is_running
+        # The resolve leads into the one create, not a second copy of it.
+        assert created == ['b4/review/checkout-conflict']
+
+    @pytest.mark.asyncio
+    async def test_an_abandoned_conflict_creates_nothing(self, gitdir: str) -> None:
+        """Backing out of the conflict shell leaves the series untouched."""
+        app = TrackingApp('test-checkout-abandon')
+        created: List[str] = []
+
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with (
+                patch.object(
+                    app, 'suspend', return_value=__import__('contextlib').nullcontext()
+                ),
+                patch('b4.review_tui._tracking_app._wait_for_enter'),
+                patch(
+                    'b4.git_fetch_am_into_repo',
+                    side_effect=b4.AmConflictError('/tmp/wt', 'conflict'),
+                ),
+                patch('b4.resolve_am_conflict_in_shell', return_value=False),
+                patch(
+                    'b4.review.create_review_branch',
+                    side_effect=lambda _t, b, *a, **k: created.append(b),
+                ),
+            ):
+                app._do_checkout(
+                    _make_mock_lser(revision=1),
+                    {'change_id': 'checkout-abandon', 'revision': 1},
+                    'HEAD',
+                    b'mbox',
+                )
+            await pilot.pause()
+            assert app.is_running
+        assert not created
+
+
 class TestLoadSeriesCaching:
     """Tests for _load_series batching and caching."""
 

-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A63DE423
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389924; cv=none; b=ChMe3LOTIj+PPyaTH9nrDtQpuJXzhnhUxZDgBciw/GhNRhsKpX3jtGJIQSG74wZrFkkmGQeSMqY0RQsqDh3tzKsiGScIaOYqqA42uLIJ7u2WTbPZjnYnwzVIWEOebTu7g79q75KePmsg4ngGnlSDlkkbwp7eNVqXgTPP+fHaQD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389924; c=relaxed/simple;
	bh=FruY43eCsGu3vpUUny73ewj7Rx7YDx/+3HVzeHDo9/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/qIvMVks1URuyUhmHwrRFvQ0UZkorSsFYaUVJlwPJK3uKE82bhOxOG9+QrDcC0ckpHtM1ZvHADl8Q9UcBJfuy3/zDkxnuddcrZR12VXLziVhtFtw3UN8coyPQvarU8pnp7JROiwnY1/ijBAA+NLfrGx1bOPozNR65RD++6PHxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxBwC/nP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxBwC/nP"
Received: by smtp.kernel.org (Postfix)
	id 777DF1F00A3A; Thu, 25 Jun 2026 12:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30B41F000E9;
	Thu, 25 Jun 2026 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389923;
	bh=lL0siYn7A+UbSNqOysNiGBgRZo4pk67Jht/YNM5odsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gxBwC/nPCVD2C7ZoigLjwANEZpizIfJN564rMR0j01PMouk09yu7ZP8t82HKHN8ah
	 yIecpK0A9S/iMf2G63/w41SdQWEiQ0kst9R1YMEblBRkfX46tBC9WStoFu4LwIGki0
	 XueD8+qcM50zydlCN3u9xo2NEGiJa6rp5bKdWWzCbvMW/wbegjgLxWO+ZMf5xGo+Vr
	 lvICYyxCjFqFle5d9nOG+FBYM/fKBehaDWA/IH0L6NdoW9lGBcnbYEPtyzWU6MDJD/
	 dQqUVdE8vrcntkz1IubPlWd3Rm2bsAkHtzNKkeIHo/G8WjeGn6CGgl/MeSw0FJ0t2U
	 xj0BduQcSzOOQ==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 25 Jun 2026 14:18:37 +0200
Subject: [PATCH RFC 2/2] review-tui: test the cherry-pick+merge take method
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-2-8ba4809d048a@kernel.org>
References: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
In-Reply-To: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-d56bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=4164; i=brauner@kernel.org;
 h=from:subject:message-id; bh=FruY43eCsGu3vpUUny73ewj7Rx7YDx/+3HVzeHDo9/g=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTZysyPXKQ248i6nzstNj6LblhZM0PC0aJAZ59vnEKDr
 ZvV1QN6HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABMRkGX4Z3Y8gL9rRz/jypgn
 v3+fv7LGfGpl3t/G93+nTmLiU1lqNYuRYYFww8ZF1+3bRfo9BHY1RzImsbu7aqsZMv+6d7rI1vQ
 cEwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the merge-pick routing added in the previous commit:

  - the patch picker always opens for merge-pick, even when no patch is
    skipped (like cherry-pick, unlike a plain merge);
  - the chosen method survives the picker, so the selection reaches
    _show_take_confirm as merge-pick with the picked indices;
  - _on_take_final dispatches merge-pick to _do_take_merge rather than
    the git-am path, so the "+merge" half actually produces a merge.

These extend TestMergeTakeSkipRouting, which already exercises the
plain-merge skip-trimming path.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 66 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index b7d543b..853f405 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -2807,6 +2807,72 @@ class TestMergeTakeSkipRouting:
         assert args[0] == 'merge', 'method must remain merge, not cherry-pick'
         assert kwargs.get('cherrypick') == [1, 3]
 
+    def test_merge_pick_always_opens_picker(self, gitdir: str) -> None:
+        """cherry-pick+merge offers the picker even with nothing skipped."""
+        branch = self._setup_branch(gitdir, 'mp-noskip-1', skip_indices=[])
+        pushed, confirmed = self._route(gitdir, branch, 'merge-pick')
+        assert len(pushed) == 1
+        assert isinstance(pushed[0], CherryPickScreen)
+        assert not confirmed
+
+    def test_merge_pick_confirmed_preserves_method(self, gitdir: str) -> None:
+        """cherry-pick+merge keeps method='merge-pick' through the picker."""
+        from types import SimpleNamespace
+
+        branch = self._setup_branch(gitdir, 'mp-keep-1', skip_indices=[])
+        app = TrackingApp.__new__(TrackingApp)
+        confirmed: list[Any] = []
+        app._show_take_confirm = (  # type: ignore[method-assign]
+            lambda *a, **k: confirmed.append((a, k))
+        )
+        take_screen: Any = SimpleNamespace(
+            method_result='merge-pick', target_result='master'
+        )
+        pick_screen: Any = SimpleNamespace(selected_indices=[1, 3])
+        app._on_cherrypick_confirmed(
+            True,
+            'cid',
+            branch,
+            take_screen,
+            {'subject': 'Test'},
+            pick_screen,
+        )
+        assert len(confirmed) == 1
+        args, kwargs = confirmed[0]
+        assert args[0] == 'merge-pick', 'method must remain merge-pick'
+        assert kwargs.get('cherrypick') == [1, 3]
+
+    def test_take_final_routes_merge_pick_to_merge(self, gitdir: str) -> None:
+        """cherry-pick+merge executes the merge path, not git-am."""
+        from contextlib import nullcontext
+        from types import SimpleNamespace
+
+        branch = self._setup_branch(gitdir, 'mp-final-1', skip_indices=[])
+        app = TrackingApp.__new__(TrackingApp)
+        calls: list[str] = []
+        app.suspend = lambda: nullcontext()  # type: ignore[method-assign]
+        app._invalidate_caches = lambda *a, **k: None  # type: ignore[method-assign]
+        app._load_series = lambda *a, **k: None  # type: ignore[method-assign]
+        app._do_take_merge = (  # type: ignore[method-assign]
+            lambda *a, **k: calls.append('merge')
+        )
+        app._do_take_am = (  # type: ignore[method-assign]
+            lambda *a, **k: calls.append('am')
+        )
+        take_screen: Any = SimpleNamespace(target_result='master')
+        confirm_screen: Any = SimpleNamespace(accept_series=True)
+        app._on_take_final(
+            True,
+            'merge-pick',
+            'cid',
+            branch,
+            take_screen,
+            {'subject': 'Test'},
+            confirm_screen,
+            cherrypick=[1, 3],
+        )
+        assert calls == ['merge'], 'merge-pick must run _do_take_merge'
+
 
 @patch('b4.review.tracking.get_review_target_branches', return_value=['master'])
 class TestTargetBranch:

-- 
2.53.0


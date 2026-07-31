Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7B372EC5
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535161; cv=none; b=tK3ruVwCjqgMZwg9lPvjrf9wffIU5gcbyBRlt3e9l4rbw5NM5zuafGxhUhnSxB4DlQvJhpcoOoXzUuhGaaIWtOMLe3uYjZV3e0we5cvt8xCJAP4qPAoLMNQ1xMnNHb3/rfq44H52WRKQ4cqJ+sATnhhBnPG8Fg6pZXN/dlMqGHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535161; c=relaxed/simple;
	bh=eCpQcMCfoQOWAqeYZMAE3g8AEpPN8MO4q15ome/Dxpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2XycjelgT/EJBzr9r6RskoCYVUcCb0mZ53lt3CbBBKYj8+0i4Qfbdzo/OQhIeZx915IY+/ulwdg+CD8uEg+Yq6Qx86L0DcSwV13A9znYbiNUkI7b7/voTlA1HMhfPTowsd9cvOuB5vhAdjy2jyc2CVzX6ATqR2mV/bUSd8WMFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLjKE/BS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLjKE/BS"
Received: by smtp.kernel.org (Postfix)
	id 8B5681F00ADB; Fri, 31 Jul 2026 21:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F301F00AC4;
	Fri, 31 Jul 2026 21:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535160;
	bh=TtDjJREgR2aLwcoE5yIOk1izy+cFYfS1tH/C1tTbVls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FLjKE/BSnleZgczMfJ5UjMyQ06wdj3pCh7lCZ3ZlF9yCyyRRfj/apjdWLhDaMLYm3
	 5+E5vBZsDIYLCuWM4Qcks5CUA3M5wChAVoYcIWG5LBLWEozyIgvGe2TKmJ+GruVoLL
	 /Dgyc0FqPEc30z98vsuYAW1faQiLk3kjbYTSckvM/xFXanK/BX4RYUz2P4j8ClV05k
	 kpypjKkAuW6ft/gAPNjZUHDlywILLl8MHJ5spKbiTAiITk6j+QIDHlH932xLr8YoA6
	 DG5p/syYhihwi32ve2o4Z4mWmUTgVNllE4gPK8U0SMJ0HOBIk8hydd2p90jdiTQzsC
	 D/2CyXiMptkBg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:03 +0200
Subject: [PATCH b4 v2 22/44] tests: cover an editor failure leaving the
 review TUI standing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-22-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=brauner@kernel.org;
 h=from:subject:message-id; bh=eCpQcMCfoQOWAqeYZMAE3g8AEpPN8MO4q15ome/Dxpg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1uv9Yst44tRnLZ9I0+Fy+p79lUe8c63SWqQKuZU
 3BbwuMjHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABP5OY2R4eqhFt9v+y5fK2Fa
 cTLwRS3LJMcwFfVZvNc4t+6cu3Xny2sM/0M1dD/8eVWsv0/lvFra661zrjzvLLrLbP33dMyC6wd
 PbOIHAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

An edit_in_editor() that raises leaves the app running, notifies the
failure, and stores no half-formed reply.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_review.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index b19e3f9..e168b24 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -589,3 +589,40 @@ class TestRenderDetailLines:
         assert 'ERROR: trailing whitespace' in out
         # Only the finding line itself, no indented context underneath.
         assert '\n    ' not in out
+
+
+class TestEditorFailure:
+    """A broken editor is reported, never fatal."""
+
+    @pytest.mark.asyncio
+    async def test_editor_error_does_not_tear_down_the_app(self, gitdir: str) -> None:
+        """An exception from the editor used to unwind out of the key handler
+        and kill the app, taking the rest of the session's unsaved review
+        state with it."""
+        import contextlib
+
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'editor-error', ['patch 1']
+        )
+        session = _build_session(gitdir, branch)
+        app = ReviewApp(session)
+        my_email = str(session['usercfg']['email'])
+
+        def boom(*args: Any, **kwargs: Any) -> bytes:
+            raise RuntimeError('editor exploded')
+
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._selected_idx = 1
+            with (
+                mock.patch('b4.edit_in_editor', side_effect=boom),
+                mock.patch.object(app, 'suspend', lambda: contextlib.nullcontext()),
+                mock.patch.object(app, 'notify') as notified,
+            ):
+                app.action_edit_reply()
+                await pilot.pause()
+
+            assert app.is_running
+            assert notified.call_args.kwargs.get('severity') == 'error'
+            reviews = app._patches[0].get('reviews', {})
+            assert not reviews.get(my_email, {}).get('reply')

-- 
2.53.0


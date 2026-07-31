Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B38D3B3C11
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489712; cv=none; b=gKFZmJ/5dxCt1Gkj6QtMdJFFghn7gwH2nqWjFf34yaW0BY/b9yxETr4213lBRPlyTvGCQh5VyrPyG5VJW9ugnGe4xna2T4Q+bVoCjk/ePK2h2t7gT9eTPEKXMiD5v+icLlvsPKiWEUEovH/nIpbrRgfCbIqThllEcsp8tK2IQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489712; c=relaxed/simple;
	bh=bwZ5Xtn+dNjuL+naQaFynhLxYIobkeAxw5a5vvG6Lwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b89S9mZn1TVHRYU8Vdrd3c1w4JFqTV1GpKuxJHyWxb0Julh9t4AY8FGeL5NtgUk7HsjSP27T32RgWr0FLZllav9cgYvOhrgDQfa4etw6TSe7Hjx7Jdh4Kp+H1la/UYVw7lQmbKG1elM0ERKokdxhlnhVlK5nE+/S3n+e6kGva4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oicw5gIJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oicw5gIJ"
Received: by smtp.kernel.org (Postfix)
	id 398D81F00A3E; Fri, 31 Jul 2026 09:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7721F000E9;
	Fri, 31 Jul 2026 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489711;
	bh=l/Z4sZI8Yst/w7weZOQG9dp9+dPmfJWzYvla+q5Z0kM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Oicw5gIJCZPxls+a+QxvsSktL1dY7bf38dMUfhUtTaBNpj8kHWbWYllXTZVPanQub
	 HpiJw6mZZAVpzdRBdPA46t/+jyPAAetzXfXnDEjJRXgVljVYdLM2EvTWCtyAS3SRyw
	 9q67NpXOH+14vo7tLCCWgAcLzznTUtu4hWFOdHvFHkA5QMmvGi+5eH6U9SCPfk+K9C
	 MTAENiOkr8mVdRXg1PZo+2zvQmgj1xv0Nth5UeIxuAv5FeqKDbsyQsbXiRY0TUFa7Q
	 XrMD2XEoJQ1jgqVtHQg2astYPJVwSvC9nW0vEo7+l15wCOhjMsMRvtz/njozDj6vEu
	 PDbrzRQU1dEpw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:19 +0200
Subject: [PATCH b4 20/27] tests: cover an editor failure leaving the review
 TUI standing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-20-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2283; i=brauner@kernel.org;
 h=from:subject:message-id; bh=bwZ5Xtn+dNjuL+naQaFynhLxYIobkeAxw5a5vvG6Lwc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIod+c075eseE9bJidPabu/sP6+2hotR1L6Npywoq
 tVc5WRlRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwESeT2H4K2kUENhvO5mLISrY
 yabnftakwyFyhmsfbr8SqyN5xvfVU4Z/6lOKJq5uMJ08dcnO3N1PvBre3a7buv6Y7hveKxsiD4n
 oMQAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Drives the reply editor with an edit_in_editor() that raises and checks
that the app is still running afterwards, that the failure was notified
and that no half-formed reply was stored.

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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3653B3BE7
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489719; cv=none; b=VV49w124A65mlHv60fdcvU2jTlmsM3q/SjDyPJv5aSruhU5T/VbNE/C3apKIt2qTs1+/+EMg3Kvc7hPVH4Hywt0hf4xMBXn+ZPgPPwjleuCaEo76b2EKiE3qEhJM4lyHOtfNC3iSumNlCbDudu4kEVf+pn4P/KkU9v6Gv6VKRH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489719; c=relaxed/simple;
	bh=1j6Wm+esklWJ/Gxy4KMljuo7qx4olanR3skNx+tU8ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/VgWyyP4KATWGbfTf+snCesDENlDA2gL9FL8ykt1a4QCoFFQlvys26XeC9jcaWwSmIW4jcVEyJHBUhfwumJbAvD4rYWcY4zrTHwKwwHKrwGNXMpeMSdJBxg/bW4VnEhi0gcYK3PyX9c84262n3wBjjv3Tjd+mtPtJZmtwUgpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQl31yzs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQl31yzs"
Received: by smtp.kernel.org (Postfix)
	id 3A9021F00A3D; Fri, 31 Jul 2026 09:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8151F000E9;
	Fri, 31 Jul 2026 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489718;
	bh=Y5eIMS9AJ5QHyRWQneSLVwS5zSoBnpuDKlsLCN8cWxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MQl31yzs1KVCMvUy0N6iU3TAwE38MtZMucQla1Xnu6o3h+9JoQ0KvVwF02Xowgrwc
	 Fcq6eoY4fChAceTgXxwTNE45gcq5ZEUsif/w77NG6YcHaAmIX12589Q17siIHLkAcU
	 U/+nJYD6BRr3AufEW7B++Aod2UfOYBgqV11gp1FsjvcKBN7PE+qOSO3KxBbcLRppuH
	 +07fSdE15gU43Vnw8HpMNXZ6Asu4IRyPaGfK1hPr9w+sbzGWelru5YCOdL7M0qrGij
	 v35aJWFKfY0f15HqIPX6KQ0q7iVIaLR6IaQ4XHraC6+YR4dpMGJFdZfHxaI5goT9K6
	 mJO4Q5jEu70VA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:25 +0200
Subject: [PATCH b4 26/27] tests: cover the review send's post-send
 bookkeeping
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-26-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=4762; i=brauner@kernel.org;
 h=from:subject:message-id; bh=1j6Wm+esklWJ/Gxy4KMljuo7qx4olanR3skNx+tU8ZE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIqtysrUEt+15uvx1/t64rY9fb7i/+QvM6ZEnHVqW
 btj3tpdkh2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQATWa3D8D9zX6DehASvZX17
 7k7zevh/QvTVQ7vks2+EGHZtLIxIsGVg+Gf9Q8t9Xc1rfib15v8/DSNe82juLnKffpu5IvXvvRa
 9OgYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Both halves of what the maintainer is told once the mail is gone. A
tracking write that fails quietly is reported instead, and neither that
nor a bookkeeping step that raises comes back as "Send failed".

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_review.py | 87 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index 8ac6113..8250e1e 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -662,3 +662,90 @@ class TestBranchRestore:
         app._restore_original_branch()
         assert b4.git_get_current_branch(gitdir) == 'master'
         assert app.branch_checked_out is False
+
+
+class TestSendBookkeeping:
+    """Everything after the SMTP handoff is bookkeeping, and bookkeeping must
+    never be able to claim the send failed."""
+
+    async def _send(
+        self, gitdir: str, change_id: str, **patches: Any
+    ) -> Tuple[List[str], bool]:
+        """Drive action_send with a staged review and a send that succeeds.
+
+        *patches* are extra mock.patch.object() keyword targets on the app.
+        Returns (notification texts, app still running).
+        """
+        import contextlib
+
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, change_id, ['patch 1']
+        )
+        session = _build_session(gitdir, branch)
+        app = ReviewApp(session)
+        my_email = str(session['usercfg']['email'])
+
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._patches[0]['reviews'] = {
+                my_email: {
+                    'reply': 'Looks good.',
+                    'trailers': ['Reviewed-by: Me <me@example.com>'],
+                    'patch-state': 'done',
+                }
+            }
+            with contextlib.ExitStack() as stack:
+                stack.enter_context(
+                    mock.patch.object(app, 'suspend', lambda: contextlib.nullcontext())
+                )
+
+                # SendScreen is a confirmation dialog; answer yes for it.
+                def _confirm(screen: Any, callback: Any = None) -> None:
+                    assert callback is not None
+                    callback(True)
+
+                stack.enter_context(mock.patch.object(app, 'push_screen', _confirm))
+                stack.enter_context(mock.patch('b4.get_smtp', return_value=(None, 'm')))
+                stack.enter_context(mock.patch('b4.send_mail', return_value=1))
+                stack.enter_context(
+                    mock.patch('b4.review_tui._review_app.mark_outgoing_seen')
+                )
+                stack.enter_context(mock.patch.object(app, '_mark_patches_answered'))
+                for name, kwargs in patches.items():
+                    stack.enter_context(mock.patch.object(app, name, **kwargs))
+                notified = stack.enter_context(mock.patch.object(app, 'notify'))
+                app.action_send()
+                await pilot.pause()
+            texts = [str(call.args[0]) for call in notified.call_args_list]
+            return texts, app.is_running
+
+    @pytest.mark.asyncio
+    async def test_unwritable_tracking_is_reported_but_not_as_a_send_failure(
+        self, gitdir: str
+    ) -> None:
+        """save_tracking_ref() returns False rather than raising, so this used
+        to pass unnoticed -- and the next session would offer the same reviews
+        as unsent, inviting the maintainer to send them twice."""
+        texts, running = await self._send(
+            gitdir, 'send-notracking', _save_tracking={'return_value': False}
+        )
+        assert running
+        assert any('Sent 1 review email' in t for t in texts)
+        assert not any('Send failed' in t for t in texts)
+        assert any('could not record it' in t for t in texts)
+
+    @pytest.mark.asyncio
+    async def test_raising_bookkeeping_is_not_a_send_failure(self, gitdir: str) -> None:
+        """The mail is on the list by then; reporting 'Send failed' would tell
+        the maintainer to send it again."""
+        texts, running = await self._send(
+            gitdir,
+            'send-bookkeeping-boom',
+            _mark_patches_answered={
+                'side_effect': OSError(28, 'No space left on device')
+            },
+        )
+        assert running
+        assert any('Sent 1 review email' in t for t in texts)
+        assert not any('Send failed' in t for t in texts)
+        assert any('No space left on device' in t for t in texts)

-- 
2.53.0


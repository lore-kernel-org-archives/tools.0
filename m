Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522021A6800
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535171; cv=none; b=JR1ZJFO1XKAjvhIlFnExyVh7uWIGZ5Q68V+Jfif8ZBjfy0QqG66GZ8gO1v3CcVyXG7q8YLFgSa9gyy2JvWWM5VPFu/oWD2Rq4DRjxlcz62LvjlsDnMfbLyMS6n/7FsjRs5GZl++ZKXEswtAjriLzYMgPNyS+jT/8wkhulQ9TeCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535171; c=relaxed/simple;
	bh=T+z/tTcET9VDdn2bHR0e2Nrm54EybPxl5nYci49Ff4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gICAdYBxD4esHEnFyLfp2nKUUaYKC7fmcQ12AEPo6QJziTTv4UKNbaark2eKhcGguZ3VyP54LiU7x6vzmYTtudC6OcoXKvvpaocMiT4ctn0tn4otXRrDtGO8er5a/CPCgNcwg/iEwOoCTeYmuHqNQ8tNh4jPs9FRRJzoO7cfk6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abiNxbn4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abiNxbn4"
Received: by smtp.kernel.org (Postfix)
	id F1C921F00ACA; Fri, 31 Jul 2026 21:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7C91F00AC4;
	Fri, 31 Jul 2026 21:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535169;
	bh=Dy+7Jujxrm4igia8NCQpUoYCRtxeCHh/kxy9qOz/quw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=abiNxbn4TuEHQNyKC5m2AbgvU7H/+YW0Razk+Mo0DW+Z/KVROwKDQgC6YdeXyxIHC
	 IA9nodISC8AIAkwWjfbqmRmwiBFNIafajWmf+fBTvChV5G2xyA7W/nnN0YwVs9Rl1c
	 SOxa9xssBl2eddzETfQt7T52yjp0fuLP4zSlgLYbhn0azB+xDeMZX0TZKr5lau8yde
	 bj1Ze/0DJg3BwseeRW7Z2ykkvTAQobI55uHIOZJAEVrfuAa+ISgAzrSvVgjeG+X/W3
	 wvvvr7CZ9Xz92BfK9OerORKv2L5TrrerJk/0D7RrKbIARam9cxK/eD76BMyVmoE8/8
	 cXxev/8kiu7UA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:11 +0200
Subject: [PATCH b4 v2 30/44] tests: cover the review send's post-send
 bookkeeping
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-30-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5373; i=brauner@kernel.org;
 h=from:subject:message-id; bh=T+z/tTcET9VDdn2bHR0e2Nrm54EybPxl5nYci49Ff4s=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1pzwv8vWyZmYfPlwjvWLFNbjUJNo/K8r9FpVw5b
 7TdvOB6RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQsVzD8Lzpzal+LV0H2nw3z
 hC3uP5MN/3nEr6tqUfuOHRpcBbf8PjH807wjbOy5YN8e3gVBRwWubejz+/cq1dLf9NvH12FqO84
 nMgIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A tracking write that does not land is reported, a bookkeeping failure
never reads as "Send failed", and a dry run records nothing.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_review.py | 100 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index 3d78ec3..ec7e9e5 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -691,6 +691,106 @@ class TestBranchRestore:
         assert app.branch_checked_out is False
 
 
+class TestSendBookkeeping:
+    """Everything after the SMTP handoff is bookkeeping, and bookkeeping must
+    never be able to claim the send failed."""
+
+    async def _send(
+        self, gitdir: str, change_id: str, dryrun: bool = False, **patches: Any
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
+        session['email_dryrun'] = dryrun
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
+                stack.enter_context(
+                    mock.patch('b4.send_mail', return_value=0 if dryrun else 1)
+                )
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
+
+    @pytest.mark.asyncio
+    async def test_a_dry_run_is_not_recorded_as_sent(self, gitdir: str) -> None:
+        """--email-dry-run logs the mail and stops there.  Stamping
+        sent-revision on it would make the next real session treat these
+        reviews as already sent and offer none of them."""
+        texts, running = await self._send(gitdir, 'send-dryrun', dryrun=True)
+        assert running
+        assert any('Dry-run' in t for t in texts)
+        assert not any('Sent 0 review email' in t for t in texts)
+
+
 class TestSessionRestorePoint:
     """_prepare_review_session() records where HEAD has to go back to."""
 

-- 
2.53.0


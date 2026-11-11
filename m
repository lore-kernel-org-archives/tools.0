Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426191;
	b=aXFN0R/DP6c2NHAwFQvKP4rFnlMnCr7jXIx+0rsVAXdHzveE9zkqLImpRCt3fVFNhYAu
	 qlVKl2sGam5DDOA+nDGalZu+4xonMySROf2mUW+bcjBzovuKGUL0k/tYo1lbERNKbLPkU
	 1DeKN9Eq6c76peNRIypna+4PoTDD9Qf7fZzOrR25Q2N4uzRFivtuK2RLh0vhyReWx/9Uu
	 h+uS7SVzbYiMkswfmA2xC6oicWvpSdL0ejxrpfL1ViKIUy1DcPNaXHScRcGzOglvaT2tr
	 Q5lY9avCWMY8yWeNbWRdpNjozPZYyT9l+fhjN4IinFcCiAbDE+DkeHGQzSSNPdDF4Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426191;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=A3V8WFjwEn7DA9IegRdH5BOhv9GAQ72+kQB7gmbBpKg=;
	b=Yf+KJ1pkX0CAyhshsCaOHaFcVYuk/a7XAyeHcmT0i1XPVuOKPYT4eMAf+m2ne6nWaJkG
	 d9mzt48v+CuejnbMRR8G96tkvhjPpqr7pyRBjqTEMitn+o2V8PZEv4qx05BobDkJTAzGJ
	 iBLnceCMnJ5fpNeymJ1t30260Jo13I946EJizLCKuAOhdgE9t04D7//n6i0GRa3khW9pg
	 qmGkejI2Wvt53EaBwOPxpx/2JjuXnymWkLJazcJFIXSnviDato0wOu6JEHZlt4rtoGu+X
	 ir9X9Cx1WX2f9KzXi319FmpamXEK2sNeGJwZC0lPN//xim65Xn+5FmIynneAjEIPDug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eb62NFvF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2338606A33A
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eb62NFvF
Received: by smtp.kernel.org (Postfix)
	id C4DE51F00A0C; Wed, 11 Nov 2026 19:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EEC1F00A08;
	Wed, 11 Nov 2026 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426191;
	bh=A3V8WFjwEn7DA9IegRdH5BOhv9GAQ72+kQB7gmbBpKg=;
	h=From:Date:Subject:To:Cc;
	b=eb62NFvFGKFdf6uTzx1docSh83evaPkkWUJJP126V+1wvfaH7aaOGD8oiuryezpzq
	 AaU3gcowo9M5+1qzAcBSDVcZoPZ3L4G4aXRprzRYHdxeZCL0zTuPQ3kb6bqaqftSJw
	 pUothr7gGR0QiSywdaVDD4uqgzIif6dGnywu05wL8qPPFiINuPIpZLKJM64lPLgSSL
	 bllfMhHfiRDuk8ncRYMaQwP/FzHa7/Ivwk6smvVYb2kBffYwmD8VOJmkQ+PBtLR9Dw
	 SPAOwKlexdEXbMCF5CyUwntsRWSERQ5Q8YJrL8t4yAMu6uFxYzVhZqeJFAD8Xoj/Hi
	 Y7ONxEVZJzdPw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Nov 2026 19:37:28 +0000
Subject: [PATCH b4] review: Send replies for skipped patches
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261111-reply-skipped-v1-1-2bdb48ab8e3c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPfD9GoC/yWMQQ6CMBREr0JmbRNpkQVXIS5sO+gXgk0/GA3h7
 lad3ZvkvQ3KLFR01YbMp6g85gL1oUK4XeYrjcTCsEfb1mUmM01vo6OkxGicPXkX6UM7NChOyhz
 k9ev18A3O/09Xf2dYviHs+wekVoR3dQAAAA==
X-Change-ID: 20261111-reply-skipped-325b3debc6f4
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13068; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LdcYtPpdd2SvT4wnR3EDmKHeL4z1jfDdU7KpClp3U5E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+HPUpvCGTtPtL8rmVbSdOTc95qapTKG+k+PK07gK5H
 IWcQ4dqO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRW+EM/32yO+exXr7L9j5Y
 XZ4hwkuDV2VTQZjer9mSx1fvFTn3JYLhn86Px6mKeizLLWv3B5Wt+nG46cf7B0Zfrs1899eimEf
 /BwMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently when a patch is skipped this includes for email mode, even if
a reply has been written.  This seems unhelpful, if the user has written
something it seems reasonable they would want to send it and if they
want to not send a reply they can always delete it.  Skipping also
affects patch application and one reason a user might reply to a patch
is to explain why they are not taking it.

Change the behaviour so that replies are also sent for skipped patches.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 docs/maintainer/review.rst       |  5 +--
 src/b4/review/_review.py         | 12 +++----
 src/b4/review_tui/_review_app.py | 22 +++---------
 src/tests/test_review.py         | 20 +++++------
 src/tests/test_tui_review.py     | 77 +++++++++++++++++++++++++++++++++++++++-
 5 files changed, 96 insertions(+), 40 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5a3e9d9..78a1108 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -760,7 +760,7 @@ Unchanged   ``≡``   —       Patch identical to prior revision (auto, on upgr
 External    ``±``   —       External reviewers have inline comments (auto)
 Draft       ``✎``   —       You have comments, a reply, or a nack trailer (auto)
 Done        ``✓``   ``d``   Review complete, include in outgoing emails (also auto)
-Skip        ``✕``   ``x``   Intentionally skipped, exclude from outgoing emails
+Skip        ``✕``   ``x``   Intentionally skipped; any replies are still sent
 ==========  ======  ======  =======================================================
 
 .. |sp| unicode:: U+0020
@@ -788,7 +788,8 @@ bold, skipped and unchanged patches appear dimmed. Press ``H`` to hide
 skipped patches from the list entirely — useful for large series where
 many patches are irrelevant to your review.
 
-Skipped patches are automatically excluded when sending review emails.
+Any unsent replies, comments, or trailers on skipped patches are still
+included when previewing and sending review emails.
 When taking patches via cherry-pick, skipped patches are pre-deselected
 in the patch selection dialog.
 
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f0..3e1027e 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3914,8 +3914,8 @@ def collect_review_emails(
 ) -> List[email.message.EmailMessage]:
     """Collect review emails to send for the given series.
 
-    Only sends the maintainer's own reviews, not agent or other
-    reviewers' data.
+    Only sends the maintainer's own unsent reviews, not agent or other
+    reviewers' data. Skipped patches can still have replies to send.
     """
     usercfg = b4.get_user_config()
     my_email = str(usercfg.get('email', 'unknown@example.com'))
@@ -3923,11 +3923,7 @@ def collect_review_emails(
 
     # Cover letter review (maintainer only)
     cover_review = series.get('reviews', {}).get(my_email, {})
-    if (
-        cover_review
-        and cover_review.get('patch-state') != 'skip'
-        and cover_review.get('sent-revision') is None
-    ):
+    if cover_review and cover_review.get('sent-revision') is None:
         msg = _build_review_email(series, None, cover_review, cover_text, topdir, None)
         if msg is not None:
             msgs.append(msg)
@@ -3935,7 +3931,7 @@ def collect_review_emails(
     # Per-patch reviews (maintainer only)
     for idx, patch_meta in enumerate(patches):
         patch_review = patch_meta.get('reviews', {}).get(my_email, {})
-        if not patch_review or patch_review.get('patch-state') == 'skip':
+        if not patch_review:
             continue
         if patch_review.get('sent-revision') is not None:
             continue
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 1e70bc6..2eec9b5 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -857,22 +857,6 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                 else None
             )
 
-        target = self._series if display_idx == 0 else patch_meta
-        if target and b4.review._get_patch_state(target, self._usercfg) == 'skip':
-            total = len(self._commit_shas)
-            label = 'cover' if display_idx == 0 else f'{display_idx}/{total}'
-            my_review = b4.review._get_my_review(target, self._usercfg)
-            skip_reason = str(my_review.get('skip-reason', ''))
-            if skip_reason:
-                viewer.write(
-                    f'[dim]Patch {label} is marked as skipped: {skip_reason}[/dim]'
-                )
-            else:
-                viewer.write(
-                    f'[dim]Patch {label} is marked as skipped — no email will be sent.[/dim]'
-                )
-            return
-
         if not review or not (
             review.get('trailers') or review.get('reply', '') or review.get('comments')
         ):
@@ -1805,15 +1789,17 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             try:
                 self._reply_sent = True
                 self._tracking['series']['status'] = 'replied'
-                # Stamp sent-revision on every non-skip review so that
+                # Stamp sent-revision on each review whose email was sent so that
                 # if this series is later upgraded to a newer revision,
                 # the upgrade step can detect which reviews were already
                 # sent and auto-skip the unchanged patches.
                 my_email = str(self._usercfg.get('email', 'unknown@example.com'))
                 current_rev = int(self._series.get('revision', 1))
+                replied_to = {msg['In-Reply-To'] for msg in msgs}
                 for target in [self._series] + list(self._patches):
                     review = target.get('reviews', {}).get(my_email, {})
-                    if review and review.get('patch-state') != 'skip':
+                    msgid = target.get('header-info', {}).get('msgid', '')
+                    if review and f'<{msgid}>' in replied_to:
                         review['sent-revision'] = current_rev
                 if not self._save_tracking():
                     # Silence here means the next session offers these reviews
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index e40dd35..0f22c00 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -4212,10 +4212,11 @@ class TestCollectReviewEmails:
             pytest.param(False, id='normal-patch-review'),
         ],
     )
+    @pytest.mark.parametrize('patch_state', ['', 'done', 'skip'])
     def test_sends_unsent_review(
-        self, _cfg: mock.Mock, _build: mock.Mock, on_cover: bool
+        self, _cfg: mock.Mock, _build: mock.Mock, on_cover: bool, patch_state: str
     ) -> None:
-        msgs = self._collect(on_cover, {})
+        msgs = self._collect(on_cover, {'patch-state': patch_state})
         assert len(msgs) == 1
 
     @pytest.mark.parametrize(
@@ -4225,10 +4226,8 @@ class TestCollectReviewEmails:
             pytest.param(True, {'sent-revision': 1}, id='cover-with-sent-revision'),
             pytest.param(False, {'sent-revision': 1}, id='patch-with-sent-revision'),
             # The upgrade step sets patch-state=skip AND skip-reason on
-            # unchanged patches whose review was already sent (combo A+B
-            # fix).  Both the skip filter and the sent-revision filter
-            # independently prevent re-sending; this row exercises the
-            # skip-state path.
+            # unchanged patches whose review was already sent. The
+            # sent-revision filter must still prevent re-sending them.
             pytest.param(
                 False,
                 {
@@ -4238,15 +4237,14 @@ class TestCollectReviewEmails:
                 },
                 id='patch-auto-skipped-after-upgrade',
             ),
-            # Explicit skip state (manually set, no sent-revision) is honoured.
             pytest.param(
-                False,
-                {'patch-state': 'skip'},
-                id='skip-state-without-sent-revision',
+                True,
+                {'sent-revision': 1, 'patch-state': 'skip'},
+                id='skipped-cover-with-sent-revision',
             ),
         ],
     )
-    def test_skips_already_sent_or_skipped(
+    def test_skips_already_sent(
         self,
         _cfg: mock.Mock,
         _build: mock.Mock,
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index e164bf6..6ccbfd9 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -21,7 +21,7 @@ import pytest
 
 pytest.importorskip('textual')
 
-from textual.widgets import ListView
+from textual.widgets import ListView, RichLog
 
 import b4
 import b4.review
@@ -690,6 +690,81 @@ class TestBranchRestore:
         assert app.branch_checked_out is False
 
 
+class TestSkippedReplies:
+    """Skipped patches can still have replies to preview and send."""
+
+    @pytest.mark.asyncio
+    @pytest.mark.parametrize('on_cover', [False, True], ids=['patch', 'cover'])
+    @pytest.mark.parametrize('dryrun', [False, True], ids=['send', 'dryrun'])
+    async def test_skipped_reply_is_previewed_and_sent(
+        self, gitdir: str, on_cover: bool, dryrun: bool
+    ) -> None:
+        import contextlib
+
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir,
+            'skipped-reply',
+            ['patch 1', 'patch 2'],
+            series_extra={'header-info': {'msgid': 'cover@example.com'}},
+        )
+        session = _build_session(gitdir, branch)
+        session['email_dryrun'] = dryrun
+        my_email = str(session['usercfg']['email'])
+        target = session['series'] if on_cover else session['patches'][0]
+        reply = 'Please fix this before I can take it.'
+        target['reviews'] = {my_email: {'patch-state': 'skip', 'reply': reply}}
+        empty_target = session['patches'][1]
+        empty_target['reviews'] = {my_email: {'patch-state': 'skip'}}
+
+        app = ReviewApp(session)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._show_content(0 if on_cover else 1)
+            await pilot.press('e')
+            await pilot.pause()
+            viewer = app.query_one('#diff-viewer', RichLog)
+            assert reply in '\n'.join(line.text for line in viewer.lines)
+
+            def _confirm(screen: Any, callback: Any = None) -> None:
+                assert callback is not None
+                callback(True)
+
+            with (
+                mock.patch.object(app, 'suspend', contextlib.nullcontext),
+                mock.patch.object(app, 'push_screen', _confirm),
+                mock.patch('b4.get_smtp', return_value=(None, 'sender@example.com')),
+                mock.patch('b4.send_mail', return_value=0 if dryrun else 1) as send,
+                mock.patch('b4.review_tui._review_app.mark_outgoing_seen'),
+                mock.patch.object(app, '_mark_patches_answered'),
+            ):
+                app.action_send()
+                send.assert_called_once()
+                msgs = send.call_args.args[1]
+                assert len(msgs) == 1
+                assert msgs[0]['In-Reply-To'] == f'<{target["header-info"]["msgid"]}>'
+                assert reply in b4.LoreMessage.get_payload(msgs[0])[0]
+
+                _cover, saved = b4.review.load_tracking(gitdir, branch)
+                saved_target = saved['series'] if on_cover else saved['patches'][0]
+                saved_review = saved_target['reviews'][my_email]
+                assert saved_review['patch-state'] == 'skip'
+                assert 'sent-revision' not in saved['patches'][1]['reviews'][my_email]
+                if dryrun:
+                    assert 'sent-revision' not in saved_review
+                    unsent = b4.review.collect_review_emails(
+                        app._series,
+                        app._patches,
+                        app._cover_text,
+                        app._topdir,
+                        app._commit_shas,
+                    )
+                    assert len(unsent) == 1
+                else:
+                    assert saved_review['sent-revision'] == saved['series']['revision']
+                    app.action_send()
+                    send.assert_called_once()
+
+
 class TestSendBookkeeping:
     """Everything after the SMTP handoff is bookkeeping, and bookkeeping must
     never be able to claim the send failed."""

---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261111-reply-skipped-325b3debc6f4

Best regards,
--  
Mark Brown <broonie@kernel.org>


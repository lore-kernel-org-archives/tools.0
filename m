Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597BF36197F
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535146; cv=none; b=RjbRbQWEcMFp1ewshvF0IM5c6fWPm0EwRZykUurGEefA2cbu15YopNR+GqQGEy8gXfOAJkcfp/TZXJbZJEBSRGjVvdTaop7D+gAS0gnQMZvMYqoRSpLI/AqcmK97sR6rI7A5iRJTbgbZQEcAGMWUnjeCeetZaXA2bqYHk326BxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535146; c=relaxed/simple;
	bh=7al8fVw9zGCDzpVY0So0hxmerKPvUKep3cQ+xTQllow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiBJlJdgsqF+m4lcvB1ZiMVV56PdMG5mMubbWUL+Nps/0GkSoVD9JgCfpEzr80h0p7QuzmfHzHYb62y/JdM/rMr4AYK3IWh/JZgpiQrxNT8bW0L2tsvRynlVqabSdKDTFOhNJqvVYpCXO6XIQWdxJrz6xHGmP1huDLT4sjEE5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9FaVGNL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9FaVGNL"
Received: by smtp.kernel.org (Postfix)
	id 1ACC31F00ACF; Fri, 31 Jul 2026 21:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8841F00AC4;
	Fri, 31 Jul 2026 21:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535145;
	bh=t2Ia+FfjDafkTgS9FznEfsaU8djx+6U2o/XFHVTPnWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j9FaVGNLLAS4C5ffZFdw+MxpaDrKSTezwdKAefuN35iG71qs+mL+iSS2bSBJ8ucRQ
	 TrUQW1+RzaVwanV70ydM7rnLs1iWJYPi6yCAWejCUS6cvM+zvkPOoKCI+vIDH9wGZJ
	 ++HvrXrDmvdInW2MTFoWJCvi5xtGrzqUyo+xtYuOUXvxA7zqYldqZl6Fnehlpz8ZfJ
	 jO3Y8z996g6psn0NZzYmkdIv3jVHyEopQ/CcVA935OjO+KNUP06MGdeDxWK1TYKGj9
	 9OrN019PeSBWhDlkgxfGI7uNn3qPIcXOZ1vjgWaxQE5SeNhXQ7cfBT6XQNAfp0T7EG
	 SSvIJ28Og61Ew==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:50 +0200
Subject: [PATCH b4 v2 09/44] tests: cover the thank-you send's post-send
 bookkeeping
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-9-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=4583; i=brauner@kernel.org;
 h=from:subject:message-id; bh=7al8fVw9zGCDzpVY0So0hxmerKPvUKep3cQ+xTQllow=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs0WOrs+9qrLb/EvjqfWHOBXCWueysOa9DD6g12b7
 A5vJdb5HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPZb8rI8PrWYvGtTxjFryhe
 aD1Qmnx81/Zgi63Pq7b/rLyTJBnGt5bhv/fWij7f4K0/7jF76e7USOxZxLfcTufkjf89N/iKoxu
 nMQMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The note is recorded as read at send time, a broken archive is not
reported as "Send failed", and a dry run records nothing.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 81 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 1212ab1..3e69621 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4495,6 +4495,87 @@ class TestTakeThankArchiveChain:
         assert not notices
 
 
+class TestSendThankMessage:
+    """Everything after a successful send is bookkeeping, and bookkeeping
+    must not be able to claim the send failed."""
+
+    def _send(
+        self, archive_raises: bool, dryrun: bool = False
+    ) -> Tuple[List[Tuple[str, str]], List[List[Any]]]:
+        """Drive _send_thank_message with a send that succeeds.
+
+        Returns (notifications as (message, severity), mark_outgoing_seen
+        calls).
+        """
+        import contextlib
+
+        notices: List[Tuple[str, str]] = []
+        seen_calls: List[List[Any]] = []
+        archived: List[str] = []
+        app = TrackingApp.__new__(TrackingApp)
+        app._email_dryrun = dryrun
+        app._patatt_sign = False
+        app._identifier = ''
+        msg = email.message.EmailMessage()
+        msg['Message-Id'] = '<thanks@example.com>'
+        series = {'change_id': 'send-1', 'revision': 1}
+
+        def _archive(self: Any, _series: Dict[str, Any]) -> None:
+            archived.append(str(_series.get('change_id', '')))
+            if archive_raises:
+                raise OSError(28, 'No space left on device')
+
+        with (
+            patch.object(TrackingApp, 'suspend', lambda self: contextlib.nullcontext()),
+            patch.object(TrackingApp, '_invalidate_caches', lambda self, cid: None),
+            patch.object(TrackingApp, '_load_series', lambda self: None),
+            patch.object(TrackingApp, '_archive_after_thanks', _archive),
+            patch.object(
+                TrackingApp,
+                'notify',
+                lambda self, message, severity='information', **k: notices.append(
+                    (str(message), severity)
+                ),
+            ),
+            patch('b4.get_smtp', return_value=(None, 'me@example.com')),
+            patch('b4.send_mail', return_value=0 if dryrun else 1),
+            patch(
+                'b4.review_tui._tracking_app.mark_outgoing_seen',
+                lambda msgs, dryrun=False: seen_calls.append(list(msgs)),
+            ),
+        ):
+            app._send_thank_message(msg, series, archive_after=True)
+        self.archived = archived
+        return notices, seen_calls
+
+    def test_marks_the_sent_message_seen(self) -> None:
+        """The thank-you is a reply into the series thread, so it comes back
+        from the list; recording it at send time keeps the badge dark."""
+        _notices, seen_calls = self._send(archive_raises=False)
+        assert len(seen_calls) == 1
+        assert seen_calls[0][0]['Message-Id'] == '<thanks@example.com>'
+
+    def test_failed_archive_is_not_a_send_failure(self) -> None:
+        """A broken archive must never read as 'Send failed': that tells the
+        maintainer to re-send a note that is already on the list."""
+        notices, _seen = self._send(archive_raises=True)
+        texts = [n for n, _sev in notices]
+        assert 'Thank-you message sent' in texts
+        assert not any('Send failed' in n for n in texts)
+        assert any('No space left on device' in n for n in texts)
+
+    def test_a_dry_run_is_not_recorded_as_thanked(self) -> None:
+        """--email-dry-run logs the note and stops there.  Marking the series
+        thanked -- and archiving it, which deletes the review branch -- would
+        spend a real series on a rehearsal."""
+        notices, seen = self._send(archive_raises=False, dryrun=True)
+        texts = [n for n, _sev in notices]
+        assert any('Dry-run' in n for n in texts)
+        assert not any('Thank-you message sent' in n for n in texts)
+        assert not seen
+        assert not self.archived
+
+
 # ---------------------------------------------------------------------------
 # take->merge conflict resolution (must never drop a non-empty commit)
 # ---------------------------------------------------------------------------

-- 
2.53.0


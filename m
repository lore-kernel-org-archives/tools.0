Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7913B1016
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489699; cv=none; b=HV4kD3l6MKjU9dK2Jwawew7B4bankaSLuIZF2kfsOwidibVAgnqOMhU+H0jSfHm5DfnjrqyBk9bhrR6hWAfR9f1XEFpz8vJic18Ceyd/I0k+sbYdeeCoaMqEnlROrgVtVLu4UABaVTNADn+4ndCQ9MJV+SW6fW+kWh1Ex0Kkonk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489699; c=relaxed/simple;
	bh=wx89m5p2qsJ+1TTzgd7Usoog8E57KnoI0RT/4jav8XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3xbAQuTAWSQZz0YwIOt6xWEbp1J4SWtBixWY+8rTIbb1u4UuKPN7mVrx3mzOPRvxVyG6AIqCbbSf20Xn9pW9nw9pmQxQb1kaJg1ogPCqoeHvx1bIXl+ee/4auA6mGQthLjwfs3HWtOPiwtBImR2/KteaAQw0mrxxr9o8ZsYtaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqeUEEzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqeUEEzS"
Received: by smtp.kernel.org (Postfix)
	id 6ACFA1F00A3A; Fri, 31 Jul 2026 09:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE991F000E9;
	Fri, 31 Jul 2026 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489698;
	bh=AAuubEUsZxJgOx2N6rPd4BZQAxcEig06Nurq3HzKbHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IqeUEEzS85v1bK4EXWIo3LOoSORI3E16BWG/EmjwNmvKkQKlTVSspk+zj+eEZNy2J
	 KuH0TguPM+Xu+DMkZzC7EjLKK+HvIwryyV8mmIiAPh2OTckwapVhRlIT42byqsu+u9
	 jsjXLsLtOeXasSq38ICGhP9sabM4vwej4rFBaa12njl+EgbVTgUkAP6N4nC8RbZnGn
	 rRVBg1AfizMbUXiHAGVlEQ/ai2V5bPxahkEuzWZxhgd40moHZqo/03NAgNgpdLYYlN
	 /CixmbBYtiFiVP+h10phSeY5WD+IrypDbcYkUsM/Rn6FqcNyfVTOS77EucHFKFTujx
	 My/7sfs1v8Mfw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:08 +0200
Subject: [PATCH b4 09/27] tests: cover the thank-you send's post-send
 bookkeeping
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-9-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3889; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wx89m5p2qsJ+1TTzgd7Usoog8E57KnoI0RT/4jav8XM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIpOZojKuNuiufxjt+j0eOaVxyw//NJN+ZXBE3ZE1
 mgFy/3ZHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPRnMnIsOq44FUJ2d3c5lvy
 5ZzOeqp/42zfPjVkyX5R4xUfOe+IWTH8z6pcGrI+dlKBld0mQ9vMmmPTzDrbJaLvhc+L5r55oae
 YCwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Both of these are about what the maintainer is told once the message is
already gone. The note is recorded as read at send time and a broken
archive is never reported as "Send failed".

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 67 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 1212ab1..57cfdc0 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4495,6 +4495,73 @@ class TestTakeThankArchiveChain:
         assert not notices
 
 
+class TestSendThankMessage:
+    """Everything after a successful send is bookkeeping, and bookkeeping
+    must not be able to claim the send failed."""
+
+    def _send(
+        self, archive_raises: bool
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
+        app = TrackingApp.__new__(TrackingApp)
+        app._email_dryrun = False
+        app._patatt_sign = False
+        app._identifier = ''
+        msg = email.message.EmailMessage()
+        msg['Message-Id'] = '<thanks@example.com>'
+        series = {'change_id': 'send-1', 'revision': 1}
+
+        def _archive(self: Any, _series: Dict[str, Any]) -> None:
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
+            patch('b4.send_mail', return_value=1),
+            patch(
+                'b4.review_tui._tracking_app.mark_outgoing_seen',
+                lambda msgs, dryrun=False: seen_calls.append(list(msgs)),
+            ),
+        ):
+            app._send_thank_message(msg, series, archive_after=True)
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
+
 # ---------------------------------------------------------------------------
 # take->merge conflict resolution (must never drop a non-empty commit)
 # ---------------------------------------------------------------------------

-- 
2.53.0


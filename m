Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278653B42D7
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489718; cv=none; b=cGgiSLCNFwQvKQP+4iSR6Fm4vO7uXBIi1R36Ixk6v+jiNQ0DNJo+/ps7/DFvSegSqk2V0u+cRp+fqrx7vbD75dYAahqmJKfVSH+GH1siKtTw/h724UnJ43ayUgmm7YpeTD8Ydxaeu62FodDgqhBbA8uDZTkFT3bG6uGbjmjh6yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489718; c=relaxed/simple;
	bh=5qWQOCBieFXmuGRfNOZcpE6u7Y2P2g+YtX7m7hTiR7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZq0ULyqsqMtV0lw8xX0dUwov5ICzvF0RBD/m9bKIZ3OsmngCrK2ELtcnQ2S5CfOroX8Hq7u5ZW2OxGYhHD1e4PnR3pIJwnzgJP6LCPE5WzjAsYZC7T71vWqB756pictMEBILsNgbSe+Wdu8TkKW+u5lF5QiFgYRIzrYsk0NcKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mmg1UJYE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmg1UJYE"
Received: by smtp.kernel.org (Postfix)
	id 124D61F00A3A; Fri, 31 Jul 2026 09:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BA81F000E9;
	Fri, 31 Jul 2026 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489717;
	bh=HTDJLulko+kxRAre33wgJypWk0jiJ6AKJFY9JFQaJPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Mmg1UJYE0vQW2aitsR1EMALtP/+Da/Ejc11MjjyM2J9+jd9x6vqsQpuA8n1qzy12N
	 gahO5iaBC5S2q+SopU2l/qH+tZ3IyzQjNtSuBO3wSm5sBNf44Owsej9efox9SnNEAI
	 gbLn+U7U5AXsP/sVXwsH7xRoyRVU0E/HK/ONLVfW042hDkh7zJDvDKw3ete+f8bpje
	 tQ61/s/MLrhobDpVUmQeySdxmLRv0onDSUPleU3J+jLqSjqMCfdbWpiiGOtQsdPVOq
	 xXwto7msBIBTS8YmWvsWqpDV8f9tpLG5ZrFwOL6INxm2CbsNnOFOBMUNzztuux8jsg
	 gRb+QtUZorzow==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:24 +0200
Subject: [PATCH b4 25/27] review-tui: keep post-send bookkeeping out of the
 review send error path
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-25-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=8593; i=brauner@kernel.org;
 h=from:subject:message-id; bh=5qWQOCBieFXmuGRfNOZcpE6u7Y2P2g+YtX7m7hTiR7w=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIqZdS3/Myttzo5PqndXCTlunr3ZybvXuaIhNmeqg
 V/RW/c5HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNxYWJkmPWJRYOdTXvb1E2X
 r+/13Se1vl55579jtdoBb9gFJ7x468rIcHppqManuy8lY1QTVqwR/J+1ddYXuVv3a1iW7G2MPz6
 /lhkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The same shape the thank-you path just lost. action_send() does the SMTP
handoff and everything after it -- the tracking write, the Answered
flags, the outgoing-seen record -- inside one try whose handler reports
"Send failed". The reviews are on the list at that point and we would be
telling the maintainer to send them again.

Here the bookkeeping mostly swallows its own failures, and that turns out
to be the worse half of the problem. _save_tracking() drops the bool
save_tracking_ref() hands back, so a tracking write that does not land is
reported as nothing at all. The next session reads the branch without a
sent-revision on any review, offers all of them as unsent, and the
maintainer sends the series twice.

Split the two. Only the SMTP call keeps that handler; once send_mail()
has returned we report the outcome and run the rest under its own, which
has to catch rather than propagate because this is a screen callback.
Pass _save_tracking()'s answer up and say so when it is False.

The two quick-reply paths get the same treatment. Nothing after the send
can raise there today, but a tight try is what keeps that true, and it
lets the branch that has already tested --email-dry-run stop passing it
on to a helper that would test it again.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_lite_app.py   | 19 ++++++-----
 src/b4/review_tui/_review_app.py | 74 ++++++++++++++++++++++++----------------
 2 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 951057f..51e1437 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -813,17 +813,18 @@ class LiteThreadScreen(ModalScreen[None]):
                     output_dir=None,
                     reflect=False,
                 )
-            if sent is None:
-                self.app.notify('Failed to send reply.', severity='error')
-            elif self._email_dryrun:
-                self.app.notify(f'Dry-run: reply to {lmsg.fromemail} logged, not sent')
-                self._mark_answered(node)
-            else:
-                mark_outgoing_seen([msg], dryrun=self._email_dryrun)
-                self.app.notify(f'Reply sent to {lmsg.fromemail}')
-                self._mark_answered(node)
         except Exception as ex:
             self.app.notify(f'Send failed: {ex}', severity='error')
+            return
+        if sent is None:
+            self.app.notify('Failed to send reply.', severity='error')
+            return
+        if self._email_dryrun:
+            self.app.notify(f'Dry-run: reply to {lmsg.fromemail} logged, not sent')
+        else:
+            mark_outgoing_seen([msg])
+            self.app.notify(f'Reply sent to {lmsg.fromemail}')
+        self._mark_answered(node)
 
     def action_back(self) -> None:
         if self._thread_nodes:
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 0982f55..1f38325 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1654,27 +1654,42 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                         output_dir=None,
                         reflect=False,
                     )
-                if sent is None:
-                    self.notify('Failed to send review emails.', severity='error')
-                else:
-                    self._reply_sent = True
-                    self._tracking['series']['status'] = 'replied'
-                    # Stamp sent-revision on every non-skip review so that
-                    # if this series is later upgraded to a newer revision,
-                    # the upgrade step can detect which reviews were already
-                    # sent and auto-skip the unchanged patches.
-                    my_email = str(self._usercfg.get('email', 'unknown@example.com'))
-                    current_rev = int(self._series.get('revision', 1))
-                    for target in [self._series] + list(self._patches):
-                        review = target.get('reviews', {}).get(my_email, {})
-                        if review and review.get('patch-state') != 'skip':
-                            review['sent-revision'] = current_rev
-                    self._save_tracking()
-                    self._mark_patches_answered(msgs)
-                    mark_outgoing_seen(msgs, dryrun=self._email_dryrun)
-                    self.notify(f'Sent {sent} review email(s).')
             except Exception as ex:
                 self.notify(f'Send failed: {ex}', severity='error')
+                return
+            if sent is None:
+                self.notify('Failed to send review emails.', severity='error')
+                return
+            self.notify(f'Sent {sent} review email(s).')
+
+            # The mail is out; everything below only records that. It gets its
+            # own handler so a bookkeeping failure is never reported as a send
+            # failure, and never escapes this screen callback.
+            try:
+                self._reply_sent = True
+                self._tracking['series']['status'] = 'replied'
+                # Stamp sent-revision on every non-skip review so that
+                # if this series is later upgraded to a newer revision,
+                # the upgrade step can detect which reviews were already
+                # sent and auto-skip the unchanged patches.
+                my_email = str(self._usercfg.get('email', 'unknown@example.com'))
+                current_rev = int(self._series.get('revision', 1))
+                for target in [self._series] + list(self._patches):
+                    review = target.get('reviews', {}).get(my_email, {})
+                    if review and review.get('patch-state') != 'skip':
+                        review['sent-revision'] = current_rev
+                if not self._save_tracking():
+                    # Silence here means the next session offers these reviews
+                    # as unsent and the maintainer sends them twice.
+                    self.notify(
+                        f'Sent, but could not record it on {self._branch}',
+                        severity='warning',
+                    )
+                self._mark_patches_answered(msgs)
+                mark_outgoing_seen(msgs, dryrun=self._email_dryrun)
+            except Exception as ex:
+                logger.debug('Post-send bookkeeping failed: %s', ex, exc_info=True)
+                self.notify(f'Sent, but recording it failed: {ex}', severity='warning')
 
         self.push_screen(SendScreen(msgs), _on_send_confirmed)
 
@@ -1751,15 +1766,16 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                     output_dir=None,
                     reflect=False,
                 )
-            if sent is None:
-                self.notify('Failed to send reply.', severity='error')
-            elif self._email_dryrun:
-                self.notify(f'Dry-run: reply to {entry["fromemail"]} logged, not sent')
-            else:
-                mark_outgoing_seen([msg], dryrun=self._email_dryrun)
-                self.notify(f'Reply sent to {entry["fromemail"]}')
         except Exception as ex:
             self.notify(f'Send failed: {ex}', severity='error')
+            return
+        if sent is None:
+            self.notify('Failed to send reply.', severity='error')
+        elif self._email_dryrun:
+            self.notify(f'Dry-run: reply to {entry["fromemail"]} logged, not sent')
+        else:
+            mark_outgoing_seen([msg])
+            self.notify(f'Reply sent to {entry["fromemail"]}')
 
     def _load_followup_msgs(self, msgs: List[Any]) -> None:
         """Parse msgs into follow-up comments and refresh the display."""
@@ -2240,9 +2256,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             self.notify('Agent review data loaded')
         self._restore_original_branch()
 
-    def _save_tracking(self) -> None:
-        """Save tracking data to the review branch."""
-        b4.review.save_tracking_ref(
+    def _save_tracking(self) -> bool:
+        """Save tracking data to the review branch.  True if it landed."""
+        return b4.review.save_tracking_ref(
             self._topdir, self._branch, self._cover_text, self._tracking
         )
 

-- 
2.53.0


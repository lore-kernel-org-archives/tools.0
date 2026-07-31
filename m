Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FA37C911
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535170; cv=none; b=k3Fc7ZEDY7ZGEtN9eN/STSTZBCbCSfMNxZNU17HSVzHS8EV19Fjb3vl3eWdWym2VsGrtTcl/418FFvMaVg1W7gJ6Ni6Za+CTbJZui0LUhVGCtLl4Y7I5dd2Dk6YqzO6rq+QVzCWwFp4TipJrbI40DY8La27YzpkiAFvMg/U7BPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535170; c=relaxed/simple;
	bh=eQPQPI0wRnLkCAtyiNOC//FN6YG+LgWtBhewlO78+tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jncXTpuHx63Sw49r4KCapYcofPxyJR6h7UOXYRm2qzP+CdNsxrgmf89u5I7ALP6yOMqae1ybXe53JguKNvI5oqbrbYet7XnUgVITJDf6xBocgWfB1YxOSWw3QWiiUJ3Y4TDTFTXJua9gQdbuGRb7Js2Xb6iEm3QpbdINy/MAO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcYNeyEk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcYNeyEk"
Received: by smtp.kernel.org (Postfix)
	id C8D6D1F00ACF; Fri, 31 Jul 2026 21:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050211F00AC4;
	Fri, 31 Jul 2026 21:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535168;
	bh=ZdE6k16dFvgJ3R85L8DPtDBhQrUTPbXNiCXfeFZL3CU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FcYNeyEk7+rRkB8WNWYZIpayYuPkbZZt77G+i3+M4taBTo9f2jxbV4qXu2Ji87Ua/
	 99h2s3SRUrizorq0TomJNTip9n3IYrZ3teXVpN1myb+X2Ny7z0FSsys6pIESvpeD4v
	 wr2dtK3N25bj3qRAm+9ItGeqDLZfE5Ol1cA9MWuAomS0DFv2HsTAHiEFNWzgtc08fo
	 x+slDY/kfB6iJHlcpdbINzaYZDGYRrQZBNa7RNzdnW1QncxMp50Uj7Kl00NylgcFNp
	 uLe80blDq3vSKX4b72mKN/cSPcQMpXG757M8IEfA57d/M9ODe5ohbhRJ70qg5UHsBP
	 8p8YirydONOIg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:10 +0200
Subject: [PATCH b4 v2 29/44] review-tui: keep post-send bookkeeping out of
 the review send error path
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-29-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=8204; i=brauner@kernel.org;
 h=from:subject:message-id; bh=eQPQPI0wRnLkCAtyiNOC//FN6YG+LgWtBhewlO78+tI=;
 b=kA0DAAoWkcYbwGV43KIByyZiAGptGpyiehRq5O8CXxGfsX+l5QHuG/fU5YM2jGWpR3Z8hVJs6
 4h1BAAWCgAdFiEEQIc0Vx6nDHizMmkokcYbwGV43KIFAmptGpwACgkQkcYbwGV43KKa8wD/TcAy
 Aq5ZGos0xJrEw/qde8c+0UES4DJDNhHcdlCz4/sA/jGKTgQlcvDxdzH9HAqfqC6d/YCnRTGcnFq
 axZrSKWoC
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

action_send() had the same shape the thank-you path just lost: the
SMTP handoff and everything after it under one handler that says
"Send failed". Worse, _save_tracking() dropped the bool from
save_tracking_ref(), so a tracking write that did not land was
swallowed and the next session offered every review as unsent again.

Keep only the SMTP call under the send handler, report a failed
tracking write, and stop --email-dry-run from stamping sent-revision
on reviews nobody received. The quick-reply paths get the same split.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_lite_app.py   | 19 +++++-----
 src/b4/review_tui/_review_app.py | 80 +++++++++++++++++++++++++---------------
 2 files changed, 61 insertions(+), 38 deletions(-)

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
index 9c9bf17..a409d34 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1657,27 +1657,48 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
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
+            if self._email_dryrun:
+                # Nothing went out, so there is nothing to record. Stamping
+                # sent-revision here would make the next real session treat
+                # these reviews as already sent and offer none of them.
+                self.notify(f'Dry-run: {len(msgs)} review email(s) logged, not sent')
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
+                mark_outgoing_seen(msgs)
+            except Exception as ex:
+                logger.debug('Post-send bookkeeping failed: %s', ex, exc_info=True)
+                self.notify(f'Sent, but recording it failed: {ex}', severity='warning')
 
         self.push_screen(SendScreen(msgs), _on_send_confirmed)
 
@@ -1754,15 +1775,16 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
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
@@ -2243,9 +2265,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
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


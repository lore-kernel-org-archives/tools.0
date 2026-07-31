Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF83314B9
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535145; cv=none; b=c+jYsfbBzMfsN+C6isXi2iybU5uPWpqhBZiwFuFBqpoOzw4rdvZDGswD2wc8p/2+oAU05DJypy43aYhXkWaHl2bQ4Fq2fdbLTzmIL3lWKFe3ibz52lp1OnFF8C12O9LU6prZCdn+YxW7+aM5dnbXN01tSgGAiYmzy1Lpgn912hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535145; c=relaxed/simple;
	bh=AStXy7dDYYFRk5qnqW4PScDmirS1a84XPr8t2cgnyig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7e3PjSPI+1OD80lPzv6vRHH8F3C9bdoof/unnKoXyptLmM0+4nRTCbozBNho8XsWPsJq65oyTNihNvS6Zl6e5ETY0AkbxUBlnufyu0PTsd8Oq7y6glaNV/1jjXeO3583L+lm+2aJFWQMgDRPpSfQmiv10FOUIFBVPTvl9S9rVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmKdTZ66; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmKdTZ66"
Received: by smtp.kernel.org (Postfix)
	id E61E71F00ACA; Fri, 31 Jul 2026 21:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D401F00AC4;
	Fri, 31 Jul 2026 21:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535143;
	bh=VyPGL8m3drZfwF5pnh5SRt3iO15rdoWGaLoxeizF0bw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RmKdTZ66YBKLiD6O3bThCC6mT2h5YRzYpplHqvdBlNn1LFl6CTFgPd9fj9mwftfR4
	 rdLGVf79EgTPsk6PdTI7rS9jygUMSyUtE2cAEoHXLeni0npdDyntOhwioNcSPBg9DU
	 VVj1Q9xw9X3VRxU/n5poxFaN/HJMwk5aHgLV93dbT6xRwsxcp+XCsY3+yfPh0eSn/a
	 vAFnYrHrpWXJn28RxnDfvMC+6od8zHAnayvp7XxAP6/P/5zE/gIjAQcYSdZaOdrcRe
	 BuCmLzjgK3yCNo5IHgqMIvJizWTugmYuEe66G4CV28xxrSJt/Eaa+doR9nbvNtY0nu
	 6t/a8i+sR6HtQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:49 +0200
Subject: [PATCH b4 v2 08/44] review-tui: keep post-send bookkeeping out of
 the send error path
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-8-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3798; i=brauner@kernel.org;
 h=from:subject:message-id; bh=AStXy7dDYYFRk5qnqW4PScDmirS1a84XPr8t2cgnyig=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2Ofx7yYUUWs8uhu2nv1Nzytrouc3wz60pnlZvaf
 1MGxYIXHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABMJ8Gb4pzeTqcmUNeuGtH79
 S863nWmFqkY5zx9MWrd1s+6bfdLX8hgZ3sczFz4WWLqt4NnHjEU7/e7IfzZfub6t+cT2A7dXNph
 /5AcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Sending a thank-you ran the SMTP handoff and all the bookkeeping after
it in one try whose handler says "Send failed", telling the maintainer
to resend a message that is already out. Keep only the SMTP call under
that handler. The bookkeeping gets its own, which must catch because
this runs from a screen callback.

send_mail() reports a dry run with a count of zero rather than None,
so --email-dry-run fell through and marked the series thanked and
archived it. Nothing went out, so record nothing.

Also mark the thank-you as read at send time via the shared helper.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index fb144a0..8d91b37 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -58,6 +58,7 @@ from b4.review_tui._common import (
     _wait_for_enter,
     display_width,
     logger,
+    mark_outgoing_seen,
     notify_quit_hint,
     pad_display,
     resolve_styles,
@@ -4999,10 +5000,27 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     output_dir=None,
                     reflect=False,
                 )
-            if sent is None:
-                self.notify('Failed to send thank-you message', severity='error')
-                return
-            # Update status to thanked
+        except Exception as ex:
+            self.notify(f'Send failed: {ex}', severity='error')
+            return
+        if sent is None:
+            self.notify('Failed to send thank-you message', severity='error')
+            return
+        if self._email_dryrun:
+            # Nothing went out, so there is nothing to record.  Marking the
+            # series thanked here -- and archiving it, which deletes the
+            # review branch -- would spend a real series on a rehearsal.
+            self.notify('Dry-run: thank-you logged, not sent')
+            return
+        self.notify('Thank-you message sent')
+
+        # The message is out, so what follows is bookkeeping and gets its own
+        # handler.  Reporting a failed archive as 'Send failed' would tell the
+        # maintainer to send a note that is already on the list, and letting
+        # it escape would unwind out of the screen callback and take the rest
+        # of the session down over an already-successful send.
+        try:
+            mark_outgoing_seen([msg])
             change_id = series.get('change_id', '')
             revision = series.get('revision')
             if self._identifier and change_id:
@@ -5018,14 +5036,14 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 if topdir:
                     review_branch = f'b4/review/{change_id}'
                     b4.review.update_tracking_status(topdir, review_branch, 'thanked')
-            self.notify('Thank-you message sent')
             if archive_after:
                 self._archive_after_thanks(series)
             self._focus_change_id = change_id
             self._invalidate_caches(change_id)
             self._load_series()
         except Exception as ex:
-            self.notify(f'Send failed: {ex}', severity='error')
+            logger.debug('Post-send bookkeeping failed: %s', ex, exc_info=True)
+            self.notify(f'Sent, but recording it failed: {ex}', severity='warning')
 
     def _archive_after_thanks(self, series: Dict[str, Any]) -> None:
         """Archive a just-thanked series, unless a newer revision is known."""

-- 
2.53.0


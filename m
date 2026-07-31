Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E803B1EC7
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489698; cv=none; b=IIhiPYvnp/CbOWWDVGRN9weoExrkeQ+KngjLKe6PpPCsQ5nEXJRhC2rJFU7HZBSYQNWYzV4V0yhiNGAWAVyIHdcIP2SfWOe0MZ2l40wSm1MHEI+9gKtTPwqvwWfmzYGhFaQX6Rzx0sy9oKEVplNHhv2cPXg8bX2YI4g7clpvMPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489698; c=relaxed/simple;
	bh=JnRrliR73eq5yxygqMJbWijTg5ZpdIFqEFE717UEczo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTVKiV4dCl8wPvEsFrmuqH1HgYTHTotT54L+6bIuFFzYOexS+XC2ASCJo9tBbAxkRHNSP+9P2CLePT9SX5PP6pnhyK+k4Ybtui+8W9arm5tH44QKZ3vJ1W1Om89x6VC0PBOVheT37wGP/Xz8wrNgZWiKX6S+qEMF++w2ZmpZwYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEIg5jAV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEIg5jAV"
Received: by smtp.kernel.org (Postfix)
	id 43B821F00A3D; Fri, 31 Jul 2026 09:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E061F000E9;
	Fri, 31 Jul 2026 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489697;
	bh=6g+/1gD2qGFBHZHWIr0gA5XhkaKOem3C+lRBFxMvp+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MEIg5jAVxAo9eLJmOiTJ4o84U3hU4c+ybO7XwwGOhXuFv7KA0gNZMke+lbgJgeed4
	 KrNaQcolwRnYzXGWcC+X7cxCQqW6VT49/AUfEqAZU0oQjCWhXIeT5EnHFTQ/ytJPss
	 fcLVYkTe8sp16xh8iyzpFBRvwHZn/i9xzXRaU2situyNJs5AUPJ6yNT1vyY7CS4edK
	 1CVYxKF3Q/VijUxuH9mMBhZa8pJtL9H+SvzDT8HQbv55inuTDdQoNKIt/WxSg9yD/i
	 yquyytA90JlA5lJ31Rspw+f1KJOixAXm1f5uWvLZyu80cILcQrEBr1Yz2oRYGLOKkb
	 mzRQuqxD7f/vA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:07 +0200
Subject: [PATCH b4 08/27] review-tui: keep post-send bookkeeping out of the
 send error path
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-8-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3895; i=brauner@kernel.org;
 h=from:subject:message-id; bh=JnRrliR73eq5yxygqMJbWijTg5ZpdIFqEFE717UEczo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIqW1QUmHyzce8OnW9WoIex0Z+KEM/OkTndlWjxsK
 o1/OO1+RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQq7zH805ot+jP3St8XnXPr
 7y1pXc1+S+xz+LlJHm0WJl/O3jgWw87IsPL2d5+VJxyfXP715PwZLpdfrwx6S4ukngocsHcwCzs
 rxQgA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Sending a thank-you note does the SMTP handoff and everything after it,
the status update, the archive and the list reload, inside one try whose
handler reports "Send failed". So a problem in the bookkeeping is
reported as a problem with the send. The message is on the list at that
point and we are telling the maintainer to send it again.

Split the two. Only the SMTP call keeps that handler. Once send_mail()
has returned we report the outcome and run the rest under its own
handler that says what actually went wrong. That handler has to catch
rather than propagate as well, because this runs from a screen callback
and an exception there unwinds out of the TUI over work that already
succeeded.

While we are here, wire the thank-you into the shared outgoing-seen
helper. It is a reply into the series thread and comes back from the
list like any other, so recording it at send time keeps the badge dark
even when b4.thanks-from-email points somewhere the From match can't
follow.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index fb144a0..55de2a7 100644
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
@@ -4999,10 +5000,21 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
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
+        self.notify('Thank-you message sent')
+
+        # The message is out, so what follows is bookkeeping and gets its own
+        # handler.  Reporting a failed archive as 'Send failed' would tell the
+        # maintainer to send a note that is already on the list, and letting
+        # it escape would unwind out of the screen callback and take the rest
+        # of the session down over an already-successful send.
+        try:
+            mark_outgoing_seen([msg], dryrun=self._email_dryrun)
             change_id = series.get('change_id', '')
             revision = series.get('revision')
             if self._identifier and change_id:
@@ -5018,14 +5030,14 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
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


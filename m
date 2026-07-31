Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D083B05B4
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489690; cv=none; b=P0VeeeAlCI4Bvudt2K/2AbfzU5OCcKa7HyRsSDRywSm+Am94K3gDk9H1/EYbDCNno9qen1A2Kg66qG2Xb6aBD33j4Xc3BYFqBxALC48TxbKvSYkhjaN7evMT4akUDJ9QrEw6RaKajxmv9TJsAjhLKgQy27yjSbgc1Ssdb7Eixsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489690; c=relaxed/simple;
	bh=LNinaV+5YmlunRwZSuoY6xONq3vB5ND1/lnwfXQqcSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5MIEHXS+/P6QaaEQChgBfH7mcrWWsvBR7UdQ8WClBu1d+SAHpoRkXmxGqcGNvvnvTW2JBRThKGZtNyU21OCrblO2EYALThNaaRlNg4tS11DwRryJatZjcvKcgvgiWYdKxA6KQLE2LdauUvO8M9a0j7qOciYLMieu4aNJ7TSMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPGTpTRC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPGTpTRC"
Received: by smtp.kernel.org (Postfix)
	id 20D001F00A3D; Fri, 31 Jul 2026 09:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536AC1F000E9;
	Fri, 31 Jul 2026 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489689;
	bh=82InrqdI8Mi8NltgS8ANA4hXrI+0jXCfd/8Q6wjEcYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mPGTpTRCIoLFLKsm5ujdIXJA+4t3TchI4chF263GAzYwGWhFZUz2zLT2H8UNDkWG9
	 P2paP8Ecau7tNchw+c7VA9+EQ8L49d+paBlqNpt0FhM39K5EswGrXTzdvUXaB31r4h
	 o4fpCGpQ5Kgr3zOvIMJhp9SAEwh+a6YMoX3l12e1JiIJq3fVUs6vThJBu0gqkcJAJ1
	 TiCnyY8+hV2XBw6zcvxTpyo0sparTMDE4TrDbr/q/vko2bOCCLfGW0+ICM7IByIq9J
	 57oUbEYH/I7VB4Y4UP/NxolhX+Ka6f+TiZDhOSfk51T2T1E6ecZ/wgwmb2ufvYpYcL
	 F4srLhgmhCaZg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:00 +0200
Subject: [PATCH b4 01/27] review-tui: mark all outgoing mail as read, not
 just review replies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-1-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460; i=brauner@kernel.org;
 h=from:subject:message-id; bh=LNinaV+5YmlunRwZSuoY6xONq3vB5ND1/lnwfXQqcSA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIr+2KTPl3z/Hv/1unmsGXpGd3x9JX6+a3n67+VLA
 abXSbcTOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbSdIKRYUah8UWhQ4IJ5457
 2Sxd+1O98SIz22UJPqn3fBP27Vjb1M/w30P7lu7fN3oKK79IMu7LWe0fNG3u0Yk9R6dd6/FzYGJ
 25AUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Marking outgoing mail as Seen at send time is done in the review app, so
only per-patch and cover letter replies get it. The thank-you note from
the tracking UI and the follow-up reply from the lite thread viewer
don't. They rely on the pass that runs when the thread is fetched again
and marks anything whose From matches the configured identity.

That pass matches the address exactly, so it misses whenever the mail
went out from somewhere else. b4.thanks-from-email exists precisely so
that thank-yous can do that. The maintainer's own message then comes
back from the list and lights up the unread badge for the series.

Move it into a helper next to the other shared TUI utilities. It
respects --email-dry-run and it never raises, because it runs when the
message is already gone and mustn't be able to turn a delivered message
into a reported failure. Wire up the follow-up reply here. The thank-you
path follows in a later patch.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_common.py     | 23 +++++++++++++++++++++++
 src/b4/review_tui/_lite_app.py   |  2 ++
 src/b4/review_tui/_review_app.py | 16 +++-------------
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 935f553..33ab7ea 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -114,6 +114,29 @@ _CallFromThreadReturn = TypeVar('_CallFromThreadReturn')
 _WorkerResult = TypeVar('_WorkerResult')
 
 
+def mark_outgoing_seen(
+    msgs: List[email.message.EmailMessage], dryrun: bool = False
+) -> None:
+    """Flag messages b4 just sent as read, before the list echoes them back.
+
+    Every send path that puts a message into a tracked thread wants this:
+    a reply, a follow-up, a thank-you note.  Without it the maintainer's
+    own mail comes back a few minutes later and lights up the series'
+    unread badge.
+
+    Never raises: the message is already gone, so a bookkeeping failure
+    here must not be reported to the caller as a failure to send.
+    """
+    if dryrun:
+        return
+    try:
+        from b4.review import messages
+
+        messages.mark_outgoing_seen(msgs)
+    except Exception as ex:
+        logger.debug('Could not mark sent messages as seen: %s', ex)
+
+
 def get_thread_msgs(
     topdir: str,
     message_id: str,
diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 9c418ad..86a201e 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -26,6 +26,7 @@ from b4.review_tui._common import (
     _quiet_worker,
     _write_diff_line,
     display_width,
+    mark_outgoing_seen,
     pad_display,
     resolve_styles,
     run_lore_worker,
@@ -816,6 +817,7 @@ class LiteThreadScreen(ModalScreen[None]):
                 self.app.notify(f'Dry-run: reply to {lmsg.fromemail} logged, not sent')
                 self._mark_answered(node)
             else:
+                mark_outgoing_seen([msg], dryrun=self._email_dryrun)
                 self.app.notify(f'Reply sent to {lmsg.fromemail}')
                 self._mark_answered(node)
         except Exception as ex:
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 81c3890..8139518 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -48,6 +48,7 @@ from b4.review_tui._common import (
     _write_followup_trailers,
     get_thread_msgs,
     logger,
+    mark_outgoing_seen,
     notify_quit_hint,
     resolve_styles,
     reviewer_colours,
@@ -1664,7 +1665,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                             review['sent-revision'] = current_rev
                     self._save_tracking()
                     self._mark_patches_answered(msgs)
-                    self._mark_outgoing_seen(msgs)
+                    mark_outgoing_seen(msgs, dryrun=self._email_dryrun)
                     self.notify(f'Sent {sent} review email(s).')
             except Exception as ex:
                 self.notify(f'Send failed: {ex}', severity='error')
@@ -1746,7 +1747,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             elif self._email_dryrun:
                 self.notify(f'Dry-run: reply to {entry["fromemail"]} logged, not sent')
             else:
-                self._mark_outgoing_seen([msg])
+                mark_outgoing_seen([msg], dryrun=self._email_dryrun)
                 self.notify(f'Reply sent to {entry["fromemail"]}')
         except Exception as ex:
             self.notify(f'Send failed: {ex}', severity='error')
@@ -2063,17 +2064,6 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         except Exception:
             pass
 
-    def _mark_outgoing_seen(self, msgs: List[Any]) -> None:
-        """Mark just-sent messages as Seen so they never show up as unread."""
-        if self._email_dryrun:
-            return
-        try:
-            from b4.review import messages
-
-            messages.mark_outgoing_seen(msgs)
-        except Exception:
-            pass
-
     def _mark_patches_answered(self, msgs: List[Any]) -> None:
         """Mark the original patches as Answered based on In-Reply-To."""
         entries = []

-- 
2.53.0


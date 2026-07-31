Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F543358AD
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535137; cv=none; b=gJNXKrnq8IKDdXEY229w1INu7GmPLl8pyAP0mBiv2CXMN3qo5ikD/mkA0qdTF/2PtHOjz8ljvflb358a7UvjqeYM+fD8u+plsCTRH2SYiJfncKS5s8ysoi9kD4IZNfod/rxPVeDT6tyqqVbtF4HDlo3b2aeNbedr+PxL+SrHagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535137; c=relaxed/simple;
	bh=SUEaOKxf8Ex6N5s655Gdo/dpZKB/v/RIesRM8HMdbbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhI9BAXus8QVP9ITB5puhwhEAIfUcB97QVthF5YFhvt1w/LSXm+mV4miAbXoIX1R/W1iYjduHUQaB339Ov956ZgNDUJ1BVmEpQCc9L0OJ75UdMr84FpjJgKzISh5ZsuHQ5+fTeHd2sELOpHsKgUcTdG8dwf8Nj24zbrTOpfBG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmVioxGz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmVioxGz"
Received: by smtp.kernel.org (Postfix)
	id AE8DF1F00ACA; Fri, 31 Jul 2026 21:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9A41F00AC4;
	Fri, 31 Jul 2026 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535135;
	bh=ojh9achdysMY9hfadijYZXr9h9gyfRYXsoqaERrXxqQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZmVioxGzGgjJEYbtCFCsm01RIbIPoDeIPyYC3e1+GABkFYEsblWnZofzCN1Vpn7g/
	 ruAkvnHhbkMvwxaCmLtV1E4dD3IM/QNtFlqghA0Eh9nnQ++LsRZtKvJrAzMeTz1+fN
	 mt1alTobOrF5SQkTPbaqluz1K05jYixlqxWQlafZqCLpulWNaUb7uZiGTGzoo+9XFC
	 Stb7Cs8HHqMDBtJN0V+g4hCsphZ++eD0RlnQl6XBPpbZe4eQ/H/LqXjLizozZu4rJ5
	 Xyewi/4TVrCJnYSz9Y/wBB4vFu6zeZce/zNNb5SoSxszL5U2Ypy18ooUlZ6wSu79oG
	 +2S9DUh/QodHQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:42 +0200
Subject: [PATCH b4 v2 01/44] review-tui: mark all outgoing mail as read,
 not just review replies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-1-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5034; i=brauner@kernel.org;
 h=from:subject:message-id; bh=SUEaOKxf8Ex6N5s655Gdo/dpZKB/v/RIesRM8HMdbbg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3aYp+2u9GwaNmPU5odN+x2z2hjnu9RGdvv7eam0
 Pd3G8uujlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIlM62b4K5iWv+jPxOq9H2PC
 p/vNTDwsV78i/NWBy8mX7ugc1TgoxcLwP1Uvaf1LmTe/9+fXCRtEbWtxezib8+8rdxcfsft2tRw
 vuAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Only review replies were marked as read at send time. The thank-you
note and the lite viewer's follow-up reply relied on matching the
sender address on the next fetch, which fails when the mail goes out
from another address such as b4.thanks-from-email. The message then
comes back from the list and lights up the unread badge.

Add a shared helper that marks outgoing mail as read at send time. It
respects --email-dry-run and never raises. Use it for the follow-up
reply; the thank-you path follows in a later patch.

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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010EB351C04
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535138; cv=none; b=YyUbK+DZLqCos0x5vR5boiFjsZbcCm36gHj6kDnny7bluRUGrl97m3g6lozu9bJ8hvxi3Fx4tecMDDA7rXfA+FG3Hfn7NpKMI8o1MgDRfableD61ZQjRvrixmo/rdHT3qE+jLn/z6iaDCKVHn17KlK0v1r5d5OuXt2Tl7bnjFP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535138; c=relaxed/simple;
	bh=wE/K8c0iQ0TWr7RXrUh4EtD78KStZp7eVvHAP/M+N78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scvSL48FHjwdAmb40Pl08qTw/7hc6HdH+WK7CNaK03i5V5/3NIX8QGB89LkkzfIG8iiq37lpSskZrDRB3kCtvvAvt/9Wd2UlVWgQ73Z2blIV6NXz1T4bM2cbLoh+fPgD9wIy361b7lZD3OEoqsLerCnwdskbW28Khtd9lQ4qL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNY2YOGj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNY2YOGj"
Received: by smtp.kernel.org (Postfix)
	id D6BF31F00ADB; Fri, 31 Jul 2026 21:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1514B1F00AC4;
	Fri, 31 Jul 2026 21:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535136;
	bh=0kzGclNEsqIsUSeOHBuhW615WcFZEHnWhE/EyVHttXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eNY2YOGjXdx5MoppOj6ESFmUwT5/x8VkBA2OlTPFLLFCM8WtDaVQYfiVp6QceLwjQ
	 rMzn63I/EMrBwIbbVltFdcledksKm5wdRgDa3ydng9dgokLCXGJGZ7xYIrq7c0LBY4
	 GN5e8x0vvqjO84kSDF5QowMWNGmU7dD8EJOH7LkNhH+iwKTqTBq/dcEsgRDBR5p8Tc
	 Sg/nj/Ia4TO8LRKEnprlasaOAIJ0ePrJc6O/+0f7c1ySX2lJi/1NaxuOdLZ3wp3F7X
	 4RPuU8JHZKV+YnnEu1a2CEAbKNEXIyYElmmv9kIKFB3STL+0AoFcI1bUPm+wGBOjTO
	 TPdagZfEGqWjA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:43 +0200
Subject: [PATCH b4 v2 02/44] tests: cover the shared outgoing-seen helper
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-2-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2603; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wE/K8c0iQ0TWr7RXrUh4EtD78KStZp7eVvHAP/M+N78=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs36J7da4Uune8WfmLslPSKLRKzehF68WWy8rel7c
 PRh59vXOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZiKsnI8N6D3W/J0nf3P82c
 tiCyuf9okrPfnYm2HyLX7L76eolDcBvDPzvRaflamslrlr//eO8i7zPJjnWWrIn2PYmRHi7qC/7
 acAMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The helper records the message, writes nothing on a dry run, and does
not let a failure escape into the send path.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_messages.py | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/src/tests/test_messages.py b/src/tests/test_messages.py
index 1dfcc82..904776d 100644
--- a/src/tests/test_messages.py
+++ b/src/tests/test_messages.py
@@ -1,6 +1,7 @@
 import datetime
 import email.message
 import os
+import sqlite3
 from typing import Dict, List, Optional
 
 import pytest
@@ -318,3 +319,45 @@ class TestMarkOutgoingSeen:
         count = conn.execute('SELECT COUNT(*) FROM messages').fetchone()[0]
         assert count == 0
         conn.close()
+
+
+class TestMarkOutgoingSeenHelper:
+    """The TUI wrapper every send path funnels through."""
+
+    @staticmethod
+    def _make_msg(msgid: str) -> 'email.message.EmailMessage':
+        msg = email.message.EmailMessage()
+        msg['Subject'] = 'Test'
+        msg['Message-Id'] = f'<{msgid}>'
+        return msg
+
+    def test_records_the_message(self, tmp_path: pytest.TempPathFactory) -> None:
+        from b4.review_tui._common import mark_outgoing_seen
+
+        mark_outgoing_seen([self._make_msg('helper1@example.com')])
+        conn = messages.get_db()
+        assert 'Seen' in messages.get_flags(conn, 'helper1@example.com')
+        conn.close()
+
+    def test_dryrun_records_nothing(self, tmp_path: pytest.TempPathFactory) -> None:
+        """A dry run never puts the message on the list, so there is nothing
+        coming back that would need to be already read."""
+        from b4.review_tui._common import mark_outgoing_seen
+
+        mark_outgoing_seen([self._make_msg('helper2@example.com')], dryrun=True)
+        conn = messages.get_db()
+        assert messages.get_flags(conn, 'helper2@example.com') == ''
+        conn.close()
+
+    def test_never_raises(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """It runs after the message is already gone, so a bookkeeping
+        failure must not reach the caller as a failure to send."""
+        from b4.review_tui._common import mark_outgoing_seen
+
+        def boom(msgs: object) -> None:
+            raise sqlite3.OperationalError('database is locked')
+
+        monkeypatch.setattr(messages, 'mark_outgoing_seen', boom)
+        mark_outgoing_seen([self._make_msg('helper3@example.com')])

-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921430C158
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489691; cv=none; b=d94/i39NvFfRxI/RvpSdSlvok/OwGAZZIfIvT1n1j7jYD240uoRnnzZiE+nBzFsVXSTDsOtGgtrSgLkxcH4my3Sju9STps/K9+qpZn8nTuwM9rGm8vnZ3x3n9YmrmdiZHqaQ+NBy2HIJSh1rzQXI8TDnv+Pdjjo45BGiIC9X5YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489691; c=relaxed/simple;
	bh=8FLfJ6Euw0dUrvbDYzBUJ/SqwKXCIUpVqpLRz6zSUTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9yN0ie8mj5jnavgVJ+gT0GdqlQJlG1SAZM4zdGVc4mLGC9Aaft/nOlF+qgQZTxdbUM8sudQRo4Lp0XiMI/1oqJpT1ws1qGUemLnI1Cgb6sAL/lm2/X+5jozySAoCacykQATv1kS3DS5XaONyr2IKSC+cSNboOvSXg0I29XAm4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhYKE14Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhYKE14Z"
Received: by smtp.kernel.org (Postfix)
	id 4802C1F00A3A; Fri, 31 Jul 2026 09:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1FE1F000E9;
	Fri, 31 Jul 2026 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489690;
	bh=uqkMCdPHCKea1PqCmtQpiE6XkDVgfxwOdEI8IX058VU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OhYKE14Z9r2KMfiU/3v4tq+IkaQqIsHi/oZ8sMg6kv7m7c4NmfGhxyaG11nDuGbh2
	 8vDNL35Gzq5hYo7i/AT09oBHoIN0/yOtaKRtgZuSj4aKpN6zaPi3dEe6oUdGsWlqFZ
	 NEkbTkCgtMIDjrden02IxuyVUxs5AMqAfiN6NKSbz6aMaQ/TLUgOXcKLO6cNzh3imt
	 Oyl2bUzykSq2F1lsReuwjn3Gq1F9lMzFMVMJ/TOGnQXySBLFy4DloG63hdNGOXpDVJ
	 i37xa9GA4UTr4Myr8az/jVtt7masd5C+MPeXvhaHT5Ockm0yPb9aiNKtNtiMFvgTGs
	 XeYFcPcktZ0IQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:01 +0200
Subject: [PATCH b4 02/27] tests: cover the shared outgoing-seen helper
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-2-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2659; i=brauner@kernel.org;
 h=from:subject:message-id; bh=8FLfJ6Euw0dUrvbDYzBUJ/SqwKXCIUpVqpLRz6zSUTM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIo2FUov7Q6UWifnfNpCU2nNNNO+e/1TN36465bdl
 HA6KGFiRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwER0VBgZjmZueCzPFyOezzF1
 zaIqJbl655296/6+KGu4bu2optNhxMjQf3bJc6HNzudD43yeHq5/4lPa5f16zq2QpfOn/ZgcM2s
 TIwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Check the three things callers rely on. It records the message, it
writes nothing on a dry run, and a failure inside it doesn't escape into
the send path that called it.

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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9502E975E
	for <tools@linux.kernel.org>; Fri,  5 Jun 2026 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663346; cv=none; b=qT0piYzy9Q7zluxiMbX/RM63QN9HTC2LETPUpmI5H+sqzYVPFcAVyTAyblg1LuA7IrHk8NFlOVGsqNios39+rT5OAnvj+EWXrr79HgC2zoZuKyxWTxlKNRsuYVWr63+0w6oVGlstj9f30CkbJqgP3UY8ehjt9FDxBTu8i7gQR8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663346; c=relaxed/simple;
	bh=6dDeBBJ6f7UfSXW1Pq3FUnVJjemP/N9Eny6+Xa48r3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k8nGHLlnYY/+iz4JQrUDFFLTJOs/euse3EKsPmd4jGNNGuEHHpCQZ4weMSSPc0prAQPMadhs+ravOunbekNVoDYdE33nhE8rchKQzfYXnoOfckkvjHL/en9RaghEvozSAkn16RC7BQNxyeXaqvw3ryU0cmPDIQn3IsQTqizV01M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO6tM1Lg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO6tM1Lg"
Received: by smtp.kernel.org (Postfix)
	id A8D791F00898; Fri,  5 Jun 2026 12:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF5E1F00893;
	Fri,  5 Jun 2026 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780663345;
	bh=eS//zeeqhH22hIBTJgW1CTCv/+c53HHnXnNhWw3+2nY=;
	h=From:Date:Subject:To:Cc;
	b=YO6tM1Lgxygsy7O9NGpkdao8qpq0/2uXGqpJicqpgk/RXLKM+fK5C5eh5bSxoTxJ+
	 Wa20euCHJ6TjgZKCZasPt8aqP2LQW7lly4TDgWjSk30gjp9DPBBWKymjBVUQv4gl2c
	 aIZn2JMr8U/0Raq/7je9rgcyFpkfjeIpgeiHKGQC9bua+fR4tLHaZpnlYkv/6v0t01
	 ogZJ7TOyDlYxc9Z9cO3q65w4sBYqBXaIC8ZIicV5AfyyDNPDy9eFfHuynQAwU1UMUV
	 Ym812aS/2jdZib2iyMu/eEPFrqU4CzYuQB1EezmW1ik6TdmXFz/hZkB0q5YiLz/F9w
	 CBhSCkILtURNA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 05 Jun 2026 08:42:22 -0400
Subject: [PATCH b4] Avoid expiring snooze test data
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-date-expiry-test-v1-1-972c2589973d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQ6CQAwFf4X0bJO6CiT+ivFQ2IfWA5LtYjCEf
 3eV40wys5IjGZwu1UoJb3N7jQWOh4r6h453sMXCFCQ00kjNUTMYy2TpwxmeWTQOp9BKC1Uq2ZQ
 w2PJfXqk70213PndP9Pn3om37Am4+cch4AAAA
X-Change-ID: 20260605-date-expiry-test-0adf32707eaa
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=tamird@kernel.org;
 h=from:subject:message-id; bh=6dDeBBJ6f7UfSXW1Pq3FUnVJjemP/N9Eny6+Xa48r3U=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKRwwUS17tsNKeeO+YqKhrXEX7BO/s/dwvqoMVnB54S
 uqGOzzomMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNUZ8gx/xROzn8Qv2+wXwDN5rtr/rj9Cfa+MW4XmeB2NWWpryGeZz/DPMinjDov
 zRUe/Rdc8Qisa1rnsKpqa3by1zVa05oXC2xOsAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

The tracking TUI test used a fixed snooze date that eventually passed,
causing startup to correctly wake the series and clear snoozed_until.

Generate a future timestamp relative to the test run so the test
continues to exercise loading an active snooze from the database.

Assisted-by: Codex gpt-5.5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 src/tests/test_tui_tracking.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index d8feb6f..c395772 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -11,6 +11,7 @@ core user workflows: series listing, navigation, filtering,
 status transitions, and modal interactions.
 """
 
+import datetime
 import pathlib
 from typing import Any, Dict, List, Optional
 from unittest.mock import patch
@@ -2780,13 +2781,14 @@ class TestLoadSeriesCaching:
         ]
         _seed_db('cache-snooze', series)
         conn = tracking.get_db('cache-snooze')
-        tracking.snooze_series(
-            conn, 'test-snooze-detail', '2026-06-01T00:00:00', revision=1
-        )
+        snoozed_until = (
+            datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(days=1)
+        ).strftime('%Y-%m-%dT%H:%M:%S')
+        tracking.snooze_series(conn, 'test-snooze-detail', snoozed_until, revision=1)
         conn.close()
 
         app = TrackingApp('cache-snooze')
         async with app.run_test(size=(120, 30)) as pilot:
             await pilot.pause()
             assert len(app._all_series) == 1
-            assert app._all_series[0].get('snoozed_until') == '2026-06-01T00:00:00'
+            assert app._all_series[0].get('snoozed_until') == snoozed_until

---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260605-date-expiry-test-0adf32707eaa

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>


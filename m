Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE93E37FF50
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535183; cv=none; b=MziG43BDTD9r9QZ435665QhB9smW4gOaUmFi0z1xFuxpxlkXvA+Oy6dzpHJ1YQh3+jDJyt/x0Ros6c3+1x+ZK1H/QSHEfUB5GptRxqAcsP7JCRxo4PpZf9bJ3jcomvOAwjPpv9l/oM4JFVIlkJm53gJc+6NU8rNotRbsPIIxt6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535183; c=relaxed/simple;
	bh=iwZKkd98qT9tzCW358jy8OAqnrbe3DjpHgNCwUHE87o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BA0Ra6Y7XvqXu0V9s/jzBdRfI5erZpyPT6eF3UCSgLXWVzE7tdZpJsSBpZ0qLMTqB5mnsPKe2ufLQwEKTUT3nlqACK3RjexCWA5RZqBe9cvxrbSWme9RVZw1J+C9L3fraDTydudfgiLEOrlcOftaooAxq0dn2ncjBeUPRFHfuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeV484cQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeV484cQ"
Received: by smtp.kernel.org (Postfix)
	id DAE131F00ACA; Fri, 31 Jul 2026 21:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D061F00AC4;
	Fri, 31 Jul 2026 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535181;
	bh=YLyK0umeVqbCyTJ23vzmkHaLWTG5mI5aYUYYCfzwnrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MeV484cQiw8omxYmS/z9Rd1Kid/4cNZWMVr8PMsG+Wr5CCPsD++dJE1YSkIUy60kP
	 S7aWJ5AcJvqQGnDMgQI/YmDVXAOa3SGuINDSV3sAilhPgw6pLU6PUQdCWJe3I5gf41
	 SF1pHtb4Ef4VLqkbeY+8UJp95+5CXGSHz443vVBvMgaVPr9cvVcgKXcHR0374ZP72Q
	 2lPTvWnjT71yMJb5ojZfgB5cLXfSmRJYKpM77lSQ+FJBMsn3D3kUfO22TbZa54lcx3
	 bgvOncvPSZuR1W8fZagm/lTzAaCTyna1LRhDnOR569ud+f8W+/W5qtDx+QP24iabMh
	 ve6kcNc3eSZLQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:21 +0200
Subject: [PATCH b4 v2 40/44] tests: cover the status sync closing its
 database
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-40-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823; i=brauner@kernel.org;
 h=from:subject:message-id; bh=iwZKkd98qT9tzCW358jy8OAqnrbe3DjpHgNCwUHE87o=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1Vfu3RnnAkr3SamE/MFafJ8S78K57mf9q/wiZCT
 O6GkrdHRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQuFzEy7Nn3VY+j2aXk3/r9
 ropfeRZEvDlkdDMx4sCm1hNvNrgfs2FkuL7sqemkUKGtsTMXepZm9YRbieSYhG5stj9cEBK9Z8p
 nBgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A write that raises must leave the connection closed anyway.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index ef79aeb..25bf13a 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -15,6 +15,7 @@ import datetime
 import email.message
 import os
 import pathlib
+import sqlite3
 from typing import Any, Callable, Dict, List, Optional, Tuple
 from unittest.mock import patch
 
@@ -5470,3 +5471,54 @@ class TestTrackingEntryBranchRestore:
             _entry.run_tracking_tui('test-entry-syncfail')
 
         assert b4.git_get_current_branch(gitdir) == 'work'
+
+    def test_a_failed_status_sync_closes_the_database(self, gitdir: str) -> None:
+        """The connection is opened inside the guard that swallows the
+        failure, so a write that raises used to skip the close and leave it
+        open for the rest of the session."""
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'work'])
+        assert ecode == 0
+        review_branch = 'b4/review/entry-dbclose-1'
+        runs = {'n': 0}
+        closed: List[bool] = []
+
+        class _Conn:
+            def close(self) -> None:
+                closed.append(True)
+
+        class _ReviewsThenQuits:
+            PATCHWORK_SENTINEL = TrackingApp.PATCHWORK_SENTINEL
+
+            def __init__(
+                self, identifier: str, original_branch: Optional[str], **kw: Any
+            ) -> None:
+                pass
+
+            def run(self, mouse: bool = True) -> Optional[str]:
+                runs['n'] += 1
+                if runs['n'] > 1:
+                    return None
+                return review_branch
+
+        def _boom(*args: Any, **kwargs: Any) -> None:
+            raise sqlite3.OperationalError('database is locked')
+
+        with (
+            patch.object(_entry, 'TrackingApp', _ReviewsThenQuits),
+            patch.object(_entry, 'ReviewApp'),
+            patch.object(
+                b4.review,
+                '_prepare_review_session',
+                return_value={'series': {'revision': 1}},
+            ),
+            patch.object(
+                b4.review,
+                'load_tracking',
+                return_value=('', {'series': {'status': 'replied'}}),
+            ),
+            patch.object(tracking, 'get_db', return_value=_Conn()),
+            patch.object(tracking, 'update_series_status', side_effect=_boom),
+        ):
+            _entry.run_tracking_tui('test-entry-dbclose')
+
+        assert closed == [True]

-- 
2.53.0


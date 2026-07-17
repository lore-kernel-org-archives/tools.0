Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC64397E9E
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327913; cv=none; b=ufJmudbojTkCdLm+6MlSOtPRHeo4J9MbBnmxXKy5v2B1suYDtqWdkWHh3OS6mh97p7vULOZeFdZiG5gH6xiTKOCUEuki5H3ghedMseavgkDPbw79RMxXOG9RxbbGRPnU342XFxeTlfqc5Ko/KLhnA2tl7ukEFuDgvBIZrZYgHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327913; c=relaxed/simple;
	bh=b+M9UqPXu6abde8nOybp0Ce9WpJC4DPGi3zBqvgUhS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aBdFMmoP3+0W9MMtKsitOyvmoUTg15LsZKQkfEoFP0DkQ5+pGssmEJhcM6MsDCyLE3bRhaizyb9AiOBSfpm73MvlN8cdIUmFl0qtD8Io6vhMso2D93WLAOY+fIWz+E4FgSOO5hT26dX6aBX4wmTvZyXEsD3aS+KwQZCLx1c4Pyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBrp3a4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBrp3a4s"
Received: by smtp.kernel.org (Postfix)
	id 3E8E41F00A3D; Fri, 17 Jul 2026 22:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CB81F000E9;
	Fri, 17 Jul 2026 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327912;
	bh=cPjswAH7BTW4yxnTZykuL2+Kp5pyxa8uAzHrDxjv9KA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dBrp3a4sEz7z0JtMISaLQeokeNo4mgQHZLtbyWx8SboEpvD2701YVACsDLWinKPtQ
	 S3NR8s1hM1djVtKO9a1TAO517I3S2y/DH0TWEGY+qrJ4y+jAZgb2xzvSS5EQkShXXW
	 P8woIUidl6zJRs7iZpPGxFsjPVWGMBxeOfaJMEnaaXgUNImidm0Yf6JqC7szs6Ls5c
	 IoXL7QBEiqnbji/naKiJNfO3K9sFwIa5JybvdxxQZa69wWd2i2jwXhSyLJenKMDF+9
	 7jWPVhE6vzQAlkJfrJyl3UQZ7jyek2pprRrPNmrTu1TWAHDqgKC/sh3v2HR+88F5u6
	 zxh9AUtArk9+w==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:44 +0200
Subject: [PATCH RFC 08/11] review: test backward revision discovery
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-work-b4-multiver-rows-v1-8-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=8137; i=brauner@kernel.org;
 h=from:subject:message-id; bh=b+M9UqPXu6abde8nOybp0Ce9WpJC4DPGi3zBqvgUhS4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbs5STvAndvjz6Jf7QnbHDf2WsfOT005E/v339maN
 paMZcV3OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYy5wzDHx6h7uUSDeHz2zQc
 J267EiQQsCrujE5lRm2j0cHfTbdC7zIyzLk94+GRM5ITvb12uFjYCy/d8ab305qc16bzJaNYTh7
 ZyQYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover discover_older_revisions() (records all previous versions with
an explicit wantvers, offline error, v1 no-op, nothing-new short
circuit without polling) and the tracker action wiring (menu entry
presence, worker invocation with the selected series).

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 118 ++++++++++++++++++++++++++++++++++++++
 src/tests/test_tui_tracking.py    |  44 ++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 5002aaa..b26933d 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4895,3 +4895,121 @@ class TestRevisionAwareSyncHelpers:
         ).fetchone()[0]
         conn.close()
         assert rev_seen == 6
+
+
+def _series_msgs(base: str, rev: int, n: int = 2) -> list[EmailMessage]:
+    """Raw messages forming one n-patch series at the given revision."""
+    msgs = []
+    for i in range(1, n + 1):
+        msg = EmailMessage()
+        msg['Subject'] = f'[PATCH v{rev} {i}/{n}] {base}: part {i}'
+        msg['From'] = 'Author <author@example.com>'
+        msg['Date'] = 'Thu, 19 Mar 2026 08:51:12 +0530'
+        msg['Message-Id'] = f'<{base}-v{rev}-p{i}@example.com>'
+        msg.set_payload(_pos_diff(i))
+        msgs.append(msg)
+    return msgs
+
+
+class TestDiscoverOlderRevisions:
+    """The backward lore search records all previous versions."""
+
+    def test_records_all_previous_versions(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('disc-all')
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_mbox_bytes', lambda msgid: b'raw'
+        )
+        base_msgs = _series_msgs('thing', 3)
+        monkeypatch.setattr(
+            b4, 'split_and_dedupe_pi_results', lambda raw: list(base_msgs)
+        )
+        seen_calls: list[tuple[int, Any]] = []
+
+        def _fake_extra(
+            msgs: list[EmailMessage],
+            direction: int = 1,
+            wantvers: Any = None,
+            nocache: bool = False,
+        ) -> list[EmailMessage]:
+            seen_calls.append((direction, wantvers))
+            return list(msgs) + _series_msgs('thing', 2) + _series_msgs('thing', 1)
+
+        monkeypatch.setattr(b4.mbox, 'get_extra_series', _fake_extra)
+        polled: list[str] = []
+        monkeypatch.setattr(
+            review_tracking,
+            'update_revision_message_counts',
+            lambda identifier, series_list, topdir=None: polled.append(
+                series_list[0]['change_id']
+            ),
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+            'status': 'new',
+        }
+        result = review_tracking.discover_older_revisions('disc-all', series, '')
+        assert result == {'found': 2, 'revisions': [1, 2], 'error': None}
+        assert seen_calls == [(-1, [1, 2])]
+        assert polled == ['cid']
+        conn = review_tracking.get_db('disc-all')
+        revs = {r['revision'] for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs == {1, 2, 3}
+
+    def test_offline_reports_error(self, tmp_path: pytest.TempPathFactory) -> None:
+        review_tracking.init_db('disc-off').close()
+        series = {'change_id': 'cid', 'revision': 3, 'message_id': 'v3@x'}
+        result = review_tracking.discover_older_revisions('disc-off', series, '')
+        assert result == {'found': 0, 'revisions': [], 'error': 'offline'}
+
+    def test_v1_is_noop(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        review_tracking.init_db('disc-v1').close()
+
+        def _boom(msgid: str) -> bytes:
+            raise AssertionError('must not fetch for v1')
+
+        monkeypatch.setattr(review_tracking, '_fetch_thread_mbox_bytes', _boom)
+        series = {'change_id': 'cid', 'revision': 1, 'message_id': 'v1@x'}
+        result = review_tracking.discover_older_revisions('disc-v1', series, '')
+        assert result == {'found': 0, 'revisions': [], 'error': None}
+
+    def test_nothing_new_found(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('disc-none')
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_mbox_bytes', lambda msgid: b'raw'
+        )
+        base_msgs = _series_msgs('thing', 3)
+        monkeypatch.setattr(
+            b4, 'split_and_dedupe_pi_results', lambda raw: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs),
+        )
+
+        def _no_poll(*args: Any, **kw: Any) -> None:
+            raise AssertionError('poller must not run when nothing was found')
+
+        monkeypatch.setattr(review_tracking, 'update_revision_message_counts', _no_poll)
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+        }
+        result = review_tracking.discover_older_revisions('disc-none', series, '')
+        assert result == {'found': 0, 'revisions': [], 'error': None}
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index eb1105c..e9d646e 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4137,3 +4137,47 @@ class TestDoTakeMergeConflict:
         common_dir = b4.git_get_common_dir(gitdir)
         assert common_dir is not None
         assert not os.path.isdir(os.path.join(common_dir, 'b4-take-worktree'))
+
+
+class TestDiscoverOlderAction:
+    """The 'Find older revisions' action wires into the discovery seam."""
+
+    @pytest.mark.asyncio
+    async def test_action_menu_offers_discover(self, tmp_path: pathlib.Path) -> None:
+        _seed_db(
+            'test-discover-menu',
+            [{'change_id': 'cid-d', 'revision': 3, 'status': 'new'}],
+        )
+        app = TrackingApp('test-discover-menu')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('a')
+            await pilot.pause()
+            keys = [key for key, _label in app.screen._actions]
+            assert 'discover' in keys
+
+    @pytest.mark.asyncio
+    async def test_action_runs_discovery(self, tmp_path: pathlib.Path) -> None:
+        _seed_db(
+            'test-discover-run',
+            [{'change_id': 'cid-d', 'revision': 3, 'status': 'new'}],
+        )
+        calls: List[Tuple[str, Optional[str]]] = []
+
+        def _fake_discover(
+            identifier: str,
+            series: Dict[str, Any],
+            linkmask: str,
+            topdir: Optional[str] = None,
+        ) -> Dict[str, Any]:
+            calls.append((identifier, series.get('change_id')))
+            return {'found': 2, 'revisions': [1, 2], 'error': None}
+
+        app = TrackingApp('test-discover-run')
+        with patch.object(tracking, 'discover_older_revisions', _fake_discover):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                app.action_discover_older()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+        assert calls == [('test-discover-run', 'cid-d')]

-- 
2.53.0


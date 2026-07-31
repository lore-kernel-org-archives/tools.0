Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75533314B9
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535148; cv=none; b=prOjX6v8M7emV+o9QMcnZJ4yX91baa8web0/IRDGCsLwMQP82mIqMFyXNkFHfQYzNugt4M5aBMRzyaJ0ajqByp1Gc5DyfFJuUoqBhhH4E6G9ziUhHMsK4MCHfLrNf1Gmru+ocTlxofRkHWSfqdwQdznvMsxbGUs0XYcZ+l9aE9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535148; c=relaxed/simple;
	bh=TPC7SniXJnJ3cQGa0GGb7xmngfGBwImdEoUGihHyG2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2tx/sJt16axw0gvTEWCzNOw2uh8623NHfBhPF8tF89LFGG5PI7FnmJVmKp5X6EzAUyK4CBJRjrEp0LLGyHgAxYKR+HMVyfN0h4AstAi7oD8lGMzaZEo+yzGKeFRghZuxRhNxKOolSPu6vz35SM+bNwaFgmAPTc+cTtcReYOxF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZWXvBen; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZWXvBen"
Received: by smtp.kernel.org (Postfix)
	id 7A2BD1F00ADB; Fri, 31 Jul 2026 21:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6411F00AC4;
	Fri, 31 Jul 2026 21:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535147;
	bh=zE4+JliTor1TTSVmSI5D2s981oCRS/S9zxFWWWMV8wI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QZWXvBenB56puoPuhwRC6Z5OWVONX5WRYNY0XKwBZk7beiP9lmUeqtrDrGj5Hn2z/
	 QxSQ0WlsrlCCJn6QxwWQEnn9m40FYuud5TR3zwsVa9f+cIZ0Triv6+hlp8xIZPSw7V
	 BL0qc3nubbypRd87ftXJkNdX9aHsr7S6vY+FdUdMwcrUGAWs3dRgVVv/YtTr4mEBIc
	 3fH9W5GYNg3REaU2JuiL6YF5EPy8PRgJv1E8JWXSrONEf/3pNC6Iruv5eOPAlu9d4x
	 CIyZFXkSZckxFwBtRNrgZuOJusrSYMF6ioV3gALAtDuTP9pzo/3tHDbkfi/6od9L+Z
	 MqtJGSIxYL8jw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:52 +0200
Subject: [PATCH b4 v2 11/44] tests: cover the take statuses in the
 thank-and-archive chain
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-11-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=4400; i=brauner@kernel.org;
 h=from:subject:message-id; bh=TPC7SniXJnJ3cQGa0GGb7xmngfGBwImdEoUGihHyG2Y=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs0+vFXQmMdyVts1IceyY1enHg2J33X/hES49Hzuh
 d0i+gtFOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACayIoqRYUrmQtvJTyvDxZbI
 TDrTsiUsn3Ob7VLW279Ego6U7N/Mks3wT3d21qb06wFPVrtM41R8G1yx0U3I9d0rl6uLtO4u6Fc
 +zgsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Add the two cases that used to come back as None: accept unchecked in
the dialog, and a take whose tracking data could not be read back. The
unrecorded status must not reach the status column.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 50 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 6a3f2f8..09d1fea 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -2674,6 +2674,34 @@ class TestSeriesLifecycle:
         assert all(p.get('taken') for p in patches), 'all patches should be taken'
         assert updated['series']['status'] == 'accepted'
 
+    def test_record_take_metadata_unreadable_tracking(self, gitdir: str) -> None:
+        """The patches are applied by the time this runs, so a tracking commit
+        that cannot be read is a missing record and not a take that never
+        happened.  Saying None for both leaves the caller unable to tell them
+        apart, and 'unrecorded' must not reach the status column either."""
+        change_id = 'take-unrecorded-1'
+        branch_name = _create_review_branch(
+            gitdir, change_id, identifier='test-unrecorded', status='reviewing'
+        )
+        app = TrackingApp.__new__(TrackingApp)
+        app._identifier = 'test-unrecorded'
+        app._selected_series = None
+
+        with patch.object(b4.review, 'load_tracking', side_effect=SystemExit(1)):
+            result = app._record_take_metadata(
+                gitdir, branch_name, 'master', ['abc'], accepted=True
+            )
+        assert result == 'unrecorded'
+
+        statuses: List[str] = []
+        with patch.object(
+            tracking,
+            'update_series_status',
+            lambda conn, cid, status, revision=None: statuses.append(status),
+        ):
+            app._finalize_take(gitdir, 'master', change_id, {'revision': 1}, result)
+        assert not statuses
+
     def test_record_take_metadata_branch_tip_is_target_not_head(
         self, gitdir: str
     ) -> None:
@@ -4421,7 +4449,10 @@ class TestTakeThankArchiveChain:
     flow only when the take leaves the series fully accepted."""
 
     def _run_take_final(
-        self, take_status: Optional[str], thank_and_archive: bool
+        self,
+        take_status: Optional[str],
+        thank_and_archive: bool,
+        accept_series: bool = True,
     ) -> Tuple[List[Tuple[Dict[str, Any], bool]], List[str]]:
         """Drive _on_take_final with a mocked take returning *take_status*.
 
@@ -4434,9 +4465,9 @@ class TestTakeThankArchiveChain:
         notices: List[str] = []
         app = TrackingApp.__new__(TrackingApp)
         take_screen: Any = SimpleNamespace(
-            accept_series=True, thank_and_archive=thank_and_archive
+            accept_series=accept_series, thank_and_archive=thank_and_archive
         )
-        confirm_screen: Any = SimpleNamespace(accept_series=True)
+        confirm_screen: Any = SimpleNamespace(accept_series=accept_series)
         series = {'change_id': 'chain-1', 'subject': 'x', 'status': 'reviewing'}
         with (
             patch.object(TrackingApp, 'suspend', lambda self: contextlib.nullcontext()),
@@ -4491,6 +4522,19 @@ class TestTakeThankArchiveChain:
         assert not thanks
         assert any('take did not complete' in n for n in notices)
 
+    def test_unaccepted_take_does_not_chain(self) -> None:
+        thanks, notices = self._run_take_final(None, True, accept_series=False)
+        assert not thanks
+        assert any('not marked accepted' in n for n in notices)
+
+    def test_unrecorded_take_says_so(self) -> None:
+        """The patches went in but the tracking data could not be read, so
+        there is no coverage to chain on -- and 'did not complete' would send
+        the maintainer looking for an apply that did happen."""
+        thanks, notices = self._run_take_final('unrecorded', True)
+        assert not thanks
+        assert any('was not recorded' in n for n in notices)
+
     def test_unchecked_box_never_chains(self) -> None:
         thanks, notices = self._run_take_final('accepted', False)
         assert not thanks

-- 
2.53.0


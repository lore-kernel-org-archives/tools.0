Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945FB3B19A5
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489700; cv=none; b=sRiatTQ4eDbJc9rG6Zg5i2y6AMOWw3mhogiAotvlItckmH0QSPMP9mmYWnUso7VPf/kVX5j+o9rXKs9RTOwffI50PlN7Km2ul+EkzoAgVF9+0kdoSwVf0F38SDcmStqRAKxtI6mYnRzFpKD/dvmBRzVoBcb9LEpSK9TsrrvBvpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489700; c=relaxed/simple;
	bh=WaZjCfDNvvJb67HxbaNWCJfvCWUUty0DGmitbNbYq/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0cNdgpBy+DpmGicKkCporuUiL0ZpPe9i2GYRRv8NbUnGiDlU+58oIQlZ908BepBnAJUOXA5gNTDoWzMXlq+YnoL0etgE17BhLiKOft0b1YmlO7bvS+eEbmVeE3MdfDgm14sFx4yvAJN5AHmFrwiPyPXBKhMYMubBfeVab0DotY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/mEyfjN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/mEyfjN"
Received: by smtp.kernel.org (Postfix)
	id 92B9D1F00A3D; Fri, 31 Jul 2026 09:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A8D1F000E9;
	Fri, 31 Jul 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489699;
	bh=NjGoMN6OXBowQGxRWatVs+tzkMvW72o/TTAfEMByYLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h/mEyfjNZxXDhEPEbn9lxSGM2tMUjpCjxrPQgDXN57rtw66qZXvDGlMugR1jEhR1i
	 kHqCzykC8ZawQyd1XnfOZX7to5ddDloeS5vkTGyQ+GzQo76fYIKZQ/RTViUwNq2AOL
	 Ezs62c+SCn/c4QOEaGjs7Kz1hBPtFnAEYK7ISLl+YCAt2SjTAbCZneFWuLdGG4qMSt
	 EvhKJcs+as+ixuIQFQ9KctnoVfRTuWXBTJmgViTgaa4VyptbA4uNnINJcluSsl8CEt
	 KpAPxIRTm5UMmcavhlCBof2Hbta1e0hAndmikL9PatRBYYUeg4bpcEddJu1r+3tw3/
	 nKavRva1YJHOw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:09 +0200
Subject: [PATCH b4 10/27] review-tui: say when a take didn't complete
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-10-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135; i=brauner@kernel.org;
 h=from:subject:message-id; bh=WaZjCfDNvvJb67HxbaNWCJfvCWUUty0DGmitbNbYq/E=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIr+fSl8aW1kR8HECXy3nl7l5/gbeHJq6Ay5/y6Oe
 3g/q+5h7yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjI1QBGhllGTqx3T/L8Otb3
 LZ6/KWul3fpoj8If/hz2zFYbohzlrzD8d9henlMssvy9o2fDz/VPtvgosOhN8v7Z5FxUnxW69Zs
 mOwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The thank-and-archive chain reports a series that comes back from the
take as anything other than accepted or partial with "series not marked
accepted". But _do_take_merge() and _do_take_am() return None for two
quite different things. Either the maintainer unchecked "mark series
accepted" in the dialog, or the take never got that far because the
target branch wouldn't resolve, a conflict resolution was abandoned or a
worktree couldn't be created.

In the second case we describe a state the series never reached and
point at a checkbox that had nothing to do with it, while the take that
actually failed goes unmentioned. We can tell the two apart from the
dialog, so do that and say which one happened.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 11 ++++++++++-
 src/tests/test_tui_tracking.py     |  6 ++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 55de2a7..7572a95 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -2645,11 +2645,20 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     'Thank & archive skipped: series only partially applied',
                     severity='warning',
                 )
-            else:
+            elif not take_screen.accept_series:
                 self.notify(
                     'Thank & archive skipped: series not marked accepted',
                     severity='warning',
                 )
+            else:
+                # _do_take_* returns None both for "accept was unchecked" and
+                # for "the take never finished"; only the latter is left here,
+                # and claiming a status the series never reached would send the
+                # maintainer looking for a take that did not happen.
+                self.notify(
+                    'Thank & archive skipped: take did not complete',
+                    severity='warning',
+                )
 
     @staticmethod
     def _record_take_metadata(
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 57cfdc0..e6a25a4 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4484,10 +4484,12 @@ class TestTakeThankArchiveChain:
         assert not thanks
         assert any('partially applied' in n for n in notices)
 
-    def test_incomplete_take_does_not_chain(self) -> None:
+    def test_aborted_take_says_so(self) -> None:
+        """A take that never finished is reported as such, not as a series
+        the maintainer declined to accept."""
         thanks, notices = self._run_take_final(None, True)
         assert not thanks
-        assert any('not marked accepted' in n for n in notices)
+        assert any('take did not complete' in n for n in notices)
 
     def test_unchecked_box_never_chains(self) -> None:
         thanks, notices = self._run_take_final('accepted', False)

-- 
2.53.0


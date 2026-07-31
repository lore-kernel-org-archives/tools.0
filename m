Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4593351C04
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535149; cv=none; b=UKlQCiGQx/MqYcehJQewtUst+7rKlxWLqz22t9ViQ24eqNF5YODVGAXBvDzUTCx13xQkB50lCDoMYg4G9TBLTdiXwghA4rVLI79MWXCztA9zKVrmKXcEWjbVpXjnZoj8DNme64Jh5PXnoK8xhsxNCIX8+C9DETJJrMM/bz5XrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535149; c=relaxed/simple;
	bh=CH1YlxK7r8m3w/8wh8Yj2rM89h9SoHCVVBhtTTfAOnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuNN6Q0pvUm6ngk7q2VXemCn1ja8SiAvJTj3JMhkisSv1tXx0Bij3KG0ONjNyRayX0j/+aRAwe1aaM807ytwozo//AmkFcuwJinAJcZ1EB5tV4xpxLeIMuNo3EVd5djqq0uStj1D8A515m1oI/mlXIGtyZjftoNJPsyDmXkhEzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCUChm+w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCUChm+w"
Received: by smtp.kernel.org (Postfix)
	id A30961F00ACA; Fri, 31 Jul 2026 21:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D495D1F00AC4;
	Fri, 31 Jul 2026 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535148;
	bh=ZLg6PS35a1GcjQJQj1pu9c+JjGqgq4L/aHDiSfLH/ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bCUChm+wqelEiJzENn7EOPxWxsCLopQNjtQNwALpxCf32VUE8ItFu30sQM4Re8Xyx
	 Txp7zhPNFzCM8NsDHiErHit9+8zx41CEvYNLWqDCUeDXd5ggvbmSQDh334VbydEAuk
	 O2L5MvK8I+S7Hgou5kSONyrnxWHMkP72pbV8Lb98DDPyvNPL5ep6d1wDKyBQAkym4L
	 8jU5EDmw7mDx/F7TsZv1wyGn6Dotm85J0Yt49oyD+TkJ1iYs/8XeRyZAIa6VyX54jq
	 Ka6r9B3z4P3QhQzZTq34Mnjf2hav4QmtH5oHbFbK8y7CjtkdEKNaaec8O0zuRCbw0b
	 h6bIdJz5SwW7w==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:53 +0200
Subject: [PATCH b4 v2 12/44] review-tui: use the shared helper to delete a
 review branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-12-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516; i=brauner@kernel.org;
 h=from:subject:message-id; bh=CH1YlxK7r8m3w/8wh8Yj2rM89h9SoHCVVBhtTTfAOnc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3eN99p24l3X91FAqzP3r2fc8j+0uot68QEfH10D
 5S3RTD/6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjILHaGf1ZzJRiiTJ27dQ6/
 55l0/SEz31oOs5mc86+aVoa+Xnfr4WZGhvvz/t/tmxHptlTxrMa00+zzf1he5om2bfwmm8P34Ni
 tFnYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The tracking UI kept its own copy of the branch deletion that moved
into b4.review as delete_review_branch(). Make the TUI copy a wrapper
that turns the error string into a notification.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 83e33c7..a20eaa4 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -3791,36 +3791,18 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
     ) -> bool:
         """Delete a review branch, switching away if currently on it.
 
+        Thin TUI wrapper around b4.review.delete_review_branch() that turns
+        its error string into a notification.  Interactive, so detaching HEAD
+        to get off the branch is fine here.
+
         Returns True on success, False on failure.
         """
-        if b4.git_get_current_branch(topdir) == review_branch:
-            ecode, out = b4.git_run_command(
-                topdir, ['rev-parse', f'{review_branch}~1'], logstderr=True
-            )
-            if ecode > 0:
-                if notify:
-                    self.notify('Could not determine parent commit', severity='error')
-                return False
-            parent = out.strip()
-            ecode, out = b4.git_run_command(
-                topdir, ['checkout', parent], logstderr=True
-            )
-            if ecode > 0:
-                if notify:
-                    self.notify(
-                        f'Could not switch away from {review_branch}', severity='error'
-                    )
-                return False
-        ecode, out = b4.git_run_command(
-            topdir, ['branch', '-D', review_branch], logstderr=True
+        ok, err = b4.review.delete_review_branch(
+            topdir, review_branch, allow_switch=True
         )
-        if ecode > 0:
-            if notify:
-                self.notify(
-                    f'Failed to delete branch {review_branch}', severity='error'
-                )
-            return False
-        return True
+        if not ok and notify:
+            self.notify(err, severity='error')
+        return ok
 
     def action_abandon(self) -> None:
         """Abandon the selected series."""

-- 
2.53.0


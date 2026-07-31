Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2A3B2D06
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489703; cv=none; b=kS/icUqwtct9/47dHBBVzExGZ63PWvHRELhWStPL6wxIEftNQ0QvnFs8up3GMCL1bgBItoO3mbZOih/x7JuPDnb0gBARSjUAcGXtne4NDNmb2WBml9/u7aRZFnWevGlRusHwyq9zg6WAQdO+fowNVwnBbt6EEUg5zou+TJVazSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489703; c=relaxed/simple;
	bh=ShfcES0/0F4oGtr7YEgFe2qpvp4mpIRt91F3LzSSBj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYhVsltzb+SKgMAaBL2Me/zuPNzsEyZnmIpwn+S7UzToMaRdYbvQCOdaG0SHcQa4O9nZTXHguDosmcJZ6ZfuahhMLXuPfRu0ehIRO2JYQPBY8fvec/PEPmvwWVr4YCwYa+2XqBxhUJs28Y6wuqtq+vnnujohTNRrZVFkdaC90UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7q4DC33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7q4DC33"
Received: by smtp.kernel.org (Postfix)
	id E10211F00A3D; Fri, 31 Jul 2026 09:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAD01F000E9;
	Fri, 31 Jul 2026 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489701;
	bh=pGiIQuJ+Og0uFb1nJrRgkMdWRhrgvmsfzS9yMCpsAxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z7q4DC33cmD1HB6iMW4L2TJoeL9VhZEj0MqonC+LOOczl6ruSRD5f2jQArRcH6T0H
	 yBco0yGbN1cDaHv5MAdwTsTwY6ZhAuGiVGUVP/0m2//L7iuDTcF9nVhQG1OEFripVh
	 Z5c1dGWKGiOAIFG8hzqGoIra1NIv4PkSFMNDAXSHCTP2ybT3ldHapEp/y+zMsCjOCi
	 bu3T/zfXghZlxBYb5P7C4Ioo208L8viYE/OcyIu8jnnTIFJodcPSSO5QiVc7TH9ovD
	 0h6f3N5D1UGWksnTdh6zdzAC0WcnTnmq/nM8Z4q5FU+tzXcr2rPu0Az06BdmvI1wXV
	 1W4svA7eQH83A==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:11 +0200
Subject: [PATCH b4 12/27] review-tui: use the shared helper to delete a
 review branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-12-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ShfcES0/0F4oGtr7YEgFe2qpvp4mpIRt91F3LzSSBj8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIpKJZyw+qW/L6b5We7WDY/flxq1C73/KKaaeO3Rq
 6tm+4TndJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkSBsjw9yzfjwxc9g4Szlu
 7HA1mng8KnaVSk9sbXT74xrG4080nBj+l/g13bv5/8gmp48n+n91SrDk+v9rY7/LvvXo/yNzNpV
 7cAAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Archiving a series moved into b4.review.archive_series() and took the
branch deletion with it as delete_review_branch(). The tracking UI kept
its own copy for the abandon path, so the same three steps exist twice
and differ only in whether a failure comes back as a notification or as
a string.

Make the one in the TUI a wrapper that turns the string into a
notification. It is interactive, so it passes allow_switch. Detaching to
get off the branch is what the abandon dialog already asked about.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 7572a95..99964d0 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -3781,36 +3781,18 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
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


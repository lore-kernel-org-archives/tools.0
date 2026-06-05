Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CE83876B0
	for <tools@linux.kernel.org>; Fri,  5 Jun 2026 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662670; cv=none; b=GSub7T+feRO6acy9YzuC8WQIxLbzxLq+3PBTNrYcqB1HO87gLfWmb3+gQ70dzzC0HA7VBj+hK7hMG+nAgsXWJ7O7JSWqG5uB1CvOUD82HkzgmiHAmMwE/mHw1ZIapALnX4/3cf0NaD5egda5xUAtybtAGRXWcPS4jcyJP8u8PWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662670; c=relaxed/simple;
	bh=oNdOtJa0cnJuasJV9k5Nd2SNn13kJefEPV+8yj0g8c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hzAIeeM3L0mfVSznsIkGxs3vfA3D435sWtdmt+55klLEcVVmcYLaSr9tuaTJ6y8yR7i3NM0WowGuVhDq7p4ASErncFEdrPzJlv4Cfm4yCsvCaFomLstp3WALbwBHFzYKY2E/958lgBBSKEhPuZ9rzdOfGewRahVwrldONzLwA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVB3dXYE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVB3dXYE"
Received: by smtp.kernel.org (Postfix)
	id 31CC11F00898; Fri,  5 Jun 2026 12:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C163F1F00893;
	Fri,  5 Jun 2026 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662669;
	bh=JSj/FwKeeBTmsJUXRxyjL1AUFO9IzRl8dgcn1ZtrFp8=;
	h=From:Date:Subject:To:Cc;
	b=bVB3dXYEnEjRZO4oSKK4DnKBuhslOYATRTXTP5xLd6sCWAheZ5Y+mlAp0A5lK2pES
	 JkNzXXzF5W6y8aHRFp5tijbO8l0XbgdyEFAEmnMsB39/qpr3WWuMBuRzdQbvxGmEJP
	 UDJu2YqLaNIjlm90L01fGTon5gwXrGvqGEBFJ8ttP8IQjcRHap4qafbNL4SPpTkm5+
	 kMj92Q4ZbXgyicJtTREbrFzgNRCFRJB9tQ8WKZTk/1yUgU32Asvg5g52F0zva/Oz1v
	 j4up4n38EC2ZXrmn+FEgsyggTfQpG7kOELh89FZ1mMakrldMpG/eDJeqhCJWkjMnZg
	 JUAvenPq5CT2A==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 05 Jun 2026 08:31:04 -0400
Subject: [PATCH b4] Keep coverless review trailers on patches
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-review-double-review-email-v1-1-d52c2ca14024@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXMQQ6CMBSE4auQWdukVCXqVQyLvjLqMwimFTAh3
 N2icflPJt+MxKhMOBUzIkdN2nc5yk2BcPPdlUab3HDWVbaye7OeOJmmH6Tlv/jw2hrxpdhjCP7
 gtsjAM/Ki7y9+huxQ/7Y0yJ3htapYlg8JeATfggAAAA==
X-Change-ID: 20260605-review-double-review-email-ba1b09cca823
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4521; i=tamird@kernel.org;
 h=from:subject:message-id; bh=oNdOtJa0cnJuasJV9k5Nd2SNn13kJefEPV+8yj0g8c4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKB3uOLNNRmj33iV3+j+m1q3ItmKaYL81tTOC+5Cy3+
 NMPpmf1HRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZ6lxIjw670xQGlIYydRw7+0fnzh0vw9A3foufly7hM5wjrCaxIPsvw3+u8Skv
 ovlPrSgLO+MpsFlrzj/Ga/3rb6fN/mmY83b69kR8A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Trailer consolidation promoted matching per-patch trailers to the series
record even when the series had no cover letter. For a single-patch
series, this split the trailer and inline comments into two replies to
the same message.

Only promote trailers when there is a real cover letter, keeping a
coverless patch review together in one reply.

Assisted-by: Codex gpt-5.5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
See incorrectly split replies:
- https://lore.kernel.org/all/178066138611.3594.6559938011018564470.b4-review@b4/
- https://lore.kernel.org/all/178066138616.3594.4372925551839686675.b4-review@b4/
---
 src/b4/review_tui/_review_app.py |  7 +++++-
 src/tests/test_tui_review.py     | 52 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 8786fbb..38a7ba3 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1181,7 +1181,12 @@ class ReviewApp(CheckRunnerMixin, App[None]):
                             preview.pop('trailers', None)
                             b4.review._cleanup_review(patch, self._usercfg)
                         self._refresh_patch_item(pidx + 1)
-            elif self._selected_idx > 0 and new_trailers and self._patches:
+            elif (
+                self._has_cover
+                and self._selected_idx > 0
+                and new_trailers
+                and self._patches
+            ):
                 # Check if all patches now have the same trailer set —
                 # if so, promote to cover letter
                 new_names = {t.split(':', 1)[0].strip().lower() for t in new_trailers}
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index fb6fae0..ab6f4dd 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -10,6 +10,7 @@ cosmetic commit edits (e.g. reworded subjects via git rebase -i).
 """
 
 from typing import Any, Dict, List, Tuple
+from unittest import mock
 
 import pytest
 
@@ -179,6 +180,57 @@ def _rewrite_patches(
 # ---------------------------------------------------------------------------
 
 
+class TestTrailerConsolidation:
+    """Tests for consolidating matching trailers onto a cover letter."""
+
+    @pytest.mark.asyncio
+    async def test_coverless_patch_keeps_trailer_with_comments(
+        self, gitdir: str
+    ) -> None:
+        """A coverless patch sends its trailer and comments in one email."""
+        branch, _patch_shas = _create_review_branch_with_patches(
+            gitdir, 'coverless-trailer', ['patch 1']
+        )
+        session = _build_session(gitdir, branch)
+        session['cover_text'] = (
+            'patch 1\n\nNOTE: No cover letter provided by the author.'
+        )
+        my_email = str(session['usercfg']['email'])
+        session['patches'][0]['reviews'] = {
+            my_email: {
+                'name': str(session['usercfg']['name']),
+                'comments': [{'path': 'file', 'line': 1, 'text': 'Comment'}],
+            }
+        }
+
+        app = ReviewApp(session)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('t')
+            await pilot.pause()
+            await pilot.press('r')
+            await pilot.press('q')
+            await pilot.pause()
+
+            assert 'reviews' not in app._series
+            patch_review = app._patches[0]['reviews'][my_email]
+            assert patch_review['trailers'] == [f'Reviewed-by: {app._default_identity}']
+            assert patch_review['comments']
+
+            with mock.patch(
+                'b4.review._review._build_review_email',
+                return_value=mock.sentinel.email,
+            ):
+                msgs = b4.review.collect_review_emails(
+                    app._series,
+                    app._patches,
+                    app._cover_text,
+                    app._topdir,
+                    app._commit_shas,
+                )
+            assert msgs == [mock.sentinel.email]
+
+
 class TestReconcileAfterShell:
     """Tests for _reconcile_after_shell tracking fixup."""
 

---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260605-review-double-review-email-ba1b09cca823

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>


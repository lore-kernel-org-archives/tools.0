Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5332D45C
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690921; cv=none; b=p8/4r74nvOizzo9hcly/epJlB9v21jlA9vGr0WnegUtklA4pfqNE8D6+C+YhcK27YOic6gCL05FtqmTap3vPk5g5sHWRfc4Lhtsl6+/lwsI12mnByipuMRGavB//jNsd1iSnjzkN7Fp4zy1FyrFqsH5zoJvc/MCWrjDYMs9Lklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690921; c=relaxed/simple;
	bh=Lwi+qTjcaVQNwP44zSekgbTHIi9Aa0qP7gc/I4aIqkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b3IStOcZ2YcjU5k4j6PTUtYc1cgKK98niHXCCH+PsZcXqkBkYa5pOLy46nZFDR13zHFCdOR3lqE7e2qgF/EpWY4WNc5fv04SSFA/NmlqNpBW2BSeoxcI6xmKQFoPB+bXm8zfX4w8Bf0Oz511FfI2UsRYuEycoyIJwWMQ6H7+Peo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSCCpRs+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSCCpRs+"
Received: by smtp.kernel.org (Postfix)
	id 4532FC4AF09; Mon, 16 Mar 2026 19:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9280C19421;
	Mon, 16 Mar 2026 19:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773690921;
	bh=Lwi+qTjcaVQNwP44zSekgbTHIi9Aa0qP7gc/I4aIqkI=;
	h=From:Date:Subject:To:Cc:From;
	b=WSCCpRs+NoUlChum2y9rGtNmDnr3JwML/dLIwQvOKZt2ePA7XpM0c18OI3OwHK0WA
	 fknw7kEuWW2tjpJVUI0hyLgIbBGqb9TJqbXlIUE5CyJabfOeUlKfAvbC/oGCvJTXcr
	 eoH90uQV6gyvtDhRdcUxeK1ge0YyyGG6yOL3WAQ4KiFC3knpsR73Ti9FPN5ccwbB06
	 atc0p6PQDsJ9bWZWjexBf8T7mwX0Uj1C+5Tws1V373mu0uM8K3KnCaE4/7sVKHUnJE
	 1L1ZhM7okdcNG+cSIlk9hKZ7F9Qwwzy2UlHypu2li0RhvE4WpwR1TAIrk3rIJAG29w
	 WbMPxtgIhJ+rQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 15:55:14 -0400
Subject: [PATCH b4 v2] review: implement reply to selected follow-up
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-review-reply-followup-v2-1-f0482c4e8241@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBREr0L+2pr+Qqq48h6GBcVfqDaUtFAkh
 Ltb8ACuJjN5M7NCIG8owC1bwVM0wbg+GXHKoOnqviVmnsmD4ELyHDnbIZqTDHZh2lnr5mlgl1x
 oXdZSEClI3cGTNp9j9wGqgOqXhUm9qBn3wZ3qTBidX47ziAf75yciQ9YUJUp+lSgwv7/J92TPz
 rdQbdv2Bb17b7jRAAAA
X-Change-ID: 20260310-review-reply-followup-732ff9a62eeb
To: "\"Kernel.org Tools\"" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5563; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Lwi+qTjcaVQNwP44zSekgbTHIi9Aa0qP7gc/I4aIqkI=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJk7EjSelBdnbfzrEi8//3SLrbC2fUva/J5tm4Q1jmpMz
 lZj5d7YMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKoNWhkZDtQ9UFEMO+po8O6o4JEWv3s9cRMm9hpddPu9vyly9V1HWYZ/Sk03D2Q
 Z9tSwv1d2mdSzODg3YQ7/x7C499k5Vre/2ZzmBQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Reply to the selected follow-up instead of collapsing all follow-ups
from the same author into one sidebar target.

The review TUI grouped follow-ups by sender in the sidebar and keyed
scroll/reply targeting by sender address. That made later replies from
the same author indistinguishable, so selecting a nested follow-up could
not target that specific message.

Track follow-up sidebar items and positions by message-id instead. This
keeps distinct follow-ups selectable and lets preview-mode reply use the
currently selected follow-up as its target.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: Codex gpt-5.4
---
Changes in v2:
- Changed trailer to Assisted-by.
- Link to v1: https://patch.msgid.link/20260310-review-reply-followup-v1-1-c49160861213@kernel.org
---
 src/b4/review_tui/_review_app.py |  3 --
 src/tests/test_review.py         | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 4a3c5bf..079e967 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -256,7 +256,6 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         self._followup_positions: Dict[str, int] = {}
         self._followup_comments: Dict[int, List[Dict[str, Any]]] = {}
         self._followup_header_map: Dict[int, Dict[str, Any]] = {}
-        self._selected_followup_msgid: Optional[str] = None
         self._show_external_comments: bool = False
         self._hint_gutter_lines: Dict[int, Tuple[str, int]] = {}
         self._reply_sent: bool = False
@@ -398,7 +397,6 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         self._followup_positions = {}
         self._followup_header_map = {}
         self._hint_gutter_lines = {}
-        self._selected_followup_msgid = None
 
         self._selected_idx = display_idx
 
@@ -1962,4 +1960,3 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         config = b4.get_main_config()
         has_agent = bool(config.get('review-agent-command') and config.get('review-agent-prompt-path'))
         self.push_screen(HelpScreen(_review_help_lines(has_agent=has_agent)))
-
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index ffffb87..55018ba 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -10,6 +10,8 @@ import b4
 from b4 import review
 from b4 import review_tui
 from b4.review._review import REVIEW_MAGIC_MARKER, check_series_attestation
+from b4.review_tui._review_app import FollowupItem, ReviewApp
+from textual.widgets import ListView
 
 
 # -- Helper diffs used across tests ------------------------------------------
@@ -165,6 +167,67 @@ Check return value.
         assert comments[0]['line'] == 12
         assert comments[0]['text'] == 'Check return value.'
 
+
+class TestReviewAppFollowupItems:
+    """Tests for per-message follow-up selection in the review TUI."""
+
+    @staticmethod
+    def _make_session() -> Dict[str, Any]:
+        return {
+            'topdir': '/tmp',
+            'cover_text': 'Subject\n',
+            'tracking': {},
+            'series': {},
+            'patches': [{}],
+            'base_commit': '',
+            'commit_shas': ['deadbeef'],
+            'commit_subjects': ['Patch subject'],
+            'sha_map': {},
+            'abbrev_len': 12,
+            'default_identity': 'Tester <tester@example.com>',
+            'usercfg': {'name': 'Tester', 'email': 'tester@example.com'},
+            'cover_subject_clean': 'Subject',
+        }
+
+    def test_append_followup_items_keeps_each_message(self) -> None:
+        """Follow-up sidebar entries stay one-per-message, even per author."""
+        app = ReviewApp(self._make_session())
+        app._followup_comments = {
+            1: [
+                {
+                    'msgid': 'reply-1@example.com',
+                    'fromname': 'Alice',
+                    'fromemail': 'alice@example.com',
+                },
+                {
+                    'msgid': 'reply-2@example.com',
+                    'fromname': 'Alice',
+                    'fromemail': 'alice@example.com',
+                },
+            ],
+        }
+
+        async def _run() -> None:
+            async with app.run_test() as _pilot:
+                lv = app.query_one('#patch-list', ListView)
+                followups = [child for child in lv.children if isinstance(child, FollowupItem)]
+                assert len(followups) == 2
+                assert [child.msgid for child in followups] == [
+                    'reply-1@example.com',
+                    'reply-2@example.com',
+                ]
+
+        import asyncio
+        asyncio.run(_run())
+
+    def test_selected_followup_keeps_reply_action_in_preview(self) -> None:
+        """Reply stays enabled in preview mode for a selected follow-up."""
+        app = ReviewApp(self._make_session())
+        app._preview_mode = True
+        app._selected_followup_msgid = 'reply@example.com'
+
+        assert app.check_action('edit_reply', ()) is True
+
     def test_multiple_comments_same_hunk(self) -> None:
         """Multiple comments in the same hunk are all collected."""
         edited = """\

---
base-commit: 4520fe6cfb7c7c58bd764d0d9493bd91907d9448
change-id: 20260310-review-reply-followup-732ff9a62eeb

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>


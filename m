Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D773C3F4E
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 19:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758890; cv=none; b=NCboPnRDxlr2sC5iTSf41tdzJ5qTzueqljTq63JW95eYq1d3gxQwAjuzrWlF3EE4DoT0kdxfO2pPBt0xeGlNqxEoKdyqsn9E/Zv2Sa5FMXk7WIGA++nMzUfqqreHJJPD296DIX3A9vo8YhgeRYR+9At9S4yO6lzZvQCAobsESxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758890; c=relaxed/simple;
	bh=vKGZolSM0p39NcLnMI8KA0KKgubpSmKd8P7KTFKPkhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eM/adHAqYd9IoD04Qxg2qVKA8rIUDnmvvZy1KwPD39kCSgbsMlzXBKb04+Il/tIelKBfCs3e18SXWe4mUoWd5I08pFYk+uO3B4b8YE/Vvw7bDbRSXa8sWgKgyAL5cNypNARh8ANf9PT2wQPOGiOhAl/EsmvyuK0SxMmQyao8viY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDAL6FPp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDAL6FPp"
Received: by smtp.kernel.org (Postfix)
	id 73E971F00899; Fri, 18 Sep 2026 19:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFC71F00898;
	Fri, 18 Sep 2026 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758883;
	bh=pKEWQ7GvpSTx2geDT3juXV4aG2X3UYWCB0CRJPhe5K4=;
	h=From:Date:Subject:To:Cc;
	b=hDAL6FPpTD2zxMJa2EyZEmZsrVSixHlVVCoYLho7OeW1KFitaLt7syIUTuTx3Zi29
	 68WlNF6ZOJejIiDD86vcb11wtOCg46QqMlhiU7YJTNlftYvqO7neoUJnM9+PprkgUl
	 uFNEQzTvCi1HtGjkpobGkvRZgvWPMm2ILqIj6zhHROk5rSN/KYN73ARCqe337wg8nD
	 c6p+5zpM/ar1RcVZU9nebH3pEtObFndmkGEOICvuXdZDZleC+SJp6TkHsUeLxJbMkh
	 bU4WRS4pe5S3kEXpWgdULQIAb3ik08jZ1/u5S6iPTB7NlTeQLUbTHmtWBo06oA6HyJ
	 27BuYsH7IQAeg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 18 Sep 2026 15:14:28 -0400
Subject: [PATCH b4] prep: preserve recipients above cover changelogs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fix-cover-recipient-parsing-v1-1-5ccbbb572736@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CQAyE4VchPdtkIUgWX8V4gDJiPSybFokJ4
 d1d9fhPJt9ODlM4XaqdDJu6LqlEfapIHkOawTqVpiY0XejryHd9sywbjA2iWZFWzoO5ppljRNu
 fETqZAhUhG8r9p19pbOn23/w1PiHrl6Xj+ADnd7B+gwAAAA==
X-Change-ID: 20260918-fix-cover-recipient-parsing-88e495e06cd0
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10582; i=tamird@kernel.org;
 h=from:subject:message-id; bh=vKGZolSM0p39NcLnMI8KA0KKgubpSmKd8P7KTFKPkhk=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlre+flnfyt8uPuX8WkoGyb+8kbG+47rXFWTBCVvfdtx
 55tT/WjOyayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEz1z3qGv8IPJGcf2utXw9r1SPpJ2Cn1WzV8W6vZu6UPXW5+ucHO/R8jw4aoJW0
 HiqWW36pJadi2sT/Xn/NwG+eBQoX4V1tcppb+ZgIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

When a cover has a changelog below "---", prep --auto-to-cc misses its
existing To/Cc trailers and appends duplicate addresses after the notes.
New recipients are also placed there, where the preflight recipient
check does not find them after the cover's diffstat is generated.

bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
limited separator parsing to bodies containing a diff or diffstat. Raw
cover letters contain neither, so their trailers are treated as prose
when a changelog follows them.

Allow callers to explicitly request separator parsing. Use that context
when collecting and updating cover trailers, extracting destinations,
and folding a cover into a single patch. Retain automatic diff detection
for other messages so free-form replies keep text after visual
separators.

Add regression coverage for raw covers, repeated recipient updates, and
separator text in replies.

Fixes: bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
This surfaced while preparing a patatt reroll: --auto-to-cc appended
recipients below the changelog, and b4 send still reported that
--auto-to-cc needed to run.
---
 src/b4/__init__.py     | 14 ++++++---
 src/b4/ez.py           | 12 +++++---
 src/tests/test_ez.py   | 83 +++++++++++++++++++++++++++++++++++++++++++++++++-
 src/tests/test_mbox.py | 13 ++++++++
 4 files changed, 112 insertions(+), 10 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a2af378..8abd990 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3076,6 +3076,8 @@ class LoreMessage:
     @staticmethod
     def get_body_parts(
         body: str,
+        *,
+        force_separator: bool = False,
     ) -> Tuple[List[LoreTrailer], str, List[LoreTrailer], str, str]:
         # remove any starting/trailing blank lines
         body = body.replace('\r', '')
@@ -3093,11 +3095,11 @@ class LoreMessage:
             signature = sparts[1]
             body = sparts[0]
 
-        # Only apply patch-separator splitting for messages that contain actual
-        # diff content. Free-form replies should not be split on '---', which
-        # may appear as a visual separator unrelated to any patch.
+        # Covers can have a changelog separator before a diffstat is generated.
+        # Their callers must request splitting explicitly. For other messages,
+        # require diff content so visual separators in replies remain prose.
         parts = [body]
-        if DIFF_RE.search(body) or DIFFSTAT_RE.search(body):
+        if force_separator or DIFF_RE.search(body) or DIFFSTAT_RE.search(body):
             parts = re.split(r'^---\s*\n', body, maxsplit=1, flags=re.M)
             if len(parts) == 2:
                 basement = parts[1]
@@ -3157,12 +3159,14 @@ class LoreMessage:
         addmysob: bool = False,
         fallback_order: str = '*',
         omit_trailers: Optional[List[str]] = None,
+        *,
+        force_separator: bool = False,
     ) -> None:
 
         config = get_main_config()
 
         bheaders, message, btrailers, basement, signature = LoreMessage.get_body_parts(
-            self.body
+            self.body, force_separator=force_separator
         )
 
         sobtr = LoreTrailer()
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 618abb9..0f06f59 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2268,7 +2268,9 @@ def make_msgid_tpt(change_id: str, revision: int, domain: Optional[str] = None)
 def get_cover_dests(
     cbody: str,
 ) -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], str]:
-    htrs, cmsg, mtrs, basement, sig = b4.LoreMessage.get_body_parts(cbody)
+    htrs, cmsg, mtrs, basement, sig = b4.LoreMessage.get_body_parts(
+        cbody, force_separator=True
+    )
     tos = list()
     ccs = list()
     for mtr in list(mtrs):
@@ -2323,7 +2325,7 @@ def mixin_cover(cbody: str, patches: List[Tuple[str, EmailMessage]]) -> None:
         b4.LoreMessage.get_body_parts(pbody)
     )
     _cheaders, cmessage, ctrailers, cbasement, csignature = (
-        b4.LoreMessage.get_body_parts(cbody)
+        b4.LoreMessage.get_body_parts(cbody, force_separator=True)
     )
     nbparts = list()
     nmessage = cmessage.rstrip('\r\n') + '\n'
@@ -4006,7 +4008,7 @@ def auto_to_cc() -> None:
 
     logger.debug('Getting addresses from cover letter')
     cover, tracking = load_cover(strip_comments=False)
-    parts = b4.LoreMessage.get_body_parts(cover)
+    parts = b4.LoreMessage.get_body_parts(cover, force_separator=True)
     seen = set()
     for ltr in parts[2]:
         if not ltr.addr:
@@ -4063,7 +4065,9 @@ def auto_to_cc() -> None:
         cmsg.set_payload(cover, charset='utf-8')
         clm = b4.LoreMessage(cmsg)
         fallback_order = str(config.get('send-trailer-order', 'To,Cc,*'))
-        clm.fix_trailers(extras=extras, fallback_order=fallback_order)
+        clm.fix_trailers(
+            extras=extras, fallback_order=fallback_order, force_separator=True
+        )
         logger.info('---')
         logger.info('You can trim/expand this list with: b4 prep --edit-cover')
         store_cover(clm.body, tracking)
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index ad9ed34..485acf7 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -470,7 +470,28 @@ def _make_patch_msg(body: str) -> EmailMessage:
     return msg
 
 
-def test_mixin_cover_relocates_basement_without_change_id() -> None:
+def test_get_cover_dests_without_diffstat() -> None:
+    cbody = (
+        'Describe the series.\n\n'
+        'To: Project List <list@example.com>\n'
+        'Cc: Maintainer <maintainer@example.com>\n'
+        'Signed-off-by: Test Override <test-override@example.com>\n'
+        '---\nChanges in v2:\n- Update the implementation.\n'
+    )
+
+    tos, ccs, body = b4.ez.get_cover_dests(cbody)
+
+    assert tos == [('Project List', 'list@example.com')]
+    assert ccs == [('Maintainer', 'maintainer@example.com')]
+    assert body == (
+        'Describe the series.\n\n'
+        'Signed-off-by: Test Override <test-override@example.com>\n'
+        '---\nChanges in v2:\n- Update the implementation.\n'
+    )
+
+
+@pytest.mark.parametrize('with_diffstat', [False, True])
+def test_mixin_cover_relocates_basement_without_change_id(with_diffstat: bool) -> None:
     """A cover whose basement omits `change-id:` must still relocate the
     basement (base-commit, prerequisites) to the very bottom of a lone patch.
 
@@ -494,6 +515,10 @@ def test_mixin_cover_relocates_basement_without_change_id() -> None:
         '---\n'
         'base-commit: 1234abcd5678\n'
     )
+    if not with_diffstat:
+        cbody = cbody.replace(
+            ' feature.txt | 1 +\n 1 file changed, 1 insertion(+)\n', ''
+        )
 
     b4.ez.mixin_cover(cbody, [('', patch)])
     body, _charset = b4.LoreMessage.get_payload(patch)
@@ -1332,6 +1357,62 @@ def _as_stdin(bdata: bytes) -> Any:
 NEW_COVER = 'A brand new subject\n\nAnd a brand new body.'
 
 
+@pytest.mark.parametrize('strategy', ['branch-description', 'commit'])
+def test_auto_to_cc_preserves_cover_changelog(gitdir: str, strategy: str) -> None:
+    b4.MAIN_CONFIG.update(
+        {
+            'prep-cover-strategy': strategy,
+            'send-series-to': 'Project List <list@example.com>',
+            'send-series-cc': (
+                'Maintainer <maintainer@example.com>, Reviewer <reviewer@example.com>'
+            ),
+        }
+    )
+    _run_prep('-n', 'recipients')
+    pathlib.Path(gitdir, 'recipient-test.txt').write_text('A series change.\n')
+    ecode, out = b4.git_run_command(None, ['add', 'recipient-test.txt'])
+    assert ecode == 0, out
+    ecode, out = b4.git_run_command(None, ['commit', '-m', 'Add a file'])
+    assert ecode == 0, out
+
+    changelog = (
+        'Changes in v2:\n- Keep recipient updates separate from the notes.\n'
+        '\n---\nChanges in v1:\n- Initial version.'
+    )
+    cover = (
+        'A series with recipients\n\nDescribe the series.\n\n'
+        'To: Project List <list@example.com>\n'
+        'Cc: Maintainer <maintainer@example.com>\n'
+        'Signed-off-by: Test Override <test-override@example.com>\n'
+        f'---\n{changelog}'
+    )
+    _, tracking = b4.ez.load_cover()
+    b4.ez.store_cover(cover, tracking)
+
+    _run_prep('--auto-to-cc')
+    updated, updated_tracking = b4.ez.load_cover()
+    expected = cover.replace(
+        'Signed-off-by:', 'Cc: Reviewer <reviewer@example.com>\nSigned-off-by:'
+    )
+    assert updated == expected
+    assert updated_tracking == tracking
+
+    pre_head = b4.git_revparse_obj('HEAD')
+    _run_prep('--auto-to-cc')
+    assert b4.git_revparse_obj('HEAD') == pre_head
+    assert b4.ez.load_cover() == (updated, tracking)
+    tos, ccs, _tag, _patches = b4.ez.get_prep_branch_as_patches()
+    assert tos == [('Project List', 'list@example.com')]
+    assert ccs == [
+        ('Maintainer', 'maintainer@example.com'),
+        ('Reviewer', 'reviewer@example.com'),
+    ]
+    branch = b4.git_get_current_branch()
+    assert branch is not None
+    info = b4.ez.get_info(branch)
+    assert (info['needs-recipients'], info['needs-auto-to-cc']) == (False, False)
+
+
 def test_prep_cover_from_file_round_trip(
     prepdir: str, tmp_path: pathlib.Path, capsys: pytest.CaptureFixture[str]
 ) -> None:
diff --git a/src/tests/test_mbox.py b/src/tests/test_mbox.py
index e1df42b..a2883e0 100644
--- a/src/tests/test_mbox.py
+++ b/src/tests/test_mbox.py
@@ -12,6 +12,19 @@ import b4.command
 import b4.mbox
 
 
+def test_minimize_thread_preserves_reply_separator() -> None:
+    body = 'First review comment.\n\n---\n\nSecond review comment.\n'
+    msg = EmailMessage()
+    msg['From'] = 'Reviewer <reviewer@example.com>'
+    msg['Subject'] = 'Re: [PATCH] A change'
+    msg['Message-ID'] = '<reply@example.com>'
+    msg.set_content(body)
+
+    (minimized,) = b4.mbox.minimize_thread([msg])
+
+    assert b4.LoreMessage.get_payload(minimized)[0].strip() == body.strip()
+
+
 @pytest.mark.parametrize(
     'mboxf, shazamargs, compareargs, compareout, b4cfg',
     [

---
base-commit: 6876839fc0612111d461d823b266f125862649f1
change-id: 20260918-fix-cover-recipient-parsing-88e495e06cd0

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>


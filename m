Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E613536E478
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 20:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231673; cv=none; b=luxhPvPaGBQ/l2Jc/edH0ii2tFQDlQ9XRuhgMzljRX/DKgt+58AFagPRSUdRNLaMai6X4NPD4diOYlPcyl434FNjgtg5EEiLXPJtkvD85iy4k4D3fPodWXOFLKLh5iuaYEgLu6W/vpQyvsRUnohAW0vhtjLCNVORG56SUXwnQQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231673; c=relaxed/simple;
	bh=Ak1hLrwJHOv8sdwJIGgJkEPb42AfnUF0/0c7jBwIm3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pssgBdSejqgp/YW2wNmh/OhDym7+S5R4UWm93GQIZxZs+gF6UoMmHGZrZ5NqBZJ1yRqd2MbR01PBJJYSFmN/OgUAjG7mhndGQWKiQXD+SOMS/n/8WDr90ALvPGug0uvXZ0lgNUXGEKRfjolzylkPNlt6DKMJtiutGbgPO91KUok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz+Tz1Al; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz+Tz1Al"
Received: by smtp.kernel.org (Postfix)
	id 9B97A1F00893; Mon,  5 Oct 2026 20:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1404A1F000FF;
	Mon,  5 Oct 2026 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791231671;
	bh=LhwYWCY5ktHpZl4yTxvGNs0KziDPhfB+5j+pd2J8FLI=;
	h=From:Date:Subject:To:Cc;
	b=Cz+Tz1Al9qdrzf2KVdR80dunIOdf8ypaOYZzMJlo0wL7ruJn2PBZIdN732/BEe0wR
	 2k8B1qYuTJWAoDyiDn54ugQJpD7dVB8hcHgESR9pBkBMUGiY/8EvMD7biegLjpkQuM
	 0CBaxy29wQUbEr7Ex/3se9eyx3WXIJAmSQeDqNZ53e1SofWUp9qwyqTZfL69Q9qIzc
	 zDVM1S04m1MNpBIbV8clokpAlHK2QZNo0vK73LULgdo4omOzZ3OH7Om7FL3pp7tnAm
	 uNL1kr4Eb2rEoT2SONLwaseZdKNPV7EWQ/kjhJh7fm1LfLOct948lcWKI6K1O32/qN
	 WCkQ2RNxHZC+Q==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 05 Oct 2026 13:20:52 -0700
Subject: [PATCH b4 v2] prep: preserve recipients above cover changelogs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-fix-cover-recipient-parsing-v2-1-fe647a72374c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42PTQ6CMBCFr2JmbU2L/LryHoYFLSOMmoLT0mgId
 7fABVy+yZfvvZnBIRM6uBxmYAzkaLAxJMcDmL6xHQpqY4ZEJrmsVCnu9BFmCMiC0dBIaL0YG3Z
 kO1GWmFYZyty0EqJhZIz4Zr+BTqHeb27SDzR+1a5UT84P/N0mBLWxf7UFJZTIjNFaZ0VSnPPrE
 9ni6zRwB/WydzG+p/iU30fUy/IDYTmg1fIAAAA=
X-Change-ID: 20260918-fix-cover-recipient-parsing-88e495e06cd0
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Markus Probst <markus.probst@posteo.de>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16291; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Ak1hLrwJHOv8sdwJIGgJkEPb42AfnUF0/0c7jBwIm3c=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlH2Nb8aHuo2vHve8aLm/tYZS9u2vbknmLdp1eHDl/wb
 FU1Kt83uWMiC4MYF4OlmCJLouihvempt/fIZr47DjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOgYM3BxCsBUR7QwMnQfEowukFL7u0p+Xnqx724b21PaC6wbmAVFkr7oudja3mZkWGmeK2P
 z7H08++TLa9uSVzaZ734RlP7pxefvep6X1cTP8AIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

When a cover had a changelog below "---", prep --auto-to-cc missed its
existing To/Cc trailers and appended duplicate addresses after the
notes. New recipients were also placed there, where the preflight
recipient check did not find them after generating the cover's
diffstat.

bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
limited separator parsing to bodies containing a diff or diffstat. Raw
cover letters contain neither, so their trailers were treated as prose
when a changelog followed them.

Allow callers to explicitly request separator parsing when updating
cover trailers, extracting destinations, and folding a cover into a
single patch. Retain automatic diff detection for other messages so
free-form replies keep text after visual separators.

Older versions already appended recipients below changelogs [0].
Scan the entire cover for existing addresses, as the send path does,
to avoid adding them again. Use the same discovery for destination
extraction so covers with only misplaced recipients also pass
preflight. Deduplicate destinations by email address because old covers
can already contain the same recipient above and below the changelog.
Preserve the existing changelog text and insert new recipients above
the separator.

Exercise recipient updates with normal, misplaced, and duplicated
trailers, including repeated updates, recipient preflight, and cover
templates without a diffstat. Retain coverage for separators in plain
replies.

Fixes: bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
Reported-by: Markus Probst <markus.probst@posteo.de>
Closes: https://github.com/mricon/b4/issues/78
Suggested-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Link: https://lore.kernel.org/tools/75ad1175-cd4f-4da3-ac6a-7005e0248fb7@rsg.ci.i.u-tokyo.ac.jp/ [0]
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
This revision incorporates Akihiko's recipient scan from his earlier
fix [1], as requested in his review [0]. It also makes destination
extraction recognize recipients left below changelogs by older b4
versions, so those covers satisfy recipient preflight.

Link: https://lore.kernel.org/tools/20260628-prep-v1-1-8ac18db0abf3@rsg.ci.i.u-tokyo.ac.jp/ [1]
---
Changes in v2:
- Scan the whole cover for existing recipients, as Akihiko suggested,
  including addresses older versions appended below the changelog.
- Recognize those addresses during destination extraction as well,
  so a cover with only misplaced recipients passes preflight.
- Return each destination once when a cover already contains duplicate
  recipient trailers.
- Extend coverage to legacy covers and templates without a diffstat.
- Add Markus's Reported-by and the issue's Closes trailer.
- Use the force_patch_separator parameter name from Akihiko's patch.
- Link to v1: https://patch.msgid.link/20260918-fix-cover-recipient-parsing-v1-1-5ccbbb572736@kernel.org
---
 src/b4/__init__.py     |  16 ++++--
 src/b4/ez.py           |  44 ++++++++++++-----
 src/tests/test_ez.py   | 129 ++++++++++++++++++++++++++++++++++++++++++++++++-
 src/tests/test_mbox.py |  10 ++++
 4 files changed, 180 insertions(+), 19 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index c482f46..5f68b4b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3162,6 +3162,7 @@ class LoreMessage:
     def find_trailers(
         body: str, followup: bool = False
     ) -> Tuple[List[LoreTrailer], List[str]]:
+        """Find trailers before the email signature, ignoring '---' boundaries."""
         ignores = {'phone', 'mail', 'email', 'e-mail', 'prerequisite-message-id'}
         headers = {'subject', 'date', 'from'}
         links = {'link', 'buglink', 'closes'}
@@ -3310,7 +3311,10 @@ class LoreMessage:
     @staticmethod
     def get_body_parts(
         body: str,
+        *,
+        force_patch_separator: bool = False,
     ) -> Tuple[List[LoreTrailer], str, List[LoreTrailer], str, str]:
+        """Split sections and find trailers in the main body's last paragraph."""
         # remove any starting/trailing blank lines
         body = body.replace('\r', '')
         body = body.strip('\n')
@@ -3327,11 +3331,11 @@ class LoreMessage:
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
+        if force_patch_separator or DIFF_RE.search(body) or DIFFSTAT_RE.search(body):
             parts = re.split(r'^---\s*\n', body, maxsplit=1, flags=re.M)
             if len(parts) == 2:
                 basement = parts[1]
@@ -3391,12 +3395,14 @@ class LoreMessage:
         addmysob: bool = False,
         fallback_order: str = '*',
         omit_trailers: Optional[List[str]] = None,
+        *,
+        force_patch_separator: bool = False,
     ) -> None:
 
         config = get_main_config()
 
         bheaders, message, btrailers, basement, signature = LoreMessage.get_body_parts(
-            self.body
+            self.body, force_patch_separator=force_patch_separator
         )
 
         sobtr = LoreTrailer()
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 6ff9502..6edb0ff 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2270,17 +2270,33 @@ def make_msgid_tpt(change_id: str, revision: int, domain: Optional[str] = None)
 def get_cover_dests(
     cbody: str,
 ) -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], str]:
-    htrs, cmsg, mtrs, basement, sig = b4.LoreMessage.get_body_parts(cbody)
+    htrs, cmsg, main_trailers, basement, sig = b4.LoreMessage.get_body_parts(
+        cbody, force_patch_separator=True
+    )
+    # Earlier b4 versions could put recipients below the changelog. Find
+    # those addresses too, but remove To/Cc only from the main trailer
+    # block so the changelog stays intact.
+    all_trailers, _others = b4.LoreMessage.find_trailers(cbody)
     tos = list()
     ccs = list()
-    for mtr in list(mtrs):
-        if mtr.lname == 'to' and mtr.addr is not None:
-            tos.append(mtr.addr)
-            mtrs.remove(mtr)
-        elif mtr.lname == 'cc' and mtr.addr is not None:
-            ccs.append(mtr.addr)
-            mtrs.remove(mtr)
-    cbody = b4.LoreMessage.rebuild_message(htrs, cmsg, mtrs, basement, sig)
+    seen = set()
+    for trailer in all_trailers:
+        if trailer.lname not in ('to', 'cc') or trailer.addr is None:
+            continue
+        _realname, addr = trailer.addr
+        if addr in seen:
+            continue
+        seen.add(addr)
+        if trailer.lname == 'to':
+            tos.append(trailer.addr)
+        else:
+            ccs.append(trailer.addr)
+    main_trailers = [
+        trailer
+        for trailer in main_trailers
+        if trailer.lname not in ('to', 'cc') or trailer.addr is None
+    ]
+    cbody = b4.LoreMessage.rebuild_message(htrs, cmsg, main_trailers, basement, sig)
     return tos, ccs, cbody
 
 
@@ -2325,7 +2341,7 @@ def mixin_cover(cbody: str, patches: List[Tuple[str, EmailMessage]]) -> None:
         b4.LoreMessage.get_body_parts(pbody)
     )
     _cheaders, cmessage, ctrailers, cbasement, csignature = (
-        b4.LoreMessage.get_body_parts(cbody)
+        b4.LoreMessage.get_body_parts(cbody, force_patch_separator=True)
     )
     nbparts = list()
     nmessage = cmessage.rstrip('\r\n') + '\n'
@@ -4008,9 +4024,9 @@ def auto_to_cc() -> None:
 
     logger.debug('Getting addresses from cover letter')
     cover, tracking = load_cover(strip_comments=False)
-    parts = b4.LoreMessage.get_body_parts(cover)
+    trailers, _others = b4.LoreMessage.find_trailers(cover)
     seen = set()
-    for ltr in parts[2]:
+    for ltr in trailers:
         if not ltr.addr:
             continue
         seen.add(ltr.addr[1])
@@ -4065,7 +4081,9 @@ def auto_to_cc() -> None:
         cmsg.set_payload(cover, charset='utf-8')
         clm = b4.LoreMessage(cmsg)
         fallback_order = str(config.get('send-trailer-order', 'To,Cc,*'))
-        clm.fix_trailers(extras=extras, fallback_order=fallback_order)
+        clm.fix_trailers(
+            force_patch_separator=True, extras=extras, fallback_order=fallback_order
+        )
         logger.info('---')
         logger.info('You can trim/expand this list with: b4 prep --edit-cover')
         store_cover(clm.body, tracking)
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index ccfe0dc..0aa89c6 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -463,7 +463,28 @@ def _make_patch_msg(body: str) -> EmailMessage:
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
 
@@ -487,6 +508,10 @@ def test_mixin_cover_relocates_basement_without_change_id() -> None:
         '---\n'
         'base-commit: 1234abcd5678\n'
     )
+    if not with_diffstat:
+        cbody = cbody.replace(
+            ' feature.txt | 1 +\n 1 file changed, 1 insertion(+)\n', ''
+        )
 
     b4.ez.mixin_cover(cbody, [('', patch)])
     body, _charset = b4.LoreMessage.get_payload(patch)
@@ -631,6 +656,108 @@ def test_mixin_cover_keeps_notes_with_midsection_trailer_line() -> None:
     assert body.index('base-commit:') > body.index('diff --git')
 
 
+@pytest.mark.parametrize('strategy', ['branch-description', 'commit'])
+@pytest.mark.parametrize('location', ['above-cut', 'below-cut', 'both'])
+def test_auto_to_cc_preserves_cover_recipients(
+    gitdir: str, strategy: str, location: str, tmp_path: pathlib.Path
+) -> None:
+    template = tmp_path / 'cover.txt'
+    template.write_text('${cover}\n---\nbase-commit: ${base_commit}\n')
+    b4.MAIN_CONFIG.update(
+        {
+            'prep-cover-strategy': strategy,
+            'prep-cover-template': str(template),
+            'send-series-to': 'Project List <list@example.com>',
+            'send-series-cc': 'Maintainer <maintainer@example.com>',
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
+    recipients = (
+        'To: Project List <list@example.com>\nCc: Maintainer <maintainer@example.com>\n'
+    )
+    cover = 'A series with recipients\n\nDescribe the series.\n\n'
+    if location != 'below-cut':
+        cover += recipients
+    cover += 'Signed-off-by: Test Override <test-override@example.com>\n'
+    cover += f'---\n{changelog}'
+    if location != 'above-cut':
+        cover += f'\n\n{recipients}'
+    cover = cover.rstrip()
+    _, tracking = b4.ez.load_cover()
+    b4.ez.store_cover(cover, tracking)
+
+    # Old b4 versions put recipients below the changelog, sometimes
+    # duplicating those above it. Discover each destination once without
+    # adding another copy to the cover.
+    _run_prep('--auto-to-cc')
+    assert b4.ez.load_cover() == (cover, tracking)
+    tos, ccs, _tag, _patches = b4.ez.get_prep_branch_as_patches()
+    assert tos == [('Project List', 'list@example.com')]
+    assert ccs == [('Maintainer', 'maintainer@example.com')]
+    branch = b4.git_get_current_branch()
+    assert branch is not None
+    info = b4.ez.get_info(branch)
+    assert (info['needs-recipients'], info['needs-auto-to-cc']) == (False, False)
+
+    b4.MAIN_CONFIG.update(
+        {
+            'send-series-to': (
+                'Project List <list@example.com>, Additional List <additional@example.com>'
+            ),
+            'send-series-cc': (
+                'Maintainer <maintainer@example.com>, Reviewer <reviewer@example.com>'
+            ),
+        }
+    )
+    _run_prep('--auto-to-cc')
+    updated, updated_tracking = b4.ez.load_cover()
+    if location == 'below-cut':
+        expected = cover.replace(
+            'Signed-off-by:',
+            'To: Additional List <additional@example.com>\n'
+            'Cc: Reviewer <reviewer@example.com>\nSigned-off-by:',
+        )
+    else:
+        expected = cover.replace(
+            'Cc: Maintainer',
+            'To: Additional List <additional@example.com>\nCc: Maintainer',
+            1,
+        ).replace(
+            'Signed-off-by:', 'Cc: Reviewer <reviewer@example.com>\nSigned-off-by:'
+        )
+    assert updated == expected
+    assert updated_tracking == tracking
+
+    pre_head = b4.git_revparse_obj('HEAD')
+    _run_prep('--auto-to-cc')
+    assert b4.git_revparse_obj('HEAD') == pre_head
+    assert b4.ez.load_cover() == (updated, tracking)
+    tos, ccs, _tag, patches = b4.ez.get_prep_branch_as_patches()
+    assert sorted(tos) == [
+        ('Additional List', 'additional@example.com'),
+        ('Project List', 'list@example.com'),
+    ]
+    assert sorted(ccs) == [
+        ('Maintainer', 'maintainer@example.com'),
+        ('Reviewer', 'reviewer@example.com'),
+    ]
+    ((_commit, patch),) = patches
+    body, _charset = b4.LoreMessage.get_payload(patch)
+    assert body.index('base-commit:') > body.index('diff --git')
+    info = b4.ez.get_info(branch)
+    assert (info['needs-recipients'], info['needs-auto-to-cc']) == (False, False)
+
+
 # A single patch whose commit message body is empty: the payload jumps straight
 # from the (header-borne) subject to the '---' cutline. This is what b4 emits
 # when the author leaves the commit message blank.
diff --git a/src/tests/test_mbox.py b/src/tests/test_mbox.py
index 02648b9..7918628 100644
--- a/src/tests/test_mbox.py
+++ b/src/tests/test_mbox.py
@@ -16,6 +16,16 @@ import b4.mbox
 from .helpers.mail import make_msg
 
 
+def test_minimize_thread_preserves_reply_separator() -> None:
+    body = 'First review comment.\n\n---\n\nSecond review comment.\n'
+    msg = make_msg('reply@example.com', 'Re: [PATCH] A change', body=body)
+
+    (minimized,) = b4.mbox.minimize_thread([msg])
+    decoded_body, _ = b4.LoreMessage.get_payload(minimized)
+
+    assert decoded_body.strip() == body.strip()
+
+
 @pytest.mark.parametrize(
     'mboxf, shazamargs, compareargs, compareout',
     [

---
base-commit: fde280870f9a212df1317b35df19e80bfda32a57
change-id: 20260918-fix-cover-recipient-parsing-88e495e06cd0

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>


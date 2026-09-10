Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBAB4746C9
	for <tools@linux.kernel.org>; Thu, 10 Sep 2026 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040474; cv=none; b=tTZ6moD4S33U8BK/au6ThvbCagPNs1z839N0FUjFlQ/2tR0sPpmGctDOKl++ruibVRwagFztbsC9DQKAQ4yz0hwo0gcheD+ytfFmH/hLmyBsEtT/mL76mH3Ajh5jvGE2tOv8rJUgw3ZlgksyxP8OXqq4bCuRr9dwFWZkk7Z7/10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040474; c=relaxed/simple;
	bh=MOGAnhJcc4r1igY+DjBEUkL87y5BHRGexG+ObRdssJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OZGnzKAz9myhaw6ZoYQUxMxJ/TUfF9h/g2u/shb68iiwiG3sbQIMNdSiSuorP3f900mSgFczNumCS1qaWEkZRSdtQ3BnlKUOhqYVgoIAQxWMNs4JRSo1j5YnSAIJCtaKg2HlJz+18VAqsS0DX7D7syDOZGiFgKuSE/g06akcWS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQEZkNPK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQEZkNPK"
Received: by smtp.kernel.org (Postfix)
	id 4C8AD1F000FF; Thu, 10 Sep 2026 11:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346871F00898;
	Thu, 10 Sep 2026 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789040472;
	bh=0z0f7azaXBBMxWFD/tTBcH8/rzSGSrtZC5QTE7bQdEo=;
	h=From:To:Cc:Subject:Date;
	b=mQEZkNPKAan6AZV+npz3I92PUupXQW4tMSU5Y+yvXr8F+vS38+OgMbpST9r4/ezje
	 2dEBzjDGmxikWnKKXeE+D5jKN4x3zhXiFk1R3C0PBV1DLiVf6c+kT9oyxBNdcR5MZQ
	 xx36J8uyAmrmgVIA3asOxpF0vZmQNyywZbcE+5H6VSMimZJCCvMW88lSp8g+fdnnRX
	 5GgeKsRK6Tb9we0f9+fYNNEsk4iSgipm3GjChGGAesJv5jTnjJMUiQTohXtEWOp7c8
	 xhm0iqM/bjIfUoXSTnESGAkYlD7qH7TMABfAnfIypWxNeOR6yAVS7xSLt69XFF6bAr
	 tR1JrOCiwju8Q==
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] review: Generate thanks commit URLs for known repositories automatically
Date: Thu, 10 Sep 2026 12:32:26 +0100
Message-ID: <20260910113504.84582-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At present generating links to commits in web interfaces for inclusion in
thanks mails requires manual configuration of a global configuration option
b4.thanks-commit-url-mask, or the per remote equivalent b4-thanks-url-mask.
Given that we also have the b4-check-repo option to configure where to check
to see if thanks are ready to be sent and practically speaking this is
likely to be one of a very small set of hosting providers this is all a bit
redundant.

If one of git.kernel.org, github or gitlab is configured for the check repo
then default to generating a link based on our knowledge of the remote, a
manual configuration will still override the default.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 docs/config.rst                             |  29 ++++-
 docs/maintainer/review.rst                  |  15 +--
 src/b4/command.py                           |   4 +
 src/b4/review_tui/_tracking_app.py          |   4 +-
 src/b4/templates/thanks-am-template.example |   3 +
 src/b4/templates/thanks-pr-template.example |   3 +
 src/b4/ty.py                                | 116 +++++++++++++++-----
 src/tests/test_tui_tracking.py              |  45 ++++++++
 src/tests/test_ty.py                        |  15 +++
 9 files changed, 190 insertions(+), 44 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 4dce6892..9b7da54c 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -463,6 +463,11 @@ Attestation settings
          [remote "spi"]
              b4-check-repo = https://git.kernel.org/pub/scm/linux/kernel/git/username/spi.git
 
+     For recognized HTTP(S) web hosts (currently git.kernel.org,
+     github.com, and gitlab.com), b4 also uses this URL to link commits in
+     the thank-you message. Other transports and hosting layouts can use
+     the per-remote ``b4-commit-url-mask`` described below.
+
      See :ref:`queuing thanks <thanks_queue>` for details.
 
      Default: ``None``
@@ -471,14 +476,26 @@ Attestation settings
      Used when creating summaries for ``b4 ty`` and the review TUI
      thank-you flow. Can be a value like::
 
-         thanks-commit-url-mask = https://git.kernel.org/username/c/%.12s
+         thanks-commit-url-mask = https://git.kernel.org/username/tree/c/%.12s
+
+     If no explicit mask or recognized check-repository URL is available,
+     b4 falls back to using commit hashes.
+
+     For repositories with multiple remotes, an explicit per-remote mask
+     takes precedence over this setting::
+
+         [remote "spi"]
+             b4-commit-url-mask = https://git.kernel.org/username/spi/c/%.12s
 
-     If not set, b4 falls back to using commit hashes.
+     When no explicit per-remote mask is set, b4 automatically derives one
+     from that remote's ``b4-check-repo`` for recognized HTTP(S) web hosts.
+     The same derivation is attempted from :term:`b4.thanks-check-repo` when
+     neither a per-remote nor this global mask is available.
 
-     When this option is set, the review TUI's thank-you preview offers
-     a **Queue** option that stores the message for delayed delivery.
-     Queued messages are held until their commit is verified published,
-     so you can push your commits before the thank-you is sent.
+     When a commit URL can be generated, the review TUI's thank-you preview
+     offers a **Queue** option that stores the message for delayed delivery.
+     Queued messages are held until their commit is verified published, so
+     you can push your commits before the thank-you is sent.
      See :ref:`queuing thanks <thanks_queue>` for details.
 
      .. note::
diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 47aa8e7b..1b47780f 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -1023,13 +1023,14 @@ screen shows the generated message with keybindings to **Send**
 
 **Queuing thanks for delayed delivery**
 
-When :term:`b4.thanks-commit-url-mask` is configured, the thank-you
-preview also offers a **Queue** option (``W``). Queuing writes the
-message as an RFC 2822 file in ``.git/b4-review/queue/`` instead of
-sending it immediately. This is useful when you want to push your
-commits to a public tree before sending thank-you messages — the
-message references commit URLs that may not resolve until the push is
-complete.
+When b4 can generate a web link for the commit — from
+:term:`b4.thanks-commit-url-mask`, a per-remote ``b4-commit-url-mask``,
+or a recognized HTTP(S) ``b4-check-repo`` URL — the thank-you preview also
+offers a **Queue** option (``W``). Queuing writes the message as an RFC 2822
+file in ``.git/b4-review/queue/`` instead of sending it immediately. This
+is useful when you want to push your commits to a public tree before
+sending thank-you messages — the message references commit URLs that may
+not resolve until the push is complete.
 
 Files are named ``{change-id}-v{revision}.msg`` and the check target is
 recorded as ``X-Check-URL``, ``X-Check-Commit``, ``X-Check-Repo`` and
diff --git a/src/b4/command.py b/src/b4/command.py
index 00c4c84b..41bb9ae8 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -249,6 +249,10 @@ def cmd_pr(cmdargs: argparse.Namespace) -> None:
 def cmd_ty(cmdargs: argparse.Namespace) -> None:
     import b4.ty
 
+    if cmdargs.gitdir:
+        # The initial setup happens relative to cwd. Reload repository-local
+        # thank-you settings when -g names a different tree.
+        b4.setup_config(cmdargs, topdir=cmdargs.gitdir)
     b4.ty.main(cmdargs)
 
 
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 4c25f8cf..0f39b8f2 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -4926,8 +4926,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # Compute checkurl from last taken commit for queue support
         checkurl: Optional[str] = None
         checkcommit: Optional[str] = None
-        cidmask = config.get('thanks-commit-url-mask')
-        if isinstance(cidmask, str) and cidmask and '%' in cidmask:
+        cidmask = b4.ty.get_commit_url_mask(topdir, target_branch)
+        if cidmask and '%' in cidmask:
             # Find the last commit ID (highest patch index with a commit)
             last_cid: Optional[str] = None
             for _idx, cid in commits:
diff --git a/src/b4/templates/thanks-am-template.example b/src/b4/templates/thanks-am-template.example
index b2c8986a..bac889a0 100644
--- a/src/b4/templates/thanks-am-template.example
+++ b/src/b4/templates/thanks-am-template.example
@@ -20,6 +20,9 @@ ${quote}
 #   url = https://...
 #   fetch = ...
 #   b4-treename = uname/sound.git
+#   b4-check-repo = https://git.kernel.org/pub/scm/linux/kernel/git/uname/sound.git
+# The check repo is also used to generate commit links for known web hosts.
+# For other hosts, or to choose a different link format, set an explicit mask:
 #   b4-commit-url-mask = https://git.kernel.org/uname/sound/c/%.8s
 Applied to ${branch}, thanks!
 
diff --git a/src/b4/templates/thanks-pr-template.example b/src/b4/templates/thanks-pr-template.example
index 13bd2058..afae4992 100644
--- a/src/b4/templates/thanks-pr-template.example
+++ b/src/b4/templates/thanks-pr-template.example
@@ -20,6 +20,9 @@ ${quote}
 #   url = https://...
 #   fetch = ...
 #   b4-treename = uname/sound.git
+#   b4-check-repo = https://git.kernel.org/pub/scm/linux/kernel/git/uname/sound.git
+# The check repo is also used to generate commit links for known web hosts.
+# For other hosts, or to choose a different link format, set an explicit mask:
 #   b4-commit-url-mask = https://git.kernel.org/uname/sound/c/%.8s
 Merged into ${branch}, thanks!
 
diff --git a/src/b4/ty.py b/src/b4/ty.py
index bbce1499..a6d9ad9b 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -13,6 +13,7 @@ import json
 import os
 import re
 import sys
+import urllib.parse
 from email.message import EmailMessage
 from pathlib import Path
 from string import Template
@@ -61,8 +62,6 @@ ${signature}
 
 # Used to track commits created by current user
 MY_COMMITS: Optional[Dict[str, Tuple[str, str, List[str]]]] = None
-# Used to track additional branch info
-BRANCH_INFO: Optional[Dict[str, str]] = None
 
 
 def git_get_merge_id(
@@ -294,6 +293,72 @@ def auto_locate_series(
     return found
 
 
+def _derive_commit_url_mask(repo: str) -> Optional[str]:
+    """Return a commit URL mask for known web repository layouts."""
+    try:
+        parsed = urllib.parse.urlparse(repo.rstrip('/'))
+        hostname = parsed.hostname
+        has_credentials = parsed.username is not None or parsed.password is not None
+    except ValueError:
+        return None
+    if parsed.scheme not in ('http', 'https') or not hostname:
+        return None
+    if has_credentials or parsed.query or parsed.fragment:
+        return None
+
+    hostname = hostname.lower()
+    path = parsed.path.rstrip('/')
+    if hostname in ('github.com', 'www.github.com', 'gitlab.com', 'www.gitlab.com'):
+        path = re.sub(r'\.git$', '', path)
+    if hostname == 'git.kernel.org':
+        repo_parts = re.sub(r'\.git$', '', path).strip('/').split('/')
+        if len(repo_parts) < 2 or not all(repo_parts):
+            return None
+        short_path = f'/{repo_parts[-2]}/{repo_parts[-1]}'
+        base = urllib.parse.urlunparse(
+            (parsed.scheme, parsed.netloc, short_path, '', '', '')
+        ).replace('%', '%%')
+        return f'{base}/c/%.12s'
+    base = urllib.parse.urlunparse(
+        (parsed.scheme, parsed.netloc, path, '', '', '')
+    ).replace('%', '%%')
+    if hostname in ('github.com', 'www.github.com'):
+        return f'{base}/commit/%s'
+    if hostname in ('gitlab.com', 'www.gitlab.com'):
+        return f'{base}/-/commit/%s'
+    return None
+
+
+def _get_commit_url_mask(config: ConfigDictT, binfo: Dict[str, str]) -> Optional[str]:
+    """Resolve the commit URL mask for one branch's remote."""
+    if 'b4-commit-url-mask' in binfo:
+        return binfo['b4-commit-url-mask'] or None
+
+    checkrepo = binfo.get('b4-check-repo')
+    if checkrepo:
+        cidmask = _derive_commit_url_mask(checkrepo)
+        if cidmask:
+            return cidmask
+
+    global_cidmask = config.get('thanks-commit-url-mask')
+    if global_cidmask:
+        assert isinstance(global_cidmask, str), (
+            'thanks-commit-url-mask must be a string'
+        )
+        return global_cidmask
+
+    global_checkrepo = config.get('thanks-check-repo')
+    if global_checkrepo:
+        assert isinstance(global_checkrepo, str), 'thanks-check-repo must be a string'
+        return _derive_commit_url_mask(global_checkrepo)
+    return None
+
+
+def get_commit_url_mask(gitdir: Optional[str], branch: str) -> Optional[str]:
+    """Return the effective commit URL mask for a branch."""
+    return _get_commit_url_mask(b4.get_main_config(), get_branch_info(gitdir, branch))
+
+
 def set_branch_details(
     gitdir: Optional[str], branch: str, jsondata: JsonDictT, config: ConfigDictT
 ) -> Tuple[JsonDictT, ConfigDictT]:
@@ -302,8 +367,6 @@ def set_branch_details(
     for key, val in binfo.items():
         if key == 'b4-treename':
             config['thanks-treename'] = val
-        elif key == 'b4-commit-url-mask':
-            config['thanks-commit-url-mask'] = val
         elif key == 'b4-pr-template':
             config['thanks-pr-template'] = val
         elif key == 'b4-am-template':
@@ -311,6 +374,8 @@ def set_branch_details(
         elif key == 'branch':
             jsondata['branch'] = val
 
+    config['thanks-commit-url-mask'] = _get_commit_url_mask(config, binfo)
+
     if 'thanks-treename' in config and isinstance(config['thanks-treename'], str):
         jsondata['treename'] = config['thanks-treename']
     elif 'url' in binfo:
@@ -330,7 +395,7 @@ def set_branch_details(
 def generate_pr_thanks(
     gitdir: Optional[str], jsondata: JsonDictT, branch: str, cmdargs: argparse.Namespace
 ) -> EmailMessage:
-    config = b4.get_main_config()
+    config = b4.get_main_config().copy()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_PR_TEMPLATE
     _ctpr = config.get('thanks-pr-template')
@@ -369,9 +434,7 @@ def generate_pr_thanks(
 def generate_am_thanks(
     gitdir: Optional[str], jsondata: JsonDictT, branch: str, cmdargs: argparse.Namespace
 ) -> EmailMessage:
-    global BRANCH_INFO
-    BRANCH_INFO = None
-    config = b4.get_main_config()
+    config = b4.get_main_config().copy()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_AM_TEMPLATE
     _ctat = config.get('thanks-am-template')
@@ -900,7 +963,6 @@ def check_stale_thanks(outdir: str) -> None:
 
 
 def get_wanted_branch(cmdargs: argparse.Namespace) -> str:
-    global BRANCH_INFO
     gitdir = cmdargs.gitdir
     if not cmdargs.branch:
         # Find out our current branch
@@ -995,7 +1057,7 @@ def _parse_checkurl(checkurl: str) -> Tuple[Optional[str], Optional[str]]:
     """Extract (repo_url, commit_id) from a thanks-commit-url-mask URL.
 
     The repo URL is only derivable from cgit/github/gitlab-style commit
-    URLs; for anything else (e.g. git.kernel.org /username/c/ shortlinks)
+    URLs; for anything else (e.g. git.kernel.org /username/tree/c/ shortlinks)
     we can usually still recover the commit id from a trailing hex run.
     Either element may be None.
     """
@@ -1037,10 +1099,6 @@ def get_check_repo_for_branch(
     3. the branch's remote URL
     4. a repo URL derived from the commit check URL
     """
-    # Long-lived callers (the TUI) thank series on different branches;
-    # never serve another branch's cached remote info
-    global BRANCH_INFO
-    BRANCH_INFO = None
     binfo = get_branch_info(gitdir, branch)
     crepo = binfo.get('b4-check-repo')
     if crepo:
@@ -1568,20 +1626,18 @@ def _process_queue_locked(
 
 
 def get_branch_info(gitdir: Optional[str], branch: str) -> Dict[str, str]:
-    global BRANCH_INFO
-    if BRANCH_INFO is not None:
-        return BRANCH_INFO
-
-    BRANCH_INFO = dict()
+    branch_info: Dict[str, str] = dict()
 
-    remotecfg = b4.get_config_from_git('branch\\.%s\\..*' % branch)
+    remotecfg = b4.get_config_from_git(
+        r'^branch\.%s\.' % re.escape(branch), gitdir=gitdir
+    )
     if 'remote' not in remotecfg:
         # Did not find a matching branch entry, so look at remotes
         gitargs = ['remote', 'show']
         lines = b4.git_get_command_lines(gitdir, gitargs)
         if not len(lines):
             # No remotes? Hmm...
-            return BRANCH_INFO
+            return branch_info
 
         remote = None
         for entry in lines:
@@ -1591,21 +1647,23 @@ def get_branch_info(gitdir: Optional[str], branch: str) -> Dict[str, str]:
 
         if remote is None:
             # Not found any matching remotes
-            return BRANCH_INFO
+            return branch_info
 
-        BRANCH_INFO['remote'] = remote
-        BRANCH_INFO['branch'] = branch.replace(f'{remote}/', '')
+        branch_info['remote'] = remote
+        branch_info['branch'] = branch.replace(f'{remote}/', '')
 
     else:
-        BRANCH_INFO['remote'] = remotecfg['remote']
+        branch_info['remote'] = remotecfg['remote']
         if 'merge' in remotecfg:
-            BRANCH_INFO['branch'] = re.sub(r'^refs/heads/', '', remotecfg['merge'])
+            branch_info['branch'] = re.sub(r'^refs/heads/', '', remotecfg['merge'])
 
     # Grab template overrides
-    remotecfg = b4.get_config_from_git('remote\\.%s\\..*' % BRANCH_INFO['remote'])
-    BRANCH_INFO.update(remotecfg)
+    remotecfg = b4.get_config_from_git(
+        r'^remote\.%s\.' % re.escape(branch_info['remote']), gitdir=gitdir
+    )
+    branch_info.update(remotecfg)
 
-    return BRANCH_INFO
+    return branch_info
 
 
 def main(cmdargs: argparse.Namespace) -> None:
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index e3d79ef7..1e064cfd 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -2931,6 +2931,51 @@ class TestSeriesLifecycle:
         # Only the two taken patches contribute commits (by 1-based index).
         assert jsondata['commits'] == [(1, 'aaa111'), (2, 'bbb222')]
 
+    def test_thank_preview_uses_branch_check_repo_url(self, gitdir: str) -> None:
+        """The queue target uses the same per-remote URL as the message."""
+        from unittest import mock
+
+        checkrepo = 'https://git.kernel.org/pub/scm/linux/kernel/git/example/spi.git'
+        b4.git_set_config(gitdir, 'branch.for-next.remote', 'spi')
+        b4.git_set_config(gitdir, 'branch.for-next.merge', 'refs/heads/for-next')
+        b4.git_set_config(gitdir, 'remote.spi.b4-check-repo', checkrepo)
+        commit = '0123456789abcdef0123456789abcdef01234567'
+        tracking_data: Dict[str, Any] = {
+            'series': {
+                'header-info': {},
+                'taken': {'branch': 'for-next'},
+                'expected': 1,
+            },
+            'patches': [
+                {
+                    'title': '[PATCH] test patch',
+                    'header-info': {'msgid': 'patch@example.com'},
+                    'taken': {'commit-id': commit},
+                }
+            ],
+        }
+        series = {'change_id': 'test-change-id'}
+        app = mock.Mock()
+        generated = email.message.EmailMessage()
+
+        with (
+            patch('b4.git_get_toplevel', return_value=gitdir),
+            patch('b4.review.load_tracking', return_value=('cover', tracking_data)),
+            patch('b4.ty.generate_am_thanks', return_value=generated),
+            patch('b4.get_email_signature', return_value='Test'),
+        ):
+            TrackingApp._start_thank(app, series)
+
+        app._show_thank_preview.assert_called_once_with(
+            generated,
+            series,
+            checkurl=f'https://git.kernel.org/example/spi/c/{commit[:12]}',
+            checkcommit=commit,
+            archive_after=False,
+            checkrepo=checkrepo,
+            checkbranch='for-next',
+        )
+
     def test_partial_series_ingests_new_revision(self, gitdir: str) -> None:
         """A 'partial' series must ingest an incoming v2 and record it.
 
diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index be132ff5..dbd6657f 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -7,6 +7,7 @@ from unittest import mock
 import pytest
 
 import b4
+import b4.command
 import b4.ty
 
 
@@ -62,6 +63,20 @@ def test_render_ty_review_layout() -> None:
     assert b4.ty.parse_ty_review(buf, sections) == set()
 
 
+def test_cmd_ty_reloads_config_for_gitdir(monkeypatch: pytest.MonkeyPatch) -> None:
+    """-g makes repository-local thank-you settings come from that tree."""
+    cmdargs = mock.Mock(gitdir='/other/repo')
+    setup_config = mock.Mock()
+    ty_main = mock.Mock()
+    monkeypatch.setattr(b4, 'setup_config', setup_config)
+    monkeypatch.setattr(b4.ty, 'main', ty_main)
+
+    b4.command.cmd_ty(cmdargs)
+
+    setup_config.assert_called_once_with(cmdargs, topdir='/other/repo')
+    ty_main.assert_called_once_with(cmdargs)
+
+
 def test_parse_ty_review_marks_skips() -> None:
     """Flipping '+' to 'x' on an item marks it (by position) skipped."""
     sections = _review_sections()
-- 
2.47.3


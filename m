Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B997446C01
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321894; cv=none; b=AYeBUMX60TmsOssnwLePszua1I+bO3WhBMUA5yifX4/het8xdSJjlJj22BqVLQADNpLI+0/fgxS741qmVyXfaamNQJ3k4hwwPJkkswwR0BmJXJl1V5ov5P8zCVVcuNyyrYVjWklSjXOKgRMnyI6vdj22PMQtofjyRcM34WjlAgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321894; c=relaxed/simple;
	bh=tFo3jFa4Q/qF2JUxXWupp4oS+7fb1rfYscZkw1XzqDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppW6c1bxEQxN/Y74mhlrCfyXz6xWzSKIKqSRHQqtC6NJN0E7mjv9aQlc3K48Qf/T8Ma5iuRWGuM01FT4Dwz3boZYSE+i2bxj6Q1G0Znh3POvIbQE3FOUWUuq9oTRRP9nLIIRHZ2vLNjg/TD+gy6eMkjplSLOMmxzzl9cVNmJdR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et5mS4E+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et5mS4E+"
Received: by smtp.kernel.org (Postfix)
	id A744E1F00ACF; Wed, 29 Jul 2026 10:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD23E1F000E9;
	Wed, 29 Jul 2026 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321881;
	bh=z3D2vwJeQv6ZeDQfHEjiDuhwQQYLrtmfzD1JOV3TkC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=et5mS4E+fQKG1Xm8zzcTD/kgkjWMN7/FX8yKiSgsbIKTdWuTF3nKzYyUT31qUluNc
	 e2AzWe5Q/5EQdPlsT4eseFQLz1aRkJMVf9VvAL5xBL6lnItCFq7VwbYc0BQhyKxEja
	 RD7umzjzwtZxPgonWEWqS52jLY17IfwXBYweR2QB7VNZgKyVNen/mEBy+uivy3sTfa
	 q0aqfNeb8RBY8QwP+5jLITRCRomf/+vMFfLWo63vC4eHgYjUz5iVqEoDDoWyblNJR6
	 Mnc1aFmKHYWw7cqELPhwsAgkH/pQUqXqryHrcx9MFrJ2NRsrP2x6d9bFOOqbiKwCVb
	 ChNMBztfqz/ZQ==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 12:44:33 +0200
Subject: [PATCH b4 6/6] tests: exercise the scratch worktrees under
 submodule.recurse
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-scratch-worktrees-v1-6-e96995158d4a@kernel.org>
References: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
In-Reply-To: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=14775; i=brauner@kernel.org;
 h=from:subject:message-id; bh=tFo3jFa4Q/qF2JUxXWupp4oS+7fb1rfYscZkw1XzqDQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRl3pxwWHLG75Vn72zmPjRl2rzqU25XPKyX3Ty2fmfeF
 oe1i1i1ZneUsjCIcTHIiimyOLSbhMst56nYbJSpATOHlQlkCAMXpwBM5NALRoZran/3fDgvuenF
 JFdp9rXGjw2fFL5lv5668cH5Sg3dQIZEhv+V8zpOrHCN0Ys7OTe1Q988P4T7rN1h9dMmzyOn66w
 7IsoHAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

An active but unpopulated submodule reproduces the recursing-checkout
fatal: a gitlink and .gitmodules in the tree plus a configured url, and
no clone anywhere. That is what every fresh linked worktree sees. The
fixture is built with plumbing so nothing is signed and master can be
advanced in place, and submodule.recurse goes on only once it is done.

git_fetch_am_into_repo() runs end to end that way, and so do the four
modal test-apply probes, the take flow's cherry-pick probe and
reroll()'s sent-tag worktree, which has to come back with the tag it
was asked for.

The fake-am test drives a series that bumps a gitlink, because that is
what puts a submodule into the synthesized tree, and poisons gpg on top
of it, so the reset and the am are covered at once.

The git_run_command() fixup gets its own test. With log.abbrevCommit=true
and a -c override in front of the subcommand the sha has to come back in
full.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/conftest.py          |  52 ++++++++++++++-
 src/tests/test___init__.py     |  15 +++++
 src/tests/test_ez.py           |  45 ++++++++++++-
 src/tests/test_tui_tracking.py | 146 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 255 insertions(+), 3 deletions(-)

diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index 48b2573..aa6dbc8 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -2,7 +2,7 @@ import copy
 import os
 import pathlib
 import sys
-from typing import Generator
+from typing import Callable, Generator
 
 import pytest
 
@@ -49,6 +49,56 @@ def sampledir(request: pytest.FixtureRequest) -> str:
     return os.path.join(request.path.parent, 'samples')
 
 
+@pytest.fixture(scope='function')
+def add_unpopulated_submodule() -> Callable[..., str]:
+    """Factory: advance master with an active but unpopulated submodule.
+
+    A gitlink and .gitmodules in the tree plus a configured url is all it
+    takes: no clone exists anywhere, which is exactly what any fresh linked
+    worktree sees, and a git command recursing into submodules there dies with
+    "fatal: not a git repository: .../worktrees/<wt>/modules/<name>". Built
+    with plumbing so nothing is signed and master can be advanced in place.
+    Callers flip submodule.recurse on only once their own fixtures are built --
+    this setup would trip over it too. Returns the sha the gitlink points at.
+    """
+
+    def _add(gitdir: str, name: str = 'sub') -> str:
+        ecode, head = b4.git_run_command(gitdir, ['rev-parse', 'master'])
+        assert ecode == 0
+        gitlink = head.strip()
+        gm = pathlib.Path(gitdir) / '.gitmodules'
+        gm.write_text(f'[submodule "{name}"]\n\tpath = {name}\n\turl = ./{name}\n')
+        ecode, _ = b4.git_run_command(gitdir, ['add', '.gitmodules'])
+        assert ecode == 0
+        ecode, _ = b4.git_run_command(
+            gitdir,
+            ['update-index', '--add', '--cacheinfo', f'160000,{gitlink},{name}'],
+        )
+        assert ecode == 0
+        ecode, tree = b4.git_run_command(gitdir, ['write-tree'])
+        assert ecode == 0
+        ecode, commit = b4.git_run_command(
+            gitdir,
+            ['commit-tree', tree.strip(), '-p', 'master'],
+            stdin=f'add {name} gitlink\n'.encode(),
+        )
+        assert ecode == 0
+        ecode, _ = b4.git_run_command(
+            gitdir, ['update-ref', 'refs/heads/master', commit.strip()]
+        )
+        assert ecode == 0
+        ecode, _ = b4.git_run_command(gitdir, ['reset', '--hard', 'master'])
+        assert ecode == 0
+        ecode, entry = b4.git_run_command(gitdir, ['ls-tree', 'master', name])
+        assert ecode == 0 and entry.startswith('160000 commit'), (
+            f'gitlink did not land in master: {entry!r}'
+        )
+        b4.git_set_config(gitdir, f'submodule.{name}.url', f'./{name}')
+        return gitlink
+
+    return _add
+
+
 @pytest.fixture(scope='function')
 def gitdir(
     request: pytest.FixtureRequest, tmp_path: pathlib.Path
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index e66f993..b02ed12 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1219,3 +1219,18 @@ def test_edit_in_editor_normalizes_crlf(
     monkeypatch.setenv('GIT_EDITOR', 'true')
     out = b4.edit_in_editor(b'line one\r\nline two\r\rlast\r\n', filehint='reply.eml')
     assert out == b'line one\nline two\n\nlast\n'
+
+
+def test_git_run_command_log_fixup_looks_past_option_prefix(gitdir: str) -> None:
+    """``--no-abbrev-commit`` must survive a leading ``-c`` override.
+
+    git_run_command counteracts log.abbrevCommit by injecting the flag after
+    the subcommand -- which it can only find by skipping the ``-c key=value``
+    pairs callers prefix (see SCRATCH_GIT_OPTS).
+    """
+    b4.git_set_config(gitdir, 'log.abbrevCommit', 'true')
+    ecode, out = b4.git_run_command(gitdir, ['-c', 'gc.auto=0', 'log', '-1'])
+    assert ecode == 0
+    assert out.startswith('commit '), out
+    sha = out.split('\n', 1)[0].split()[1]
+    assert len(sha) == 40, f'log abbreviated the sha despite the fixup: {sha}'
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 192b000..97a3bd2 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1,7 +1,7 @@
 import logging
 import os
 from email.message import EmailMessage
-from typing import Any, Dict, Generator, List, Optional, Set, Tuple, cast
+from typing import Any, Callable, Dict, Generator, List, Optional, Set, Tuple, cast
 from unittest.mock import patch
 
 import pytest
@@ -1253,3 +1253,46 @@ def test_claim_branch_description_restamps_series(prepdir: str) -> None:
     # Authorship preserved; committer re-stamped to the current identity.
     assert all(a == orig_email for a, _c in post)
     assert all(c == 'changed@example.com' for _a, c in post)
+
+
+def test_reroll_ignores_submodule_recurse(
+    gitdir: str, add_unpopulated_submodule: Callable[..., str]
+) -> None:
+    """reroll()'s sent-tag worktree is one of b4's scratch worktrees too.
+
+    Under prep-cover-strategy=commit the series is cherry-picked into a fresh
+    sparse worktree whose ``checkout -f`` dies on the user's submodule.recurse
+    -- and the sent tag goes with it, swallowed as "Error tagging the
+    revision".
+    """
+    add_unpopulated_submodule(gitdir)
+
+    b4.MAIN_CONFIG.update({'prep-cover-strategy': 'commit'})
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        ['--no-stdin', '--no-interactive', '--offline-mode', 'prep', '-n', 'pytest']
+    )
+    b4.ez.cmd_prep(cmdargs)
+
+    with open(os.path.join(gitdir, 'file1.txt'), 'a') as fh:
+        fh.write('reroll tweak\n')
+    b4.git_run_command(gitdir, ['add', 'file1.txt'])
+    ecode, _ = b4.git_run_command(gitdir, ['commit', '-m', 'reroll: tweak file1'])
+    assert ecode == 0
+
+    _cover, tracking = b4.ez.load_cover(strip_comments=True)
+    tagname, _rev = b4.ez.get_sent_tagname(
+        tracking['series']['change-id'], b4.ez.SENT_TAG_PREFIX, 1
+    )
+
+    # Only now flip the config the bug needs, so the fixture setup above never
+    # ran under recursion itself.
+    b4.git_set_config(gitdir, 'submodule.recurse', 'true')
+
+    mybranch = b4.git_get_current_branch()
+    assert mybranch is not None
+    b4.ez.reroll(mybranch, 'sent tag message\n', 'reroll-recurse@test.local')
+
+    assert b4.git_revparse_tag(None, tagname), (
+        f'reroll did not tag {tagname}: the scratch worktree recursed'
+    )
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index b4db46b..993c640 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -15,7 +15,7 @@ import datetime
 import email.message
 import os
 import pathlib
-from typing import Any, Dict, List, Optional, Tuple
+from typing import Any, Callable, Dict, List, Optional, Tuple
 from unittest.mock import patch
 
 import pytest
@@ -3010,6 +3010,114 @@ class TestCrossWorktreeFetch:
         assert blob.strip() == 'cross-worktree marker'
 
 
+def _gitlink_bump_series(gitdir: str, name: str = 'sub') -> b4.LoreSeries:
+    """A 1-patch series that bumps the submodule gitlink.
+
+    The patch carries an ``index <old>..<new> 160000`` line, so the fake-am
+    tree synthesized from it holds a gitlink of its own -- which is what makes
+    make_fake_am_range's ``reset --hard`` recurse.
+    """
+    ecode, newlink = b4.git_run_command(gitdir, ['rev-parse', 'master'])
+    assert ecode == 0
+    ecode, _ = b4.git_run_command(
+        gitdir,
+        ['update-index', '--cacheinfo', f'160000,{newlink.strip()},{name}'],
+    )
+    assert ecode == 0
+    ecode, tree = b4.git_run_command(gitdir, ['write-tree'])
+    assert ecode == 0
+    ecode, commit = b4.git_run_command(
+        gitdir,
+        ['commit-tree', tree.strip(), '-p', 'master'],
+        stdin=f'bump {name}\n'.encode(),
+    )
+    assert ecode == 0
+    ecode, mbox = b4.git_run_command(
+        gitdir, ['format-patch', '-1', '--stdout', commit.strip()], decode=False
+    )
+    assert ecode == 0
+    assert b'160000' in mbox, 'patch does not carry a gitlink index line'
+    ecode, _ = b4.git_run_command(gitdir, ['reset', '--hard', 'master'])
+    assert ecode == 0
+    msgs = b4.mailsplit_bytes(mbox)
+    for idx, msg in enumerate(msgs):
+        if not msg['Message-Id']:
+            msg['Message-Id'] = f'<gitlink-bump-{idx}@test.local>'
+    return b4.review._get_lore_series(msgs)
+
+
+class TestScratchWorktreeSubmodules:
+    """b4's scratch worktrees must ignore the user's submodule.recurse.
+
+    A fresh linked worktree has no per-worktree submodule clones, so a
+    recursing checkout or reset dies with "fatal: not a git repository:
+    .../worktrees/<wt>/modules/<name>" before anything is applied. In a repo
+    carrying submodules (the b4 repo itself among them) that killed every
+    review-branch creation and shazam apply.
+    """
+
+    def test_fetch_am_ignores_submodule_recurse(
+        self, gitdir: str, add_unpopulated_submodule: Callable[..., str]
+    ) -> None:
+        add_unpopulated_submodule(gitdir)
+
+        # An am-able patch on top of the submodule-bearing master.
+        patchfile = pathlib.Path(gitdir) / 'sub_recurse_patch.txt'
+        patchfile.write_text('submodule recurse marker\n')
+        ecode, _ = b4.git_run_command(gitdir, ['add', 'sub_recurse_patch.txt'])
+        assert ecode == 0
+        ecode, tree = b4.git_run_command(gitdir, ['write-tree'])
+        assert ecode == 0
+        ecode, commit = b4.git_run_command(
+            gitdir,
+            ['commit-tree', tree.strip(), '-p', 'master'],
+            stdin=b'add sub_recurse_patch\n',
+        )
+        assert ecode == 0
+        ecode, mbox = b4.git_run_command(
+            gitdir, ['format-patch', '-1', '--stdout', commit.strip()], decode=False
+        )
+        assert ecode == 0
+        ecode, _ = b4.git_run_command(gitdir, ['reset', '--hard', 'master'])
+        assert ecode == 0
+
+        # Only now flip the config the bug needs, so the fixture setup above
+        # never ran under recursion itself.
+        b4.git_set_config(gitdir, 'submodule.recurse', 'true')
+
+        b4.git_fetch_am_into_repo(gitdir, mbox, at_base='master', am_flags=['-3'])
+
+        ecode, blob = b4.git_run_command(
+            gitdir, ['show', 'FETCH_HEAD:sub_recurse_patch.txt']
+        )
+        assert ecode == 0, 'scratch-worktree apply failed under submodule.recurse'
+        assert blob.strip() == 'submodule recurse marker'
+
+    def test_fake_am_range_ignores_scratch_worktree_config(
+        self,
+        gitdir: str,
+        monkeypatch: pytest.MonkeyPatch,
+        add_unpopulated_submodule: Callable[..., str],
+    ) -> None:
+        """The fake-am staging worktree is a scratch worktree too.
+
+        Its ``reset --hard`` recurses once the synthesized tree carries a
+        gitlink, and its ``git am`` builds throwaway commits nothing will ever
+        ship -- so it must not reach for the user's signing key either.
+        """
+        add_unpopulated_submodule(gitdir)
+        lser = _gitlink_bump_series(gitdir)
+        b4.git_set_config(gitdir, 'submodule.recurse', 'true')
+        _poison_gpg_signing(monkeypatch)
+
+        start, end = lser.make_fake_am_range(gitdir=gitdir, at_base='master')
+
+        assert start, 'fake-am range died in the scratch worktree'
+        assert end
+        assert b4.git_commit_exists(gitdir, start)
+        assert b4.git_commit_exists(gitdir, end)
+
+
 class TestMergeTakeSkipRouting:
     """Take routing when patches are skipped (bug 6d1d35c).
 
@@ -4596,3 +4704,39 @@ class TestTestApplyNoSigning:
         screen = TakeConfirmScreen('linear', 'master', branch)
         ok, detail = screen._test_take()
         assert ok, f'take test-apply tried to sign: {detail}'
+
+
+class TestTestApplySubmoduleRecurse:
+    """The same test-applies must survive the user's submodule.recurse.
+
+    Their scratch worktree is as fresh as any other, so the sparse
+    ``checkout -f`` hits the same missing-submodule-clone fatal and every
+    probe reports a failure that has nothing to do with the patches.
+    """
+
+    @pytest.mark.parametrize(
+        'screen_cls',
+        [RebaseScreen, TargetBranchScreen, BaseSelectionScreen],
+        ids=lambda c: c.__name__,
+    )
+    def test_static_test_apply_ignores_submodule_recurse(
+        self,
+        gitdir: str,
+        screen_cls: Any,
+        add_unpopulated_submodule: Callable[..., str],
+    ) -> None:
+        ambytes = _one_patch_mbox(gitdir)
+        add_unpopulated_submodule(gitdir)
+        b4.git_set_config(gitdir, 'submodule.recurse', 'true')
+        ok, detail = screen_cls._test_apply_at(ambytes, 'master')
+        assert ok, f'{screen_cls.__name__} test-apply recursed: {detail}'
+
+    def test_take_confirm_test_apply_ignores_submodule_recurse(
+        self, gitdir: str, add_unpopulated_submodule: Callable[..., str]
+    ) -> None:
+        branch = _create_review_branch(gitdir, 'recurse-take', with_patch=True)
+        add_unpopulated_submodule(gitdir)
+        b4.git_set_config(gitdir, 'submodule.recurse', 'true')
+        screen = TakeConfirmScreen('linear', 'master', branch)
+        ok, detail = screen._test_take()
+        assert ok, f'take test-apply recursed: {detail}'

-- 
2.53.0


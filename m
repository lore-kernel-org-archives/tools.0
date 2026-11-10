Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314460;
	b=AxSBohb/CfrAv4bfSF/vyAyhXHwb/CWwqnl9QhXc1sJW+jmhbmzAqcHZ4I/cae6oO8ld
	 9skXG73JI4SnNY/y/2Bz4wWOhtf7xXVi2onk4NmNqaI7WW0yX3cWg87jMVfSXAnPy6oS+
	 eTqB6dBc/PYKMYD1j06goIeCjNeYSY3k27cP39jzp+XJvGPOPSC1AsJ3MdAikxns+XPTs
	 n4jgEr1OESt5a7vrA3YN7gQpwJUpV9yhFcowiTU0+Etod4huL/NBVHl0r6rvs7mDHmYwA
	 9u4dNuwq0pv87W6Qt+ZUXB7w3a9FLVBStrgMOeNS+kbwh1KHm5BsEXSzmid6nDnAXfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314460;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=jlNhGwcrsOs24dZ5COugW+8nAMWZeijK7sSKhmHxOfM=;
	b=YsJ/oDAX/2aqtBQdPACUsEWJ6qEBCxBFKD0Rk6TpCvVRWcfs//SiXJrfrhyUUrW5dKkY
	 weirbynMOxrT4X5MWT8hDLYHsm/gTUE5Zgtp/9W4cG+2m5a+uY4tNJ1OXXN53aWSxW7gR
	 SZHuCH2dna0IzlOn/R6VsKlcKS8gtHzChbucG50/0dGaKDMe5mz7pmr8rt6vcg43sZvQp
	 iQQ71tv7QsDMw8mfGsxo+g9+odEMQcmq3KbLvidaDGfm5RVLFz8UZnKGYn+MGRRiFUPvT
	 2dzU0TsEJqptwWslLCUVMipZ2ttpDO4/K5rcfJLxXkhd/4Kpm0tKhvZi8hDJyS2rBzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC860A2606
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFB441F0089F; Tue, 10 Nov 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314459;
	b=NGCwbOUnVc8DpXF7YOrYgFczDY19rT8b6sV0GYSTcaIqKmJzMiJaHoc5PXaJEDBuPeMP
	 SQ6gBFUnkE1HetPpRaCbosCEMoGAQN0pTBezG5FQkgwOaM3rA+uaBu5r5cd1Ryvcv1Cyj
	 ADDBHIbbajnLGTPuM63UbKz7H3+EWmt7G6d1ViHNQ5CXfWu6OYTRkqAD1UsKYEMr+Ij9A
	 tUoUraPNuQ71rPStzi06yUditkLvGUWbU4LF3aK3aVqtBB46yMca0c8fchcxTMY0OZUqO
	 beuFOqQ5cBGGWeuXboLuNGpYm/J7wOt8ZL4dXxN9gpXBaRr31zv+kRdn8OW763+/aOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314459;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=jlNhGwcrsOs24dZ5COugW+8nAMWZeijK7sSKhmHxOfM=;
	b=yh23T4UWnPX/OCrti/AOJtmOUGYkvDuvI3fLUK3Sk66b8X6KwPBWaufoDbaTaX/DB8Jv
	 SICupCity9MzPDVAwPCecno+8rxCGtDxK2hlr6yYCdcmmOFEMiLkyRykHa7nqI2wRYQYP
	 0xQ1nl6/fp6hBVZBUmF8+tbHGvziJ/cNcPjnbmsZ3Avl9pyDu2S+/QMzjd6uRvzrlLFYE
	 unglDGWO7X1fuWUevH/Vrgfn3FO4i28Hs6YWylLFJkSPF/a4j4ow9QrJA+1VOh3XnMAP0
	 awSgmkWrWjrtj75hKwf9caoawRvW/sPwPg7N9evOjsnuZk7D1IXJ/5aksiY9z1O3DFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D4AC1F008A2
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9D4AC1F008A2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3E5B848182;
	Tue, 10 Nov 2026 13:40:56 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Tue, 10 Nov 2026 13:40:48 +0100
Subject: [PATCH RFC b4 2/6] ez: refuse to rewrite history during an
 in-progress git operation
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-editor_refuse_the-v1-2-4b6e52f326a9@proxmox.com>
References: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
In-Reply-To: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
To: tools@kernel.org
Cc: Gabriel Goller <g.goller@proxmox.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Gabriel Goller <hey@gabriels.computer>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794314453716

From: Gabriel Goller <hey@gabriels.computer>

A rebase, merge, cherry-pick, revert or am that stopped between steps
can leave a clean tree behind, so the clean-tree checks of b4 prep, b4
trailers and b4 send do not catch it. Rewriting HEAD in that state
pulls history out from under the operation, and continuing it
afterwards replays the remaining steps onto the wrong commits.

Check for an operation in progress wherever b4 rewrites history or
moves HEAD. The check runs before the editor opens, and before b4 send
sends a series that it rerolls afterwards, so a refusal never costs an
edit or leaves a sent series without its tag. Commands that only read
the series keep working. The state is read from the per-worktree git
dir, so an operation stopped in one linked worktree does not block the
others.

Signed-off-by: Gabriel Goller <hey@gabriels.computer>
---
 src/b4/ez.py         | 35 +++++++++++++++++++++
 src/tests/test_ez.py | 86 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 2441badbb288..3a2594576f09 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -345,6 +345,7 @@ def get_base_forkpoint(basebranch: str, mybranch: Optional[str] = None) -> str:
 
 
 def start_new_series(cmdargs: argparse.Namespace) -> None:
+    check_no_operation_in_progress()
     usercfg = b4.get_user_config()
     if 'name' not in usercfg or 'email' not in usercfg:
         logger.critical(
@@ -725,6 +726,22 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         )
 
 
+def check_no_operation_in_progress() -> None:
+    """Exit if a git operation stopped between steps in this worktree.
+
+    A rebase, merge, cherry-pick, revert or am that stopped between steps
+    can leave a clean tree behind, with HEAD wherever the operation put it.
+    Rewriting history or moving HEAD then pulls it out from under that
+    operation. Commands that only read the series stay usable.
+    """
+    topdir = b4.git_get_toplevel()
+    inprogress = b4._worktree_inprogress_op(topdir) if topdir else None
+    if inprogress:
+        logger.critical('CRITICAL: A git %s is in progress.', inprogress)
+        logger.critical('          Finish or abort it first.')
+        sys.exit(1)
+
+
 def make_magic_json(data: Dict[str, Any]) -> str:
     mj = (
         f'{MAGIC_MARKER}\n'
@@ -777,6 +794,7 @@ def load_cover(
 
 
 def store_cover(content: str, tracking: Dict[str, Any], new: bool = False) -> None:
+    check_no_operation_in_progress()
     strategy = get_cover_strategy()
     if strategy in {'commit', 'tip-commit'}:
         cover_message = content + '\n\n' + make_magic_json(tracking)
@@ -1067,6 +1085,7 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
       pulled series); claiming makes them yours so the trailer/cover-update
       rewrite is permitted instead of refused.
     """
+    check_no_operation_in_progress()
     mybranch = b4.git_get_current_branch()
     if branch and branch != mybranch:
         if not b4.git_branch_exists(None, branch):
@@ -1599,6 +1618,8 @@ def deps_from_file(fpath: str) -> None:
 
 
 def edit_cover() -> None:
+    # Before the editor runs, so that a refusal costs no edits
+    check_no_operation_in_progress()
     is_prep_branch(mustbe=True)
     cover, tracking = load_cover()
     bcover = cover.encode()
@@ -1618,6 +1639,8 @@ def edit_cover() -> None:
 
 
 def edit_deps() -> None:
+    # Before the editor runs, so that a refusal costs no edits
+    check_no_operation_in_progress()
     is_prep_branch(mustbe=True)
     cover, tracking = load_cover()
     prereqs = tracking['series'].get('prerequisites', list())
@@ -2107,6 +2130,7 @@ def interactive_trailer_review(
 
 
 def update_trailers(cmdargs: argparse.Namespace) -> None:
+    check_no_operation_in_progress()
     if not b4.can_network and not cmdargs.localmbox:
         logger.critical(
             'CRITICAL: To work in offline mode you have to pass a local mailbox.'
@@ -3224,6 +3248,16 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         auth_verify(cmdargs)
         return
 
+    if not (
+        cmdargs.resend
+        or cmdargs.dryrun
+        or cmdargs.output_dir
+        or cmdargs.reflect
+        or cmdargs.preview_to
+    ):
+        # Refuse before sending anything rather than at the reroll after it
+        check_no_operation_in_progress()
+
     mybranch = b4.git_get_current_branch()
     if mybranch is None:
         logger.critical('CRITICAL: Not currently on a branch, unable to send')
@@ -3764,6 +3798,7 @@ def get_sent_tagname(
 def reroll(
     mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PREFIX
 ) -> None:
+    check_no_operation_in_progress()
     # Remove signature
     chunks = tag_msg.rsplit('\n-- \n')
     if len(chunks) > 1:
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 13c960babd89..266cea96fbde 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1992,3 +1992,89 @@ def test_prep_cover_and_deps_flags_are_mutually_exclusive() -> None:
         parser.parse_args(['prep', '--edit-cover', '--cover-from-file', '-'])
     with pytest.raises(SystemExit):
         parser.parse_args(['prep', '--show-deps', '--deps-from-file', '-'])
+
+
+# -- refusing to run during an in-progress git operation ----------------------
+
+
+def _stop_rebase(where: str) -> None:
+    """Leave a rebase stopped on a failed --exec, with a clean tree."""
+    ecode, out = b4.git_run_command(
+        where, ['rebase', '--exec', 'false', 'HEAD~1'], logstderr=True
+    )
+    assert ecode != 0, out
+    assert b4._worktree_inprogress_op(where) == 'rebase'
+    assert not b4.git_get_repo_status(where)
+
+
+def _stop_cherry_pick(where: str) -> None:
+    """Leave a cherry-pick stopped because it turned out empty."""
+    ecode, out = b4.git_run_command(where, ['cherry-pick', 'HEAD'], logstderr=True)
+    assert ecode != 0, out
+    assert b4._worktree_inprogress_op(where) == 'cherry-pick'
+    assert not b4.git_get_repo_status(where)
+
+
+@pytest.mark.parametrize(
+    'command, stop',
+    [
+        (['prep', '--edit-cover'], _stop_rebase),
+        (['prep', '--edit-cover'], _stop_cherry_pick),
+        # A rebase detaches HEAD, which is refused before the cover is stored
+        (['prep', '--set-prefixes', 'RFC'], _stop_cherry_pick),
+        (['trailers', '-u'], _stop_rebase),
+        (['trailers', '-u'], _stop_cherry_pick),
+        (['send', '--to', 'list@example.com'], _stop_rebase),
+        (['send', '--to', 'list@example.com'], _stop_cherry_pick),
+    ],
+)
+def test_refuses_in_progress_operation(
+    prepdir_commit: str,
+    stop: Callable[[str], None],
+    command: List[str],
+    caplog: pytest.LogCaptureFixture,
+) -> None:
+    """A clean tree is not enough: rewriting HEAD in the middle of a
+    rebase or cherry-pick would pull history out from under it."""
+    _add_series_commit(prepdir_commit)
+    stop(prepdir_commit)
+    head = b4.git_revparse_obj('HEAD')
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(['--no-stdin', '--no-interactive', *command])
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit) as exc:
+        cmdargs.func(cmdargs)
+    assert exc.value.code == 1
+    assert 'is in progress' in caplog.text
+    assert b4.git_revparse_obj('HEAD') == head
+
+
+def test_in_progress_operation_allows_reading(
+    prepdir_commit: str, capsys: pytest.CaptureFixture[str]
+) -> None:
+    """Only rewriting is refused; the series can still be looked at."""
+    _add_series_commit(prepdir_commit)
+    _stop_cherry_pick(prepdir_commit)
+    capsys.readouterr()
+    _run_prep('--show-cover')
+    assert 'EDITME: cover title for pytest' in capsys.readouterr().out
+
+
+def test_in_progress_check_is_per_worktree(
+    prepdir_commit: str, tmp_path: pathlib.Path, caplog: pytest.LogCaptureFixture
+) -> None:
+    """An operation stopped in a linked worktree blocks only that worktree."""
+    _add_series_commit(prepdir_commit)
+    linked = str(tmp_path / 'linked')
+    ecode, out = b4.git_run_command(
+        None, ['worktree', 'add', '--detach', linked, 'master'], logstderr=True
+    )
+    assert ecode == 0, out
+    _stop_cherry_pick(linked)
+
+    # The main worktree is unaffected...
+    b4.ez.check_no_operation_in_progress()
+    # ...while the linked one is refused.
+    os.chdir(linked)
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        b4.ez.check_no_operation_in_progress()
+    assert 'A git cherry-pick is in progress' in caplog.text

-- 
2.56.0



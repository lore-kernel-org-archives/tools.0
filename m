Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877670;
	b=DCKIphLdrGitpHatnRzEC3A+QLFK4jp9qLySA7+Pj90j61Pe0A4qpoKItmOEaU53AkET
	 uPW5rCy6jwT0zcdxuV5sbO39P5ZJiHDzuAv5zj2F5rfH4NH1fgsDyz4jVIWomADXoOTEc
	 b0DsU3fQogskRDgc2AJN35kYC7h21Y+pJvFQFrEHIQ6EMcsnhhipKHqX+QhwPSIyfeubw
	 t24ZkalKw06zCSQ+dc6KYAyg0jOHfflnKuc5CkH33lLaEqaiKJfy5dMlQOH+tEYvPTRjX
	 s9SX9a5zvpSQ2tQIBbaaT3RzsuKYLO8wDBtJwuVGEQv62VK+hluAMo04FWvzsN612mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877670;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0qziuZyONObceA099R7qIlB/qTjOnjtSw2B9vbrDvNs=;
	b=BfijHGeRL9drojqqrBS6QT8tPTADXP+QjkGAkeDtS5n2pUK0zwo8MeS2TS/nvt2F8QIc
	 o1Ql8jVf/DJ//Y5++k6S2+CfzUSUkRjg8jdm/iN1hFkjeur1bV7Rztrl9DIFy5pUNiS8V
	 Sj6E602w8Cif/QGc75pLAB5yCs8nN+HAT9g1ni0JbPXSsuDUi4XWoP1o8MMLRh2og49HQ
	 //xQzJLuuKHwhfZRhNKephHJpGsWXkwX3kwcNcxkmlJu959dL22JEQAIhjmtjM8m4DA1y
	 q7lyPqXKm8qFYxwseEZa2z2Iumro2ai7xwz2SF6qITXky94Cwd331GADZcMtoLNkuIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muAXFqL+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F74606A31C
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 01:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muAXFqL+
Received: by smtp.kernel.org (Postfix)
	id C54961F000C5; Tue, 17 Nov 2026 01:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B85A1F000C4;
	Tue, 17 Nov 2026 01:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877669;
	bh=0qziuZyONObceA099R7qIlB/qTjOnjtSw2B9vbrDvNs=;
	h=From:Date:Subject:To:Cc;
	b=muAXFqL+ZhX6+NqwnnqR9q3TUJFzXJReIMk4ek0paONlZGOVV/LjTwx6ll0OpruTO
	 P/LuaHZF8sjvSH3OQEPWL7vpLdo5o9yCyZ1Pm78+udrVknKoKuPfmsWzyGxzQyeg0k
	 NrGsdF+vW4vh6G1HANVBEcYy+xY+WNKJDLY0R8kbKqX3DoLew3X2jL/r4BZ5L2GQwY
	 1Ps+F9laoH/uz079hNyCdXNQPVxKWFgywkk9aX2Y2DoGDTpXic6cObfSzMCizamonu
	 oKaQBQSkW5rnzALvi+RDDrld6yxW250b7qe/SSe5jOpKpvZa0ZYyuYMutiYzVNeuoa
	 FBRCzmcZVAozw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Nov 2026 01:07:42 +0000
Subject: [PATCH b4 v2] review: Add a batch mode for agent reviews
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261117-batch-agent-v2-1-d42998f95590@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN6o+2oC/22NzQ6CMBCEX4Xs2Rq6Igon38NwKO32R01r2ko0h
 He34NW5zWTmmxkSRUcJ+mqGSJNLLvhicFeBtMIbYk4VD1hjy4vYKLK0TBjymYlaq2OntTpjA2X
 xjKTde6NdYWxg+GXpNd5I5hWztqxLOcTPdjnxrfuXPnHG2Qm7VmEtUTSHy52ip8c+RAPDsixfH
 91ASb0AAAA=
X-Change-ID: 20261111-batch-agent-a0fd59ffd824
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=93736; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+0/UwwV5CQoyv7VfDF6l5twPwfTbJjqYuGS38N9d8k0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+r3g0IatyromT4864z69s13+8NsPr69e5LwSuhS24Y
 B+sHRw8vaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATuWzOyDC7gmljeJrikoy1
 VuLXGLuWq72vnRDaZGdYV6b6sbD/+A+G/55FR/9tKDvZfiXdrDnAIqe6RnDbrGD1So+rmlx9v6b
 L8wEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Agent reviews can take quite some time to run which is not ideal for
interactive use. Add a command 'b4 review batch agent' which runs an agent
review for everything that is currently in reviewing state, allowing users
to ingest a batch of patches then review them all non-interactively.
Allow this to be limited to a specific agent in case the user is working
with multiple agents and wants to use them all.

A separate agent command can be supplied for this mode, allowing the
user to have both interactive and non-interactive sessions, and a
substitution {review_dir} is provided to make permissions management
easier.

There is a plan to offer batch operations on tagged commits in the TUI but
this feels like a case that's worth handling separately.  As well as the
particularly long runtimes compared to other things that b4 does users
may also wish to do them in an isolated environment (or an environment
with better connectivity for that matter) so a mechanism for running
things non-interactively could be beneficial.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Allow a separate command for batch mode.
- Run the batch reviews in a separate worktree, providing a substitution
  for the worktree.
- Remember to commit new files.
- Link to v1: https://patch.msgid.link/20261111-batch-agent-v1-1-7296d20c2a43@kernel.org
---
 docs/config.rst                  |   38 +-
 docs/maintainer/review.rst       |   85 +++-
 src/b4/command.py                |   26 +
 src/b4/man/b4.1.rst              |   13 +
 src/b4/review/_review.py         |   23 +-
 src/b4/review/batch.py           |  675 +++++++++++++++++++++++++
 src/b4/review_tui/_review_app.py |   21 +-
 src/tests/test_review_batch.py   | 1037 ++++++++++++++++++++++++++++++++++++++
 src/tests/test_tui_review.py     |   90 ++++
 9 files changed, 1999 insertions(+), 9 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 593129e..58984bb 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -918,18 +918,48 @@ These settings control ``b4 review`` TUI behaviour.
    :term:`b4.review-agent-command`
      The command to invoke for AI-assisted review (triggered by the ``a``
      keybinding). Both this option and :term:`b4.review-agent-prompt-path`
-     must be set for the agent feature to be available.
+     must be set for the agent feature to be available in the review TUI.
+     Also used by ``b4 review batch agent`` when
+     :term:`b4.review-agent-batch-command` is unset.
+
+     ``{review_dir}`` in the command is replaced with the absolute review
+     output directory, including the tip commit SHA. b4 creates it before
+     starting a command that uses the placeholder. Replacement happens
+     after argument parsing, so paths containing spaces remain a single
+     argument. This works in both the review TUI and batch runs.
 
      Default: ``None``
 
      .. versionadded:: v0.15
 
+   :term:`b4.review-agent-batch-command`
+     The command to invoke for ``b4 review batch agent``. When set, it
+     overrides :term:`b4.review-agent-command` for batch runs only; otherwise
+     batch runs use :term:`b4.review-agent-command`. Configure a command that
+     runs without interaction and exits after completing the review.
+     It uses the same :term:`b4.review-agent-prompt-path` as the review TUI,
+     whose ``a`` keybinding continues to use :term:`b4.review-agent-command`.
+
+     During batch runs, ``{review_dir}`` in the selected command is replaced
+     with the absolute ``.git/b4-review/<tip-sha>`` output directory in the
+     batch worktree. b4 creates that directory before invoking a command
+     that uses the placeholder. Replacement happens after argument parsing,
+     so paths containing spaces remain a single argument. For example::
+
+       review-agent-batch-command = codex exec --sandbox workspace-write --add-dir {review_dir}
+
+     Default: ``None``
+
+     .. versionadded:: v0.17
+
    :term:`b4.review-agent-prompt-path`
      Path to a file containing the prompt to use with the review agent.
      Both this option and :term:`b4.review-agent-command` must be set for
-     the agent feature to be available. A sample prompt is included in
-     ``misc/agent-reviewer.md`` in the b4 source tree and can be adapted
-     to your project's review guidelines.
+     the agent feature to be available in the review TUI. Batch runs require
+     this option and either :term:`b4.review-agent-batch-command` or
+     :term:`b4.review-agent-command`. A sample prompt is included in
+     ``misc/agent-reviewer.md`` in the b4 source tree and can be adapted to
+     your project's review guidelines.
 
      Default: ``None``
 
diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5a3e9d9..0f5f29c 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -1808,7 +1808,7 @@ To use Gemini CLI instead::
 To use OpenAI Codex CLI::
 
     [b4]
-      review-agent-command = codex --sandbox workspace-write
+      review-agent-command = codex --sandbox workspace-write --add-dir {review_dir}
       review-agent-prompt-path = .git/agent-reviewer.md
 
 To use GitHub Copilot CLI::
@@ -1832,6 +1832,89 @@ for your project. A sample prompt is included in
 repository and adapt it to your project's coding standards and review
 guidelines.
 
+The command may use ``{review_dir}`` for the absolute review output
+directory, including the tip commit SHA. b4 creates this directory before
+starting a command that uses the placeholder. Substitution happens after
+argument parsing, preserving spaces in the path. This is also supported
+in batch runs and can be used to configure your agent's write permissions.
+
+Batch agent reviews
+~~~~~~~~~~~~~~~~~~~
+Run the configured review agent on all eligible series in the current
+repository with::
+
+    b4 review batch agent
+
+Batch runs use :term:`b4.review-agent-batch-command` when set, falling back
+to :term:`b4.review-agent-command` otherwise. Configure a command that runs
+without interaction and exits when the review is complete. Both commands
+use :term:`b4.review-agent-prompt-path`; the review interface's ``a``
+keybinding continues to use :term:`b4.review-agent-command`.
+
+During batch runs, ``{review_dir}`` in either command is replaced with the
+absolute review output directory for the current series:
+``<batch-worktree>/.git/b4-review/<tip-sha>``. b4 creates this directory before
+starting a command that uses the placeholder. Use it to configure write
+permissions for your agent or wrapper, for example::
+
+    [b4]
+      review-agent-batch-command = codex exec --sandbox workspace-write --add-dir {review_dir}
+
+The substitution is applied to each argument after parsing the command,
+so spaces in the directory name stay within one argument. It also works
+inside an argument, such as ``--write-dir={review_dir}``. Other text is
+passed through unchanged; b4 does not add agent-specific options.
+
+By default, the command selects review branches in the **Reviewing**
+state that do not already have an agent review attached to the series or
+any patch.
+
+New agent imports record their source explicitly. For older reviews,
+b4 treats notes or comments attributed to someone other than your configured
+user identity as agent reviews unless they carry mailing-list or Sashiko
+provenance, or are generated upgrade notes.
+
+To skip only series that already have a review from a particular agent,
+use its stored reviewer name::
+
+    b4 review batch agent --agent-name 'Review Agent'
+
+The name must exactly match the reviewer's display name from
+``identity.txt``, including case. Series reviewed by other agents remain
+eligible. The configured batch agent command still runs;
+``--agent-name`` only filters existing reviews and leaves the agent's
+command and identity unchanged.
+
+To list eligible branches without running the agent or changing the
+repository, use::
+
+    b4 review batch agent --dry-run
+
+The agent does not run in your working tree. Each series is checked out
+in a temporary worktree, ``b4-agent-worktree`` in the repository's
+``.git`` directory, which is removed when the batch ends. Your checkout
+and any uncommitted changes are left alone, so you can keep working while
+the batch runs. Anything the agent changes in the worktree is discarded
+before the next series is checked out.
+
+Changes made to the tracking data of a series while its review is
+running, by ``b4 review cron`` or in the review interface, are kept. If
+its patches change, the review is discarded and reported as a failure.
+
+A review branch that is checked out in one of the repository's worktrees,
+including the one you start the batch from, cannot be checked out for the
+agent and is reported as a failure. Only one batch can run in a
+repository at a time.
+
+Agent failures are reported and the batch continues with the remaining
+series. The command exits with a nonzero status if any review fails.
+The agent is asked to write a summary even when it finds no issues;
+an invocation that produces no review data is reported as a failure and
+remains eligible for a later run. Review files left by an earlier run
+are imported before another agent is started. Any leftover review files
+for that checkout are removed before a fresh agent run; if they cannot
+be removed, that series is reported as a failure without starting the agent.
+
 .. _customising_theme:
 
 Customising the colour theme
diff --git a/src/b4/command.py b/src/b4/command.py
index 18d9a9e..3a3c460 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -693,6 +693,32 @@ def setup_parser() -> argparse.ArgumentParser:
         help='Output in JSON format',
     )
 
+    # b4 review batch
+    sp_rev_batch = rev_subparsers.add_parser(
+        'batch', help='Run review operations across multiple series'
+    )
+    batch_subparsers = sp_rev_batch.add_subparsers(
+        help='batch sub-command help', dest='batch_subcmd', required=True
+    )
+    sp_batch_agent = batch_subparsers.add_parser(
+        'agent', help='Run the review agent on reviewing series without agent reviews'
+    )
+    sp_batch_agent.add_argument(
+        '--agent-name',
+        dest='agent_name',
+        default=None,
+        metavar='NAME',
+        help='Skip series only if an existing agent review has this exact '
+        'reviewer name (case-sensitive; default: any agent)',
+    )
+    sp_batch_agent.add_argument(
+        '--dry-run',
+        dest='dryrun',
+        action='store_true',
+        default=False,
+        help='List eligible review branches without running the agent',
+    )
+
     # b4 review cron
     sp_rev_cron = rev_subparsers.add_parser(
         'cron',
diff --git a/src/b4/man/b4.1.rst b/src/b4/man/b4.1.rst
index ded7d6e..94f610c 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -332,6 +332,19 @@ For options and their descriptions, see ``b4 review --help`` and
   list the series that would be cleaned up without changing the tracking
   database.
 
+``b4 review batch agent [--agent-name NAME] [--dry-run]``
+  Run the configured review agent on every review branch in the current
+  repository whose state is reviewing and which has no agent review attached.
+  Reviews run sequentially in a temporary worktree, leaving the current
+  checkout and working tree alone. Use ``--dry-run`` to list eligible branches.
+  With ``--agent-name NAME``, skip only series with an agent review whose stored
+  reviewer display name exactly matches NAME, including case. The configured
+  agent command still runs; this option only filters existing reviews.
+  Batch runs use ``b4.review-agent-batch-command`` when set, otherwise
+  ``b4.review-agent-command``, with the same ``b4.review-agent-prompt-path``.
+  The command must run without interaction and exit after completing the
+  review. The review TUI continues to use ``b4.review-agent-command``.
+
 ``b4 review tui``
   Launch the review TUI.
 
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f0..e76274a 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -516,6 +516,10 @@ def main(cmdargs: argparse.Namespace) -> None:
         cmd_show_info(cmdargs)
     elif cmdargs.review_subcmd == 'cron':
         cmd_cron(cmdargs)
+    elif cmdargs.review_subcmd == 'batch':
+        from b4.review import batch
+
+        batch.cmd_agent(cmdargs)
 
 
 def get_review_branch_patch_ids(
@@ -1388,6 +1392,18 @@ def _clear_other_comments(
     return cleared
 
 
+def get_agent_review_dir(topdir: str, tip_sha: str) -> str:
+    """Return the directory agent review files for *tip_sha* are read from.
+
+    It lives under the common git directory.  That is ``.git`` in an
+    ordinary checkout, and it is the one place every worktree of a
+    repository shares: a linked worktree has a ``.git`` file rather than a
+    directory, so an agent started in one cannot write below it.
+    """
+    common_dir = b4.git_get_common_dir(topdir) or os.path.join(topdir, '.git')
+    return os.path.join(common_dir, b4.review.tracking.REVIEW_METADATA_DIR, tip_sha)
+
+
 def _integrate_agent_reviews(
     topdir: str,
     cover_text: str,
@@ -1417,7 +1433,7 @@ def _integrate_agent_reviews(
         return False
     head_sha = out.strip()
 
-    review_dir = os.path.join(topdir, '.git', 'b4-review', head_sha)
+    review_dir = get_agent_review_dir(topdir, head_sha)
     if not os.path.isdir(review_dir):
         return False
 
@@ -1449,6 +1465,7 @@ def _integrate_agent_reviews(
         series_reviews: Dict[str, Any] = series.setdefault('reviews', {})
         entry: Dict[str, Any] = series_reviews.setdefault(reviewer_email, {})
         entry['name'] = reviewer_name
+        entry['source'] = 'agent'
         old_note = entry.get('note', '')
         if old_note:
             entry['note'] = old_note + '\n\n' + series_note
@@ -1524,6 +1541,7 @@ def _integrate_agent_reviews(
         patch_reviews: Dict[str, Any] = patch.setdefault('reviews', {})
         entry = patch_reviews.setdefault(reviewer_email, {})
         entry['name'] = reviewer_name
+        entry['source'] = 'agent'
         if comments:
             existing_comments: List[Dict[str, Any]] = entry.setdefault('comments', [])
             existing_comments.extend(comments)
@@ -1541,7 +1559,8 @@ def _integrate_agent_reviews(
     # Save tracking — this amends the branch tip, changing its SHA so
     # the directory is not re-consumed on the next run.
     if branch:
-        save_tracking_ref(topdir, branch, cover_text, tracking)
+        if not save_tracking_ref(topdir, branch, cover_text, tracking):
+            raise RuntimeError(f'Unable to save agent reviews on {branch}')
     else:
         save_tracking(topdir, cover_text, tracking)
     logger.info(
diff --git a/src/b4/review/batch.py b/src/b4/review/batch.py
new file mode 100644
index 0000000..7de1755
--- /dev/null
+++ b/src/b4/review/batch.py
@@ -0,0 +1,675 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2026 Arm Ltd.
+#
+"""Non-interactive batch operations on review branches.
+
+``b4 review batch agent`` runs the configured review agent on every review
+branch that is being reviewed and has not been looked at by an agent yet.
+Agent runs are slow, so this lets a maintainer track a batch of series and
+have them all reviewed unattended rather than starting each run by hand
+from the TUI.
+
+The series are checked out in a working tree of the batch's own rather than
+in the one b4 was started from, which can be in any state and stays usable
+for however long the batch takes.
+"""
+
+import argparse
+import contextlib
+import os
+import shlex
+import shutil
+import subprocess
+import sys
+from typing import Any, Dict, List, NamedTuple, Optional, Set, Tuple
+
+import b4
+import b4.review
+import b4.review.tracking
+
+logger = b4.logger
+
+# Reviewer address of the generated "patch unchanged" notes that a revision
+# upgrade attaches to the patches it carries over.
+_UPGRADE_REVIEWER = 'b4-upgrade@internal'
+# Keys the Sashiko and mailing-list follow-up imports stamp on their entries.
+_OTHER_PROVENANCE_KEYS = ('provenance', 'followup-msgid', 'sashiko-review-id')
+# Temporary branches (e.g. revision upgrade work branches) are not series.
+_TMP_BRANCH_PREFIX = f'{b4.review.REVIEW_BRANCH_PREFIX}_tmp-'
+# The working tree the series are checked out in lives in the common git
+# directory, like the worktrees b4 makes for itself elsewhere.  The lock that
+# says a batch is using it is kept with the rest of the review metadata.
+_WORKTREE_NAME = 'b4-agent-worktree'
+_LOCK_NAME = 'agent-batch.lock'
+
+# The TUI sends only the first sentence.  A batch has nobody watching it, and
+# a review that finds nothing must still leave something behind: without a
+# stored review the series would look unreviewed and be picked again by every
+# later run.  The directory is spelled out because an agent can tell that it
+# is in a working tree of a repository that has another, and left to itself
+# may decide that the .git the prompt file talks about is that one's.
+_AGENT_PROMPT = (
+    'Read and execute the prompt from {prompt_path}. '
+    'This is an unattended batch run, so do not ask questions or wait for '
+    'input. Write the review files to {review_dir}: that is in the .git '
+    'directory of the working tree you are started in, and not in the one of '
+    'the repository it belongs to. Always write identity.txt and series.txt: '
+    'if you find no issues, series.txt must still contain a one-line summary '
+    'saying so.'
+)
+
+
+class _AgentFailure(Exception):
+    """The agent review of one series did not produce a usable result."""
+
+
+class _BatchAbort(Exception):
+    """Something is wrong that would affect every remaining series."""
+
+
+class _Candidate(NamedTuple):
+    branch: str
+    revision: Any
+    subject: str
+
+
+class _AgentCommand(NamedTuple):
+    """The configured agent command line, short of the prompt it ends with."""
+
+    args: List[str]
+    prompt_path: str
+
+    def for_review(self, review_dir: str) -> List[str]:
+        """Return the command that has the agent write to *review_dir*."""
+        prompt = _AGENT_PROMPT.format(
+            prompt_path=self.prompt_path, review_dir=review_dir
+        )
+        # Substitute after splitting the command so spaces in the path
+        # stay within one argument. Other braces (e.g. JSON) are literal.
+        args = [arg.replace('{review_dir}', review_dir) for arg in self.args]
+        return args + [prompt]
+
+
+def _is_agent_review(addr: str, entry: Dict[str, Any], my_email: str) -> bool:
+    """Tell whether a stored review entry was written by a review agent.
+
+    Agent imports record ``source``.  Reviews imported before that was
+    recorded can only be recognised by elimination: they hold a note or
+    comments, are not the maintainer's own, and carry none of the markers
+    left by the other things that write review entries.
+    """
+    source = entry.get('source')
+    if source:
+        return bool(source == 'agent')
+    if addr in (my_email, _UPGRADE_REVIEWER):
+        return False
+    if any(entry.get(key) for key in _OTHER_PROVENANCE_KEYS):
+        return False
+    return bool(entry.get('note') or entry.get('comments'))
+
+
+def _agent_reviewer_names(tracking: Dict[str, Any], my_email: str) -> Set[str]:
+    """Return the display names of the agents with a review on a series."""
+    names: Set[str] = set()
+    targets: List[Any] = [tracking.get('series')]
+    targets.extend(tracking.get('patches') or [])
+    for target in targets:
+        if not isinstance(target, dict):
+            continue
+        reviews = target.get('reviews')
+        if not isinstance(reviews, dict):
+            continue
+        for addr, entry in reviews.items():
+            if isinstance(entry, dict) and _is_agent_review(addr, entry, my_email):
+                names.add(str(entry.get('name', '')))
+    return names
+
+
+def _needs_agent_review(
+    tracking: Dict[str, Any], my_email: str, agent_name: Optional[str]
+) -> bool:
+    """Tell whether a series should be handed to the agent.
+
+    Only series in the reviewing state qualify.  Without *agent_name* a
+    review from any agent is enough to leave a series alone; with it, only
+    a review stored under exactly that reviewer name is.
+    """
+    series = tracking.get('series')
+    if not isinstance(series, dict):
+        return False
+    if series.get('status', 'reviewing') != 'reviewing':
+        return False
+    names = _agent_reviewer_names(tracking, my_email)
+    if agent_name is None:
+        return not names
+    return agent_name not in names
+
+
+def _find_candidates(
+    topdir: str, my_email: str, agent_name: Optional[str]
+) -> List[_Candidate]:
+    """List the review branches that are waiting for an agent review."""
+    candidates: List[_Candidate] = []
+    for branch in b4.review.tracking.get_review_branches(topdir):
+        if branch.startswith(_TMP_BRANCH_PREFIX):
+            continue
+        try:
+            _cover_text, tracking = b4.review.load_tracking(topdir, branch)
+        except (SystemExit, Exception) as ex:
+            logger.warning('Skipping %s: %s', branch, ex)
+            continue
+        if not _needs_agent_review(tracking, my_email, agent_name):
+            continue
+        series = tracking['series']
+        candidates.append(
+            _Candidate(
+                branch=branch,
+                revision=series.get('revision', 1),
+                subject=str(series.get('subject') or '(no subject)'),
+            )
+        )
+    return candidates
+
+
+def _has_review_files(topdir: str, branch: str) -> bool:
+    """Tell whether an earlier agent run left review files for *branch*."""
+    ecode, out = b4.git_run_command(topdir, ['rev-parse', branch])
+    if ecode != 0:
+        return False
+    return os.path.isdir(b4.review.get_agent_review_dir(topdir, out.strip()))
+
+
+def _get_agent_command(topdir: str) -> _AgentCommand:
+    """Build the agent command line from the configuration, or exit."""
+    config = b4.get_main_config()
+    command_key = 'review-agent-batch-command'
+    agent_cmd = config.get(command_key)
+    if agent_cmd is None:
+        command_key = 'review-agent-command'
+        agent_cmd = config.get(command_key)
+    agent_prompt = config.get('review-agent-prompt-path')
+    if not agent_cmd or not agent_prompt:
+        logger.critical(
+            'Review agent not configured (set b4.review-agent-batch-command '
+            'or b4.review-agent-command, and '
+            'b4.review-agent-prompt-path)'
+        )
+        sys.exit(1)
+    if not isinstance(agent_cmd, str) or not isinstance(agent_prompt, str):
+        logger.critical(
+            'b4.%s and b4.review-agent-prompt-path must each be set only once',
+            command_key,
+        )
+        sys.exit(1)
+
+    try:
+        sp = shlex.shlex(agent_cmd, posix=True)
+        sp.whitespace_split = True
+        cmdargs = list(sp)
+    except ValueError as ex:
+        logger.critical('Could not parse b4.%s: %s', command_key, ex)
+        sys.exit(1)
+    if not cmdargs:
+        logger.critical('b4.%s is empty', command_key)
+        sys.exit(1)
+
+    prompt_path = os.path.join(topdir, agent_prompt)
+    if not os.path.isfile(prompt_path):
+        logger.critical('Agent prompt file not found: %s', agent_prompt)
+        sys.exit(1)
+
+    return _AgentCommand(args=cmdargs, prompt_path=prompt_path)
+
+
+class _AgentWorktree:
+    """The working tree the agent is run in.
+
+    Reviewing in a tree of its own keeps the batch out of the one b4 was
+    started from.  The tree is created the first time a series has to be
+    checked out, so that a batch which starts no agent does not pay for a
+    checkout, and is then moved from one series to the next.
+
+    It shares the repository the way a linked worktree does, but where one
+    of those has a ``.git`` file this has a directory.  An agent files its
+    review under ``.git/b4-review``, and is as a rule allowed to write
+    nowhere else, so that has to be a path it can use in the tree it is
+    started in.  The reviews are collected there and only handed over to
+    the repository when the agent is done with them.
+
+    The caller holds the batch lock for as long as it uses this, which is
+    what makes it safe to remove a tree that is already there.
+    """
+
+    def __init__(self, topdir: str, common_dir: str) -> None:
+        self.path = os.path.join(common_dir, _WORKTREE_NAME)
+        self._topdir = topdir
+        self._common_dir = common_dir
+        self._gitdir = os.path.join(self.path, '.git')
+        self._review_root = os.path.join(
+            self._gitdir, b4.review.tracking.REVIEW_METADATA_DIR
+        )
+        self._created = False
+
+    def _git(self, args: List[str], logstderr: bool = True) -> Tuple[int, str]:
+        # git_run_command() only tells git where the repository is, and git
+        # then takes the current directory for the top of the working tree.
+        return b4.git_run_command(
+            self.path, args, logstderr=logstderr, rundir=self.path
+        )
+
+    def _create(self, branch: str) -> None:
+        if os.path.lexists(self.path):
+            # Nobody else is running a batch, so this one was killed before
+            # it could clean up.
+            logger.info('Removing the review worktree left by an interrupted batch')
+            if not self.remove():
+                raise _BatchAbort(f'Could not remove {self.path}')
+        # Git knows what the private half of a worktree has to hold for the
+        # repository at hand, so it gets to make a linked one.  Nothing is
+        # checked out yet: checkout() does that for every series alike.
+        # --force is for a worktree that is still registered after its
+        # directory was deleted.
+        gitargs = ['worktree', 'add', '--force', '--detach', '--no-checkout']
+        gitargs += [self.path, branch]
+        ecode, out = b4.git_run_command(self._topdir, gitargs, logstderr=True)
+        if ecode != 0:
+            # No series is going to fare any better than this one did.
+            raise _BatchAbort(f'Could not create a review worktree: {out.strip()}')
+        # That private half then takes the place of the file pointing at it.
+        # Git no longer has this down as a worktree once it has moved, but
+        # carries on treating it as one when it is run in it.
+        try:
+            ecode, out = self._git(['rev-parse', '--absolute-git-dir'], logstderr=False)
+            admin_dir = out.strip()
+            if ecode != 0 or not os.path.isdir(admin_dir):
+                raise OSError('git did not say where it keeps the worktree')
+            os.unlink(self._gitdir)
+            shutil.move(admin_dir, self._gitdir)
+            with open(os.path.join(self._gitdir, 'commondir'), 'w') as fh:
+                fh.write(self._common_dir + '\n')
+        except OSError as ex:
+            self.remove()
+            raise _BatchAbort(f'Could not create a review worktree: {ex}') from ex
+        # Git tidies this up after the last worktree it removes itself.
+        with contextlib.suppress(OSError):
+            os.rmdir(os.path.dirname(admin_dir))
+        self._created = True
+
+    def checkout(self, branch: str) -> str:
+        """Put a pristine checkout of *branch* in the tree.
+
+        Returns the commit at the tip of the branch, which is the one the
+        agent files its review under.  The branch itself is checked out
+        rather than that commit, so that the agent finds what it would if
+        it were started from the TUI.  Git refuses to do that with a branch
+        that is checked out in one of the repository's worktrees, which is
+        reported as a failed review: that branch is somebody's to work on,
+        and storing a review moves it.
+        """
+        reused = self._created
+        if not reused:
+            self._create(branch)
+        ecode, out = self._git([*b4.SCRATCH_GIT_OPTS, 'checkout', '--force', branch])
+        if ecode != 0:
+            lines = out.strip().splitlines()
+            raise _AgentFailure(
+                'could not check out the branch' + (f': {lines[-1]}' if lines else '')
+            )
+        if reused:
+            # The checkout put back the files the last agent changed; this
+            # gets rid of the ones it added.
+            ecode, out = self._git(['clean', '-ffdxq'])
+            if ecode != 0:
+                raise _AgentFailure('could not clean the review worktree')
+        # Likewise any review it started on but did not get to the end of.
+        shutil.rmtree(self._review_root, ignore_errors=True)
+        try:
+            os.makedirs(self._review_root)
+        except OSError as ex:
+            raise _AgentFailure(f'could not clean the review worktree: {ex}') from ex
+        ecode, out = self._git(['rev-parse', 'HEAD'], logstderr=False)
+        if ecode != 0 or not out.strip():
+            raise _AgentFailure('could not tell what was checked out')
+        return out.strip()
+
+    def review_dir(self, tip_sha: str) -> str:
+        """Return where the agent files its review of the tip *tip_sha*."""
+        return os.path.join(self._review_root, tip_sha)
+
+    def is_clean(self) -> bool:
+        """Tell whether the files git tracks are as they were checked out."""
+        ecode, out = self._git(
+            ['status', '--porcelain=v1', '--untracked-files=no'], logstderr=False
+        )
+        return ecode == 0 and not out.strip()
+
+    def remove(self) -> bool:
+        """Remove the tree, if there is one.  True if it is gone."""
+        if not self._created and not os.path.lexists(self.path):
+            return True
+        self._created = False
+        if os.path.isfile(self._gitdir):
+            # Still a linked worktree, which is as far as an earlier batch
+            # got with it.  Git has to be told that it is going away.
+            b4.git_run_command(
+                self._topdir,
+                ['worktree', 'remove', '--force', self.path],
+                logstderr=True,
+            )
+        shutil.rmtree(self.path, ignore_errors=True)
+        if os.path.lexists(self.path):
+            logger.warning('Could not remove the review worktree %s', self.path)
+            return False
+        return True
+
+
+def _load_tracking(topdir: str, branch: str) -> Tuple[str, Dict[str, Any]]:
+    """Load the cover letter and tracking data of a review branch."""
+    try:
+        return b4.review.load_tracking(topdir, branch)
+    except (SystemExit, Exception) as ex:
+        raise _AgentFailure('could not load tracking data') from ex
+
+
+def _patch_commits(topdir: str, branch: str, series: Dict[str, Any]) -> List[str]:
+    """List the commits of the patches on a review branch, oldest first."""
+    first_patch = series.get('first-patch-commit', '')
+    if first_patch:
+        range_spec = f'{first_patch}~1..{branch}~1'
+    else:
+        range_spec = f'{series.get("base-commit", "")}..{branch}~1'
+    ecode, out = b4.git_run_command(topdir, ['rev-list', '--reverse', range_spec])
+    if ecode > 0 or not out.strip():
+        raise _AgentFailure('unable to list patch commits')
+    return out.strip().splitlines()
+
+
+def _import_reviews(
+    topdir: str,
+    branch: str,
+    cover_text: str,
+    tracking: Dict[str, Any],
+    commit_shas: List[str],
+) -> bool:
+    """Store the review files waiting for the tip of *branch*, if any."""
+    patches: List[Dict[str, Any]] = tracking.setdefault('patches', [])
+    try:
+        return b4.review._integrate_agent_reviews(
+            topdir, cover_text, tracking, commit_shas, patches, branch=branch
+        )
+    except Exception as ex:
+        raise _AgentFailure(str(ex)) from ex
+
+
+def _hand_over_review(topdir: str, branch: str, review_dir: str) -> None:
+    """Move the review an agent wrote to where b4 looks for it.
+
+    That is a directory in the repository, named after the tip of the
+    branch as it is now.
+    """
+    ecode, out = b4.git_run_command(topdir, ['rev-parse', branch])
+    if ecode != 0 or not out.strip():
+        raise _AgentFailure('the branch went away while it was being reviewed')
+    dest = b4.review.get_agent_review_dir(topdir, out.strip())
+    if os.path.realpath(dest) == os.path.realpath(review_dir):
+        return
+    try:
+        # Files that are there already stay unless the agent wrote the same
+        # ones, as when it used to write there itself.
+        shutil.copytree(review_dir, dest, symlinks=True, dirs_exist_ok=True)
+    except (OSError, shutil.Error) as ex:
+        raise _AgentFailure(f'could not collect the review: {ex}') from ex
+    shutil.rmtree(review_dir, ignore_errors=True)
+
+
+def _review_branch(
+    topdir: str,
+    worktree: _AgentWorktree,
+    branch: str,
+    agent: _AgentCommand,
+    my_email: str,
+    agent_name: Optional[str],
+) -> str:
+    """Get an agent review onto one review branch.
+
+    Returns ``reviewed`` when the agent ran and its review was imported,
+    ``imported`` when review files left by an earlier run made a new run
+    unnecessary, and ``skipped`` when the series stopped being eligible
+    while the batch was running.  Raises :class:`_AgentFailure` when no
+    usable review was obtained.
+    """
+    if not b4.git_branch_exists(topdir, branch):
+        return 'skipped'
+    cover_text, tracking = _load_tracking(topdir, branch)
+    # Earlier agent runs can take long enough for this to have changed.
+    if not _needs_agent_review(tracking, my_email, agent_name):
+        return 'skipped'
+
+    series: Dict[str, Any] = tracking['series']
+    patches: List[Dict[str, Any]] = tracking.setdefault('patches', [])
+    commit_shas = _patch_commits(topdir, branch, series)
+
+    # An earlier run may have been interrupted between the agent finishing
+    # and its review being stored.  Pick that up rather than paying for the
+    # same review twice.
+    if _import_reviews(
+        topdir, branch, cover_text, tracking, commit_shas
+    ) and not _needs_agent_review(tracking, my_email, agent_name):
+        return 'imported'
+
+    # The agent prompt points at this blob for the discussion so far; series
+    # tracked before it existed only get one the first time they are opened.
+    # This rewrites the tracking commit, which is what review files are filed
+    # under, so it has to happen before the agent starts.
+    change_id = series.get('change-id')
+    if (
+        change_id
+        and series.get('thread-blob')
+        and not series.get('thread-context-blob')
+    ):
+        b4.review.tracking.ensure_thread_context_blob(
+            topdir, change_id, series, patches
+        )
+
+    # The agent reads the series from HEAD and the working tree, and files
+    # its review under the commit it finds at HEAD.
+    start_sha = worktree.checkout(branch)
+    review_dir = worktree.review_dir(start_sha)
+    shared_review_dir = b4.review.get_agent_review_dir(topdir, start_sha)
+    # checkout() cleared the worktree's review files. Also clear anything
+    # the earlier import could not use in the shared directory, so those
+    # files cannot be mixed into the fresh review under the new identity.
+    try:
+        if os.path.lexists(shared_review_dir):
+            shutil.rmtree(shared_review_dir)
+    except OSError as ex:
+        raise _AgentFailure(f'could not clean the agent review directory: {ex}') from ex
+    # A command using this path to grant sandbox write access may require
+    # it to exist before the agent starts.
+    if any('{review_dir}' in arg for arg in agent.args):
+        try:
+            os.makedirs(review_dir, exist_ok=True)
+        except OSError as ex:
+            raise _AgentFailure(
+                f'could not create the agent review directory: {ex}'
+            ) from ex
+    agent_cmd = agent.for_review(review_dir)
+
+    logger.debug('Running review agent: %s', ' '.join(agent_cmd))
+    try:
+        returncode = subprocess.run(
+            agent_cmd, cwd=worktree.path, check=False
+        ).returncode
+    except OSError as ex:
+        # No series is going to fare any better than this one did.
+        raise _BatchAbort(f'Could not start the review agent: {ex}') from ex
+
+    # An agent is only supposed to write review files.  Nothing else it did
+    # in the tree outlives the review, but an agent that is able to change
+    # it is worth knowing about.
+    if not worktree.is_clean():
+        logger.warning(
+            'The agent changed files in the review worktree while reviewing %s; '
+            'the changes are discarded',
+            branch,
+        )
+
+    # An agent that knows its way around worktrees may have gone for the
+    # directory in the repository regardless, if it is free to write there.
+    written = [review_dir, shared_review_dir]
+    try:
+        # An empty directory created for command substitution is not output.
+        written = [path for path in written if os.path.isdir(path) and os.listdir(path)]
+    except OSError as ex:
+        raise _AgentFailure(f'could not collect the review: {ex}') from ex
+    imported = False
+    if written:
+        # Nothing stops the tracking commit from being rewritten while the
+        # agent is busy, by a tracking update or from the TUI, and a review
+        # leaves plenty of time for it.  The review is as good as it was if
+        # the patches are the same, but it goes on top of the tracking data
+        # as it is now, not as it was when the agent started.
+        cover_text, tracking = _load_tracking(topdir, branch)
+        current_shas = _patch_commits(topdir, branch, tracking.get('series') or {})
+        if current_shas != commit_shas:
+            raise _AgentFailure('the series changed while it was being reviewed')
+        for path in written:
+            _hand_over_review(topdir, branch, path)
+        imported = _import_reviews(topdir, branch, cover_text, tracking, commit_shas)
+
+    if returncode != 0:
+        reason = f'agent exited with code {returncode}'
+        if imported:
+            reason += ' (the review data it wrote was imported)'
+        raise _AgentFailure(reason)
+    if not imported:
+        raise _AgentFailure('agent produced no review data')
+
+    # --agent-name does not choose the agent, so the review that was just
+    # stored may be under another name and leave the series selected.
+    if agent_name is not None and _needs_agent_review(tracking, my_email, agent_name):
+        logger.warning(
+            '%s was reviewed as %s, not %s: the same --agent-name will select it again',
+            branch,
+            ', '.join(sorted(_agent_reviewer_names(tracking, my_email))),
+            agent_name,
+        )
+    return 'reviewed'
+
+
+def cmd_agent(cmdargs: argparse.Namespace) -> None:
+    """Run the review agent on reviewing series that have no agent review.
+
+    Series are reviewed one after another in a working tree that is
+    removed when the batch ends, which leaves the one b4 was started from
+    alone.  A failed review does not stop the batch, but makes it exit
+    non-zero.
+    """
+    topdir = b4.git_get_toplevel()
+    if not topdir:
+        logger.critical('Not in a git repository.')
+        sys.exit(1)
+
+    dryrun = bool(getattr(cmdargs, 'dryrun', False))
+    agent_name: Optional[str] = getattr(cmdargs, 'agent_name', None)
+    if agent_name is not None and not agent_name.strip():
+        # Nothing is stored under an empty name, so this would select
+        # every reviewing series rather than the none it looks like.
+        logger.critical('--agent-name needs a reviewer name')
+        sys.exit(1)
+
+    agent: Optional[_AgentCommand] = None
+    if not dryrun:
+        agent = _get_agent_command(topdir)
+
+    my_email = str(b4.get_user_config().get('email', 'unknown@example.com'))
+    candidates = _find_candidates(topdir, my_email, agent_name)
+    if not candidates:
+        logger.info('No review branches need an agent review.')
+        return
+
+    if dryrun:
+        logger.info('Review branches that would be sent to the review agent:')
+        for cand in candidates:
+            note = ''
+            if _has_review_files(topdir, cand.branch):
+                note = ' [review files from an earlier run would be imported first]'
+            logger.info(
+                '  %s (v%s): %s%s', cand.branch, cand.revision, cand.subject, note
+            )
+        logger.info('Dry run: %d review branch(es) would be reviewed.', len(candidates))
+        return
+
+    assert agent is not None
+    common_dir = b4.git_get_common_dir(topdir)
+    if not common_dir:
+        logger.critical('Could not find the git directory of %s.', topdir)
+        sys.exit(1)
+    lock_path = os.path.join(
+        common_dir, b4.review.tracking.REVIEW_METADATA_DIR, _LOCK_NAME
+    )
+    worktree = _AgentWorktree(topdir, common_dir)
+
+    counts = {'reviewed': 0, 'imported': 0, 'skipped': 0}
+    failures: List[Tuple[str, str]] = []
+    stopped = 0
+    removed = True
+    with contextlib.ExitStack() as stack:
+        # Batches share the working tree, and two of them would also both
+        # pay for a review of the same series.
+        try:
+            stack.enter_context(b4.lockfile_nb(lock_path))
+        except b4.LockHeldError:
+            logger.critical(
+                'Another batch of agent reviews is running in this repository.'
+            )
+            sys.exit(1)
+        try:
+            for num, cand in enumerate(candidates, 1):
+                logger.info(
+                    'Reviewing %s (%d/%d): %s',
+                    cand.branch,
+                    num,
+                    len(candidates),
+                    cand.subject,
+                )
+                try:
+                    outcome = _review_branch(
+                        topdir, worktree, cand.branch, agent, my_email, agent_name
+                    )
+                except _AgentFailure as ex:
+                    failures.append((cand.branch, str(ex)))
+                    logger.critical('Agent review failed for %s: %s', cand.branch, ex)
+                    continue
+                counts[outcome] += 1
+                if outcome == 'imported':
+                    logger.info(
+                        '%s: imported the review left by an earlier run', cand.branch
+                    )
+                elif outcome == 'skipped':
+                    logger.info('%s: no longer needs an agent review', cand.branch)
+        except _BatchAbort as ex:
+            logger.critical('%s', ex)
+            logger.critical('Stopping the batch.')
+            stopped = 1
+        except KeyboardInterrupt:
+            logger.critical('Interrupted, stopping the batch.')
+            stopped = 130
+        finally:
+            removed = worktree.remove()
+
+    logger.info(
+        'Agent reviews: %d completed, %d imported from earlier runs, %d failed',
+        counts['reviewed'],
+        counts['imported'],
+        len(failures),
+    )
+    for branch, reason in failures:
+        logger.info('  failed: %s: %s', branch, reason)
+
+    if stopped:
+        sys.exit(stopped)
+    if failures or not removed:
+        sys.exit(1)
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 1e70bc6..280a1d0 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -2361,11 +2361,28 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                 f'Agent prompt file not found: {agent_prompt}', severity='error'
             )
             return
-        cmdargs += [f'Read and execute the prompt from {prompt_path}']
-
         if not self._ensure_branch_checked_out():
             return
 
+        if any('{review_dir}' in arg for arg in cmdargs):
+            ecode, out = b4.git_run_command(self._topdir, ['rev-parse', 'HEAD'])
+            if ecode != 0 or not out.strip():
+                self.notify('Could not determine the review commit', severity='error')
+                self._restore_original_branch()
+                return
+            review_dir = b4.review.get_agent_review_dir(self._topdir, out.strip())
+            try:
+                os.makedirs(review_dir, exist_ok=True)
+            except OSError as ex:
+                self.notify(
+                    f'Could not create the agent review directory: {ex}',
+                    severity='error',
+                )
+                self._restore_original_branch()
+                return
+            cmdargs = [arg.replace('{review_dir}', review_dir) for arg in cmdargs]
+        cmdargs += [f'Read and execute the prompt from {prompt_path}']
+
         with self.suspend():
             logger.info('Running review agent: %s', ' '.join(cmdargs))
             try:
diff --git a/src/tests/test_review_batch.py b/src/tests/test_review_batch.py
new file mode 100644
index 0000000..38211e1
--- /dev/null
+++ b/src/tests/test_review_batch.py
@@ -0,0 +1,1037 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2026 Arm Ltd.
+
+import argparse
+import json
+import logging
+import os
+import pathlib
+import shlex
+import shutil
+import sys
+from typing import Any, Dict, List, Optional
+from unittest import mock
+
+import pytest
+
+import b4
+import b4.command
+from b4 import review
+from b4.review import batch
+
+from .helpers.tracking import create_review_branch
+
+MY_EMAIL = 'test-override@example.com'
+AGENT_NAME = 'Review Agent'
+AGENT_EMAIL = 'agent@example.com'
+
+# Stands in for an agent CLI.  Logs what it was started with and where, then
+# behaves as the mode argument says.
+FAKE_AGENT = """\
+import json
+import os
+import subprocess
+import sys
+
+mode, log, prompt = sys.argv[1], sys.argv[2], sys.argv[-1]
+
+
+def git(*args):
+    return subprocess.check_output(('git',) + args, text=True).strip()
+
+
+branch = git('symbolic-ref', '--short', 'HEAD')
+head = git('rev-parse', 'HEAD')
+with open('file1.txt') as fh:
+    file1 = fh.read()
+run = {
+    'branch': branch,
+    'prompt': prompt,
+    'toplevel': git('rev-parse', '--show-toplevel'),
+    'status': git('status', '--porcelain=v1'),
+    'file1': file1,
+    'pending': os.listdir(os.path.join('.git', 'b4-review')),
+}
+with open(log, 'a') as fh:
+    fh.write(json.dumps(run) + '\\n')
+
+if mode == 'silent' or os.environ.get('FAKE_AGENT_FAIL_ON') == branch:
+    sys.exit(3 if mode != 'silent' else 0)
+if mode == 'scribble':
+    with open('file1.txt', 'a') as fh:
+        fh.write('scribble\\n')
+    with open('leftover.txt', 'w') as fh:
+        fh.write('leftover\\n')
+
+# What the sample prompt has an agent do, unless it knows about worktrees
+review_dir = os.path.join('.git', 'b4-review', head)
+if mode == 'shared':
+    review_dir = os.path.join(git('rev-parse', '--git-common-dir'), 'b4-review', head)
+os.makedirs(review_dir, exist_ok=True)
+with open(os.path.join(review_dir, 'identity.txt'), 'w') as fh:
+    fh.write('Review Agent <agent@example.com>\\n')
+if mode == 'unfinished':
+    sys.exit(3)
+with open(os.path.join(review_dir, 'series.txt'), 'w') as fh:
+    fh.write('No issues found\\n')
+
+# Things that happen to a series while an agent is looking at it
+message = git('log', '-1', '--format=%B')
+if mode == 'retrack':
+    # Its tracking data is updated
+    message = message.replace('"status": "reviewing"', '"status": "replied"')
+    git('commit', '-q', '--amend', '--allow-empty', '-m', message)
+if mode == 'restack':
+    # It gets another patch
+    git('reset', '-q', '--hard', 'HEAD~1')
+    git('commit', '-q', '--allow-empty', '-m', 'One more patch')
+    git('commit', '-q', '--allow-empty', '-m', message)
+"""
+
+
+def _agent_review(name: str = AGENT_NAME) -> Dict[str, Any]:
+    return {'name': name, 'source': 'agent', 'note': 'Looks fine'}
+
+
+def _tracking(
+    status: str = 'reviewing',
+    series_reviews: Optional[Dict[str, Any]] = None,
+    patch_reviews: Optional[Dict[str, Any]] = None,
+) -> Dict[str, Any]:
+    series: Dict[str, Any] = {'status': status}
+    if series_reviews is not None:
+        series['reviews'] = series_reviews
+    patch: Dict[str, Any] = {'title': 'patch 1'}
+    if patch_reviews is not None:
+        patch['reviews'] = patch_reviews
+    return {'series': series, 'patches': [patch]}
+
+
+def test_review_directory_substitution_preserves_other_arguments() -> None:
+    args = [
+        'wrapper',
+        'agent',
+        '--write-dir',
+        '{review_dir}',
+        '--policy=write:{review_dir} read:{review_dir}',
+        '{"unrelated": "{other}"}',
+        '${HOME}',
+        '$$',
+        '--',
+    ]
+    review_root = '/repository with spaces/.git/b4-agent-worktree/.git/b4-review'
+    review_dir = os.path.join(review_root, 'first-tip')
+    agent = batch._AgentCommand(args=args.copy(), prompt_path='/review prompt.md')
+
+    command = agent.for_review(review_dir)
+
+    assert command[:4] == ['wrapper', 'agent', '--write-dir', review_dir]
+    assert command[4] == f'--policy=write:{review_dir} read:{review_dir}'
+    assert command[5:-1] == args[5:]
+    assert review_dir in command[-1]
+    # Each series expands the original template, not the previous series' path.
+    assert agent.args == args
+    next_command = agent.for_review(os.path.join(review_root, 'next-tip'))
+    assert 'first-tip' not in ' '.join(next_command)
+    assert next_command[3] == os.path.join(review_root, 'next-tip')
+    assert 'next-tip' in next_command[-1]
+
+
+@pytest.mark.parametrize(
+    'args',
+    [
+        ['codex', 'exec', '--sandbox', 'workspace-write', '--'],
+        ['/opt/agent tools/codex', '--add-dir', '/existing path'],
+        ['agent', '--policy={"write": false}', '${HOME}', '{}'],
+    ],
+)
+def test_commands_without_substitution_are_unchanged(args: List[str]) -> None:
+    agent = batch._AgentCommand(args=args, prompt_path='/review.md')
+
+    command = agent.for_review('/repository/.git/b4-review/tip')
+
+    assert command[:-1] == args
+
+
+def test_batch_parser_and_dispatch() -> None:
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        ['review', 'batch', 'agent', '--agent-name', AGENT_NAME, '--dry-run']
+    )
+
+    assert cmdargs.review_subcmd == 'batch'
+    assert cmdargs.batch_subcmd == 'agent'
+    assert cmdargs.agent_name == AGENT_NAME
+    assert cmdargs.dryrun is True
+
+    with mock.patch('b4.review.batch.cmd_agent') as cmd_agent:
+        review.main(cmdargs)
+
+    cmd_agent.assert_called_once_with(cmdargs)
+
+
+class TestNeedsAgentReview:
+    """Which stored reviews count as an agent having looked at a series."""
+
+    @pytest.mark.parametrize(
+        'addr,entry,expected',
+        [
+            (AGENT_EMAIL, _agent_review(), True),
+            # A recorded source is trusted over what the entry looks like
+            (MY_EMAIL, _agent_review(), True),
+            (AGENT_EMAIL, {'name': 'x', 'source': 'other', 'note': 'n'}, False),
+            # Reviews imported before the source was recorded
+            (AGENT_EMAIL, {'name': AGENT_NAME, 'note': 'Looks fine'}, True),
+            (AGENT_EMAIL, {'name': AGENT_NAME, 'comments': [{'text': 'x'}]}, True),
+            (AGENT_EMAIL, {'name': AGENT_NAME}, False),
+            (MY_EMAIL, {'name': 'Me', 'note': 'My own note'}, False),
+            (
+                'b4-upgrade@internal',
+                {'name': 'B4 Upgrade', 'note': 'Patch unchanged from v1'},
+                False,
+            ),
+            (
+                'sashiko@sashiko.dev',
+                {
+                    'name': 'sashiko.dev',
+                    'comments': [{'text': 'x'}],
+                    'sashiko-review-id': 7,
+                    'provenance': 'https://sashiko.example.org/#/message/x',
+                },
+                False,
+            ),
+            (
+                'reviewer@example.com',
+                {
+                    'name': 'List Reviewer',
+                    'comments': [{'text': 'x'}],
+                    'followup-msgid': 'reply@example.com',
+                    'provenance': 'https://lore.kernel.org/r/reply@example.com',
+                },
+                False,
+            ),
+        ],
+    )
+    def test_is_agent_review(
+        self, addr: str, entry: Dict[str, Any], expected: bool
+    ) -> None:
+        assert batch._is_agent_review(addr, entry, MY_EMAIL) is expected
+
+    def test_series_without_reviews_needs_one(self) -> None:
+        assert batch._needs_agent_review(_tracking(), MY_EMAIL, None)
+
+    @pytest.mark.parametrize('status', ['new', 'replied', 'snoozed', 'waiting'])
+    def test_only_reviewing_series(self, status: str) -> None:
+        assert not batch._needs_agent_review(_tracking(status), MY_EMAIL, None)
+
+    def test_review_on_series_or_any_patch_counts(self) -> None:
+        reviews = {AGENT_EMAIL: _agent_review()}
+        on_series = _tracking(series_reviews=reviews)
+        on_patch = _tracking(patch_reviews=reviews)
+        assert not batch._needs_agent_review(on_series, MY_EMAIL, None)
+        assert not batch._needs_agent_review(on_patch, MY_EMAIL, None)
+
+    def test_non_agent_reviews_do_not_count(self) -> None:
+        tracking = _tracking(
+            series_reviews={MY_EMAIL: {'name': 'Me', 'note': 'My own note'}},
+            patch_reviews={
+                'b4-upgrade@internal': {'name': 'B4 Upgrade', 'note': 'Unchanged'}
+            },
+        )
+        assert batch._needs_agent_review(tracking, MY_EMAIL, None)
+
+    @pytest.mark.parametrize(
+        'agent_name,expected',
+        [
+            (None, False),
+            (AGENT_NAME, False),
+            ('Other Agent', True),
+            (AGENT_NAME.lower(), True),
+        ],
+    )
+    def test_agent_name_must_match_exactly(
+        self, agent_name: Optional[str], expected: bool
+    ) -> None:
+        tracking = _tracking(patch_reviews={AGENT_EMAIL: _agent_review()})
+        assert batch._needs_agent_review(tracking, MY_EMAIL, agent_name) is expected
+
+
+class TestCmdAgent:
+    @pytest.fixture
+    def agent_log(self, gitdir: str, tmp_path: pathlib.Path) -> pathlib.Path:
+        """Configure the fake agent; returns the log of its invocations."""
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'review')
+        return log
+
+    @staticmethod
+    def _configure_agent(
+        gitdir: str, tmp_path: pathlib.Path, log: pathlib.Path, mode: str
+    ) -> None:
+        script = tmp_path / 'fake-agent.py'
+        script.write_text(FAKE_AGENT)
+        with open(os.path.join(gitdir, '.git', 'agent-reviewer.md'), 'w') as fh:
+            fh.write('Review the series.\n')
+        b4.MAIN_CONFIG['review-agent-command'] = (
+            f'{sys.executable} {script} {mode} {log}'
+        )
+        b4.MAIN_CONFIG['review-agent-prompt-path'] = '.git/agent-reviewer.md'
+
+    @staticmethod
+    def _run(agent_name: Optional[str] = None, dryrun: bool = False) -> None:
+        batch.cmd_agent(argparse.Namespace(agent_name=agent_name, dryrun=dryrun))
+
+    @staticmethod
+    def _invocations(log: pathlib.Path) -> List[Dict[str, Any]]:
+        """Return what the fake agent logged about each of its runs."""
+        if not log.exists():
+            return []
+        return [json.loads(line) for line in log.read_text().splitlines()]
+
+    @classmethod
+    def _branches(cls, log: pathlib.Path) -> List[str]:
+        """Return the branches the fake agent was run on, in order."""
+        return [run['branch'] for run in cls._invocations(log)]
+
+    @staticmethod
+    def _tip(gitdir: str, branch: str) -> str:
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', branch])
+        assert ecode == 0
+        return out.strip()
+
+    @staticmethod
+    def _agent_note(gitdir: str, branch: str) -> Optional[Dict[str, Any]]:
+        _cover, tracking = review.load_tracking(gitdir, branch)
+        entry: Optional[Dict[str, Any]] = (
+            tracking['series'].get('reviews', {}).get(AGENT_EMAIL)
+        )
+        return entry
+
+    @staticmethod
+    def _worktree(gitdir: str) -> str:
+        """Return where the batch puts its worktree."""
+        return os.path.join(gitdir, '.git', 'b4-agent-worktree')
+
+    @classmethod
+    def _assert_no_worktree(cls, gitdir: str) -> None:
+        """Check that the batch worktree is gone, and that git agrees."""
+        assert not os.path.lexists(cls._worktree(gitdir))
+        ecode, out = b4.git_run_command(gitdir, ['worktree', 'list', '--porcelain'])
+        assert ecode == 0
+        worktrees = [line for line in out.splitlines() if line.startswith('worktree ')]
+        assert worktrees == [f'worktree {gitdir}']
+
+    def test_reviews_only_series_that_need_it(
+        self, gitdir: str, agent_log: pathlib.Path
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        create_review_branch(
+            gitdir,
+            'done',
+            with_patch=True,
+            series_extra={'reviews': {AGENT_EMAIL: _agent_review()}},
+        )
+        create_review_branch(gitdir, 'replied', with_patch=True, status='replied')
+        needs_tip = self._tip(gitdir, needs)
+        done_tip = self._tip(gitdir, 'b4/review/done')
+
+        self._run()
+
+        runs = self._invocations(agent_log)
+        assert [run['branch'] for run in runs] == [needs]
+        # The series is checked out for the agent away from the main tree,
+        # and it is not shown what is waiting to be reviewed there
+        assert runs[0]['toplevel'] == self._worktree(gitdir)
+        assert runs[0]['status'] == ''
+        assert runs[0]['pending'] == []
+        # ...but is told that is where its review goes
+        prompt = runs[0]['prompt']
+        assert os.path.join(gitdir, '.git', 'agent-reviewer.md') in prompt
+        assert os.path.join(self._worktree(gitdir), '.git', 'b4-review', needs_tip) in (
+            prompt
+        )
+        assert 'series.txt' in prompt
+
+        entry = self._agent_note(gitdir, needs)
+        assert entry == {
+            'name': AGENT_NAME,
+            'source': 'agent',
+            'note': 'No issues found',
+        }
+        assert self._tip(gitdir, 'b4/review/done') == done_tip
+        # The review is stored, with nothing left of how it got there
+        assert os.listdir(os.path.join(gitdir, '.git', 'b4-review')) == [
+            'agent-batch.lock'
+        ]
+        self._assert_no_worktree(gitdir)
+        assert b4.git_get_current_branch(gitdir) == 'master'
+
+        # Nothing is left to do, so a second run starts no agent
+        self._run()
+        assert len(self._invocations(agent_log)) == 1
+
+    @pytest.mark.parametrize(
+        'command_key', ['review-agent-command', 'review-agent-batch-command']
+    )
+    def test_review_directory_substitution_with_a_wrapper(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        command_key: str,
+    ) -> None:
+        # Expanded paths must stay a single argument even when unquoted in
+        # the template and when the repository path contains spaces.
+        moved = tmp_path / 'repository with spaces'
+        os.rename(gitdir, moved)
+        os.chdir(moved)
+        gitdir = str(moved)
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'review')
+        wrapper = tmp_path / 'agent wrapper.py'
+        wrapper.write_text(
+            'import os, runpy, subprocess, sys\n'
+            'assert len(sys.argv) == 5, sys.argv\n'
+            'assert sys.argv[1] == "--write-dir"\n'
+            'assert sys.argv[3] == "--"\n'
+            'head = subprocess.check_output(["git", "rev-parse", "HEAD"], text=True).strip()\n'
+            'expected = os.path.abspath(os.path.join(".git", "b4-review", head))\n'
+            'assert sys.argv[2] == expected, sys.argv\n'
+            'assert os.path.isdir(expected), expected\n'
+            'assert os.listdir(expected) == []\n'
+            'assert expected in sys.argv[4]\n'
+            f'sys.argv = [{str(tmp_path / "fake-agent.py")!r}, "review", '
+            f'{str(log)!r}, sys.argv[4]]\n'
+            'runpy.run_path(sys.argv[0], run_name="__main__")\n'
+        )
+        b4.MAIN_CONFIG[command_key] = (
+            shlex.join([sys.executable, str(wrapper)]) + ' --write-dir {review_dir} --'
+        )
+        first = create_review_branch(gitdir, 'a-first', with_patch=True)
+        second = create_review_branch(gitdir, 'b-second', with_patch=True)
+        tips = [self._tip(gitdir, branch) for branch in (first, second)]
+
+        self._run()
+
+        runs = self._invocations(log)
+        assert [run['branch'] for run in runs] == [first, second]
+        assert [run['pending'] for run in runs] == [[tip] for tip in tips]
+        for branch in (first, second):
+            entry = self._agent_note(gitdir, branch)
+            assert entry is not None
+            assert entry['note'] == 'No issues found'
+        self._assert_no_worktree(gitdir)
+
+    def test_dry_run_lists_without_running(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        # No agent is configured: a dry run does not need one
+        needs = create_review_branch(gitdir, 'needs', subject='Needs a review')
+        create_review_branch(gitdir, 'replied', status='replied')
+        tip = self._tip(gitdir, needs)
+
+        # Building the branches logged their names too
+        caplog.clear()
+        with caplog.at_level(logging.INFO, logger='b4'):
+            self._run(dryrun=True)
+
+        assert f'{needs} (v1): Needs a review' in caplog.text
+        assert 'b4/review/replied' not in caplog.text
+        assert self._tip(gitdir, needs) == tip
+        assert not os.path.exists(os.path.join(gitdir, '.git', 'b4-review'))
+        self._assert_no_worktree(gitdir)
+
+    def test_leaves_the_working_tree_alone(
+        self, gitdir: str, agent_log: pathlib.Path
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        # Work in progress of every kind: staged, unstaged and untracked
+        with open(os.path.join(gitdir, 'file2.txt'), 'a') as fh:
+            fh.write('staged work\n')
+        ecode, _out = b4.git_run_command(gitdir, ['add', 'file2.txt'], rundir=gitdir)
+        assert ecode == 0
+        with open(os.path.join(gitdir, 'file1.txt'), 'a') as fh:
+            fh.write('work in progress\n')
+        with open(os.path.join(gitdir, 'notes.txt'), 'w') as fh:
+            fh.write('untracked work\n')
+
+        def _status() -> str:
+            ecode, out = b4.git_run_command(
+                gitdir, ['status', '--porcelain=v1'], rundir=gitdir
+            )
+            assert ecode == 0
+            return out
+
+        before = _status()
+        assert before.splitlines() == [' M file1.txt', 'M  file2.txt', '?? notes.txt']
+
+        self._run()
+
+        # The agent was shown the series and none of that
+        runs = self._invocations(agent_log)
+        assert [run['branch'] for run in runs] == [needs]
+        assert runs[0]['status'] == ''
+        assert 'work in progress' not in runs[0]['file1']
+        assert self._agent_note(gitdir, needs) is not None
+        # ...and all of it is still there
+        assert _status() == before
+        with open(os.path.join(gitdir, 'file1.txt')) as fh:
+            assert fh.read().endswith('work in progress\n')
+        assert b4.git_get_current_branch(gitdir) == 'master'
+        self._assert_no_worktree(gitdir)
+
+    def test_failure_does_not_stop_the_batch(
+        self,
+        gitdir: str,
+        agent_log: pathlib.Path,
+        monkeypatch: pytest.MonkeyPatch,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        broken = create_review_branch(gitdir, 'a-broken', with_patch=True)
+        works = create_review_branch(gitdir, 'b-works', with_patch=True)
+        monkeypatch.setenv('FAKE_AGENT_FAIL_ON', broken)
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        assert exc.value.code == 1
+        assert self._branches(agent_log) == [broken, works]
+        assert f'Agent review failed for {broken}' in caplog.text
+        assert 'agent exited with code 3' in caplog.text
+        assert self._agent_note(gitdir, broken) is None
+        assert self._agent_note(gitdir, works) is not None
+        self._assert_no_worktree(gitdir)
+
+        # The failed series is picked up again by the next run
+        monkeypatch.delenv('FAKE_AGENT_FAIL_ON')
+        self._run()
+        assert self._branches(agent_log) == [broken, works, broken]
+        assert self._agent_note(gitdir, broken) is not None
+
+    @pytest.mark.parametrize('substitute', [False, True])
+    def test_no_review_data_is_a_failure(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+        substitute: bool,
+    ) -> None:
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'silent')
+        if substitute:
+            b4.MAIN_CONFIG['review-agent-command'] = (
+                f'{b4.MAIN_CONFIG["review-agent-command"]} {{review_dir}}'
+            )
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        assert exc.value.code == 1
+        assert 'agent produced no review data' in caplog.text
+        assert len(self._invocations(log)) == 1
+        _cover, tracking = review.load_tracking(gitdir, needs)
+        assert batch._needs_agent_review(tracking, MY_EMAIL, None)
+        assert os.listdir(os.path.join(gitdir, '.git', 'b4-review')) == [
+            'agent-batch.lock'
+        ]
+        self._assert_no_worktree(gitdir)
+
+    def test_review_directory_creation_failure_does_not_start_agent(
+        self,
+        gitdir: str,
+        agent_log: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        b4.MAIN_CONFIG['review-agent-command'] = (
+            f'{b4.MAIN_CONFIG["review-agent-command"]} {{review_dir}}'
+        )
+        broken = create_review_branch(gitdir, 'a-broken', with_patch=True)
+        works = create_review_branch(gitdir, 'b-works', with_patch=True)
+        review_dir = os.path.join(
+            self._worktree(gitdir), '.git', 'b4-review', self._tip(gitdir, broken)
+        )
+        makedirs = os.makedirs
+
+        def _makedirs(path: str, *args: Any, **kwargs: Any) -> None:
+            if path == review_dir:
+                raise PermissionError('Cannot create review output')
+            makedirs(path, *args, **kwargs)
+
+        with mock.patch('b4.review.batch.os.makedirs', side_effect=_makedirs):
+            with pytest.raises(SystemExit) as exc:
+                self._run()
+
+        assert exc.value.code == 1
+        assert 'could not create the agent review directory' in caplog.text
+        assert self._branches(agent_log) == [works]
+        assert self._agent_note(gitdir, broken) is None
+        assert self._agent_note(gitdir, works) is not None
+        self._assert_no_worktree(gitdir)
+
+    def test_imports_review_files_from_earlier_run(
+        self, gitdir: str, agent_log: pathlib.Path
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        review_dir = os.path.join(gitdir, '.git', 'b4-review', self._tip(gitdir, needs))
+        os.makedirs(review_dir)
+        with open(os.path.join(review_dir, 'identity.txt'), 'w') as fh:
+            fh.write(f'{AGENT_NAME} <{AGENT_EMAIL}>\n')
+        with open(os.path.join(review_dir, 'series.txt'), 'w') as fh:
+            fh.write('Left over from an interrupted run\n')
+
+        self._run()
+
+        assert self._invocations(agent_log) == []
+        entry = self._agent_note(gitdir, needs)
+        assert entry is not None
+        assert entry['note'] == 'Left over from an interrupted run'
+        assert not os.path.exists(review_dir)
+
+    @pytest.mark.parametrize('mode', ['review', 'shared'])
+    @pytest.mark.parametrize('identity', [None, 'Missing email address'])
+    def test_clears_rejected_review_files_before_starting_agent(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        mode: str,
+        identity: Optional[str],
+    ) -> None:
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, mode)
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        review_dir = pathlib.Path(
+            review.get_agent_review_dir(gitdir, self._tip(gitdir, needs))
+        )
+        review_dir.mkdir(parents=True)
+        if identity is not None:
+            (review_dir / 'identity.txt').write_text(identity)
+        (review_dir / '0001.txt').write_text('Stale finding from an earlier run\n')
+
+        self._run()
+
+        # The fresh agent writes only a series summary. The rejected patch
+        # note must not be imported under its identity, even when the agent
+        # writes directly to the shared directory.
+        assert self._branches(log) == [needs]
+        entry = self._agent_note(gitdir, needs)
+        assert entry is not None
+        assert entry['note'] == 'No issues found'
+        _cover, tracking = review.load_tracking(gitdir, needs)
+        assert 'reviews' not in tracking['patches'][0]
+        assert not review_dir.exists()
+
+    def test_review_cleanup_failure_does_not_start_agent(
+        self,
+        gitdir: str,
+        agent_log: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        broken = create_review_branch(gitdir, 'a-broken', with_patch=True)
+        works = create_review_branch(gitdir, 'b-works', with_patch=True)
+        review_dir = review.get_agent_review_dir(gitdir, self._tip(gitdir, broken))
+        os.makedirs(review_dir)
+        with open(os.path.join(review_dir, '0001.txt'), 'w') as fh:
+            fh.write('Stale finding\n')
+        rmtree = shutil.rmtree
+
+        def _rmtree(path: str, *args: Any, **kwargs: Any) -> None:
+            if path == review_dir:
+                raise PermissionError('Cannot remove old review')
+            rmtree(path, *args, **kwargs)
+
+        with mock.patch('b4.review.batch.shutil.rmtree', side_effect=_rmtree):
+            with pytest.raises(SystemExit) as exc:
+                self._run()
+
+        assert exc.value.code == 1
+        assert 'could not clean the agent review directory' in caplog.text
+        assert self._branches(agent_log) == [works]
+        assert self._agent_note(gitdir, broken) is None
+        assert self._agent_note(gitdir, works) is not None
+        self._assert_no_worktree(gitdir)
+
+    def test_agent_name_only_skips_that_agent(
+        self,
+        gitdir: str,
+        agent_log: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        other = create_review_branch(
+            gitdir,
+            'other-agent',
+            with_patch=True,
+            series_extra={
+                'reviews': {'other@example.com': _agent_review('Other Agent')}
+            },
+        )
+
+        # Any agent review is enough by default
+        self._run()
+        assert self._invocations(agent_log) == []
+
+        self._run(agent_name=AGENT_NAME)
+        assert self._branches(agent_log) == [other]
+        _cover, tracking = review.load_tracking(gitdir, other)
+        assert set(tracking['series']['reviews']) == {
+            'other@example.com',
+            AGENT_EMAIL,
+        }
+
+        # Now it has a review under that name too
+        self._run(agent_name=AGENT_NAME)
+        assert len(self._invocations(agent_log)) == 1
+
+        # The configured agent does not change with the name, so asking for
+        # one it never writes reviews as keeps selecting the series
+        with caplog.at_level(logging.WARNING, logger='b4'):
+            self._run(agent_name='Third Agent')
+        assert len(self._invocations(agent_log)) == 2
+        assert 'will select it again' in caplog.text
+
+    def test_rejects_empty_agent_name(
+        self, gitdir: str, agent_log: pathlib.Path
+    ) -> None:
+        create_review_branch(gitdir, 'needs', with_patch=True)
+
+        with pytest.raises(SystemExit) as exc:
+            self._run(agent_name='')
+
+        assert exc.value.code == 1
+        assert self._invocations(agent_log) == []
+
+    def test_requires_agent_configuration(self, gitdir: str) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        tip = self._tip(gitdir, needs)
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        assert exc.value.code == 1
+        assert self._tip(gitdir, needs) == tip
+
+    @pytest.mark.parametrize('interactive_configured', [False, True])
+    def test_uses_batch_command_override(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        agent_log: pathlib.Path,
+        interactive_configured: bool,
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        b4.MAIN_CONFIG['review-agent-batch-command'] = b4.MAIN_CONFIG.pop(
+            'review-agent-command'
+        )
+        if interactive_configured:
+            b4.MAIN_CONFIG['review-agent-command'] = str(
+                tmp_path / 'interactive-agent-must-not-run'
+            )
+
+        self._run()
+
+        assert self._branches(agent_log) == [needs]
+        entry = self._agent_note(gitdir, needs)
+        assert entry is not None
+        assert entry['note'] == 'No issues found'
+
+    @pytest.mark.parametrize(
+        'command', ['', '   ', 'agent "unterminated', ['agent', 'another-agent']]
+    )
+    def test_invalid_batch_command_does_not_fall_back(
+        self,
+        gitdir: str,
+        agent_log: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+        command: Any,
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        b4.MAIN_CONFIG['review-agent-batch-command'] = command
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        assert exc.value.code == 1
+        assert 'b4.review-agent-batch-command' in caplog.text
+        assert self._invocations(agent_log) == []
+        assert self._agent_note(gitdir, needs) is None
+
+    def test_agent_changes_do_not_reach_the_next_series(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'scribble')
+        first = create_review_branch(gitdir, 'a-first', with_patch=True)
+        second = create_review_branch(gitdir, 'b-second', with_patch=True)
+
+        with caplog.at_level(logging.WARNING, logger='b4'):
+            self._run()
+
+        # Both series are reviewed, the second from as clean a checkout as
+        # the first: neither the change nor the new file is there
+        runs = self._invocations(log)
+        assert [run['branch'] for run in runs] == [first, second]
+        assert [run['status'] for run in runs] == ['', '']
+        assert 'scribble' not in runs[1]['file1']
+        assert f'changed files in the review worktree while reviewing {first}' in (
+            caplog.text
+        )
+        assert self._agent_note(gitdir, first) is not None
+        assert self._agent_note(gitdir, second) is not None
+        # None of it gets anywhere near the main tree either
+        ecode, out = b4.git_run_command(
+            gitdir, ['status', '--porcelain=v1'], rundir=gitdir
+        )
+        assert ecode == 0
+        assert out == ''
+        self._assert_no_worktree(gitdir)
+
+    def test_takes_review_written_to_the_repository(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'shared')
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+
+        self._run()
+
+        assert self._branches(log) == [needs]
+        entry = self._agent_note(gitdir, needs)
+        assert entry is not None
+        assert entry['note'] == 'No issues found'
+        assert os.listdir(os.path.join(gitdir, '.git', 'b4-review')) == [
+            'agent-batch.lock'
+        ]
+
+    def test_keeps_tracking_changes_made_during_review(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'retrack')
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        tip = self._tip(gitdir, needs)
+
+        self._run()
+
+        # The review was written for a tracking commit that is no longer
+        # the tip of the branch, and is stored on top of the one that is
+        assert self._branches(log) == [needs]
+        assert self._tip(gitdir, needs) != tip
+        _cover, tracking = review.load_tracking(gitdir, needs)
+        assert tracking['series']['status'] == 'replied'
+        assert tracking['series']['reviews'][AGENT_EMAIL]['note'] == 'No issues found'
+        assert os.listdir(os.path.join(gitdir, '.git', 'b4-review')) == [
+            'agent-batch.lock'
+        ]
+
+    def test_drops_review_of_series_that_changed(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'restack')
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        assert exc.value.code == 1
+        assert 'the series changed while it was being reviewed' in caplog.text
+        assert self._agent_note(gitdir, needs) is None
+        # The review is not kept for a later run to find either
+        assert os.listdir(os.path.join(gitdir, '.git', 'b4-review')) == [
+            'agent-batch.lock'
+        ]
+        self._assert_no_worktree(gitdir)
+
+    def test_unfinished_review_is_not_imported(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        log = tmp_path / 'agent.log'
+        self._configure_agent(gitdir, tmp_path, log, 'unfinished')
+        first = create_review_branch(gitdir, 'a-first', with_patch=True)
+        second = create_review_branch(gitdir, 'b-second', with_patch=True)
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        # An agent that gives up half way has reviewed nothing, and what it
+        # did write is gone by the time the next one starts
+        assert exc.value.code == 1
+        assert caplog.text.count('agent exited with code 3') >= 2
+        runs = self._invocations(log)
+        assert [run['branch'] for run in runs] == [first, second]
+        assert [run['pending'] for run in runs] == [[], []]
+        _cover, tracking = review.load_tracking(gitdir, first)
+        assert 'reviews' not in tracking['series']
+
+    def test_stops_when_agent_cannot_be_started(
+        self,
+        gitdir: str,
+        tmp_path: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        with open(os.path.join(gitdir, '.git', 'agent-reviewer.md'), 'w') as fh:
+            fh.write('Review the series.\n')
+        b4.MAIN_CONFIG['review-agent-command'] = str(tmp_path / 'no-such-agent')
+        b4.MAIN_CONFIG['review-agent-prompt-path'] = '.git/agent-reviewer.md'
+        create_review_branch(gitdir, 'a-first', with_patch=True)
+        create_review_branch(gitdir, 'b-second', with_patch=True)
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        assert exc.value.code == 1
+        assert caplog.text.count('Could not start the review agent') == 1
+        self._assert_no_worktree(gitdir)
+
+    def test_branch_checked_out_elsewhere_fails_alone(
+        self,
+        gitdir: str,
+        agent_log: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        other = create_review_branch(gitdir, 'b-other', with_patch=True)
+        mine = create_review_branch(gitdir, 'a-mine', with_patch=True, checkout=True)
+        assert b4.git_get_current_branch(gitdir) == mine
+
+        with pytest.raises(SystemExit) as exc:
+            self._run()
+
+        # Git does not hand out a branch that somebody is on, which is no
+        # reason not to review the others
+        assert exc.value.code == 1
+        assert f'Agent review failed for {mine}' in caplog.text
+        assert 'could not check out the branch' in caplog.text
+        assert self._branches(agent_log) == [other]
+        assert self._agent_note(gitdir, mine) is None
+        assert self._agent_note(gitdir, other) is not None
+        assert b4.git_get_current_branch(gitdir) == mine
+        self._assert_no_worktree(gitdir)
+
+    @pytest.mark.parametrize('linked', [False, True])
+    def test_replaces_worktree_left_by_interrupted_batch(
+        self, gitdir: str, agent_log: pathlib.Path, linked: bool
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        tip = self._tip(gitdir, needs)
+        # A batch that was killed leaves its worktree behind, complete with
+        # whatever the agent did there
+        stale = self._worktree(gitdir)
+        if linked:
+            # ...which git knows about if it never got as far as an agent
+            ecode, _out = b4.git_run_command(gitdir, ['worktree', 'add', stale, needs])
+            assert ecode == 0
+        else:
+            review_dir = os.path.join(stale, '.git', 'b4-review', tip)
+            os.makedirs(review_dir)
+            with open(os.path.join(review_dir, 'identity.txt'), 'w') as fh:
+                fh.write(f'{AGENT_NAME} <{AGENT_EMAIL}>\n')
+            with open(os.path.join(review_dir, 'series.txt'), 'w') as fh:
+                fh.write('Cut short\n')
+        with open(os.path.join(stale, 'leftover.txt'), 'w') as fh:
+            fh.write('leftover\n')
+
+        self._run()
+
+        runs = self._invocations(agent_log)
+        assert [run['branch'] for run in runs] == [needs]
+        assert runs[0]['status'] == ''
+        assert runs[0]['pending'] == []
+        entry = self._agent_note(gitdir, needs)
+        assert entry is not None
+        assert entry['note'] == 'No issues found'
+        self._assert_no_worktree(gitdir)
+
+    def test_replaces_worktree_that_was_deleted_by_hand(
+        self, gitdir: str, agent_log: pathlib.Path
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        # Git still has the worktree down as holding the branch
+        stale = self._worktree(gitdir)
+        ecode, _out = b4.git_run_command(gitdir, ['worktree', 'add', stale, needs])
+        assert ecode == 0
+        shutil.rmtree(stale)
+
+        self._run()
+
+        assert self._branches(agent_log) == [needs]
+        assert self._agent_note(gitdir, needs) is not None
+        self._assert_no_worktree(gitdir)
+
+    def test_only_one_batch_at_a_time(
+        self,
+        gitdir: str,
+        agent_log: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        create_review_branch(gitdir, 'needs', with_patch=True)
+        # Another batch is in the middle of a review
+        running = self._worktree(gitdir)
+        os.makedirs(os.path.join(running, '.git', 'b4-review'))
+        lock = os.path.join(gitdir, '.git', 'b4-review', 'agent-batch.lock')
+
+        with b4.lockfile_nb(lock):
+            with pytest.raises(SystemExit) as exc:
+                self._run()
+
+        assert exc.value.code == 1
+        assert 'Another batch of agent reviews is running' in caplog.text
+        assert self._invocations(agent_log) == []
+        # Its worktree is not ours to take away
+        assert os.path.isdir(running)
+
+    def test_runs_from_a_subdirectory(
+        self, gitdir: str, agent_log: pathlib.Path
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        subdir = os.path.join(gitdir, 'subdir')
+        os.mkdir(subdir)
+        os.chdir(subdir)
+
+        self._run()
+
+        runs = self._invocations(agent_log)
+        assert [run['branch'] for run in runs] == [needs]
+        assert runs[0]['toplevel'] == self._worktree(gitdir)
+        assert self._agent_note(gitdir, needs) is not None
+        assert b4.git_get_current_branch(gitdir) == 'master'
+        # Nothing was checked out into the subdirectory
+        assert os.listdir(subdir) == []
+        self._assert_no_worktree(gitdir)
+
+    def test_runs_from_a_linked_worktree(
+        self, gitdir: str, tmp_path: pathlib.Path, agent_log: pathlib.Path
+    ) -> None:
+        needs = create_review_branch(gitdir, 'needs', with_patch=True)
+        # The prompt path is relative to the top of the tree b4 is run in,
+        # and there is no .git directory to keep it in here
+        prompt_path = tmp_path / 'agent-reviewer.md'
+        prompt_path.write_text('Review the series.\n')
+        b4.MAIN_CONFIG['review-agent-prompt-path'] = str(prompt_path)
+        linked = str(tmp_path / 'linked')
+        ecode, _out = b4.git_run_command(
+            gitdir, ['worktree', 'add', '--detach', linked, 'master']
+        )
+        assert ecode == 0
+        os.chdir(linked)
+
+        self._run()
+
+        # The batch worktree is where it always is, in the git directory
+        # all the worktrees share, and so is the review on its way through
+        runs = self._invocations(agent_log)
+        assert [run['branch'] for run in runs] == [needs]
+        assert runs[0]['toplevel'] == self._worktree(gitdir)
+        assert self._agent_note(gitdir, needs) is not None
+        assert os.listdir(os.path.join(gitdir, '.git', 'b4-review')) == [
+            'agent-batch.lock'
+        ]
+        assert not os.path.lexists(self._worktree(gitdir))
+        assert os.path.isdir(linked)
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index e164bf6..01d8f6c 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -14,6 +14,8 @@ rendering, and the branch-restore logic on exit.
 import datetime
 import email.message
 import json
+import pathlib
+import shlex
 from typing import Any, Dict, List, Optional, Tuple
 from unittest import mock
 
@@ -690,6 +692,94 @@ class TestBranchRestore:
         assert app.branch_checked_out is False
 
 
+class TestAgentCommand:
+    @staticmethod
+    def _app(gitdir: str, tmp_path: pathlib.Path, command: List[str]) -> ReviewApp:
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'agent-command', ['patch 1']
+        )
+        session = _build_session(gitdir, branch)
+        session['original_branch'] = 'master'
+        app = ReviewApp(session)
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', 'master'])
+        assert ecode == 0
+        prompt = tmp_path / 'prompt {review_dir}.md'
+        prompt.write_text('Review the series.\n')
+        b4.MAIN_CONFIG['review-agent-command'] = shlex.join(command)
+        b4.MAIN_CONFIG['review-agent-prompt-path'] = str(prompt)
+        return app
+
+    @pytest.mark.parametrize('substitute', [False, True])
+    def test_review_directory_uses_checked_out_head(
+        self, gitdir: str, tmp_path: pathlib.Path, substitute: bool
+    ) -> None:
+        import contextlib
+
+        args = [
+            'wrapper',
+            '--output={review_dir}' if substitute else '--output=fixed',
+            '{"literal": "{other}"}',
+        ]
+        app = self._app(gitdir, tmp_path, args)
+        # The review branch moves after the app opens; its current tip is
+        # what the agent will read after b4 checks it out.
+        app._tracking['series']['subject'] = 'Updated tracking'
+        assert b4.review.save_tracking_ref(
+            gitdir, app._branch, app._cover_text, app._tracking
+        )
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', app._branch])
+        assert ecode == 0
+        review_dir = b4.review.get_agent_review_dir(gitdir, out.strip())
+
+        def launch(command: List[str], *, cwd: str) -> mock.Mock:
+            assert cwd == gitdir
+            assert b4.git_get_current_branch(gitdir) == app._branch
+            assert pathlib.Path(review_dir).is_dir() is substitute
+            expected = [arg.replace('{review_dir}', review_dir) for arg in args]
+            assert command == expected + [
+                f'Read and execute the prompt from {tmp_path / "prompt {review_dir}.md"}'
+            ]
+            return mock.Mock(returncode=0)
+
+        popen = mock.Mock(side_effect=launch)
+        with (
+            mock.patch.object(app, 'suspend', contextlib.nullcontext),
+            mock.patch('b4.review_tui._review_app.subprocess', Popen=popen),
+            mock.patch('b4.review_tui._review_app._wait_for_enter'),
+            mock.patch('b4.review._integrate_agent_reviews', return_value=False),
+        ):
+            app.action_agent()
+        popen.assert_called_once()
+        assert b4.git_get_current_branch(gitdir) == 'master'
+
+    @pytest.mark.parametrize('failure', ['head', 'mkdir'])
+    def test_preparation_failure_does_not_launch_agent(
+        self, gitdir: str, tmp_path: pathlib.Path, failure: str
+    ) -> None:
+        app = self._app(gitdir, tmp_path, ['wrapper', '{review_dir}'])
+        git_run_command = b4.git_run_command
+
+        def git(path: str, args: List[str], **kwargs: Any) -> Tuple[int, str]:
+            if failure == 'head' and args == ['rev-parse', 'HEAD']:
+                return 1, ''
+            return git_run_command(path, args, **kwargs)
+
+        with (
+            mock.patch('b4.git_run_command', side_effect=git),
+            mock.patch(
+                'b4.review_tui._review_app.os.makedirs',
+                side_effect=PermissionError('read-only'),
+            ),
+            mock.patch.object(app, 'notify') as notify,
+            mock.patch('b4.review_tui._review_app.subprocess') as subprocess,
+        ):
+            app.action_agent()
+        subprocess.Popen.assert_not_called()
+        notify.assert_called_once()
+        assert notify.call_args.kwargs['severity'] == 'error'
+        assert b4.git_get_current_branch(gitdir) == 'master'
+
+
 class TestSendBookkeeping:
     """Everything after the SMTP handoff is bookkeeping, and bookkeeping must
     never be able to claim the send failed."""

---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261111-batch-agent-a0fd59ffd824

Best regards,
--  
Mark Brown <broonie@kernel.org>


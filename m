Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401248;
	b=CdRFpDa+tB4amstPm+HZDiYkvcw5l6zhzX4oSYtgshWvs9BqtD9TjAuJnKUNYmOqvHjE
	 8F1RrTMpTGupYorHIGhY6PiQa7AkyfPwd0Q3L1SG3l5AXieysG8MwkXaE/b67nVpTtvrr
	 gv/vHYgVawIWw3K8NmJOufvxwKQBF1RukMudVIzDUmQA1CEYUbGN97uITjZIgMLA5zhSN
	 e3l8LkEo5ITHFcdbvyVW0hLoxyrW+Z4jALrKJcrCp1Z9lcdez5/ZtyeNLNTZdR8B+0u//
	 mV0Lcx4h3o6/qDhwe+vjHw0pgaQNxYuWWcCXCIGD6ZavdAQ2KW+YPn9/c7VxMe5O4sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401248;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IO/7ZN+AU1JrzbBB6K1rwFYcqawYqrMDJAsMedG3bd0=;
	b=FlYUABJXROH9JAEGgj7Acqc9JXP1J20KcGUQGcfs8X7tVmJF/0khoCEPG5INFORGCgjD
	 BkaC7gDeSvp4PzeM4mzUfEyDJs+FmliSUhmfilpByJXSa6qktzWpSMB2TTQ8I99ey5G1Q
	 8HbQ/yaVtODI70nYD3Z75RNYk8ZsCfO0v/volz9iFwb/6yZYbonN1aFOVCE5iaRh2eHBC
	 pzYFsaATokrSOCmjSmCrFc+z/qvoudwk2r9xopF5r9ByoJN7iL20jLXrgTPP/xpPd7LSh
	 fyrmbpXjlI5yRV+bZSJbTFVGQYr8LytE1tRrPh8y8n7OqdPzdjragAVG7HO1zWl1t1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S7KJ7i30;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5366A606A321
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S7KJ7i30
Received: by smtp.kernel.org (Postfix)
	id 037711F00A07; Wed, 11 Nov 2026 12:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9291F00A05;
	Wed, 11 Nov 2026 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401247;
	bh=IO/7ZN+AU1JrzbBB6K1rwFYcqawYqrMDJAsMedG3bd0=;
	h=From:Date:Subject:To:Cc;
	b=S7KJ7i30RtanaO0YodaN8tmb2jtdVE0NWQFYEziwfyFkQ2LsuV9gItgP/vCO5HvBo
	 JaeSZN30vBg2DIzZHnDde/Mw3+j5qtQksIKJJTl/afTdhym0KfKVm32rMFYDKpub1v
	 IubjSh5URo5dAcFtITOnIbJ23ycNaiSalpEXT3X/r2C6bwqpzRP+L8BR+6l2AcQXFR
	 KrRCVqXutAHnJJzYo/2akggnuXwTMh2FQT9i5SXyG2bBCe94Tt5VWgPMWvew4WjD8S
	 fNjGRhZH8yGTRELOf6zxRtgjUrnF1VrUU2/EDVEMExGhlxPFLi6wprNLxYjsXhaySX
	 81DVDSYT/2kPw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Nov 2026 12:47:17 +0000
Subject: [PATCH b4] review: Add a batch mode for agent reviews
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
Message-Id: <20261111-batch-agent-v1-1-7296d20c2a43@kernel.org>
X-B4-Tracking: v=1; b=H4sIANRj9GoC/yWMSwqEMBQEryK9NqBBRecq4iKfF30uMpJkBkG8u
 1F7Vw1VByIFpohPcSDQnyN/fYa6LGAW5WcSbDNDVrKr84RWySxCzeSTUJWz7eCc7WWDbGyBHO9
 PbYRuML1f/OmVTLozOM8La60ShHMAAAA=
X-Change-ID: 20261111-batch-agent-a0fd59ffd824
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7466; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FYJ9k9Qfy09LtF5mFz6cGv/k1CHO0kNxFpp8fuh0KcQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+JN/VuPSx0D/Os734I9tD89JvN92T5zZFiFhe9jW63
 Re1RDOto5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNZbsLwP8Hii9A62cQL61gv
 14jELP7+jqXwrFO3dFTd43nKLWJ7YxkZ1iSVnb38Izvo8JzQLzuY05f6mBbtuMSybG5i2r/N7/m
 K2AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Agent reviews can take quite some time to run which is not ideal for
interactive use. Add a command 'b4 review batch agent' which runs an agent
review for everything that is currently in reviewing state, allowing users
to ingest a batch of patches then review them all non-interactively.
Allow this to be limited to a specific agent in case the user is working
with multiple agents and wants to use them all.

There is a plan to offer batch operations on tagged commits in the TUI but
this feels like a case that's worth handling separately.  As well as the
particularly long runtimes compared to other things that b4 does users
may also wish to do them in an isolated environment (or an environment
with better connectivity for that matter) so a mechanism for running
thigns non-interactively could be beneficial.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 docs/maintainer/review.rst | 39 +++++++++++++++++++++++++++++++++++++++
 src/b4/command.py          | 26 ++++++++++++++++++++++++++
 src/b4/man/b4.1.rst        |  9 +++++++++
 src/b4/review/_review.py   |  9 ++++++++-
 4 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5a3e9d9..583e067 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -1832,6 +1832,45 @@ for your project. A sample prompt is included in
 repository and adapt it to your project's coding standards and review
 guidelines.
 
+Batch agent reviews
+~~~~~~~~~~~~~~~~~~~
+Run the configured review agent on all eligible series in the current
+repository with::
+
+    b4 review batch agent
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
+eligible. The configured :term:`b4.review-agent-command` still runs;
+``--agent-name`` only filters existing reviews and leaves the agent's
+command and identity unchanged.
+
+To list eligible branches without running the agent or changing the
+repository, use::
+
+    b4 review batch agent --dry-run
+
+Agent failures are reported and the batch continues with the remaining
+series. The command exits with a nonzero status if any review fails.
+The agent is asked to write a summary even when it finds no issues;
+an invocation that produces no review data is reported as a failure and
+remains eligible for a later run. Review files left by an earlier run
+are imported before another agent is started.
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
index ded7d6e..c6b587e 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -332,6 +332,15 @@ For options and their descriptions, see ``b4 review --help`` and
   list the series that would be cleaned up without changing the tracking
   database.
 
+``b4 review batch agent [--agent-name NAME] [--dry-run]``
+  Run the configured review agent on every review branch in the current
+  repository whose state is reviewing and which has no agent review attached.
+  Reviews run sequentially and the original checkout is restored afterward.
+  Requires a clean working tree. Use ``--dry-run`` to list eligible branches.
+  With ``--agent-name NAME``, skip only series with an agent review whose stored
+  reviewer display name exactly matches NAME, including case. The configured
+  agent command still runs; this option only filters existing reviews.
+
 ``b4 review tui``
   Launch the review TUI.
 
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f0..bd74360 100644
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
@@ -1449,6 +1453,7 @@ def _integrate_agent_reviews(
         series_reviews: Dict[str, Any] = series.setdefault('reviews', {})
         entry: Dict[str, Any] = series_reviews.setdefault(reviewer_email, {})
         entry['name'] = reviewer_name
+        entry['source'] = 'agent'
         old_note = entry.get('note', '')
         if old_note:
             entry['note'] = old_note + '\n\n' + series_note
@@ -1524,6 +1529,7 @@ def _integrate_agent_reviews(
         patch_reviews: Dict[str, Any] = patch.setdefault('reviews', {})
         entry = patch_reviews.setdefault(reviewer_email, {})
         entry['name'] = reviewer_name
+        entry['source'] = 'agent'
         if comments:
             existing_comments: List[Dict[str, Any]] = entry.setdefault('comments', [])
             existing_comments.extend(comments)
@@ -1541,7 +1547,8 @@ def _integrate_agent_reviews(
     # Save tracking — this amends the branch tip, changing its SHA so
     # the directory is not re-consumed on the next run.
     if branch:
-        save_tracking_ref(topdir, branch, cover_text, tracking)
+        if not save_tracking_ref(topdir, branch, cover_text, tracking):
+            raise RuntimeError(f'Unable to save agent reviews on {branch}')
     else:
         save_tracking(topdir, cover_text, tracking)
     logger.info(

---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261111-batch-agent-a0fd59ffd824

Best regards,
--  
Mark Brown <broonie@kernel.org>


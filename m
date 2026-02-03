Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F480399026
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112460; cv=none; b=SdeoqCYQJ+qr0utZmlkGE212kt3jDF0NoQy4MfusS0N1owr/DWm+6EwVSv3NCujmHDG/p7dvnBs1NI8lKLHbAbPl4htgkAecBaMfE8kDYh1v+bqcbT7iSr4+78QekMJT88mSytGLF8PAS9U2v5KUYZb55WEQCtqCf1Nm6L9q4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112460; c=relaxed/simple;
	bh=MYxhTmzgLqk1v5dVEvNmTXqORv3FjH2ent0hzajWgik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tUkSzuiwmBuRFOy2/T3Qr8SpXPNLsl+nkfbq6OD/4210RbSlut9f5ccr6GIDG/JYCCAY1yQkSFPksBtRS7ex20XHS7vPbkW+/kpPBSlSSTQsWdaQkJgXpyqTUE3rnMAa4TgCnmUU4A6Q56P0MU1c7abINr4j2D4ki2/HfI/S5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UpIj9ojU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UpIj9ojU"
Received: by smtp.kernel.org (Postfix)
	id 96FEEC19421; Tue,  3 Feb 2026 09:54:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E32BC116D0
	for <tools@kernel.org>; Tue,  3 Feb 2026 09:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E32BC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6D4681A2BBC;
	Tue,  3 Feb 2026 09:54:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4500960728;
	Tue,  3 Feb 2026 09:54:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 424E5119A8888;
	Tue,  3 Feb 2026 10:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770112453; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kiQcdM3wa7AhP2N2Ted1OrrEXsE0T3AsKQ2WGAfz6oc=;
	b=UpIj9ojUyiuLy3H/n1cDyLaeneNZKDyOaAiZMbkHXOcNqE41xRMZfBUmlQh5zYABR9mCvW
	dod9KOWrn+HS4VJUJYNfhBjcprRVAQiP01BRLvLCefMctAnYAQNwQwIznzGudl7bgNQ+Pi
	RFcdyxNtHHVqq9ZnL9420v0NgNCzKVvVinPhykTAfvSflv0M3OdK3kpSAB11fdb4zF9WSr
	EESuuflNA9F+TRzCnVbyTQ2FkcY1icsjpM6WGhnTqoKxFdun3EFO+YmRbn5fwld3pzZwNS
	U2QcFk/dhaWzNs6LK2swWrDIMezVw0fqtwkQO65UNdNvSDGQjwJRnmZmhPI8uQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 03 Feb 2026 10:54:01 +0100
Subject: [PATCH b4 v2] ez: allow cleaning multiple branches at once
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-multiple-prep-cleanup-v2-1-50d8ccefe25c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBREr2L+ur8Bgkq78h6NC6FYf4JAQE0b4
 91L3Xc58zJvdsg2kc1wr3ZIdqNMwZcgLhWYafAvi/QsGQQTNZOsxXl1C0VnMSYb0Tg7+DWibti
 tafSg9FhD2RY40vv0PkBL6Es3UV5C+pxXGz/Jz8oF53+sG0eOhis2qlZIZWSnQ1gc+asJM/THc
 XwBpftGBMAAAAA=
X-Change-ID: 20250407-multiple-prep-cleanup-b60966ba8bf5
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9530;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MYxhTmzgLqk1v5dVEvNmTXqORv3FjH2ent0hzajWgik=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpgcXEm08/cRaT9KRiqW9qO0QPPwjgkJ1UEu8z5
 JHPsKSgVf6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaYHFxAAKCRDRgEFAKaOo
 NjIjEACtUQZ3t2dSMxZ/cH8KJIDC2uxHZLo4MubFc1jwn5oT7mHoGMSAbufa3DEmdV52S5Gvckd
 l0mxwcN06Q8QHGPz/8sTw82Ox/L7Y7/0Lqv+lpN+wPG0cwp/r1FokTIw9mxJENIjxhTommRhezL
 8VCo4EpI3LDRqykKYSpsf38Mdr1Ai/uvX7o3GWIlK26nG+DvIxY0/kuxWBw6WnovtJmKnZlFZGk
 U5AgvmnCFfED5hsLX9ROWt029NiVX0lu2tcZG2lgwaZ4v8lXSWXCDMCjEBGoP9TMNIU1vVdqRkU
 ZIxs0KtLBeVU/3u4towgbLK7qiC6dBE5Am3yS2lLwmA/45TOzOIT8au0lJp3Y/77z7H56XzPGUr
 x0eCRmbqp0h3eB3kdSq/3fTgUEuuUqX4qsB1Y7dFDl/PF1TvY8jY0lASUKjMXUBMdGI2Xtv1vs0
 NCVvlqAexNm8pY0P6a5EwGHh2yhcYA+u73SIjKE1JFy0L0TuL+HbeTL7vtyfiL/U8HDjQQFCyma
 toJT6VUYjlW8ZLCdgir/IyU8kCJ19q8NAQZL37vDIHCKxYCNNXANdigL7Cjlr0iDCZowQc3k+us
 XpDI3w17lzryarLtALWUrlkMTSlGO0/bYuJUMVW0hd5eyIG30MKScHpDX4FJ2GK0lWJVvyj3HSl
 mbVORyKzJ39THag==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

Allow "b4 prep --cleanup" to cleanup multiple branches in one go. If an
error occurs (branch not known/empty branch/currently checked out), just
return to continue cleaning up branches. Give the user multiple options:
"y" to cleanup, "n" to skip, "q" to abort the cleanup, "s" to show
the branch log with diffs, and "?" to print help about these options.

Passing nothing to --cleanup still shows the available branches to
cleanup.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- return instead of failing if branch is not prep-managed
- show branch log instead of general information on the branch
- Link to v1: https://patch.msgid.link/20251211-multiple-prep-cleanup-v1-1-c180f87248c4@bootlin.com
---
 docs/contributor/prep.rst | 10 ++---
 src/b4/command.py         |  4 +-
 src/b4/ez.py              | 94 ++++++++++++++++++++++++++++++++---------------
 3 files changed, 72 insertions(+), 36 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 18c710d..6d6fed5 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -337,15 +337,15 @@ up the prep-managed branch, together with all of its sent tags::
 
     b4 prep --cleanup
 
-This command lists all prep-managed branches in your repository. Pick a
-branch to clean up, make sure it's not currently checked out, and run
-the command again::
+This command lists all prep-managed branches in your repository. Pick one or
+more branches to clean up, make sure it's not currently checked out, and run the
+command again::
 
-    b4 prep --cleanup b4/my-topical-branch
+    b4 prep --cleanup b4/my-topical-branch ...
 
 After you confirm your action, this should create a tarball with all the
 patches, cover letters, and tracking information from your series.
-Afterwards, b4 deletes the branch and all related tags from your local
+Afterwards, b4 deletes the branch(es) and all related tags from your local
 repository.
 
 .. _prep_flags:
diff --git a/src/b4/command.py b/src/b4/command.py
index 1f8b8f1..cc8bc38 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -344,8 +344,8 @@ def setup_parser() -> argparse.ArgumentParser:
                        help='Mark current revision as sent and reroll (requires cover letter msgid)')
     spp_g.add_argument('--show-info', metavar='PARAM', nargs='?', const=':_all',
                        help='Show series info in a format that can be passed to other commands.')
-    spp_g.add_argument('--cleanup', metavar='BRANCHNAME', nargs='?', const='_show',
-                       help='Archive and remove a prep-tracked branch and all its sent/ tags')
+    spp_g.add_argument('--cleanup', metavar='BRANCHNAME', nargs='*',
+                       help='Archive and remove prep-tracked branches and all associated sent/ tags')
 
     ag_prepn = sp_prep.add_argument_group('Create new branch', 'Create a new branch for working on patch series')
     ag_prepn.add_argument('-n', '--new', dest='new_series_name',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 298e382..7af8e14 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -26,6 +26,7 @@ import io
 import tarfile
 import hashlib
 import urllib.parse
+import subprocess
 
 from typing import Any, Optional, Tuple, List, Union, Dict, Set
 from string import Template
@@ -2518,47 +2519,40 @@ def get_prep_managed_branches(gitdir: Optional[str] = None) -> List[str]:
     return mybranches
 
 
-def cleanup(param: str) -> None:
-    if param == '_show':
-        # Show all b4-tracked branches
-        mybranches = get_prep_managed_branches(None)
-        if not len(mybranches):
-            logger.info('No b4-tracked branches found')
-            sys.exit(0)
+def _cleanup_branch(branch: str) -> None:
 
-        logger.info('Please specify branch:')
-        for branch in mybranches:
-            logger.info(' %s', branch)
+    if not b4.git_branch_exists(None, branch):
+        logger.error('ERROR: Not a known branch: %s', branch)
         return
 
-    mybranch = param
-    if not b4.git_branch_exists(None, mybranch):
-        logger.critical('Not a known branch: %s', mybranch)
-        sys.exit(1)
-    is_prep_branch(mustbe=True, usebranch=mybranch)
-    base_commit, start_commit, end_commit = get_series_range(usebranch=mybranch)
+    if not is_prep_branch(usebranch=branch):
+        return
+
+    base_commit, start_commit, end_commit = get_series_range(usebranch=branch)
     # start commit and end commit can't be the same
     if start_commit == end_commit:
-        logger.critical('CRITICAL: %s appears to be an empty branch', mybranch)
-        sys.exit(1)
+        logger.error('ERROR: %s appears to be an empty branch', branch)
+        return
+
     # Refuse to clean up the currently checked out branch
     curbranch = b4.git_get_current_branch()
-    if curbranch == mybranch:
-        logger.critical('CRITICAL: %s is currently checked out, cannot cleanup', mybranch)
-        sys.exit(1)
-    cover, tracking = load_cover(usebranch=mybranch)
+    if curbranch == branch:
+        logger.error('ERROR: %s is currently checked out, cannot cleanup', branch)
+        return
+
+    cover, tracking = load_cover(usebranch=branch)
     # Find all tags
     ts = tracking['series']
     tags = list()
-    logger.info('Will archive and delete all of the following:')
+    logger.info('\nWill archive and delete all of the following:')
     logger.info('---')
-    logger.info('branch: %s', mybranch)
+    logger.info('branch: %s', branch)
     if 'history' in ts:
         for rn, links in ts['history'].items():
             tagname, revision = get_sent_tagname(ts.get('change-id'), SENT_TAG_PREFIX, rn)
             tag_commit = b4.git_revparse_tag(None, tagname)
             if not tag_commit:
-                tagname, revision = get_sent_tagname(mybranch, SENT_TAG_PREFIX, rn)
+                tagname, revision = get_sent_tagname(branch, SENT_TAG_PREFIX, rn)
                 tag_commit = b4.git_revparse_tag(None, tagname)
             if not tag_commit:
                 logger.debug('No tag matching revision %s', revision)
@@ -2573,7 +2567,32 @@ def cleanup(param: str) -> None:
             tags.append((tagname, base_commit, tag_commit, revision, cover))
     logger.info('---')
     try:
-        input('Press Enter to confirm or Ctrl-C to abort')
+        resp = None
+        while resp is None:
+            resp = input('Proceed? [y/s/q/N/?] ')
+            if resp == "?":
+                logger.info(textwrap.dedent(
+                    """
+                    Possible answers:
+                    y: cleanup the branch
+                    s: show branch log
+                    q or Ctrl-C: abort cleanup
+                    n (default): do not cleanup this branch
+                    ?: show this help message
+                    """))
+                resp = None
+            elif resp in ("show", "s"):
+                start_commit = get_info(branch)["start-commit"]
+                end_commit = get_info(branch)["end-commit"]
+                subprocess.run(["git", "--paginate", "log", "-p",
+                                f"{start_commit}~..{end_commit}"])
+                logger.info('')
+                resp = None
+            elif resp == "q":
+                sys.exit(130)
+            elif resp != "y":
+                return
+
     except KeyboardInterrupt:
         logger.info('')
         sys.exit(130)
@@ -2595,13 +2614,13 @@ def cleanup(param: str) -> None:
         write_to_tar(tfh, f'{change_id}/tracking.js', mnow, ifh)
         ifh.close()
         # Add the current series
-        logger.info('Archiving branch %s', mybranch)
+        logger.info('Archiving branch %s', branch)
         patches = b4.git_range_to_patches(None, start_commit, end_commit)
         ifh = io.BytesIO()
         b4.save_git_am_mbox([patch[1] for patch in patches], ifh)
         write_to_tar(tfh, f'{change_id}/patches.mbx', mnow, ifh)
         ifh.close()
-        deletes.append(['branch', '--delete', '--force', mybranch])
+        deletes.append(['branch', '--delete', '--force', branch])
 
         for tagname, base_commit, tag_commit, revision, cover in tags:
             logger.info('Archiving %s', tagname)
@@ -2636,6 +2655,23 @@ def cleanup(param: str) -> None:
     logger.info('Wrote: %s', tarpath)
 
 
+def cleanup(branches: list[str]) -> None:
+    if not branches:
+        # Show all b4-tracked branches
+        mybranches = get_prep_managed_branches(None)
+        if not len(mybranches):
+            logger.info('No b4-tracked branches found')
+            sys.exit(0)
+
+        logger.info('Please specify branch:')
+        for branch in mybranches:
+            logger.info(' %s', branch)
+        return
+
+    for branch in branches:
+        _cleanup_branch(branch)
+
+
 def show_info(param: str) -> None:
     # is param a name of the branch?
     mybranch: Optional[str] = None
@@ -3027,7 +3063,7 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.show_info:
         return show_info(cmdargs.show_info)
 
-    if cmdargs.cleanup:
+    if cmdargs.cleanup is not None:
         return cleanup(cmdargs.cleanup)
 
     if cmdargs.format_patch:

---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20250407-multiple-prep-cleanup-b60966ba8bf5


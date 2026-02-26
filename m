Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368E39E6C8
	for <tools@linux.kernel.org>; Thu, 26 Feb 2026 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100346; cv=none; b=W+Btp3pv1AwEXjdFF+QZyjacNHkENIM6vFyM3Z+9o1nMCjDx/T6LONSBJo160xvD4Tp3PDzjS/hC3Ki/3zqZGuiVk3oKanTb17F1/zFXRQjdWVLu3nb/ggdzuZA1glEFkixPMo5loJDODugc1qTVofNygxX66Sf3D7KDhLCQu+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100346; c=relaxed/simple;
	bh=4BBuz1igUDm6mzGx1zIkYMh4VJVCqqinra10fA55bBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EUTGzN6becCCEbsqVJnu//69qM8Ck73AzWTLtZKmcWh/GvKqTuztcZZgGszUXlwB3GRrCpdwkRe9o46ESzynK/KBPwAG47iz3K7nFdJeVZ6hg7PluTjis8K7uE5Kk+IisHjFUb6kuJnpjwkRQFOmkhouE0oZ6/dyAaCisBKiUfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DOePj23t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DOePj23t"
Received: by smtp.kernel.org (Postfix)
	id 868ADC19422; Thu, 26 Feb 2026 10:05:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB713C19424
	for <tools@kernel.org>; Thu, 26 Feb 2026 10:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB713C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87F54C4068F
	for <tools@kernel.org>; Thu, 26 Feb 2026 10:05:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2FCE5FDEB;
	Thu, 26 Feb 2026 10:05:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8806103691DD;
	Thu, 26 Feb 2026 11:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772100341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=BtFVumWGmc+gDvGWJokoe/iZwn0T7oICNH3jND3zbqI=;
	b=DOePj23tBKxyJrAdrQHB2StY+xpkFPPfevO+TH5SWERGjY9Dec0miZ+dXLdSaHOsAoCF2b
	1UNI5hrjkdGiryAWr7lRxm/buqX00llNN7w0LoEHYJWRdECjqruy5b618ljx9UzZcnqE5+
	83gRmklrdhJ7suG3MitixpIhLx9oBsd1/kECS9U+mukRLqAGpOAOJbBR4jyDqRpscYfacl
	k1Qhp/65p9rfktUMefHzs0JyyBDWvh2d1D9J80o3AojoKyG7OWy2rHOjteRWrWbOI6+68V
	8f0LOOjujD+NacTMag2VTK4HZlxlY0F6fNNe35RtERMBqmNDyX7TVC2tgDCMXA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Feb 2026 11:05:35 +0100
Subject: [PATCH b4 v4] ez: allow cleaning multiple branches at once
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-multiple-prep-cleanup-v4-1-c08834685aa3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQrCMBAF4KtI1kYy06SNrryHuGiSiQ3UpvQPp
 fTuxoKgSJdvHu+bmfXUBerZaTezjqbQh9ikIPc7ZquyuREPLmWGApWQouD3sR5CWxNvO2q5ral
 sxpabXBzz3JTaeMXSNpU+PFb3woxk13SrQj/E7rm+mmBt3iogwIY6AQduQQuvC5TayrOJcahDc
 7DxvpoTfpxcoMi2HEyOEk5bS55Q2X8n+3JQbTlZcpwpCgPSeefg11mW5QVih3FyUAEAAA==
X-Change-ID: 20250407-multiple-prep-cleanup-b60966ba8bf5
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10014;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4BBuz1igUDm6mzGx1zIkYMh4VJVCqqinra10fA55bBU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpoBr0Qr5OHlS1/Jg7cy6L7E/ZwyyL6Pme6CC2+
 o+swu6lVCqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaAa9AAKCRDRgEFAKaOo
 NoqLEACzDVz5qsCnCZlChH55mZmjcSBwJH3rcmvika1PO0w5DUKow0qCEU7lJIvNo2Dg3YFDkCd
 ghPZowrFHAl2PBKDz0hAraBLJV4KwXKlj/ihf528FKxPkCd6BTZ//9nioLMJOsy9OorbY+RwJNV
 wODYKAGpElAIyec9n1njBUxRvKZrcsIYt6LiW14pS3HRqnGTjhsiQFc0Kkt/Cwr+ux7bX6clOHj
 1aEw/TA+zy8Q1o6j0zmXnzoYJRtn/N+6cfXxkR3a/14sFQAFA8LVsItWwP/KXnbUyfqhoIF0t1A
 cYOjrdOADnZMzp0wnv7I3y9eRvLSiajxXxk9gkEPeGi8J5Z95IXy11MA8LVuk7Gftm4PUP7cZVd
 gKrLLQK9zaWfJiCUauItGPj0rkv/DHf/L0bdEUCU//ODQfdDfPZ8UyXhyzk905t59/EumFo8xPK
 m1INcxImKf2IyaR0vb9EyA3Fy/ortEAwQuCXfKe3DCg7HOOkt7MCISWucpcjJkJu+Nqj+Iv4qim
 ogAchW+SgtmPDCbQAMD+5LIcrEwwy/HhMHeJ72cz4Ribm510xaU1RPaZvW8JlIFJS7zWLOJ+pS3
 ahFO5C/LkUnxjBCm499wXS+89GJt7I7iSqY+W1zsWupk+jWOMmqBC1Au+aGxnXzP27i2TA8aW8V
 pviaQW6PXlYzdGA==
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
Changes in v4:
- Address feedback from Konstantin (%-formatting)
- Link to v3: https://patch.msgid.link/20260225-multiple-prep-cleanup-v3-1-db77b14dfdd1@bootlin.com

Changes in v3:
- Address feedback from Konstantin
- Link to v2: https://patch.msgid.link/20260203-multiple-prep-cleanup-v2-1-50d8ccefe25c@bootlin.com

Changes in v2:
- return instead of failing if branch is not prep-managed
- show branch log instead of general information on the branch
- Link to v1: https://patch.msgid.link/20251211-multiple-prep-cleanup-v1-1-c180f87248c4@bootlin.com
---
 docs/contributor/prep.rst | 10 ++---
 src/b4/command.py         |  4 +-
 src/b4/ez.py              | 99 +++++++++++++++++++++++++++++++++--------------
 3 files changed, 77 insertions(+), 36 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index e6b45c7..9e9da65 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -342,15 +342,15 @@ up the prep-managed branch, together with all of its sent tags::
 
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
index 0e685cd..54c32a5 100644
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
index 42379a7..9dcad6d 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2520,47 +2520,41 @@ def get_prep_managed_branches(gitdir: Optional[str] = None) -> List[str]:
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
+        logger.error('ERROR: %s is not a prep-managed branch', branch)
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
@@ -2575,7 +2569,37 @@ def cleanup(param: str) -> None:
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
+                ecode, out = b4.git_run_command(None, ["log",
+                                                       "--patch",
+                                                       "--color=always",
+                                                       f"{start_commit}~..{end_commit}"])
+                if ecode > 0:
+                    logger.critical('ERROR: unable to show git log between %s and %s',
+                                    start_commit, end_commit)
+                    sys.exit(130)
+                logger.info(out)
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
@@ -2597,13 +2621,13 @@ def cleanup(param: str) -> None:
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
@@ -2638,6 +2662,23 @@ def cleanup(param: str) -> None:
     logger.info('Wrote: %s', tarpath)
 
 
+def cleanup(branches: List[str]) -> None:
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
@@ -3029,7 +3070,7 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.show_info:
         return show_info(cmdargs.show_info)
 
-    if cmdargs.cleanup:
+    if cmdargs.cleanup is not None:
         return cleanup(cmdargs.cleanup)
 
     if cmdargs.format_patch:

---
base-commit: 858baa2b2eeb93ea1b0e1b57adfb77e4a126043e
change-id: 20250407-multiple-prep-cleanup-b60966ba8bf5


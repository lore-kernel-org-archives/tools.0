Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0CA2FDC4E
	for <tools@linux.kernel.org>; Thu, 11 Dec 2025 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447655; cv=none; b=jCU7/VjWtlBhwytIyLfgdMlsTSLlCWr1GNTSxs4Tj+iBTNcQjo+ZMgQ4dcWEsi7/xLWFsZSGmxHWXSXVVSE9uSX9U03wCMnlGs7qcSkB3dXk6j51zCxt+RyW6zjs9dirJ4+CfAv+AJje+sVwDYoyaxYE0SrpNw/ZE1aNauGoEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447655; c=relaxed/simple;
	bh=SL78eT+3aFhWdpPWHLkXVGEuxo1nuQPBMOq1+h35tkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ArnYdMjcsfzf4AA7NBUxoeuw9CZI5pOkAIcQCG6+DSZpapI3V9M+SyhYNDoz35DQ/Pxur881LEBprHRohvM3e4VwJjO6q9EOSd76MA+Hc4xkHpkVLoKoSkcVd1LdeszVDTrIEMOVWV9pB/i2h8SZ3r/doK0DN/ktkl4MlY4b/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BEmn/XW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BEmn/XW0"
Received: by smtp.kernel.org (Postfix)
	id AF77EC4CEF7; Thu, 11 Dec 2025 10:07:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66AF8C113D0
	for <tools@kernel.org>; Thu, 11 Dec 2025 10:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66AF8C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A67EF4E41B6D;
	Thu, 11 Dec 2025 10:07:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CD8E6068C;
	Thu, 11 Dec 2025 10:07:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74E46103C8E11;
	Thu, 11 Dec 2025 11:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765447648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nyYu5YljBzPprELgcoW/XTiwTfd2PVP7uYTBJC1CkqA=;
	b=BEmn/XW0UhxlVagTFVgvoOOXQAXSBPw9x+rojJP24ZU15vJDtcyvyknt9HPtmwgV66Srjo
	z6U9FX3zqmPElnOY0nj7BhQPLMJyBPvD913/5GFF2A+hTkRARfKplmNgCI/P6fEG4HPeQY
	g9FIFRqoczTVcZC8oG9lVy4TuE15ibk0FvlE3cKJKlCiAF0LNa7iixiApP/ciM09WZwu2a
	2mCaDWf0VoKsykDYEnSEP/Hpn05VRAEsx2zidEc9Q8MG7DerZjt6zDvy2AyCTCHLoTIbg+
	J2yT9htbtsuGjacqxV9ovufrrnBPdzm/MX6McVUigvAAjJflmWPcta2C3eg4yg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 11 Dec 2025 11:07:17 +0100
Subject: [PATCH b4] ez: allow cleaning multiple branches at once
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-multiple-prep-cleanup-v1-1-c180f87248c4@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANSXOmkC/x2MWwqAIBAArxL73YKF2eMq0YfWVgtmohVBdPekz
 2GYeSBSYIrQZQ8Eujjy7hIUeQbjqt1CyFNiKEVZCSlq3E57sLeEPpDH0ZJ2p0ejRKuU0Y2ZK0h
 tkjPf/7cHI2F43w8HZxb0awAAAA==
X-Change-ID: 20250407-multiple-prep-cleanup-b60966ba8bf5
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8847;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SL78eT+3aFhWdpPWHLkXVGEuxo1nuQPBMOq1+h35tkw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpOpfgUtLX4TfalyFseyg+udT1R2U53/+GZGWWY
 tcViOBdTlaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTqX4AAKCRDRgEFAKaOo
 NoQmEACpwfhyjoD+8e2Sik/0gZh+QhvnKmhO/aobYYMZReFFg9PlMEcf9+Gv8z08gDPd1N6ORak
 guowR6+Zg+dG6qisJzPxjV8bQI2K8MR31evCG2CCeom2Iul0qhgE6YrEVf1KvahIlsj4XC16RDw
 jRZFuraJrQfXxPO1gFGTPpDmGivrdxmmALKzz9TW7v9B+DyYLdhdZ930IhH2t5G1FpZ2VbmMPm7
 ph/8slp53PKJfPv4sDKXC0UrLxV04VyFwEkl0PFXsf+uZUHt34w8SO4+L9z6/8AmeiSR3yIYtjU
 7botFXiapMsYX3foC0tFEVXXPgC409ApYoFp0z2Bp56gw07WqGBODsm7z0XmUvY35CRciy3OepM
 tOooRz59kK/0zGDS/gN2GLVOEKMmEKQSIid4WisTKlnqfrh8zMSd86c47f9dek46yiLqwPsWkv7
 tiMM4raf9Kt7ookCHkhRw+cNjXGKOQpgWSUEIpXtcxRfbhE4tqASB4skvWKgYmZPxeYO5kXvqyi
 ZPSXWBSVKXqdjg+lbNHeu68Z2bRaz5psbYflA8QEd/MXs1xx+6Thof/pb44pXENO0WIkXg8QyGa
 91piJ9Z22ofgDxJ3g3wzYdI0PAFa8f0JMkiDd5OU7Rx7pabxF+l8kA/D4Y4ig9H8q1AuZS5PSF3
 J/mxF5uSixNeJrQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

Allow "b4 prep --cleanup" to cleanup multiple branches in one go. If an
error occurs (branch not known/empty branch/currently checked out), just
return to continue cleaning up branches. Give the user multiple options:
"y" to cleanup, "n" to skip, "q" to abort the cleanup, "s" to show
information on the branch, and "?" to print help about these options.

Passing nothing to --cleanup still shows the available branches to
cleanup.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 docs/contributor/prep.rst | 10 +++---
 src/b4/command.py         |  4 +--
 src/b4/ez.py              | 88 +++++++++++++++++++++++++++++++----------------
 3 files changed, 66 insertions(+), 36 deletions(-)

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
index 298e382..fa8d017 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2518,47 +2518,38 @@ def get_prep_managed_branches(gitdir: Optional[str] = None) -> List[str]:
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
+    is_prep_branch(mustbe=True, usebranch=branch)
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
@@ -2573,7 +2564,29 @@ def cleanup(param: str) -> None:
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
+                    s: show branch information
+                    q or Ctrl-C: abort cleanup
+                    n (default): do not cleanup this branch
+                    ?: show this help message
+                    """))
+                resp = None
+            elif resp in ("show", "s"):
+                show_info(branch)
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
@@ -2595,13 +2608,13 @@ def cleanup(param: str) -> None:
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
@@ -2636,6 +2649,23 @@ def cleanup(param: str) -> None:
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
@@ -3027,7 +3057,7 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.show_info:
         return show_info(cmdargs.show_info)
 
-    if cmdargs.cleanup:
+    if cmdargs.cleanup is not None:
         return cleanup(cmdargs.cleanup)
 
     if cmdargs.format_patch:

---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20250407-multiple-prep-cleanup-b60966ba8bf5


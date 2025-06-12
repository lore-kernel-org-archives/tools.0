Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86D18858C
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723271; cv=none; b=NzMWjXkpRC6itPtw2VDL7cigTA5Hrn2h4SX6AH+ErjfEcHUv7W90UIstLWG/CyBEM844gXGuRgxhky5OmDzM45jW2l4mxBXDJls0u90i1hOzekLoO40352/5x56zFqRcnC5V/dFZ47FXVvLf06UNrNojdPmT97x4hq3fb9CWTGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723271; c=relaxed/simple;
	bh=Kg86WuveLbIiZGrvxARSt+3rjTqtyMHQNMhbYdSN1No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WBXJK/GP1lJO68VhZiSqXHQSMGLPlen9LeZp47jHuWT/0j64TQnb68x7e++ahWM0g8NdRqCM9AGozoD7yjwhuMM4WGdTtBUHy8Kc+HZJ1Pp1eo6BwR75V3mgwin+hr/e7aRpd4/7sb2Mxyd/bY89Of+cANkIk04HctY9wrYYmqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5FSJxxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5FSJxxm"
Received: by smtp.kernel.org (Postfix)
	id 4131FC4CEF0; Thu, 12 Jun 2025 10:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C940C4CEEA;
	Thu, 12 Jun 2025 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749723271;
	bh=Kg86WuveLbIiZGrvxARSt+3rjTqtyMHQNMhbYdSN1No=;
	h=From:To:Cc:Subject:Date:From;
	b=L5FSJxxmIcp4+3Xw7Xvcd63OK5Prd3xyLlOsuciv5lZN5nnP182gdhZL7K3sQWNAk
	 cIvXXnuO26zCB+ADvjxV8ybxKZ3VtGD7rV3HOSnL817aS3qZsx5idxYkFRdJRx+FKt
	 Td14U8fLmB1rPRg1b4+yuJu6QNzTx9AhJYFLC+itEnFxaDMyPHsnTLB+PPN/Lj4Mzu
	 bZf5DsXwtXHI5ZEOjMX3zT+lQJZ0OT1cZPw8QbBOx/y1PUPPMHlQMUSqFpEsPeCaD8
	 /iPfe0nUBQ/few2WjHD6wKx7YezYg2oOutnY7sg409iApdAk2Q2MhUQq4Vz5x2igLh
	 2u+QawC529Y9g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	konstantin@linuxfoundation.org
Cc: tools@kernel.org
Subject: [PATCH v4 1/1] ty: Allow users to specify whether thank-yous are sent to themselves
Date: Thu, 12 Jun 2025 11:14:28 +0100
Message-ID: <20250612101428.419150-1-lee@kernel.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The motivation behind this change was that thank-yous weren't showing up
in maintainer's inboxes.  This is a problem because some of us the
presence of these mails to indicate that particular sets or individual
patches have been applied or not.

Provide command line option '--me-too' to override the default
behaviour.  If this is not specified, there are no functional changes.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217672
Signed-off-by: Lee Jones <lee@kernel.org>
---

v3 -> v4: Rebase and fix conflicts - no functional changes intended

 src/b4/command.py |  2 ++
 src/b4/ty.py      | 19 ++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index bad221e4e8b5..e386b704a0a0 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -270,6 +270,8 @@ def setup_parser() -> argparse.ArgumentParser:
                        help='Print out emails instead of sending them')
     sp_ty.add_argument('--pw-set-state', default=None,
                        help='Set this patchwork state instead of default (use with -a, -t or -d)')
+    sp_ty.add_argument('--me-too', action='store_true', dest='metoo', default=False,
+                       help='Send a copy of the thanks mail to yourself - ensures a copy lands in your inbox')
     sp_ty.set_defaults(func=cmd_ty)
 
     # b4 diff
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 137d769c8230..c77c04dbb532 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -78,14 +78,15 @@ def git_get_commit_message(gitdir: Optional[str], rev: str) -> Tuple[int, Union[
     return b4.git_run_command(gitdir, args)
 
 
-def make_reply(reply_template: str, jsondata: Dict[str, str], gitdir: Optional[str]) -> email.message.EmailMessage:
+def make_reply(reply_template: str, jsondata: Dict[str, str], gitdir: Optional[str], cmdargs: argparse.Namespace) -> email.message.EmailMessage:
     msg = email.message.EmailMessage()
     msg['From'] = '%s <%s>' % (jsondata['myname'], jsondata['myemail'])
     excludes = b4.get_excluded_addrs()
     newto = b4.cleanup_email_addrs([(jsondata['fromname'], jsondata['fromemail'])], excludes, gitdir)
 
     # Exclude ourselves and original sender from allto or allcc
-    excludes.add(jsondata['myemail'])
+    if not cmdargs.metoo:
+        excludes.add(jsondata['myemail'])
     excludes.add(jsondata['fromemail'])
     allto = b4.cleanup_email_addrs(utils.getaddresses([jsondata['to']]), excludes, gitdir)
     allcc = b4.cleanup_email_addrs(utils.getaddresses([jsondata['cc']]), excludes, gitdir)
@@ -269,7 +270,7 @@ def set_branch_details(gitdir: Optional[str], branch: str, jsondata: Dict[str, s
     return jsondata, config
 
 
-def generate_pr_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch: str) -> email.message.EmailMessage:
+def generate_pr_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch: str, cmdargs: argparse.Namespace) -> email.message.EmailMessage:
     config = b4.get_main_config()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_PR_TEMPLATE
@@ -294,11 +295,11 @@ def generate_pr_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch:
     if not cidmask:
         cidmask = 'merge commit: %s'
     jsondata['summary'] = cidmask % jsondata['merge_commit_id']
-    msg = make_reply(thanks_template, jsondata, gitdir)
+    msg = make_reply(thanks_template, jsondata, gitdir, cmdargs)
     return msg
 
 
-def generate_am_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch: str, since: str) -> email.message.EmailMessage:
+def generate_am_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch: str, since: str), cmdargs: argparse.Namespace -> email.message.EmailMessage:
     config = b4.get_main_config()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_AM_TEMPLATE
@@ -311,7 +312,7 @@ def generate_am_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch:
                             config['thanks-am-template'])
             sys.exit(2)
     if 'commits' not in jsondata:
-        commits = auto_locate_series(gitdir, jsondata, branch, since)
+        commits = auto_locate_series(gitdir, jsondata, branch, cmdargs.since)
     else:
         commits = jsondata['commits']
 
@@ -342,7 +343,7 @@ def generate_am_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch:
                         nomatch, len(commits), jsondata['subject'])
         logger.critical('           Please review the resulting message')
 
-    msg = make_reply(thanks_template, jsondata, gitdir)
+    msg = make_reply(thanks_template, jsondata, gitdir, cmdargs)
     return msg
 
 
@@ -424,10 +425,10 @@ def send_messages(listing: List[Dict], branch: str, cmdargs: argparse.Namespace)
         jsondata['signature'] = signature
         if 'pr_commit_id' in jsondata:
             # This is a pull request
-            msg = generate_pr_thanks(gitdir, jsondata, branch)
+            msg = generate_pr_thanks(gitdir, jsondata, branch, cmdargs)
         else:
             # This is a patch series
-            msg = generate_am_thanks(gitdir, jsondata, branch, cmdargs.since)
+            msg = generate_am_thanks(gitdir, jsondata, branch, cmdargs)
 
         if msg is None:
             continue
-- 
2.50.0.rc1.591.g9c95f17f64-goog


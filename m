Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8745B20E70E
	for <tools@linux.kernel.org>; Thu,  1 May 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090910; cv=none; b=OmvPwJy+5wUAWWltHbl1iXQj7HgppCbC96dLr0VZL+G+N1G6IY+SOu7ckzXin2vX8lt35Kvw0TnUHuy0leM1RyKTM8bRKFPk/FIuFK6DYOhtsqVwgaBlVYDoy3UTEQHYZj03bwsS2CJ7kfKbWM/8LLYtsAxCMv3PTiUN7UqL9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090910; c=relaxed/simple;
	bh=bv+lqHBBP9ajcotS4hoqFGBtqf/TT3mMpn2TjW4VdqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=meYE5Y4kDtA1F55YYwWibWvwAIjzOJn7+ep1skm91bhDUh1lg30GF87eBrn/zFcthpJNC+RBZIrgM7cDUGAkCLCCfZZXOBX961xc8WqxoPqPyXlDZZzKgc2ZHa489fjMM8wKaElvMvcYK7hjYOqHGGms7MSsakRDfS3BolB4v30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGLC7XeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGLC7XeR"
Received: by smtp.kernel.org (Postfix)
	id 1400BC4CEED; Thu,  1 May 2025 09:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E36C4CEE3;
	Thu,  1 May 2025 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746090908;
	bh=bv+lqHBBP9ajcotS4hoqFGBtqf/TT3mMpn2TjW4VdqY=;
	h=From:To:Cc:Subject:Date:From;
	b=nGLC7XeRoSzWeNWWRyzvaSOCcNRTF4a+LFzMbPNVVIO3/fvotdeonFjWKsInAu/G7
	 1NI8kuTz/WRIfcS9Qg7zOZYw1GgsU2hRvKLG1sesJ2+bhbLWTOaQocznmKH2dLdau+
	 8rvJVcTXhMqj/Ag7pWtP/M61uM2LRVoxo+yTjNs+G9Yq1V2S1jolyveHIZfMszUrkX
	 vOfz2Fb/HrGbPcArHY/zsH5p3ewEzd75jS6IiAyEox6Wkx4IQPQep1/vCV5CPyNUBa
	 gpxB5VjWg5xdIxkl2oxAgnqbM1lk7p0s24a8c45XCj0/x34jSDW5PD/mnfdn14aN4E
	 mYauhoXtcqeCA==
From: Lee Jones <lee@kernel.org>
To: konstantin@linuxfoundation.org
Cc: tools@kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 1/1] ty: Allow users to specify whether thank-yous are sent to themselves
Date: Thu,  1 May 2025 10:15:02 +0100
Message-ID: <20250501091502.3663038-1-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The motivation behind this change was that thanks-yous weren't showing
up in my inbox.  This is a problem because I use the presence of these
mails to indicate that particular sets or individual patches have been
applied or not.

Provide command line option '--send-to-self' to override the default
behaviour.  If this is not specified, there are no functional changes.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217672
Signed-off-by: Lee Jones <lee@kernel.org>
---
v1 => v2:
 - Commit message update

 src/b4/command.py |  2 ++
 src/b4/ty.py      | 19 ++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 617a2d7ded8f..777987f06aa7 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -266,6 +266,8 @@ def setup_parser() -> argparse.ArgumentParser:
                        help='Print out emails instead of sending them')
     sp_ty.add_argument('--pw-set-state', default=None,
                        help='Set this patchwork state instead of default (use with -a, -t or -d)')
+    sp_ty.add_argument('--send-to-self', action='store_true', dest='sendtoself', default=False,
+                       help='Send a copy of the thanks mail to yourself - ensures a copy lands in your inbox')
     sp_ty.set_defaults(func=cmd_ty)
 
     # b4 diff
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 021588ff9e55..f6a4f63bb3da 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -78,14 +78,15 @@ def git_get_commit_message(gitdir: Optional[str], rev: str) -> Tuple[int, Union[
     return b4.git_run_command(gitdir, args)
 
 
-def make_reply(reply_template: str, jsondata: dict, gitdir: Optional[str]) -> email.message.EmailMessage:
+def make_reply(reply_template: str, jsondata: dict, gitdir: Optional[str], cmdargs: argparse.Namespace) -> email.message.EmailMessage:
     msg = email.message.EmailMessage()
     msg['From'] = '%s <%s>' % (jsondata['myname'], jsondata['myemail'])
     excludes = b4.get_excluded_addrs()
     newto = b4.cleanup_email_addrs([(jsondata['fromname'], jsondata['fromemail'])], excludes, gitdir)
 
     # Exclude ourselves and original sender from allto or allcc
-    excludes.add(jsondata['myemail'])
+    if not cmdargs.sendtoself:
+        excludes.add(jsondata['myemail'])
     excludes.add(jsondata['fromemail'])
     allto = b4.cleanup_email_addrs(utils.getaddresses([jsondata['to']]), excludes, gitdir)
     allcc = b4.cleanup_email_addrs(utils.getaddresses([jsondata['cc']]), excludes, gitdir)
@@ -270,7 +271,7 @@ def set_branch_details(gitdir: Optional[str], branch: str, jsondata: dict, confi
     return jsondata, config
 
 
-def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str) -> email.message.EmailMessage:
+def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str, cmdargs: argparse.Namespace) -> email.message.EmailMessage:
     config = b4.get_main_config()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_PR_TEMPLATE
@@ -295,11 +296,11 @@ def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str) -> em
     if not cidmask:
         cidmask = 'merge commit: %s'
     jsondata['summary'] = cidmask % jsondata['merge_commit_id']
-    msg = make_reply(thanks_template, jsondata, gitdir)
+    msg = make_reply(thanks_template, jsondata, gitdir, cmdargs)
     return msg
 
 
-def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, since: str) -> email.message.EmailMessage:
+def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, cmdargs: argparse.Namespace) -> email.message.EmailMessage:
     config = b4.get_main_config()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_AM_TEMPLATE
@@ -312,7 +313,7 @@ def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, since
                             config['thanks-am-template'])
             sys.exit(2)
     if 'commits' not in jsondata:
-        commits = auto_locate_series(gitdir, jsondata, branch, since)
+        commits = auto_locate_series(gitdir, jsondata, branch, cmdargs.since)
     else:
         commits = jsondata['commits']
 
@@ -343,7 +344,7 @@ def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, since
                         nomatch, len(commits), jsondata['subject'])
         logger.critical('           Please review the resulting message')
 
-    msg = make_reply(thanks_template, jsondata, gitdir)
+    msg = make_reply(thanks_template, jsondata, gitdir, cmdargs)
     return msg
 
 
@@ -425,10 +426,10 @@ def send_messages(listing: List[Dict], branch: str, cmdargs: argparse.Namespace)
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
2.48.1.502.g6dc24dfdaf-goog


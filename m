Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F42580EC
	for <tools@linux.kernel.org>; Wed, 12 Feb 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381323; cv=none; b=HPR5l+yX2o9aCPLuCY3gb2/oJpd1sX9cPI7MG5zecpGBw8DMTaVHlnOVJdlq/+8wgHPWCKllrGtmDIq6iMsKJrEp35UNuwknd2EO0c3N+X4R/DrFhb1h3Fc1JZAMJwmIyX84M14+Ry3A/dW8ZSBbl/5LM8rU4Aw2RsToh0eGWZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381323; c=relaxed/simple;
	bh=X6Upj2N3HY847ilJ93+zKgDZ1Dw7InWONlpTAOKCOLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HClpN1hvinZ1K9oTvQy3iGaTPBg3i7hD4wdr5HBZGMGXnYASevgbpyPcbQ2459nCRO7yIy3uUq6SRxnE2RjvRqc7T04u/WbAW3cVLOZcioebFXsHu/3iTUllolzKWVFMUaetVEH5hHR44B+UT8bIcTQersq871hN7HN1D0Tk2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlwLE6Vk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlwLE6Vk"
Received: by smtp.kernel.org (Postfix)
	id AC970C4AF09; Wed, 12 Feb 2025 17:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7612DC4CEDF;
	Wed, 12 Feb 2025 17:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739381321;
	bh=X6Upj2N3HY847ilJ93+zKgDZ1Dw7InWONlpTAOKCOLY=;
	h=From:To:Cc:Subject:Date:From;
	b=tlwLE6VkfU/mZUuxGe7REyCh3wn+PRMbhuEyqV3s9xiN1wZpmTnavrAZ2JHZW9+ku
	 JLq5uihZjF30GeR9n1nqTQJTHeQ8SkkyfsCzCMcFS2J11i9sOUX8d+GOm311n53mpx
	 CX9SH5fcvIuV4WCH4oEKDNZ3gy+lrRFXHvYZWvuq9kp8NUScT5hXPEIWt5nc3+qzm/
	 /kdvgNHWKhWuftqmpdsrX987ALCTp6GwWcp2fnc4ez80Waj80T8hK7FOGuOGyS/NS1
	 g3TuvDYFyR32hPRbwAukiu8hVkft5/KPJM6WyQ2iY4CEuU0hdstRjTMBgChkPi45xM
	 nwCzEHD9WpcfA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	tools@kernel.org
Cc: Konstantin,
	Ryabitsev,
	konstantin@linuxfoundation.org
Subject: [PATCH 1/1] ty: Allow users to specify whether thank-yous are sent to themselves
Date: Wed, 12 Feb 2025 17:28:38 +0000
Message-ID: <20250212172838.2765647-1-lee@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
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


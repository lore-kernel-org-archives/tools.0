Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936024409
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821532; cv=none; b=AAj5Nvj8N/lOL0sElmywMM+iAFEKffjebF7X2tN0CAShoXeaxmRWu9pIc8zUedk8J37bXFgRVjD6L8NpeRhxR/I0VTu+y5Y9AMzUPE5d69RIQHgyYKOas3Azp1eTg6zVEP0YNu6V89AC2L9ijmByF40/Iqfh0/iiNUBY3qw2eQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821532; c=relaxed/simple;
	bh=R8WQ8SMIWsb9xjZj4LrupMBa6d2X2NDvk88zAbuM3h4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBP2jfnaetueYJnQ8QfQ5rc1AIUYS/sRScaGqQOJVTscg1tXYeaGbT6NIU0x8ZBRNeg8q5PQk8/ZGOAW73rLoQw0uCNhBtLLjmAGtxqVTRblS4OusSOHXpFSAZhq7FLQomP+kUnX8VtIqhp10mpsXrsKsUwiu2LymhGmhs2DeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WV6VJXVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WV6VJXVp"
Received: by smtp.kernel.org (Postfix)
	id 3FE74C4CEF0; Fri, 13 Jun 2025 13:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD86C4CEE3;
	Fri, 13 Jun 2025 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821532;
	bh=R8WQ8SMIWsb9xjZj4LrupMBa6d2X2NDvk88zAbuM3h4=;
	h=From:To:Cc:Subject:Date:From;
	b=WV6VJXVpv2MSuAdRoci30NlXD7cZ3qP7W+ft8SZbnUOdapBaWyoAhpidU3Mdv8reh
	 L3zmWUWomHuHMSf+wTXPP+ucE3tFmQ1BeXmqZVZaHeWjAJEp9HfFAG4ut4UA0pQiqU
	 PT2gI5cckm4AEtvqi+lCf3jhKyoYQJOn3fINwXwIYfAvn3/3l2JPNpVVMTJ9Fmuh2v
	 DS9RwVAD6Zi4fB04CsJxwpoXlAolvtjRIlayZr4qwr02Yno03+aSulUnnH6EbVD9Ym
	 J1+xURDbgGU9lwTQOczR/77EjCGEROYcsE+DRITHwOi/5jYDdB3QtMUSZw4MrOL6mU
	 TzfoLGF+jkLLA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	konstantin@linuxfoundation.org
Cc: tools@kernel.org
Subject: [PATCH v5 1/1] ty: Allow users to specify whether thank-yous are sent to themselves
Date: Fri, 13 Jun 2025 14:32:09 +0100
Message-ID: <20250613133209.892846-1-lee@kernel.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
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

v4 -> v5: Actually test the conflict resolutions and repair the obvious breakage!  *hangs head in shame*
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
index 137d769c8230..14ba58c56870 100644
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
+def generate_am_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch: str, cmdargs: argparse.Namespace) -> email.message.EmailMessage:
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
2.50.0.rc2.692.g299adb8693-goog


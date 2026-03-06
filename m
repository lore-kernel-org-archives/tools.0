Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83493612D8
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797957; cv=none; b=IiYNY5LamNN0Uo1srJ9bpowFrkJlWA+HdtCaWLoo45tsUuNU5LfCI1QVf/XlgkcrAcse1Os9hNX6acpuUKBigXHEmg8T6GgmboZV+5vFIKhUj0PIq8wZWOFK1UDXPVYFmSjgOsXWh6uYwUhcc8RbpSE/v7D5p+1LLBm1/mDPRfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797957; c=relaxed/simple;
	bh=zRqyb6ASc1M4esfe6+vRu0Y/FiXCUC+Ms0Aw83BU690=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkJZtqybM7S+9Et70hxoJ7oPhoCwjrvZ8M89wH5Jr3oJwCrVCVtUXEGPctFUx0IGy0gkXA1qvnqcw+ktfQky8OJmRyV8KvZ9NRpeKHnoNi6Wx2VmD2aH/z2rpJb6KmvWfV94jFcZEA+6vRb5is6/s4YFxFPeyz0LZqeB6Mw0+Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMMFFSsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMMFFSsh"
Received: by smtp.kernel.org (Postfix)
	id D6B4CC2BC86; Fri,  6 Mar 2026 11:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2053BC4CEF7;
	Fri,  6 Mar 2026 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772797956;
	bh=zRqyb6ASc1M4esfe6+vRu0Y/FiXCUC+Ms0Aw83BU690=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZMMFFSshKAzUzzfpjcot6ZIBYuIHRE0OACd2Wk2IxJrwMZtwPdIivLmPvqANSto9b
	 m2+w1kdOI/mi/gvta/dM09oiMom5B3GMY2Y3X1QjPxU/zADowwaB2rGKUfE0X77WOU
	 gH+oI/rxnjJSAdLbyPGdb10op5ulO/SDGKRxD6mG1Wk6sUHLrwqVE2OoMim36n7pcp
	 cRdyzfPApJDEPZChJUE/Ig70Se2j1toOq4z1XMG7KWjMf0uYaTsc0KOrbXBMHfxjhX
	 BX798SUOLj+OLtukxZETHCFzj7mlBzufPsoRU1PtMPOVOlatPub54j0Tthvq+DiCbi
	 YsYCVzrXgOUTA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 06 Mar 2026 12:52:24 +0100
Subject: [PATCH b4 1/3] shazam: refactor git_fetch_am_into_repo for
 deterministic worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-master-v1-1-5a4b9cbe11d7@kernel.org>
References: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
In-Reply-To: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Christian Brauner <christian@amutable.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Christian Brauner <brauner@kernel.org>, 
 "Claude Opus 4.6" <noreply@anthropic.com>
X-Mailer: b4 0.15-dev-ace2f
X-Developer-Signature: v=1; a=openpgp-sha256; l=6601; i=brauner@kernel.org;
 h=from:subject:message-id; bh=zRqyb6ASc1M4esfe6+vRu0Y/FiXCUC+Ms0Aw83BU690=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSuOsAgZXor58mpoJLgV/MXOPG9y11r6/dbtnJtn8TiD
 xssy+dt7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjId2dGhsMMmxorll1zyxJO
 OFLxgsVbpDLWVkDGd7br92kxhsrqnowM+wRUdiupzfrQZxOwQNZ2yu1H5kVTdfPMnD1XcpvEX9D
 gBgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Replace the git_temp_worktree context manager with a deterministic
worktree path (<git-common-dir>/b4-shazam-worktree) and manual
lifecycle management. This is preparation for conflict resolution
support where the worktree needs to persist after a failed git-am.

Add AmConflictError(RuntimeError) exception so callers can
distinguish am failures from other errors. Since it inherits from
RuntimeError, existing callers that catch RuntimeError continue to
work unchanged.

Add an am_flags parameter to allow callers to pass additional flags
to git-am (e.g., -3 for three-way merge).

Clean up any stale worktree from a previous run at the start of
each invocation. On am failure, the worktree is intentionally left
behind (for future conflict resolution use); the stale-worktree
cleanup handles this on the next run.

Update the shazam caller in make_am to explicitly catch
AmConflictError, clean up the worktree, and log the failure,
preserving the current user-visible behavior.

Also fix a minor str(gwt) -> gwt in the FETCH_HEAD origin rewrite
since gwt is already a str.

Co-developed-by: Claude Opus 4.6 <noreply@anthropic.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 src/b4/__init__.py | 51 +++++++++++++++++++++++++++++++++++++++------------
 src/b4/mbox.py     |  8 ++++++++
 2 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index eab290b..0baaec8 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -73,6 +73,13 @@ __VERSION__ = '0.15-dev'
 PW_REST_API_VERSION = '1.2'
 
 
+class AmConflictError(RuntimeError):
+    def __init__(self, worktree_path: str, output: str):
+        self.worktree_path = worktree_path
+        self.output = output
+        super().__init__(output)
+
+
 def _dkim_log_filter(record: logging.LogRecord) -> bool:
     # Hide all dkim logging output in normal operation by setting the level to
     # DEBUG. If debugging output has been enabled then prefix dkim logging
@@ -4721,31 +4728,48 @@ def git_revparse_obj(gitobj: str, gitdir: Optional[str] = None) -> str:
 
 
 def git_fetch_am_into_repo(gitdir: Optional[str], ambytes: bytes, at_base: str = 'HEAD',
-                           origin: Optional[str] = None, check_only: bool = False) -> None:
+                           origin: Optional[str] = None, check_only: bool = False,
+                           am_flags: Optional[List[str]] = None) -> None:
     if gitdir is None:
         gitdir = os.getcwd()
     topdir = git_get_toplevel(gitdir)
 
-    with git_temp_worktree(topdir, at_base) as gwt:
+    common_dir = git_get_common_dir(topdir)
+    if not common_dir:
+        raise RuntimeError('Unable to determine git common dir')
+    gwt = os.path.join(common_dir, 'b4-shazam-worktree')
+
+    # Clean up any stale worktree from a previous run
+    if os.path.exists(gwt):
+        git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+
+    gitargs = ['worktree', 'add', '--detach', '--no-checkout', gwt]
+    if at_base:
+        gitargs.append(at_base)
+    ecode, out = git_run_command(topdir, gitargs, logstderr=True)
+    if ecode > 0:
+        raise RuntimeError('Failed to create worktree: %s' % out.strip())
+
+    cleanup = True
+    try:
         logger.info('Magic: Preparing a sparse worktree')
-        ecode, out = git_run_command(gwt, ['sparse-checkout', 'set'], logstderr=True)
+        ecode, out = git_run_command(gwt, ['sparse-checkout', 'set'], logstderr=True, rundir=gwt)
         if ecode > 0:
             logger.critical('Error running sparse-checkout set')
             logger.critical(out)
             raise RuntimeError
-        ecode, out = git_run_command(gwt, ['checkout', '-f'], logstderr=True)
+        ecode, out = git_run_command(gwt, ['checkout', '-f'], logstderr=True, rundir=gwt)
         if ecode > 0:
             logger.critical('Error running checkout into sparse workdir')
             logger.critical(out)
             raise RuntimeError
-        ecode, out = git_run_command(gwt, ['am'], stdin=ambytes, logstderr=True)
+        amargs = ['am']
+        if am_flags:
+            amargs.extend(am_flags)
+        ecode, out = git_run_command(gwt, amargs, stdin=ambytes, logstderr=True, rundir=gwt)
         if ecode > 0:
-            logger.critical('Unable to cleanly apply series, see failure log below')
-            logger.critical('---')
-            logger.critical(out.strip())
-            logger.critical('---')
-            logger.critical('Not fetching into FETCH_HEAD')
-            raise RuntimeError
+            cleanup = False
+            raise AmConflictError(gwt, out.strip())
         if check_only:
             return
         logger.info('---')
@@ -4758,6 +4782,9 @@ def git_fetch_am_into_repo(gitdir: Optional[str], ambytes: bytes, at_base: str =
             logger.critical('Unable to fetch from the worktree')
             logger.critical(out.strip())
             raise RuntimeError
+    finally:
+        if cleanup:
+            git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
 
     if not origin:
         return
@@ -4772,7 +4799,7 @@ def git_fetch_am_into_repo(gitdir: Optional[str], ambytes: bytes, at_base: str =
     with open(fhf.rstrip(), 'r') as fhh:
         contents = fhh.read()
     mmsg = 'patches from %s' % origin
-    new_contents = contents.replace(str(gwt), mmsg)
+    new_contents = contents.replace(gwt, mmsg)
     if new_contents != contents:
         with open(fhf.rstrip(), 'w') as fhh:
             fhh.write(new_contents)
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 3d12f8e..132cbb9 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -389,6 +389,14 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             else:
                 logger.info(' Base: %s (use --merge-base to override)', base_commit)
             b4.git_fetch_am_into_repo(topdir, ambytes=ambytes, at_base=base_commit, origin=linkurl)
+        except b4.AmConflictError as cex:
+            b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
+            logger.critical('Unable to cleanly apply series, see failure log below')
+            logger.critical('---')
+            logger.critical(cex.output)
+            logger.critical('---')
+            logger.critical('Not fetching into FETCH_HEAD')
+            sys.exit(1)
         except RuntimeError:
             sys.exit(1)
 

-- 
2.47.3


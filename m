Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314466;
	b=LtQoAnrT0uSxt7WvvFzTQj+KVhl2VR068g+HhmALGeSqizedlPti3cYhG9HKpm8zkl+Z
	 cz8iXA53w4/K1dkcIPgfpklJZSJnRYy+3KTUYr/XUCcqzJK1R8yiMDsMzNqmLqHXIEtRv
	 O6CRY4GgS1it5/8nJVqN79mLg1O4x23MCye64wwrHYN2aKNidk+H+c1iUBIAs0dZcd3Vp
	 BHENYL0WawMRVSOn/I6noi2yrSbXYv57qj78VmSiD6oW2Mp5FhvHJyKxCoemwOzmvppBX
	 i4nRPAPsIuJ5qDfFym5lvlRaGSVBSbOpZzEooLKuRHB1Xbu9bGK2Zm8H5ruvcNAkZJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314466;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=fZAFBwSf+vS3KA35P0QgTML6l0MryPu/neILn01IkD0=;
	b=OqyGE14DFNnc9bqgXrGkdaZI7mXeF+8PhxOGCO+sO7Mmk1wOcpqvTyyWpkHHhMop2fIR
	 wLabCKOjJi83d0DJTC7Weh3ATc8L23GTaLA1UkAwMQfH04Y/8ezc5T3AYbagxqxfg4Rbq
	 dm7gDIChMTsF4gl7x1VOV9m6SW9g7wG4e7ypBbPqrLVM/I5Zgyev0zlTTT/hMiSm5wbFf
	 XVXtAAVCFrLAGGeh05DXyXm7FtZrsYIuw2gpxVnsZmv03ssT6y/zGydOCIqZVKBbWRyzo
	 B7HRgZcO4mCZFkSmVVN3rB5+fWtp0iIu1R8VYQ5aGahfTjdWYf9bUMLktJ63nLSNLmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1460A2608
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DF711F00901; Tue, 10 Nov 2026 12:41:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314465;
	b=RYJbCIVOHws8zuf/p2lhvVvI95OzJL88to3AMfDhxrVJmjZR6EaP6tfW39+YWHVk3mzM
	 qNPrOs3AW1wQo3LBtGZwg5uJ0Ldg3UpJxFKsgBbIzIAVB0F6uJqlqjWaMVH6YBNMj5H6t
	 AfxOWN6hKyKxcXTarLoPmpbTJx67Jum4tS2/kMa7iTtQHbSudCcw5xGFlb+K+Qr3dh6MR
	 X6S9W0WsyFOq3m0LZgLlZryjDD6WduvLC4WClHQQsIVsXpueAxanG+NGRFlSe8Y/jiZ9v
	 vMNAwrGPN2/mzB8J8YP/lJMEHus11ECvFUjQu+06BdSRkL8XKhY86c7E/eW62XQfBAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314465;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=fZAFBwSf+vS3KA35P0QgTML6l0MryPu/neILn01IkD0=;
	b=IusiuAPOvtkRcnyg9Brl2i8pmjlukVPm9URceAmwZHOmecZIkF2Apkh+CTB385a+bjhB
	 tWtR/9FJeVKJ4R6cxHXFJFpSwAv+M6Ct80WyOLUhwsHdZ0/cQd3+Su5AnVuPn2AIFEQrD
	 ZenQpy116XDpsQx3y3cL2P9T/2OiahRELIO6Djhoxmws18RyL0GY89vDlAM5RiaFoCmio
	 clrfGFG9KshYj9npsWFnSKEr3VXR/qq+8zjl86aF9ZTCVfWVEa8viPpgvoA4gwTLpeHY9
	 PVDDRKACJzpsFOXifJQMroGXOHA9QmPNQCFjpcBli4RdjpR68HV0GuZSgfoXvilrroA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40C4D1F008A1
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 40C4D1F008A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 8E0EF48182;
	Tue, 10 Nov 2026 13:41:00 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Tue, 10 Nov 2026 13:40:50 +0100
Subject: [PATCH RFC b4 4/6] ez: work on a series at a detached HEAD
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-editor_refuse_the-v1-4-4b6e52f326a9@proxmox.com>
References: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
In-Reply-To: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
To: tools@kernel.org
Cc: Gabriel Goller <g.goller@proxmox.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Gabriel Goller <hey@gabriels.computer>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794314453976

From: Gabriel Goller <hey@gabriels.computer>

Tools that manage the checkout themselves leave HEAD detached, as does
git checkout --detach. b4 prep, b4 send and b4 trailers refused to
work there, even when HEAD carries a complete series.

With the commit cover strategy, everything b4 needs is in the history
of HEAD: the cover commit starts the series and holds its tracking
data, and HEAD ends it. So when HEAD is detached, take the series from
there. No branch configuration applies, so only the commit strategy is
supported. Nothing records which strategy a detached series was made
with, so refuse a series that the commit strategy cannot have made: a
cover that tracks a base branch, as a tip-commit cover does, a cover
without exactly one parent, and merges in the series.

Rewrites keep HEAD detached and back up the old tip as
refs/original/b4/<change-id>. b4 send tags the sent revision and
updates the cover as it does on a branch, and b4 prep --claim claims
the series at HEAD. Explicit branch arguments and branch workflows are
unchanged.

Signed-off-by: Gabriel Goller <hey@gabriels.computer>
---
 src/b4/ez.py                  | 253 +++++++++++++++++---------
 src/tests/test_ez_detached.py | 403 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 568 insertions(+), 88 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 86a7e37305f7..481a221cb4a2 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -822,6 +822,7 @@ def store_cover(content: str, tracking: Dict[str, Any], new: bool = False) -> No
                 start=f'{commit}~1',
                 end='HEAD',
                 reflog_msg='b4: update cover letter',
+                backup_ref=get_series_backup_ref(tracking),
             )
 
     if strategy == 'branch-description':
@@ -841,25 +842,51 @@ def store_cover(content: str, tracking: Dict[str, Any], new: bool = False) -> No
 #              (once/if git upstream properly supports it)
 
 
-def get_cover_strategy(usebranch: Optional[str] = None) -> str:
+def get_prep_target(usebranch: Optional[str] = None) -> Tuple[str, Optional[str]]:
+    """Return the revision that holds the series and the branch it is on.
+
+    An explicit *usebranch*, or else the current branch, is both. On a
+    detached HEAD, the series is the history of HEAD, and there is no
+    branch whose configuration could apply to it.
+    """
     if usebranch:
-        branch = usebranch
-    else:
-        _cb = b4.git_get_current_branch()
-        if _cb is None:
+        return usebranch, usebranch
+    mybranch = b4.git_get_current_branch()
+    if mybranch is None:
+        return 'HEAD', None
+    return mybranch, mybranch
+
+
+def _get_configured_cover_strategy() -> str:
+    config = b4.get_main_config()
+    return str(config.get('prep-cover-strategy', 'commit'))
+
+
+def get_cover_strategy(usebranch: Optional[str] = None) -> str:
+    _rev, branch = get_prep_target(usebranch)
+    if branch is None:
+        # Only the commit strategy keeps everything in the history of HEAD.
+        # The others need a branch to keep the cover in, or to remember
+        # which strategy the series uses.
+        strategy = _get_configured_cover_strategy()
+        if strategy != 'commit':
             logger.critical(
-                'CRITICAL: not currently on a branch, unable to determine cover strategy'
+                'CRITICAL: HEAD is detached, and b4 supports only the "commit" cover'
             )
+            logger.critical(
+                '          strategy without a branch (b4.prep-cover-strategy is %s).',
+                strategy,
+            )
+            logger.critical('          Check out a branch to use that strategy.')
             sys.exit(1)
-        branch = _cb
+        return strategy
     # Check local branch config for the strategy
     bconfig = b4.get_config_from_git(rf'branch\.{branch}\..*')
     if 'b4-prep-cover-strategy' in bconfig:
         strategy = str(bconfig.get('b4-prep-cover-strategy'))
         logger.debug('Got strategy=%s from branch-config', strategy)
     else:
-        config = b4.get_main_config()
-        strategy = str(config.get('prep-cover-strategy', 'commit'))
+        strategy = _get_configured_cover_strategy()
 
     if strategy in {'commit', 'branch-description', 'tip-commit'}:
         return strategy
@@ -872,17 +899,14 @@ def is_prep_branch(mustbe: bool = False, usebranch: Optional[str] = None) -> boo
     mustmsg = (
         'CRITICAL: This is not a prep-managed branch or it was created by someone else.'
     )
-    mybranch: Optional[str] = None
-    if usebranch:
-        mybranch = usebranch
-    else:
-        mybranch = b4.git_get_current_branch()
+    _rev, mybranch = get_prep_target(usebranch)
     if mybranch is None:
-        # Not on any branch?
-        if mustbe:
-            logger.critical(mustmsg)
-            sys.exit(1)
-        return False
+        mustmsg = 'CRITICAL: HEAD is not a prep-managed series or it was created by someone else.'
+        if _get_configured_cover_strategy() != 'commit':
+            if mustbe:
+                # Explains why and exits
+                get_cover_strategy()
+            return False
 
     strategy = get_cover_strategy(mybranch)
     if strategy in {'commit', 'tip-commit'}:
@@ -912,16 +936,7 @@ def find_cover_commit(usebranch: Optional[str] = None) -> Optional[str]:
     logger.debug(
         'Looking for the cover letter commit with magic marker "%s"', MAGIC_MARKER
     )
-    if not usebranch:
-        usebranch = b4.git_get_current_branch()
-    if usebranch is None:
-        logger.critical(
-            'The current repository is not tracking a branch. To use b4, please checkout a branch.'
-        )
-        logger.critical('Maybe a rebase is running?')
-        raise RuntimeError(
-            'Not currently on a branch, please checkout a b4-tracked branch'
-        )
+    rev, mybranch = get_prep_target(usebranch)
 
     # Restrict to committer being the current person, in case an errant cover letter
     # got added into the shared tree, as in:
@@ -939,7 +954,7 @@ def find_cover_commit(usebranch: Optional[str] = None) -> Optional[str]:
         '--since=1.year',
         '--no-mailmap',
         f'--committer={limit_committer}',
-        usebranch,
+        rev,
         '--',
     ]
     lines = b4.git_get_command_lines(None, gitargs)
@@ -947,9 +962,81 @@ def find_cover_commit(usebranch: Optional[str] = None) -> Optional[str]:
         return None
     found = lines[0].split()[0]
     logger.debug('Cover commit found in %s', found)
+    if mybranch is None:
+        _check_detached_series(found)
     return found
 
 
+def _read_cover_tracking(cover_commit: str) -> Dict[str, Any]:
+    ecode, out = b4.git_run_command(
+        None, ['show', '-s', '--format=%B', cover_commit, '--']
+    )
+    if ecode > 0 or MAGIC_MARKER not in out:
+        logger.critical('CRITICAL: unable to read cover letter at %s', cover_commit)
+        sys.exit(1)
+    _cover, magic_json = out.split(MAGIC_MARKER, maxsplit=1)
+    _junk, mdata = magic_json.split('{', maxsplit=1)
+    tracking: Dict[str, Any] = json.loads('{' + mdata)
+    return tracking
+
+
+def _check_detached_series(cover_commit: str) -> None:
+    """Exit unless *cover_commit* starts a series that HEAD can carry alone.
+
+    Without a branch, nothing records the cover strategy, so the history
+    has to show that the series uses the commit strategy: an empty cover
+    commit with one parent, and a linear series from there to HEAD. A
+    tip-commit cover can also sit at HEAD with one parent, but only the
+    commit strategy keeps no base branch in its tracking data.
+    """
+    tracking = _read_cover_tracking(cover_commit)
+    basebranch = tracking.get('series', dict()).get('base-branch')
+    if basebranch is not None:
+        logger.critical(
+            'CRITICAL: The cover letter at %.12s tracks base branch %s,',
+            cover_commit,
+            basebranch,
+        )
+        logger.critical(
+            '          so it is not stored with the "commit" strategy, which is'
+        )
+        logger.critical('          the only one b4 supports on a detached HEAD.')
+        logger.critical('          Check out the branch of this series instead.')
+        sys.exit(1)
+    parents = b4.git_get_command_lines(
+        None, ['rev-list', '--no-walk', '--parents', cover_commit]
+    )
+    if len(parents) != 1 or len(parents[0].split()) != 2:
+        logger.critical(
+            'CRITICAL: The cover letter at %.12s does not have exactly one parent,',
+            cover_commit,
+        )
+        logger.critical('          so b4 cannot tell where the series is based.')
+        sys.exit(1)
+    merges = b4.git_get_command_lines(
+        None, ['rev-list', '--merges', f'{cover_commit}..HEAD']
+    )
+    if merges:
+        logger.critical(
+            'CRITICAL: The series that starts at %.12s contains merge commit %.12s,',
+            cover_commit,
+            merges[0],
+        )
+        logger.critical('          so b4 cannot tell which commits belong to it.')
+        sys.exit(1)
+
+
+def get_series_backup_ref(tracking: Dict[str, Any]) -> Optional[str]:
+    """Return the backup ref for rewriting the series, or None for the default.
+
+    On a branch, rewrites back up to ``refs/original/<branch>``. A detached
+    HEAD has no name of its own, so the change-id names the backup.
+    """
+    if b4.git_get_current_branch() is not None:
+        return None
+    return f'refs/original/b4/{tracking["series"]["change-id"]}'
+
+
 def find_cover_commits(usebranch: Optional[str] = None) -> List[Tuple[str, str]]:
     """Return ``[(sha, committer_email), ...]`` for every cover commit found.
 
@@ -958,10 +1045,7 @@ def find_cover_commits(usebranch: Optional[str] = None) -> List[Tuple[str, str]]
     commit that was committed under a different identity -- e.g. after the
     user changed their ``user.email``. Newest first; empty when none exist.
     """
-    if not usebranch:
-        usebranch = b4.git_get_current_branch()
-    if usebranch is None:
-        return []
+    rev, _mybranch = get_prep_target(usebranch)
     gitargs = [
         'log',
         '--grep',
@@ -970,7 +1054,7 @@ def find_cover_commits(usebranch: Optional[str] = None) -> List[Tuple[str, str]]
         '--pretty=format:%H %cE',
         '--since=1.year',
         '--no-mailmap',
-        usebranch,
+        rev,
         '--',
     ]
     found: List[Tuple[str, str]] = []
@@ -981,7 +1065,7 @@ def find_cover_commits(usebranch: Optional[str] = None) -> List[Tuple[str, str]]
     return found
 
 
-def _explain_not_prep_branch(mybranch: str, fallbackmsg: str) -> None:
+def _explain_not_prep_branch(mybranch: Optional[str], fallbackmsg: str) -> None:
     """Log a helpful reason why *mybranch* failed the prep-branch check.
 
     The restricted :func:`find_cover_commit` lookup just came up empty. If a
@@ -991,6 +1075,7 @@ def _explain_not_prep_branch(mybranch: str, fallbackmsg: str) -> None:
     Falls back to *fallbackmsg* when no cover commit exists at all.
     """
     covers = find_cover_commits(usebranch=mybranch)
+    where = 'branch' if mybranch else 'HEAD'
     if not covers:
         logger.critical(fallbackmsg)
         return
@@ -998,7 +1083,7 @@ def _explain_not_prep_branch(mybranch: str, fallbackmsg: str) -> None:
         logger.critical(
             'CRITICAL: Found %d b4 cover-letter commits on this', len(covers)
         )
-        logger.critical('          branch, committed under different identities:')
+        logger.critical('          %s, committed under different identities:', where)
         for sha, email in covers:
             logger.critical('            %s  by %s', sha[:12], email)
         logger.critical('          Something is wrong here that b4 should not try to')
@@ -1007,18 +1092,23 @@ def _explain_not_prep_branch(mybranch: str, fallbackmsg: str) -> None:
     sha, email = covers[0]
     usercfg = b4.get_user_config()
     myemail = usercfg.get('email')
-    logger.critical("CRITICAL: This branch's b4 cover-letter commit (%s)", sha[:12])
+    logger.critical("CRITICAL: This %s's b4 cover-letter commit (%s)", where, sha[:12])
     logger.critical('          was committed by %s, but your current git', email)
     logger.critical('          identity is %s.', myemail)
     logger.critical('          This usually happens after changing your user.email.')
     logger.critical('          To continue, either:')
     logger.critical('            - set user.email back to %s, or', email)
-    logger.critical('            - claim this branch under your current identity:')
+    logger.critical('            - claim this %s under your current identity:', where)
     logger.critical('                b4 prep --claim')
 
 
 def _rewrite_series_commits(
-    edit_map: Dict[str, str], start: str, end: str = 'HEAD', *, reflog_msg: str
+    edit_map: Dict[str, str],
+    start: str,
+    end: str = 'HEAD',
+    *,
+    reflog_msg: str,
+    backup_ref: Optional[str] = None,
 ) -> Dict[str, str]:
     """Wrap rewrite_commits(), turning a third-party-committer refusal into advice.
 
@@ -1028,7 +1118,9 @@ def _rewrite_series_commits(
     user to ``prep --claim`` instead of dumping a traceback.
     """
     try:
-        return rewrite_commits(edit_map, start, end, reflog_msg=reflog_msg)
+        return rewrite_commits(
+            edit_map, start, end, reflog_msg=reflog_msg, backup_ref=backup_ref
+        )
     except ThirdpartyCommitterError as ex:
         logger.critical(
             'CRITICAL: refusing to rewrite commit(s) committed by someone else:'
@@ -1049,7 +1141,7 @@ def _rewrite_series_commits(
         sys.exit(1)
 
 
-def _claim_range_start(mybranch: str, cover_sha: str) -> str:
+def _claim_range_start(mybranch: Optional[str], cover_sha: str) -> str:
     """Return the rewrite-range start (exclusive) for claiming *mybranch*.
 
     For the ``commit`` strategy the cover letter is the first commit of the
@@ -1106,9 +1198,8 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
             logger.critical('CRITICAL: could not check out %s:\n%s', branch, out)
             sys.exit(1)
         mybranch = branch
-    if not mybranch:
-        logger.critical('CRITICAL: not currently on a branch')
-        sys.exit(1)
+    # Claiming a detached HEAD rewrites it in place, like any other rewrite
+    where = mybranch or 'HEAD'
 
     usercfg = b4.get_user_config()
     myemail = usercfg.get('email')
@@ -1121,7 +1212,7 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
     covers = find_cover_commits(usebranch=mybranch)
     if len(covers) > 1:
         logger.critical(
-            'CRITICAL: Found %d b4 cover-letter commits on %s,', len(covers), mybranch
+            'CRITICAL: Found %d b4 cover-letter commits on %s,', len(covers), where
         )
         logger.critical('          committed under different identities:')
         for sha, email in covers:
@@ -1129,9 +1220,15 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
         logger.critical('          b4 will not try to untangle this automatically.')
         sys.exit(1)
 
+    backup_ref = None
     if covers:
         # commit / tip-commit strategy: derive the range from the cover commit.
         cover_sha, _cover_email = covers[0]
+        if mybranch is None:
+            # find_cover_commit() would check this, but it can't find a
+            # cover committed under another identity
+            _check_detached_series(cover_sha)
+            backup_ref = get_series_backup_ref(_read_cover_tracking(cover_sha))
         start = _claim_range_start(mybranch, cover_sha)
     else:
         # branch-description keeps no cover commit; the branch is still
@@ -1139,7 +1236,7 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
         if not is_prep_branch(usebranch=mybranch):
             logger.critical(
                 'CRITICAL: %s is not a prep-managed branch; nothing to claim.',
-                mybranch,
+                where,
             )
             sys.exit(1)
         series_start = get_series_start(usebranch=mybranch)
@@ -1156,7 +1253,7 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
         None, ['log', '--format=%h %cE %s', f'{start}..HEAD']
     )
     if not lines:
-        logger.critical('CRITICAL: no commits found between %s and %s', start, mybranch)
+        logger.critical('CRITICAL: no commits found between %s and %s', start, where)
         sys.exit(1)
     committers: Set[str] = set()
     for ln in lines:
@@ -1166,7 +1263,7 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
     if committers == {myemail}:
         logger.info(
             'All commits on %s are already committed by you (%s); nothing to claim.',
-            mybranch,
+            where,
             myemail,
         )
         return
@@ -1176,7 +1273,7 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
         logger.info('  %s', line)
     logger.info('Authorship is preserved; only the committer identity changes.')
     if not no_interactive:
-        prompt = f'Claim these commits on {mybranch} under {myemail}? [y/N] '
+        prompt = f'Claim these commits on {where} under {myemail}? [y/N] '
         try:
             resp = input(prompt)
         except EOFError:
@@ -1192,8 +1289,9 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
         reflog_msg='b4: claim prep branch',
         force=True,
         allow_thirdparty_committer=True,
+        backup_ref=backup_ref,
     )
-    logger.info('Claimed %s. The series is now committed by %s.', mybranch, myemail)
+    logger.info('Claimed %s. The series is now committed by %s.', where, myemail)
 
 
 def is_base_tree_entry(entry: str) -> bool:
@@ -1885,11 +1983,7 @@ def _print_check_results(res: Dict[str, Tuple[bool, str]]) -> None:
 
 
 def get_series_start(usebranch: Optional[str] = None) -> Optional[str]:
-    mybranch: Optional[str] = None
-    if usebranch:
-        mybranch = usebranch
-    else:
-        mybranch = b4.git_get_current_branch()
+    _rev, mybranch = get_prep_target(usebranch)
     strategy = get_cover_strategy(usebranch=mybranch)
     forkpoint = None
     if strategy == 'commit':
@@ -2539,6 +2633,7 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
         start=start,
         end='HEAD',
         reflog_msg='b4: update trailers',
+        backup_ref=get_series_backup_ref(tracking) if tracking else None,
     )
     logger.info('Trailers updated.')
 
@@ -2564,11 +2659,7 @@ def get_addresses_from_cmd(
 def get_series_range(
     start_commit: Optional[str] = None, usebranch: Optional[str] = None
 ) -> Tuple[str, str, str]:
-    mybranch: Optional[str] = None
-    if usebranch:
-        mybranch = usebranch
-    else:
-        mybranch = b4.git_get_current_branch()
+    rev, mybranch = get_prep_target(usebranch)
     if not start_commit:
         start_commit = get_series_start(usebranch=mybranch)
         if start_commit is None:
@@ -2584,13 +2675,8 @@ def get_series_range(
     if strategy == 'tip-commit':
         cover_commit = find_cover_commit(usebranch=mybranch)
         end_commit = b4.git_revparse_obj(f'{cover_commit}~1')
-    elif mybranch:
-        end_commit = b4.git_revparse_obj(mybranch)
     else:
-        logger.critical(
-            'CRITICAL: Not currently on a branch, unable to determine end commit'
-        )
-        sys.exit(1)
+        end_commit = b4.git_revparse_obj(rev)
 
     return base_commit, start_commit, end_commit
 
@@ -3271,11 +3357,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         # Refuse before sending anything rather than at the reroll after it
         check_no_operation_in_progress()
 
+    # None on a detached HEAD, where the series is the history of HEAD
     mybranch = b4.git_get_current_branch()
-    if mybranch is None:
-        logger.critical('CRITICAL: Not currently on a branch, unable to send')
-        sys.exit(1)
-
     is_prep_branch(mustbe=True)
 
     config = b4.get_main_config()
@@ -3298,7 +3381,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             logger.critical('Could not figure out revision from %s', revstr)
             sys.exit(1)
 
-        if not b4.git_revparse_tag(None, tagname):
+        if not b4.git_revparse_tag(None, tagname) and mybranch:
             # Try initial branch-name only based version
             tagname, revision = get_sent_tagname(mybranch, SENT_TAG_PREFIX, revstr)
             if revision is None:
@@ -3776,7 +3859,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     if tag_msg is None:
         logger.critical(
-            'CRITICAL: unable to get tag_msg from %s, not rerolling', mybranch
+            'CRITICAL: unable to get tag_msg from %s, not rerolling', mybranch or 'HEAD'
         )
         return
 
@@ -3809,7 +3892,10 @@ def get_sent_tagname(
 
 
 def reroll(
-    mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PREFIX
+    mybranch: Optional[str],
+    tag_msg: str,
+    msgid: str,
+    tagprefix: str = SENT_TAG_PREFIX,
 ) -> None:
     check_no_operation_in_progress()
     # Remove signature
@@ -4230,10 +4316,7 @@ def show_info(param: str) -> None:
         mybranch = b4.git_get_current_branch()
         getval = param
 
-    if mybranch is None:
-        logger.critical('No branch specified and no current branch found')
-        sys.exit(1)
-
+    # Without a branch, get_info() reports on the series at HEAD
     prep_info = get_info(usebranch=mybranch)
     if getval == '_all':
         for key, val in prep_info.items():
@@ -4246,7 +4329,7 @@ def show_info(param: str) -> None:
         sys.exit(1)
 
 
-def get_info(usebranch: str) -> Dict[str, Union[str, bool, None]]:
+def get_info(usebranch: Optional[str]) -> Dict[str, Union[str, bool, None]]:
     is_prep_branch(mustbe=True, usebranch=usebranch)
     cover, tracking = load_cover(usebranch=usebranch)
     csubject, _ = get_cover_subject_body(cover)
@@ -4311,7 +4394,7 @@ def get_info(usebranch: str) -> Dict[str, Union[str, bool, None]]:
                 ts.get('change-id'), SENT_TAG_PREFIX, rn
             )
             tag_commit = b4.git_revparse_tag(None, tagname)
-            if not tag_commit:
+            if not tag_commit and usebranch:
                 logger.debug(
                     'No tag %s, trying with base branch name %s', tagname, usebranch
                 )
@@ -4348,11 +4431,8 @@ def range_diff_compare(
         tracking['series']['change-id'], SENT_TAG_PREFIX, compareto
     )
     prev_end = b4.git_revparse_tag(None, tagname)
-    if not prev_end:
-        mybranch = b4.git_get_current_branch(None)
-        if mybranch is None:
-            logger.critical('CRITICAL: No current branch found')
-            sys.exit(1)
+    mybranch = b4.git_get_current_branch(None)
+    if not prev_end and mybranch:
         tagname, _ = get_sent_tagname(mybranch, SENT_TAG_PREFIX, compareto)
         prev_end = b4.git_revparse_tag(None, tagname)
     if not prev_end:
@@ -4615,9 +4695,6 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
         msgid = cmdargs.reroll
         msgs = b4.get_pi_thread_by_msgid(msgid, onlymsgids={msgid}, nocache=True)
         mybranch = b4.git_get_current_branch(None)
-        if not mybranch:
-            logger.critical('CRITICAL: No current branch found')
-            sys.exit(1)
         if msgs:
             for msg in msgs:
                 if b4.LoreMessage.get_clean_msgid(msg) == msgid:
diff --git a/src/tests/test_ez_detached.py b/src/tests/test_ez_detached.py
new file mode 100644
index 000000000000..2ed1b5b9e75f
--- /dev/null
+++ b/src/tests/test_ez_detached.py
@@ -0,0 +1,403 @@
+# -*- coding: utf-8 -*-
+# SPDX-License-Identifier: GPL-2.0-or-later
+"""The contributor workflow on a detached HEAD, without any branch."""
+
+import email.message
+import logging
+import mailbox
+import os
+import pathlib
+from typing import Any, Dict, Generator, List, Optional
+from unittest.mock import patch
+
+import pytest
+
+import b4
+import b4.command
+import b4.ez
+
+
+def _run(*args: str) -> None:
+    """Drive a b4 subcommand the way the command line would."""
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(['--no-stdin', '--no-interactive', *args])
+    cmdargs.func(cmdargs)
+
+
+def _git(*args: str, where: Optional[str] = None) -> str:
+    ecode, out = b4.git_run_command(where, list(args), logstderr=True)
+    assert ecode == 0, out
+    assert isinstance(out, str)
+    return out.strip()
+
+
+def _commit_file(name: str, subject: str) -> None:
+    pathlib.Path(name).write_text(f'{subject}\n')
+    _git('add', name)
+    _git('commit', '-q', '-m', subject)
+
+
+def _head() -> str:
+    return b4.git_revparse_obj('HEAD')
+
+
+def _tracking() -> Dict[str, Any]:
+    _cover, tracking = b4.ez.load_cover()
+    return tracking
+
+
+def _backup_ref() -> str:
+    return f'refs/original/b4/{_tracking()["series"]["change-id"]}'
+
+
+def _assert_no_bogus_branch_config() -> None:
+    ecode, out = b4.git_run_command(
+        None, ['config', '--get-regexp', r'^branch\.(HEAD|None)\.']
+    )
+    assert ecode == 1, out
+
+
+def _cover_from(tmp_path: pathlib.Path, text: str) -> None:
+    fpath = tmp_path / 'cover.txt'
+    fpath.write_text(text)
+    _run('prep', '--cover-from-file', str(fpath))
+
+
+COVER = 'Add two files\n\nThis series adds two files.\n\nSigned-off-by: Test <t@example.com>'
+
+
+@pytest.fixture
+def detached(gitdir: str) -> Generator[str, None, None]:
+    """A commit-strategy series on a detached HEAD, with its branch gone."""
+    b4.MAIN_CONFIG['prep-cover-strategy'] = 'commit'
+    _run('prep', '-n', 'pytest')
+    _commit_file('one.txt', 'Add the first file')
+    _commit_file('two.txt', 'Add the second file')
+    _git('checkout', '-q', '--detach')
+    _git('branch', '-q', '-D', 'b4/pytest')
+    assert b4.git_get_current_branch() is None
+    yield gitdir
+
+
+def test_series_is_found_from_head(detached: str) -> None:
+    assert b4.ez.is_prep_branch() is True
+    assert b4.ez.get_cover_strategy() == 'commit'
+    cover = b4.ez.find_cover_commit()
+    assert cover is not None
+    base, start, end = b4.ez.get_series_range()
+    assert start == cover
+    assert base == b4.git_revparse_obj(f'{cover}~1')
+    assert end == _head()
+    info = b4.ez.get_info(usebranch=None)
+    assert info['branch'] is None
+    assert info['series-range'] == f'{start}..{end}'
+
+
+def test_cover_update_rewrites_head_in_place(
+    detached: str, tmp_path: pathlib.Path, capsys: pytest.CaptureFixture[str]
+) -> None:
+    old_head = _head()
+    master = b4.git_revparse_obj('master')
+    old_tree = b4.git_revparse_obj('HEAD^{tree}')
+    _cover_from(tmp_path, COVER)
+
+    assert b4.git_get_current_branch() is None
+    assert _head() != old_head
+    assert b4.git_revparse_obj('HEAD^{tree}') == old_tree
+    assert b4.git_revparse_obj('master') == master
+    assert b4.git_revparse_obj(_backup_ref()) == old_head
+    assert not b4.git_branch_exists(None, 'refs/original/HEAD')
+    _run('prep', '--show-cover')
+    assert capsys.readouterr().out.strip() == COVER
+    _assert_no_bogus_branch_config()
+
+
+def test_edit_cover_in_editor(
+    detached: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    editor = tmp_path / 'editor.sh'
+    editor.write_text(
+        '#!/bin/sh\nprintf "Edited subject\\n\\nEdited body.\\n" > "$1"\n'
+    )
+    editor.chmod(0o755)
+    monkeypatch.setenv('GIT_EDITOR', str(editor))
+    _run('prep', '--edit-cover')
+    cover, _tracking = b4.ez.load_cover()
+    assert cover == 'Edited subject\n\nEdited body.'
+    assert b4.git_get_current_branch() is None
+
+
+def test_edit_cover_refused_when_head_moves(
+    detached: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """Moving a detached HEAD mid-edit is a series switch; the edit lands
+    nowhere and the text is kept for the user."""
+    elsewhere = b4.git_revparse_obj('HEAD~1')
+    editor = tmp_path / 'editor.sh'
+    editor.write_text(
+        f'#!/bin/sh\nprintf "Lost subject\\n\\nbody\\n" > "$1"\n'
+        f'git -C "{detached}" checkout -q --detach {elsewhere}\n'
+    )
+    editor.chmod(0o755)
+    monkeypatch.setenv('GIT_EDITOR', str(editor))
+    with pytest.raises(RuntimeError, match='Detached HEAD moved') as ex:
+        b4.ez.edit_cover()
+    saved = pathlib.Path(str(ex.value).split(' saved at ')[-1])
+    try:
+        assert saved.read_text() == 'Lost subject\n\nbody\n'
+    finally:
+        saved.unlink()
+    assert _head() == elsewhere
+
+
+def test_deps_prefixes_and_revision(
+    detached: str, tmp_path: pathlib.Path, capsys: pytest.CaptureFixture[str]
+) -> None:
+    deps = tmp_path / 'deps.txt'
+    deps.write_text('change-id: 20240101-other-series-0123456789ab:v2\n')
+    _run('prep', '--deps-from-file', str(deps))
+    _run('prep', '--set-prefixes', 'RFC')
+    _run('prep', '--force-revision', '3')
+    capsys.readouterr()
+    _run('prep', '--show-deps')
+    assert capsys.readouterr().out.strip() == (
+        'change-id: 20240101-other-series-0123456789ab:v2'
+    )
+    series = _tracking()['series']
+    assert series['prefixes'] == ['RFC']
+    assert series['revision'] == 3
+    assert b4.git_get_current_branch() is None
+    _assert_no_bogus_branch_config()
+
+
+def test_format_patch_and_check(
+    detached: str, tmp_path: pathlib.Path, caplog: pytest.LogCaptureFixture
+) -> None:
+    _cover_from(tmp_path, COVER)
+    outdir = tmp_path / 'out'
+    _run('prep', '--format-patch', str(outdir))
+    names = sorted(os.listdir(outdir))
+    assert len(names) == 3
+    assert names[0].startswith('0000-add-two-files')
+    assert names[1].startswith('0001-add-the-first-file')
+
+    b4.MAIN_CONFIG['prep-perpatch-check-cmd'] = 'true'
+    with caplog.at_level(logging.INFO):
+        _run('prep', '--check')
+    assert 'Success: 2, Warning: 0, Error: 0' in caplog.text
+
+
+def _sent_patches() -> List[email.message.EmailMessage]:
+    _tos, _ccs, _tag, patches = b4.ez.get_prep_branch_as_patches(movefrom=False)
+    return [msg for _commit, msg in patches]
+
+
+def test_trailers_update(detached: str, tmp_path: pathlib.Path) -> None:
+    """Follow-up trailers land on the right commit, and HEAD stays put
+    relative to the series: still detached, cover still first."""
+    _cover_from(tmp_path, COVER)
+    msgs = _sent_patches()
+    reply = email.message.EmailMessage()
+    reply['From'] = 'Rev Iewer <rev@example.com>'
+    reply['Subject'] = 'Re: ' + str(msgs[2]['Subject'])
+    reply['Message-Id'] = '<review-1@example.com>'
+    reply['In-Reply-To'] = msgs[2]['Message-Id']
+    reply['References'] = msgs[2]['Message-Id']
+    reply.set_content('> some quote\n\nReviewed-by: Rev Iewer <rev@example.com>\n')
+    mbx_path = str(tmp_path / 'thread.mbox')
+    mbx = mailbox.mbox(mbx_path)
+    for msg in msgs + [reply]:
+        mbx.add(msg)
+    mbx.close()
+
+    cover = b4.ez.find_cover_commit()
+    _run('--offline-mode', 'trailers', '-u', '-m', mbx_path)
+
+    assert b4.git_get_current_branch() is None
+    assert b4.ez.find_cover_commit() == cover
+    body = _git('log', '-1', '--format=%B', 'HEAD')
+    assert 'Reviewed-by: Rev Iewer <rev@example.com>' in body
+    first = _git('log', '-1', '--format=%B', 'HEAD~1')
+    assert 'Reviewed-by' not in first
+    assert b4.git_revparse_obj(_backup_ref())
+
+
+class _Transport:
+    def __init__(self) -> None:
+        self.sent: List[email.message.EmailMessage] = []
+
+    def send_mail(self, _smtp: Any, msgs: Any, **kwargs: Any) -> Optional[int]:
+        if kwargs.get('dryrun'):
+            return None
+        self.sent.extend(msgs)
+        return len(msgs)
+
+
+@pytest.fixture
+def transport(monkeypatch: pytest.MonkeyPatch) -> _Transport:
+    tr = _Transport()
+    monkeypatch.setattr(b4, 'send_mail', tr.send_mail)
+    monkeypatch.setattr(
+        b4, 'get_smtp', lambda dryrun=False: (None, 'test-override@example.com')
+    )
+    monkeypatch.setattr('builtins.input', lambda _prompt='': '')
+    b4.MAIN_CONFIG['prep-pre-flight-checks'] = 'disable-all'
+    return tr
+
+
+def test_send_tags_and_rerolls(
+    detached: str, tmp_path: pathlib.Path, transport: _Transport
+) -> None:
+    _cover_from(tmp_path, COVER)
+    master = b4.git_revparse_obj('master')
+    series_tree = b4.git_revparse_obj('HEAD^{tree}')
+    change_id = _tracking()['series']['change-id']
+
+    _run('send', '--no-sign', '--to', 'list@example.com')
+
+    assert len(transport.sent) == 3
+    assert str(transport.sent[0]['Subject']).startswith('[PATCH 0/2] Add two files')
+    tagname = f'sent/{change_id}-v1'
+    tagged = b4.git_revparse_tag(None, tagname)
+    assert tagged is not None
+    # The tag holds the two patches and not the cover letter
+    assert b4.git_revparse_obj(f'{tagname}^{{tree}}') == series_tree
+    assert (
+        _git('rev-list', '--count', f'{b4.ez.get_series_range()[0]}..{tagname}') == '2'
+    )
+
+    series = _tracking()['series']
+    assert series['revision'] == 2
+    assert series['history']['v1'] == [
+        b4.LoreMessage.get_clean_msgid(transport.sent[0])
+    ]
+    assert b4.git_get_current_branch() is None
+    assert b4.git_revparse_obj('HEAD^{tree}') == series_tree
+    assert b4.git_revparse_obj('master') == master
+    assert 'Changes in v2' in b4.ez.load_cover()[0]
+    _assert_no_bogus_branch_config()
+
+    # The sent revision is there to resend and compare against
+    _run('send', '--no-sign', '--resend', 'v1', '--to', 'list@example.com')
+    assert len(transport.sent) == 6
+    assert '[PATCH RESEND 0/2]' in str(transport.sent[3]['Subject'])
+    assert b4.ez.range_diff_compare(1, execvp=False) is not None
+    assert _tracking()['series']['revision'] == 2
+
+
+@pytest.mark.parametrize(
+    'sendargs',
+    [
+        ['--dry-run'],
+        ['--preview-to', 'me@example.com'],
+        ['--reflect'],
+    ],
+)
+def test_send_without_reroll(
+    detached: str,
+    tmp_path: pathlib.Path,
+    transport: _Transport,
+    sendargs: List[str],
+) -> None:
+    _cover_from(tmp_path, COVER)
+    head = _head()
+    _run('send', '--no-sign', '--to', 'list@example.com', *sendargs)
+    assert _head() == head
+    assert _tracking()['series']['revision'] == 1
+    assert not b4.git_get_command_lines(None, ['tag', '--list', 'sent/*'])
+
+
+def test_send_output_dir(
+    detached: str, tmp_path: pathlib.Path, transport: _Transport
+) -> None:
+    _cover_from(tmp_path, COVER)
+    head = _head()
+    _run('send', '--no-sign', '-o', str(tmp_path / 'out'), '--to', 'list@example.com')
+    assert _head() == head
+    assert _tracking()['series']['revision'] == 1
+
+
+def test_claim_after_identity_change(
+    detached: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    newcfg = {'name': 'Changed User', 'email': 'changed@example.com'}
+    with patch('b4.get_user_config', return_value=newcfg):
+        assert b4.ez.is_prep_branch() is False
+        with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+            b4.ez.is_prep_branch(mustbe=True)
+        assert "This HEAD's b4 cover-letter commit" in caplog.text
+        assert 'b4 prep --claim' in caplog.text
+        old_head = _head()
+        _run('prep', '--claim')
+        assert b4.ez.is_prep_branch() is True
+        assert b4.git_revparse_obj(_backup_ref()) == old_head
+    assert b4.git_get_current_branch() is None
+    committers = set(_git('log', '--format=%ce', 'HEAD~3..HEAD').split())
+    assert committers == {'changed@example.com'}
+
+
+def test_new_branch_from_detached_series(
+    detached: str, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """prep -n still creates a branch, and a series at HEAD becomes its
+    dependency, as it does from a prep branch."""
+    change_id = _tracking()['series']['change-id']
+    monkeypatch.setattr('builtins.input', lambda _prompt='': '')
+    _run('prep', '-n', 'followup')
+    assert b4.git_get_current_branch() == 'b4/followup'
+    assert _tracking()['series']['prerequisites'] == [f'change-id: {change_id}:v1']
+
+
+def test_other_strategies_need_a_branch(
+    detached: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    b4.MAIN_CONFIG['prep-cover-strategy'] = 'branch-description'
+    head = _head()
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        _run('prep', '--show-cover')
+    assert 'b4 supports only the "commit" cover' in caplog.text
+    assert 'b4.prep-cover-strategy is branch-description' in caplog.text
+    assert _head() == head
+    _assert_no_bogus_branch_config()
+
+
+def test_tip_commit_layout_is_refused(
+    gitdir: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    """A tip-commit cover can look like a commit-strategy cover with an
+    empty series; its tracking data tells them apart."""
+    b4.MAIN_CONFIG['prep-cover-strategy'] = 'tip-commit'
+    _run('prep', '-n', 'pytest')
+    _git('checkout', '-q', '--detach')
+    b4.MAIN_CONFIG['prep-cover-strategy'] = 'commit'
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        _run('prep', '--show-cover')
+    assert 'tracks base branch' in caplog.text
+
+
+def test_merge_in_series_is_refused(
+    detached: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    head = _head()
+    _git('checkout', '-q', '-b', 'side', 'master')
+    _commit_file('side.txt', 'Side change')
+    _git('checkout', '-q', '--detach', head)
+    _git('merge', '-q', '--no-edit', 'side')
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        _run('prep', '--show-cover')
+    assert 'cannot tell which commits belong to it' in caplog.text
+
+
+def test_linked_worktree_moves_only_its_head(
+    detached: str, tmp_path: pathlib.Path
+) -> None:
+    head = _head()
+    linked = str(tmp_path / 'linked')
+    _git('worktree', 'add', '-q', '--detach', linked, head)
+    _git('checkout', '-q', 'master')
+    os.chdir(linked)
+    _cover_from(tmp_path, COVER)
+    assert b4.git_get_current_branch(linked) is None
+    assert b4.git_revparse_obj('HEAD', gitdir=linked) != head
+    assert b4.git_get_current_branch(detached) == 'master'
+    assert b4.git_revparse_obj(_backup_ref()) == head

-- 
2.56.0



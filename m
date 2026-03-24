Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322473FF8A4
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366090; cv=none; b=u4cTmcNLD6ow7H2u4kuNG71cmE54W/zWhu/nuF+bAaiAeMcz75vrXQrL7ld0ozdumrGifwlZ7UqIulRNo2HZmrH9KiU7iC6DG1BTrZWVtgsosdBOp4rGqeBWJCI5NYyV+uBah/hutB79yX+qipR7hpAjZQM0ybSdZjBh7geRAAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366090; c=relaxed/simple;
	bh=Efg4ssod2gwXqYvY5Ip9gcVGsbJjTy9gGw+/0ROdUok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvEQ4phoJp+MrxoumCyrZ/pCalBkI6aDk1q8SfDujBD5if+J0cS7PWr20PRSnzgdr/bXICmySuqh/FSCKROMorqv7FFchjfs2kp35oI/Jmw7Js1qf3/v/djY0oAuYlVfkXuHIt+EwByuSKd+bday7NmnC+hoV4/D8SOK1Gz2qjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV82xRfu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV82xRfu"
Received: by smtp.kernel.org (Postfix)
	id DEA4EC2BC87; Tue, 24 Mar 2026 15:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEFFC19424;
	Tue, 24 Mar 2026 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774366089;
	bh=Efg4ssod2gwXqYvY5Ip9gcVGsbJjTy9gGw+/0ROdUok=;
	h=From:To:Cc:Subject:Date:From;
	b=TV82xRfuRkXuWFz2UYOMbxdo/eZoNuhmicDYjqQ4EAXCRseRHelMLpCQz+mGdDJQZ
	 pJ5pwmGksPO2Vfd65c6VMrROK4FsRnBneuttomk23N8iX1cQawRlimqGFuxzxGYxug
	 k0/EOwgGQQf0IOZ4q4CtI0WnGRCHC6ToaBeI1HKwR1W1738CteIbEpShAU4mSgu3eE
	 oZB/Xv0k6xUkIsfQzj0HF9T1RUDIudXTpFBYkqOzxKV6aDeLzzo/qaRbipXZUnZRai
	 GJPstwsQV7VdWaV1BlOrXKmtAfuWCQhJMGkIVzD7/CqLzlVZQdOmTWVFtbR+loA2lU
	 PoPq2/yZ1UxLg==
From: Chuck Lever <cel@kernel.org>
To: tools@kernel.org
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH] ez: add "file" cover letter strategy
Date: Tue, 24 Mar 2026 11:28:05 -0400
Message-ID: <20260324152805.88424-1-cel@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

The branch-description cover strategy stores the cover letter,
changelog, and recipient list as a single blob in .git/config
under the branch description key.  This is unwieldy: the blob
cannot be edited by hand, tools such as "stg branch --list"
dump the entire cover letter for every prepped branch, and
auto-to-cc writes recipient trailers directly into the cover
letter prose where they risk corruption on regeneration.

Add a new "file" strategy that stores these three concerns
in separate plain text files under .git/b4-prep/<change-id>/:

  cover       -- subject, body, and non-address trailers
  changelog   -- version history below the --- separator
  recipients  -- To: and Cc: lines from --auto-to-cc

Tracking metadata (revision, change-id, base-branch) remains
in .git/config as with branch-description.  The load path
assembles the three files into the combined cover text that
all downstream code expects, so no other functions require
modification.  The store path splits the combined text back
into the three files using LoreMessage.get_body_parts() to
separate address trailers from cover body content.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Assisted-by: claude-opus-4-6
---
 docs/contributor/prep.rst |  29 +++++++++
 src/b4/ez.py              | 127 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 153 insertions(+), 3 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 68aec4436219..7da6e43d9f22 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -96,6 +96,35 @@ cover letter. You can tell ``b4`` which strategy to use using the
   * you have to rely on the base branch for keeping track of where your
     series starts
 
+``file`` strategy
+  This keeps the cover letter, changelog, and recipients in separate
+  plain text files under ``.git/b4-prep/<change-id>/``. Tracking
+  metadata (revision, change-id, base-branch) remains in
+  ``.git/config`` as with ``branch-description``.
+
+  The directory contains three files:
+
+  * ``cover`` -- the cover letter subject, body, and non-address trailers
+  * ``changelog`` -- version history entries (below the ``---`` separator)
+  * ``recipients`` -- ``To:`` and ``Cc:`` lines populated by ``--auto-to-cc``
+
+  Upsides:
+
+  * each file is plain text, directly editable with any text editor
+  * editing the cover letter doesn't rewrite commit history
+  * ``--auto-to-cc`` writes to ``recipients`` without touching the cover
+    letter body, so regenerating addresses can't corrupt prose
+  * compatible with tools like Stacked Git that manage commits
+    independently
+  * ``stg branch --list`` is not cluttered with cover letter text
+
+  Downsides:
+
+  * the cover letter only exists local to your tree -- you won't be
+    able to commit it to the repository and push it remotely
+  * you have to rely on the base branch for keeping track of where your
+    series starts
+
 ``tip-commit`` strategy
   This is similar to the default ``commit`` strategy, but instead of
   keeping the cover letter and all tracking information in an empty
diff --git a/src/b4/ez.py b/src/b4/ez.py
index b7afab52a14d..613daee969d5 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -25,6 +25,7 @@ import gzip
 import io
 import tarfile
 import hashlib
+import shutil
 import urllib.parse
 
 from typing import Any, Optional, Tuple, List, Union, Dict, Set
@@ -683,6 +684,113 @@ def make_magic_json(data: Dict[str, Any]) -> str:
     return mj + json.dumps(data, indent=2)
 
 
+def _get_prep_dir(change_id: str) -> pathlib.Path:
+    if not change_id or '/' in change_id or '\\' in change_id or '..' in change_id:
+        logger.critical('CRITICAL: invalid change-id: %s', change_id)
+        sys.exit(1)
+    topdir = b4.git_get_toplevel()
+    if topdir is None:
+        logger.critical('CRITICAL: unable to determine git toplevel')
+        sys.exit(1)
+    gitdir = pathlib.Path(topdir) / '.git'
+    if not gitdir.is_dir():
+        # Handle gitdir files (worktrees, submodules)
+        ecode, out = b4.git_run_command(None, ['rev-parse', '--git-dir'])
+        if ecode > 0:
+            logger.critical('CRITICAL: unable to determine git directory')
+            sys.exit(1)
+        gitdir = pathlib.Path(out.strip())
+    return gitdir / 'b4-prep' / change_id
+
+
+def _load_file_cover(usebranch: Optional[str] = None) -> Tuple[str, Dict[str, Any]]:
+    """Load cover data from the file strategy's separate files."""
+    mybranch = usebranch or b4.git_get_current_branch()
+    bcfg = b4.get_config_from_git(rf'branch\.{mybranch}\..*')
+    tracking = json.loads(bcfg.get('b4-tracking', '{}'))
+    if not tracking:
+        return '', tracking
+
+    change_id = tracking.get('series', {}).get('change-id', '')
+    if not change_id:
+        return '', tracking
+
+    prepdir = _get_prep_dir(change_id)
+    cover = ''
+    changelog = ''
+    recipients = ''
+
+    coverfile = prepdir / 'cover'
+    if coverfile.exists():
+        cover = coverfile.read_text(encoding='utf-8').strip()
+
+    changelogfile = prepdir / 'changelog'
+    if changelogfile.exists():
+        changelog = changelogfile.read_text(encoding='utf-8').strip()
+
+    recipientsfile = prepdir / 'recipients'
+    if recipientsfile.exists():
+        recipients = recipientsfile.read_text(encoding='utf-8').strip()
+
+    # Assemble into the combined cover text that downstream expects:
+    # subject\n\nbody\n\nrecipient-trailers\n\n---\nchangelog
+    parts = []
+    if cover:
+        parts.append(cover)
+    if recipients:
+        parts.append(recipients)
+    assembled = '\n\n'.join(parts)
+    if changelog:
+        assembled += '\n\n---\n' + changelog
+
+    return assembled, tracking
+
+
+def _store_file_cover(content: str, tracking: Dict[str, Any], new: bool = False) -> None:
+    """Store cover data into the file strategy's separate files."""
+    change_id = tracking.get('series', {}).get('change-id', '')
+    if not change_id:
+        logger.critical('CRITICAL: no change-id in tracking data')
+        sys.exit(1)
+
+    prepdir = _get_prep_dir(change_id)
+    prepdir.mkdir(parents=True, exist_ok=True)
+
+    # Split the combined cover text into components.
+    # The --- separator divides cover+recipients from changelog.
+    changelog = ''
+    coverportion = content
+    # Look for the changelog separator (--- on its own line)
+    parts = re.split(r'^---\s*$', content, maxsplit=1, flags=re.M)
+    if len(parts) == 2:
+        coverportion = parts[0]
+        changelog = parts[1].strip()
+
+    # Separate recipient trailers from the cover body.
+    # Trailers are To:/Cc: lines at the end of the cover portion.
+    htrs, cmsg, mtrs, basement, sig = b4.LoreMessage.get_body_parts(coverportion)
+    recipients_list = []
+    body_trailers = []
+    for mtr in mtrs:
+        if mtr.lname in ('to', 'cc'):
+            recipients_list.append(mtr.as_string())
+        else:
+            body_trailers.append(mtr)
+
+    # Rebuild the cover without To/Cc trailers
+    cover_clean = b4.LoreMessage.rebuild_message(htrs, cmsg, body_trailers, basement, sig)
+
+    (prepdir / 'cover').write_text(cover_clean.strip() + '\n', encoding='utf-8')
+    (prepdir / 'changelog').write_text(changelog + '\n' if changelog else '', encoding='utf-8')
+    (prepdir / 'recipients').write_text('\n'.join(recipients_list) + '\n' if recipients_list else '', encoding='utf-8')
+
+    # Tracking still goes in git config, same as branch-description
+    mybranch = b4.git_get_current_branch(None)
+    trackstr = json.dumps(tracking)
+    b4.git_set_config(None, f'branch.{mybranch}.b4-tracking', trackstr)
+    logger.info('Updated cover letter files in %s', prepdir)
+
+
 def load_cover(strip_comments: bool = False, usebranch: Optional[str] = None) -> Tuple[str, Dict[str, Any]]:
     strategy = get_cover_strategy(usebranch)
     if strategy in {'commit', 'tip-commit'}:
@@ -709,6 +817,9 @@ def load_cover(strip_comments: bool = False, usebranch: Optional[str] = None) ->
         cover = bcfg.get('description', '')
         tracking = json.loads(bcfg.get('b4-tracking', '{}'))
 
+    elif strategy == 'file':
+        cover, tracking = _load_file_cover(usebranch=usebranch)
+
     else:
         logger.critical('Not yet supported for %s cover strategy', strategy)
         sys.exit(0)
@@ -755,11 +866,15 @@ def store_cover(content: str, tracking: Dict[str, Any], new: bool = False) -> No
         b4.git_set_config(None, f'branch.{mybranch}.b4-tracking', trackstr)
         logger.info('Updated branch description and tracking info.')
 
+    if strategy == 'file':
+        _store_file_cover(content, tracking, new=new)
+
 
 # Valid cover letter strategies:
 # 'commit': in an empty commit at the start of the series        : implemented
 # 'branch-description': in the branch description                : implemented
 # 'tip-commit': in an empty commit at the tip of the branch      : implemented
+# 'file': in separate files under .git/b4-prep/<change-id>/      : implemented
 # 'tag': in an annotated tag at the tip of the branch            : TODO
 # 'tip-merge': in an empty merge commit at the tip of the branch : TODO
 #              (once/if git upstream properly supports it)
@@ -782,7 +897,7 @@ def get_cover_strategy(usebranch: Optional[str] = None) -> str:
         config = b4.get_main_config()
         strategy = str(config.get('prep-cover-strategy', 'commit'))
 
-    if strategy in {'commit', 'branch-description', 'tip-commit'}:
+    if strategy in {'commit', 'branch-description', 'tip-commit', 'file'}:
         return strategy
 
     logger.critical('CRITICAL: unknown prep-cover-strategy: %s', strategy)
@@ -811,7 +926,7 @@ def is_prep_branch(mustbe: bool = False, usebranch: Optional[str] = None) -> boo
                 sys.exit(1)
             return False
         return True
-    if strategy == 'branch-description':
+    if strategy in {'branch-description', 'file'}:
         # See if we have b4-tracking set for this branch
         bcfg = b4.get_config_from_git(rf'branch\.{mybranch}\..*')
         if bcfg.get('b4-tracking'):
@@ -1085,7 +1200,7 @@ def get_series_start(usebranch: Optional[str] = None) -> Optional[str]:
     if strategy == 'commit':
         # Start at the cover letter commit
         return find_cover_commit(usebranch=mybranch)
-    if strategy == 'branch-description':
+    if strategy in {'branch-description', 'file'}:
         bcfg = b4.get_config_from_git(rf'branch\.{mybranch}\..*')
         tracking = bcfg.get('b4-tracking')
         if not tracking:
@@ -2677,6 +2792,12 @@ def _cleanup_branch(branch: str) -> None:
     logger.info('Cleaning up git refs')
     for gitargs in deletes:
         b4.git_run_command(None, gitargs)
+    # Clean up file strategy directory if it exists
+    if change_id:
+        prepdir = _get_prep_dir(change_id)
+        if prepdir.exists():
+            shutil.rmtree(prepdir)
+            logger.info('Removed %s', prepdir)
     logger.info('---')
     logger.info('Wrote: %s', tarpath)
 
-- 
2.53.0


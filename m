Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A3629CB57
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614408; cv=none; b=FQbBLnkQzoHtxrEURtYGtWqIlKVdjOolWByjnvDIt1+F0E0XJS62CzOD/kMZKVcLtk8Jf+yQ0I0A600a5533T6y1ySmaocye/EMOWPgLY2EfIUr0GNl+xQlqIqMLn8so7gBPzv5GIgNFiIFhBmi4U7Erths0nW/BgXZTJkyZBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614408; c=relaxed/simple;
	bh=wtFEU8mqHwztIlR/NSvaindkz332Wh7kLQe5Z3JPjkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yn/3AEMP4E+shrbn7PGzmjlAZBOmsDbIpRDyku4loek9VJ8lb/I2wu7jNH+cpP4pMkNP4vO/zOWrkDJ+y/Ioa3QkzQxYCP/55E4AsoFuib9vJv5yKQ0PEP4qJNdZNCB2gjWPdLa3aUUUTmnd/G7i9NxiyU7JXdK9kOPnkG5vQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsxQJr0P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsxQJr0P"
Received: by smtp.kernel.org (Postfix)
	id E7A15C2BCB3; Sun, 19 Apr 2026 16:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8DDC2BCB7;
	Sun, 19 Apr 2026 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614407;
	bh=wtFEU8mqHwztIlR/NSvaindkz332Wh7kLQe5Z3JPjkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JsxQJr0PX8yeTltT6R9riJxftXVY1eSOIwN6qblSFa5XlJgVR+Lg6hDId8tR45nOl
	 CYq/8lMw3HG1lsEyUioLBoUtrEDQ1rOu2HU+ABSZx3IvXJX877w0d0nFe38fFjzx+H
	 0q4vutttqeolhI3N5FMJt9/iUvj4YzscHrz8x3smuFalVaikWVlXQY82qOT9FpOqYu
	 unOrvKLHTqmdU6ptRGDsIeJmZk+djr+RUM512EiQKCdQiltJs1WPZ+u6S7Mq0hVD1B
	 fMKAGs+Q1xuhGG8XL359s8LjzvFLCVtL61vMLbqHFUEmfYWnuMTnCUu536jpKVvnsy
	 mASXqT82uKbvA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 11:59:58 -0400
Subject: [PATCH b4 v2 03/11] Import dependencies unconditionally
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-ruff-check-v2-3-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5447; i=tamird@kernel.org;
 h=from:subject:message-id; bh=wtFEU8mqHwztIlR/NSvaindkz332Wh7kLQe5Z3JPjkI=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/jCbJT+1/sgRcET5wz2Taay1Pi1MgotnrFO3m7Myk
 E9+vYVhx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKn+b8bIcL9qDscyZ/nlb7Y3zlrqt28X20qJN5u/Mza8nL/iXF2d6FGG/04r2b0
 ZAk8e5Lo67caFyO1rZku1LP+3VZRVyGTBtT0sZTwA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

These are always available since commit f4185d6b.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 src/b4/__init__.py    | 30 ++----------------------------
 src/b4/ez.py          | 30 ++++--------------------------
 src/tests/conftest.py |  1 -
 3 files changed, 6 insertions(+), 55 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 1e4c91e..df5c58c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -49,10 +49,12 @@ from typing import (
     overload,
 )
 
+import dkim  # type: ignore[import-untyped]
 import liblore.utils
 import requests
 
 import liblore
+import patatt
 
 ConfigDictT = Dict[str, Union[str, List[str], None]]
 
@@ -65,20 +67,6 @@ emlpolicy = email.policy.EmailPolicy(utf8=True, cte_type='8bit', max_line_length
 # adapted from email._parseaddr
 qspecials = re.compile(r'[()<>@,:;.\"\[\]]')
 
-try:
-    import dkim  # type: ignore[import-untyped]
-
-    can_dkim = True
-except ModuleNotFoundError:
-    can_dkim = False
-
-try:
-    import patatt
-
-    can_patatt = True
-except ModuleNotFoundError:
-    can_patatt = False
-
 # global setting allowing us to turn off networking
 can_network = True
 
@@ -1012,13 +1000,6 @@ class LoreSeries:
             for trailer in attref:
                 logger.info('  %s', trailer)
 
-        if not (can_dkim and can_patatt):
-            logger.info('  ---')
-            if not can_dkim:
-                logger.info('  NOTE: install dkimpy for DKIM signature verification')
-            if not can_patatt:
-                logger.info('  NOTE: install patatt for end-to-end signature verification')
-
         return msgs
 
 
@@ -1694,9 +1675,6 @@ class LoreMessage:
         if not can_network:
             logger.debug('Message has DKIM signatures, but can_network is off')
             return
-        if not can_dkim:
-            logger.debug('Message has DKIM signatures, but can_dkim is off')
-            return
 
         # Identify all DKIM-Signature headers and try them in reverse order
         # until we come to a passing one
@@ -1783,10 +1761,6 @@ class LoreMessage:
                 self.body = '\n'.join(ibh) + '\n\n' + self.body
 
     def _load_patatt_attestors(self) -> None:
-        if not can_patatt:
-            logger.debug('Message has %s headers, but can_patatt is off', DEVSIG_HDR)
-            return
-
         # This should be always the case, but assert it anyway
         assert isinstance(self._attestors, list)
 
diff --git a/src/b4/ez.py b/src/b4/ez.py
index e69a106..562f2a9 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -13,6 +13,7 @@ import email.policy
 import email.utils
 import gzip
 import hashlib
+import importlib.util
 import io
 import json
 import os
@@ -29,21 +30,10 @@ from email.message import EmailMessage
 from string import Template
 from typing import Any, Dict, List, Optional, Set, Tuple, Union
 
-import b4
-
-try:
-    import patatt
-    can_patatt = True
-except ModuleNotFoundError:
-    can_patatt = False
+import git_filter_repo as fr  # type: ignore[import-untyped]
 
-try:
-    import git_filter_repo as fr  # type: ignore[import-untyped]
-    can_gfr = True
-except ModuleNotFoundError:
-    can_gfr = False
-
-import importlib.util
+import b4
+import patatt
 
 can_codespell = importlib.util.find_spec('codespell_lib') is not None
 
@@ -150,9 +140,6 @@ def run_frf(frf: fr.RepoFilter) -> None:
     but is completely unnecessary for b4's purposes. Delete this file after
     each invocation, so it doesn't interfere with subsequent runs.
     """
-    if not can_gfr:
-        logger.critical('CRITICAL: git-filter-repo is not available')
-        sys.exit(1)
     run_rewrite_hook('pre')
     logger.debug('Running git-filter-repo...')
     frf.run()
@@ -2492,13 +2479,6 @@ def reroll(mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PR
     store_cover(new_cover, tracking)
 
 
-def check_can_gfr() -> None:
-    if not can_gfr:
-        logger.critical('ERROR: b4 submit requires git-filter-repo. You should be able')
-        logger.critical('       to install it from your distro packages, or from pip.')
-        sys.exit(1)
-
-
 def show_revision() -> None:
     is_prep_branch(mustbe=True)
     _cover, tracking = load_cover()
@@ -3054,7 +3034,6 @@ def set_presubject(presubject: str) -> None:
 
 
 def cmd_prep(cmdargs: argparse.Namespace) -> None:
-    check_can_gfr()
     status = b4.git_get_repo_status()
     if len(status):
         logger.critical('CRITICAL: Repository contains uncommitted changes.')
@@ -3156,7 +3135,6 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
 
 
 def cmd_trailers(cmdargs: argparse.Namespace) -> None:
-    check_can_gfr()
     status = b4.git_get_repo_status()
     if len(status):
         logger.critical('CRITICAL: Repository contains uncommitted changes.')
diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index d8cd853..3ff3891 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -13,7 +13,6 @@ def settestdefaults(tmp_path: pathlib.Path) -> None:
     topdir = b4.git_get_toplevel()
     if topdir and topdir != os.getcwd():
         os.chdir(topdir)
-    b4.can_patatt = False
     b4.can_network = False
     b4.MAIN_CONFIG = dict(b4.DEFAULT_CONFIG)
     b4.USER_CONFIG = {

-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F235B645
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580524; cv=none; b=DWi1EeBRKwa9dFQlUZthpRokXq0awdaMtvdj9zeRziWE5sASh6rOovdfbQrgrfgGVyfBUEPMh/T+oPEc6ENhBtwpYynxJsD8DSNEzxXi/TVx4o1ro5/3KJoecIvG3vwMQ/lKeikp4tO8vurkQFajI1s8YL81DPCFLPf5rpmBA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580524; c=relaxed/simple;
	bh=I5L7SKI9fe62XgFrheHy+HvBAea2F7Y8N86wYGBVKMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+yX7gUSXM1ccx2OMRUA8gEsoXnKv3CKkumSnotA9hfQ1T307WKCCTare9//iX4APHaYchRwK/V30gY/o9tHtAlLFP5MvC05R+2LxoBLrW8a8N1+2tb0ufgUIUT/n4yRJdQcO0F5NJUX6l2X93hQ9UAPOqHfU/7FG8GsD8k1x0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkjIbVDw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkjIbVDw"
Received: by smtp.kernel.org (Postfix)
	id 0764BC2BC9E; Tue,  7 Apr 2026 16:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDD4C19424;
	Tue,  7 Apr 2026 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580523;
	bh=I5L7SKI9fe62XgFrheHy+HvBAea2F7Y8N86wYGBVKMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tkjIbVDwwItrcE037ZofbZcaTMOFcEcRukmgJbA7ybm5+vqSDbzPXPjrnDA7VMSMw
	 t/bpagZkx9Uk+QXUQC08x7UrFJvDBdJ/1RHZCfeGVaMYQCF9Z3aCT1x1Slwlmo+jKP
	 bVaIzTFmN3wS/c7mHGetH/dKh6rND6hp/d9Oh0s2RZrR4kIZ1MGX2uoHSSgTqsuUfA
	 Dpgu7tJe1o9N2noqJ6HGddoc5MU1LRO3ZDWatJ7RHej3V9n4TLnyAiod2Uvc3Iipmc
	 xf4PmshxZbbJVSb3VGzyvjsFamMKD4aSmejLLNCJm3O3BdU+6a44ESDY/gIdkzQlPE
	 31s5isodiIFdg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:33 -0400
Subject: [PATCH b4 04/12] Import dependencies unconditionally
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-4-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5434; i=tamird@kernel.org;
 h=from:subject:message-id; bh=I5L7SKI9fe62XgFrheHy+HvBAea2F7Y8N86wYGBVKMI=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTdPPvLtRZX2Hrdqf0/bmsTsV9tqTF5tnZe2OUus7K
 ObJ+cynYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFSLbWP4K13Xa6YVxT9Z+UyCv9OmQje1nR+8jrxmOzC3pv/t36TLtgx/xc7wCU6
 W/f5QUn2Z8+f7ce0cxnqOPz8c/LV9u23MJp+NHAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

These are always available since commit f4185d6b.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 src/b4/__init__.py    | 31 +++----------------------------
 src/b4/ez.py          | 30 ++++--------------------------
 src/tests/conftest.py |  1 -
 3 files changed, 7 insertions(+), 55 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7cc3a93..a14d89c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -48,8 +48,11 @@ from typing import (
     overload,
 )
 
+import dkim  # type: ignore[import-untyped]
 import requests
 
+import patatt
+
 ConfigDictT = Dict[str, Union[str, List[str], None]]
 
 from email import charset
@@ -63,20 +66,6 @@ emlpolicy = email.policy.EmailPolicy(utf8=True, cte_type='8bit', max_line_length
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
 
@@ -1007,13 +996,6 @@ class LoreSeries:
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
 
 
@@ -1689,9 +1671,6 @@ class LoreMessage:
         if not can_network:
             logger.debug('Message has DKIM signatures, but can_network is off')
             return
-        if not can_dkim:
-            logger.debug('Message has DKIM signatures, but can_dkim is off')
-            return
 
         # Identify all DKIM-Signature headers and try them in reverse order
         # until we come to a passing one
@@ -1778,10 +1757,6 @@ class LoreMessage:
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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562962BDC0E
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614412; cv=none; b=klRWfYFWQQhji+dJnjdLD3582v8s+tX436YjBtpn312fGkOJNRpCXPd22QJHJfrfNXaxQC60YpgrJRimzkTXMv7Zl9F0/S80WvqetWDabyfWCR8GU7P7Dz9MW+uVmmkLlg5gjeboSi+FtA5ZwLCPnMTJibJ5EO15D9k+8h81fnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614412; c=relaxed/simple;
	bh=T4lM4jamnHcOL/yJjjvPMBViJk5vAAfws1cftryb0Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uViYTS3jmbOghWImymzrwRyiZvjTnXHUwE+LNrEQj5ce3/dfG1VO95MlKP7NIf17n8u+VM//NhuvuPekyZhaR0aaS03HQ67C3nItptSrv6eFCB3H++x4GkAyoshxhhW/fWy8hOr9Xwf3OgEfrLpDYy137N3oaMgy2FKA4aUdzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMhTB8Ha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMhTB8Ha"
Received: by smtp.kernel.org (Postfix)
	id 4D9EAC2BCB3; Sun, 19 Apr 2026 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CC0C2BCAF;
	Sun, 19 Apr 2026 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614412;
	bh=T4lM4jamnHcOL/yJjjvPMBViJk5vAAfws1cftryb0Zg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IMhTB8HaFcmm3rmxX2c/RFaQ3qflfKGZfLxcnhyobi3F3tgX2lAtaD+KJokQ8EWZ0
	 bD/g0fL+f7Bcxu9qmRohrzDkN9gtRj3qNc3DVDH7AG10X3ZPoHUNxYLfEAzZxVF3hZ
	 yaUQzA/8bUzMTpmxspFt6SDveYIHQ4FC3+6KvyAhKRam2CFE+aIdIcp/0ZaIlMh8JT
	 9slSA5NM5gOhkcTGf4HAFG6dghfjCOIwY7j3MyqbmdBZ9kTfU9tK4ZDzNSiMOnAgjh
	 wiNw8vnwrluZ5BPBDojjYRKjG26FHJWu1msMA26FIw68gxHXWByGTlb9AWFf6g7SHs
	 BhHmfIuYeU/AQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 12:00:04 -0400
Subject: [PATCH b4 v2 09/11] Avoid duplicate map lookups
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-ruff-check-v2-9-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12420; i=tamird@kernel.org;
 h=from:subject:message-id; bh=T4lM4jamnHcOL/yJjjvPMBViJk5vAAfws1cftryb0Zg=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/rB0TA8Iu/9blrlwzWv5bZufdd5fdPOdTg2HzkKpe
 aKXHj+175jIwiDGxWAppsiSKHpob3rq7T2yme+Ow8xhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6BjrGDFycAjDVce6MDO+nGD36++ZoZOzcsq45b+avbc/fW7ZJpuFJ3qPexR+bVbczMpyNcV9
 ytHiSU1Je3Ycs4QzXprrCiUc8v4gv3HDDjUulkBcA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Use dict.get and defaultdict to avoid repeated membership checks before
indexing into the same map. This keeps the existing behavior while
making later type narrowing easier for mypy and pyright.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 src/b4/__init__.py | 105 ++++++++++++++++++++++++++---------------------------
 src/b4/ez.py       |  10 ++---
 2 files changed, 56 insertions(+), 59 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index c427ee4..72b1c97 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -28,6 +28,7 @@ import tempfile
 import textwrap
 import time
 import urllib.parse
+from collections import defaultdict
 from contextlib import contextmanager
 from email import charset
 from email.message import EmailMessage
@@ -198,7 +199,7 @@ class LoreMailbox:
     msgid_map: Dict[str, 'LoreMessage']
     series: Dict[int, 'LoreSeries']
     covers: Dict[int, 'LoreMessage']
-    trailer_map: Dict[str, List['LoreMessage']]
+    trailer_map: defaultdict[str, List['LoreMessage']]
     followups: List['LoreMessage']
     unknowns: List['LoreMessage']
 
@@ -206,7 +207,7 @@ class LoreMailbox:
         self.msgid_map = dict()
         self.series = dict()
         self.covers = dict()
-        self.trailer_map = dict()
+        self.trailer_map = defaultdict(list)
         self.followups = list()
         self.unknowns = list()
 
@@ -223,11 +224,6 @@ class LoreMailbox:
 
         return '\n'.join(out)
 
-    def get_by_msgid(self, msgid: str) -> Optional['LoreMessage']:
-        if msgid in self.msgid_map:
-            return self.msgid_map[msgid]
-        return None
-
     def partial_reroll(self, revision: int, sloppytrailers: bool) -> None:
         # Is it a partial reroll?
         # To qualify for a partial reroll:
@@ -244,11 +240,13 @@ class LoreMailbox:
         for patch in lser.patches:
             if patch is None:
                 continue
-            if patch.in_reply_to is None or patch.in_reply_to not in self.msgid_map:
+            if (
+                patch.in_reply_to is None
+                or (ppatch := self.msgid_map.get(patch.in_reply_to)) is None
+            ):
                 logger.debug('Patch not sent as a reply-to')
                 sane = False
                 break
-            ppatch = self.msgid_map[patch.in_reply_to]
             found = False
             while True:
                 if (
@@ -263,10 +261,10 @@ class LoreMailbox:
                 # Do we have another level up?
                 if (
                     ppatch.in_reply_to is None
-                    or ppatch.in_reply_to not in self.msgid_map
+                    or (npatch := self.msgid_map.get(ppatch.in_reply_to)) is None
                 ):
                     break
-                ppatch = self.msgid_map[ppatch.in_reply_to]
+                ppatch = npatch
 
             if not found:
                 sane = False
@@ -330,9 +328,7 @@ class LoreMailbox:
             qmsgs, ignore_msgids=set(self.msgid_map.keys())
         )
         for patchid, fmsgs in patchid_map.items():
-            if patchid not in self.trailer_map:
-                self.trailer_map[patchid] = list()
-            self.trailer_map[patchid] += fmsgs
+            self.trailer_map[patchid].extend(fmsgs)
 
     def get_latest_revision(self) -> Optional[int]:
         if not len(self.series):
@@ -356,10 +352,10 @@ class LoreMailbox:
             revision = self.get_latest_revision()
             if revision is None:
                 return None
-        elif revision not in self.series:
-            return None
 
-        lser = self.series[revision]
+        lser = self.series.get(revision)
+        if lser is None:
+            return None
 
         # Is it empty?
         empty = True
@@ -375,15 +371,15 @@ class LoreMailbox:
             self.partial_reroll(revision, sloppytrailers)
 
         # Grab our cover letter if we have one
-        if revision in self.covers:
-            lser.add_patch(self.covers[revision])
+        if (cover := self.covers.get(revision)) is not None:
+            lser.add_patch(cover)
             lser.has_cover = True
         else:
             # Let's find the first patch with an in-reply-to and see if that
             # is our cover letter
             for member in lser.patches:
                 if member is not None and member.in_reply_to is not None:
-                    potential = self.get_by_msgid(member.in_reply_to)
+                    potential = self.msgid_map.get(member.in_reply_to)
                     if (
                         potential is not None
                         and potential.has_diffstat
@@ -414,12 +410,13 @@ class LoreMailbox:
             if fmsg.in_reply_to is None:
                 # Check if there's something matching in References
                 for refid in fmsg.references:
-                    if refid in self.msgid_map and refid != fmsg.msgid:
-                        pmsg = self.msgid_map[refid]
+                    if (
+                        refid != fmsg.msgid
+                        and (pmsg := self.msgid_map.get(refid)) is not None
+                    ):
                         logger.debug('Found a references entry %s in msgid_map', refid)
                         break
-            elif fmsg.in_reply_to in self.msgid_map:
-                pmsg = self.msgid_map[fmsg.in_reply_to]
+            elif (pmsg := self.msgid_map.get(fmsg.in_reply_to)) is not None:
                 logger.debug('Found in-reply-to %s in msgid_map', fmsg.in_reply_to)
             if pmsg is None:
                 # Can't find the message we're replying to here
@@ -443,8 +440,6 @@ class LoreMailbox:
                         # previous revisions to current revision if patch id did
                         # not change
                         if pmsg.git_patch_id:
-                            if pmsg.git_patch_id not in self.trailer_map:
-                                self.trailer_map[pmsg.git_patch_id] = list()
                             self.trailer_map[pmsg.git_patch_id].append(fmsg)
                     pmsg.followup_trailers += trailers
                     break
@@ -452,15 +447,18 @@ class LoreMailbox:
                     # Could be a cover letter
                     pmsg.followup_trailers += trailers
                     break
-                if pmsg.in_reply_to and pmsg.in_reply_to in self.msgid_map:
+                if (
+                    pmsg.in_reply_to
+                    and (nmsg := self.msgid_map.get(pmsg.in_reply_to)) is not None
+                ):
                     # Avoid bad message id causing infinite loop
-                    if pmsg == self.msgid_map[pmsg.in_reply_to]:
+                    if pmsg == nmsg:
                         break
                     lvl += 1
                     for pltr in pmsg.trailers:
                         pltr.lmsg = pmsg
                         trailers.append(pltr)
-                    pmsg = self.msgid_map[pmsg.in_reply_to]
+                    pmsg = nmsg
                     continue
                 break
 
@@ -472,29 +470,28 @@ class LoreMailbox:
             logger.debug(
                 '  matching patch_id %s from: %s', lmsg.git_patch_id, lmsg.full_subject
             )
-            if lmsg.git_patch_id in self.trailer_map:
-                for fmsg in self.trailer_map[lmsg.git_patch_id]:
-                    logger.debug('  matched: %s', fmsg.msgid)
-                    fltrs, fmis = fmsg.get_trailers(sloppy=sloppytrailers)
-                    for fltr in fltrs:
-                        if fltr in lmsg.trailers:
-                            logger.debug('  trailer already exists')
-                            continue
-                        if fltr in lmsg.followup_trailers:
-                            logger.debug('  identical trailer received for this series')
-                            continue
-                        logger.debug(
-                            '  carrying over the trailer to this series (may be duplicate)'
-                        )
-                        logger.debug('  %s', lmsg.full_subject)
-                        logger.debug('    + %s', fltr.as_string())
-                        if fltr.lmsg:
-                            logger.debug('      via: %s', fltr.lmsg.msgid)
-                        lmsg.followup_trailers.append(fltr)
-                    for fltr in fmis:
-                        lser.trailer_mismatches.add(
-                            (fltr.name, fltr.value, fmsg.fromname, fmsg.fromemail)
-                        )
+            for fmsg in self.trailer_map.get(lmsg.git_patch_id, ()):
+                logger.debug('  matched: %s', fmsg.msgid)
+                fltrs, fmis = fmsg.get_trailers(sloppy=sloppytrailers)
+                for fltr in fltrs:
+                    if fltr in lmsg.trailers:
+                        logger.debug('  trailer already exists')
+                        continue
+                    if fltr in lmsg.followup_trailers:
+                        logger.debug('  identical trailer received for this series')
+                        continue
+                    logger.debug(
+                        '  carrying over the trailer to this series (may be duplicate)'
+                    )
+                    logger.debug('  %s', lmsg.full_subject)
+                    logger.debug('    + %s', fltr.as_string())
+                    if fltr.lmsg:
+                        logger.debug('      via: %s', fltr.lmsg.msgid)
+                    lmsg.followup_trailers.append(fltr)
+                for fltr in fmis:
+                    lser.trailer_mismatches.add(
+                        (fltr.name, fltr.value, fmsg.fromname, fmsg.fromemail)
+                    )
 
         return lser
 
@@ -529,7 +526,7 @@ class LoreMailbox:
                 if lmsg.revision_inferred and lmsg.in_reply_to:
                     # We have an inferred revision here.
                     # Do we have an upthread cover letter that specifies a revision?
-                    irt = self.get_by_msgid(lmsg.in_reply_to)
+                    irt = self.msgid_map.get(lmsg.in_reply_to)
                     if irt is not None and irt.has_diffstat and not irt.has_diff:
                         # Yes, this is very likely our cover letter
                         logger.debug('  fixed revision to v%s', irt.revision)
@@ -3796,7 +3793,7 @@ def get_config_from_git(
             chunks = key.split('.')
             cfgkey = chunks[-1].lower()
             if cfgkey in multivals:
-                if cfgkey not in gitconfig or gitconfig[cfgkey] is None:
+                if gitconfig.get(cfgkey) is None:
                     gitconfig[cfgkey] = list()
                 gitconfig[cfgkey].append(value)
             else:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 3a59256..d64e0bc 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -26,6 +26,7 @@ import textwrap
 import time
 import urllib.parse
 import uuid
+from collections import defaultdict
 from email.message import EmailMessage
 from string import Template
 from typing import Any, Dict, List, Optional, Set, Tuple, Union
@@ -2262,7 +2263,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     seen: Set[str] = set()
     excludes: Set[str] = set()
-    pccs: Dict[str, List[Tuple[str, str]]] = dict()
+    pccs: defaultdict[str, List[Tuple[str, str]]] = defaultdict(list)
 
     if cmdargs.preview_to or cmdargs.no_trailer_to_cc:
         todests = list()
@@ -2285,10 +2286,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 if btr.addr[1] in seen:
                     continue
                 if commit:
-                    if commit not in pccs:
-                        pccs[commit] = list()
-                    if btr.addr not in pccs[commit]:
-                        pccs[commit].append(btr.addr)
+                    cpccs = pccs[commit]
+                    if btr.addr not in cpccs:
+                        cpccs.append(btr.addr)
                     continue
                 seen.add(btr.addr[1])
                 if btr.lname == 'to':

-- 
2.53.0


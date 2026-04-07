Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213C83CEBBA
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580527; cv=none; b=UzCfpBLSOOknti3iruGyt86X1bT5+qndcac8JA6hWjSyBCST363wDJWTFiChmzSJcfuDxWKs+R6oQSlQUxWUxEtRgfxMQA+XM3X9N0XVJg5XK1VSBEYbdFtaYz+F16T1LhmtalljBPe12RcgNnslOZuT5r9BTOVjMLtC+5++Kqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580527; c=relaxed/simple;
	bh=Z52Cd1wHkDIosty5Y+iQmSfu78WLoeyKiTpROrDqHrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V75WqSt4JvyxWb8ED+jjdQfebsj5EP4HtXQ8aLUilYwETPmIyWKl7b0D7Ef65bZUNKP7IBmV29o7AJEWh7dXQIUSu4PPbyuZEBUX6dr2cmQdW/3Ii4Y+Rcha4OkIgm3MZKgmm6d30sLzvXOHcU2BFvK8kLmjU4/uFSTg5Md/i20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgF0ShNF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgF0ShNF"
Received: by smtp.kernel.org (Postfix)
	id E137BC19424; Tue,  7 Apr 2026 16:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BCBC2BCB0;
	Tue,  7 Apr 2026 16:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580526;
	bh=Z52Cd1wHkDIosty5Y+iQmSfu78WLoeyKiTpROrDqHrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hgF0ShNFGgY5n95idsfBVWTdAPWQG5RxG/17wVYU/D/Kn9neGLzvgFYap8ihYyTax
	 bwFf7m10/sFSHpw945zZtgSzm06ta6BFhbOOQqX3P75m8a15tb5KUsilqxlVQ6pvKd
	 3yKUGiB90BnkfkpQ/ZJQFSPBCaQL1ER+Ct7y12G1WxxsCsyvT0in6K4QcIiEj0OfU4
	 oDkqREE5smio9qUibkbMjubBxnP0yQeILcM8E6HfFsANCykDzHYMTeY0ZyDEWTGnnR
	 CK4RG24p0huKxEoZakHck60u9rqsEpN3eW1HyOzJyvbqsclyqL7ytlgxtwKUmP/jWH
	 H0m41soVjM8Sg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:38 -0400
Subject: [PATCH b4 09/12] Avoid duplicate map lookups
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-9-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12616; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Z52Cd1wHkDIosty5Y+iQmSfu78WLoeyKiTpROrDqHrY=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTTNYLL4J2/qc/GNtWdDAvrBiy0dtl8CmJ5HlX1hrY
 puss2d1TGRhEONisBRTZEkUPbQ3PfX2HtnMd8dh5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix0DHWMGLk4BmOq+KIZ/mof3C2pUPpu/ZDLH16ojLcuYZ4X+eLb0xP8t1oE25VoP/zAyzLkoWp7
 6/opaUjRLb1+d2OSfJYVTJmrXBQdaX+e2yVvFBQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Use dict.get and defaultdict to avoid repeated membership checks before
indexing into the same map. This keeps the existing behavior while
making later type narrowing easier for mypy and pyright.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 src/b4/__init__.py | 100 ++++++++++++++++++++++++++---------------------------
 src/b4/ez.py       |  10 +++---
 2 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index f38787b..e6eae3e 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -29,6 +29,7 @@ import tempfile
 import textwrap
 import time
 import urllib.parse
+from collections import defaultdict
 from contextlib import contextmanager
 from pathlib import Path
 from typing import (
@@ -190,7 +191,7 @@ class LoreMailbox:
     msgid_map: Dict[str, 'LoreMessage']
     series: Dict[int, 'LoreSeries']
     covers: Dict[int, 'LoreMessage']
-    trailer_map: Dict[str, List['LoreMessage']]
+    trailer_map: defaultdict[str, List['LoreMessage']]
     followups: List['LoreMessage']
     unknowns: List['LoreMessage']
 
@@ -198,7 +199,7 @@ class LoreMailbox:
         self.msgid_map = dict()
         self.series = dict()
         self.covers = dict()
-        self.trailer_map = dict()
+        self.trailer_map = defaultdict(list)
         self.followups = list()
         self.unknowns = list()
 
@@ -215,11 +216,6 @@ class LoreMailbox:
 
         return '\n'.join(out)
 
-    def get_by_msgid(self, msgid: str) -> Optional['LoreMessage']:
-        if msgid in self.msgid_map:
-            return self.msgid_map[msgid]
-        return None
-
     def partial_reroll(self, revision: int, sloppytrailers: bool) -> None:
         # Is it a partial reroll?
         # To qualify for a partial reroll:
@@ -236,11 +232,13 @@ class LoreMailbox:
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
                 if patch.counter == ppatch.counter and patch.expected == ppatch.expected:
@@ -248,9 +246,12 @@ class LoreMailbox:
                     found = True
                     break
                 # Do we have another level up?
-                if ppatch.in_reply_to is None or ppatch.in_reply_to not in self.msgid_map:
+                if (
+                    ppatch.in_reply_to is None
+                    or (npatch := self.msgid_map.get(ppatch.in_reply_to)) is None
+                ):
                     break
-                ppatch = self.msgid_map[ppatch.in_reply_to]
+                ppatch = npatch
 
             if not found:
                 sane = False
@@ -305,9 +306,7 @@ class LoreMailbox:
         logger.debug('Retrieved %s matching code-review messages', len(qmsgs))
         patchid_map = map_codereview_trailers(qmsgs, ignore_msgids=set(self.msgid_map.keys()))
         for patchid, fmsgs in patchid_map.items():
-            if patchid not in self.trailer_map:
-                self.trailer_map[patchid] = list()
-            self.trailer_map[patchid] += fmsgs
+            self.trailer_map[patchid].extend(fmsgs)
 
 
     def get_latest_revision(self) -> Optional[int]:
@@ -328,10 +327,10 @@ class LoreMailbox:
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
@@ -347,15 +346,15 @@ class LoreMailbox:
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
                     if potential is not None and potential.has_diffstat and not potential.has_diff:
                         # This is *probably* the cover letter
                         lser.patches[0] = potential
@@ -380,12 +379,13 @@ class LoreMailbox:
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
@@ -407,8 +407,6 @@ class LoreMailbox:
                         # previous revisions to current revision if patch id did
                         # not change
                         if pmsg.git_patch_id:
-                            if pmsg.git_patch_id not in self.trailer_map:
-                                self.trailer_map[pmsg.git_patch_id] = list()
                             self.trailer_map[pmsg.git_patch_id].append(fmsg)
                     pmsg.followup_trailers += trailers
                     break
@@ -416,15 +414,18 @@ class LoreMailbox:
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
 
@@ -434,25 +435,24 @@ class LoreMailbox:
             if lmsg is None or lmsg.git_patch_id is None:
                 continue
             logger.debug('  matching patch_id %s from: %s', lmsg.git_patch_id, lmsg.full_subject)
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
-                        logger.debug('  carrying over the trailer to this series (may be duplicate)')
-                        logger.debug('  %s', lmsg.full_subject)
-                        logger.debug('    + %s', fltr.as_string())
-                        if fltr.lmsg:
-                            logger.debug('      via: %s', fltr.lmsg.msgid)
-                        lmsg.followup_trailers.append(fltr)
-                    for fltr in fmis:
-                        lser.trailer_mismatches.add((fltr.name, fltr.value, fmsg.fromname, fmsg.fromemail))
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
+                    logger.debug('  carrying over the trailer to this series (may be duplicate)')
+                    logger.debug('  %s', lmsg.full_subject)
+                    logger.debug('    + %s', fltr.as_string())
+                    if fltr.lmsg:
+                        logger.debug('      via: %s', fltr.lmsg.msgid)
+                    lmsg.followup_trailers.append(fltr)
+                for fltr in fmis:
+                    lser.trailer_mismatches.add((fltr.name, fltr.value, fmsg.fromname, fmsg.fromemail))
 
         return lser
 
@@ -487,7 +487,7 @@ class LoreMailbox:
                 if lmsg.revision_inferred and lmsg.in_reply_to:
                     # We have an inferred revision here.
                     # Do we have an upthread cover letter that specifies a revision?
-                    irt = self.get_by_msgid(lmsg.in_reply_to)
+                    irt = self.msgid_map.get(lmsg.in_reply_to)
                     if irt is not None and irt.has_diffstat and not irt.has_diff:
                         # Yes, this is very likely our cover letter
                         logger.debug('  fixed revision to v%s', irt.revision)
@@ -3396,7 +3396,7 @@ def get_config_from_git(regexp: str, defaults: Optional[Dict[str, Any]] = None,
             chunks = key.split('.')
             cfgkey = chunks[-1].lower()
             if cfgkey in multivals:
-                if cfgkey not in gitconfig or gitconfig[cfgkey] is None:
+                if gitconfig.get(cfgkey) is None:
                     gitconfig[cfgkey] = list()
                 gitconfig[cfgkey].append(value)
             else:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index b54e04c..51ded98 100644
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
@@ -1988,7 +1989,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     seen: Set[str] = set()
     excludes: Set[str] = set()
-    pccs: Dict[str, List[Tuple[str, str]]] = dict()
+    pccs: defaultdict[str, List[Tuple[str, str]]] = defaultdict(list)
 
     if cmdargs.preview_to or cmdargs.no_trailer_to_cc:
         todests = list()
@@ -2011,10 +2012,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22CA4502A
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751050489; cv=none; b=C+K8DYwe4HhFGYnXm518kxChfJ+7yZ058P/Kp7VRHYk8ptHGxKrD4vdq72GGWAMyeeE6IuumATcP0AK1A6/Eb63T30hhE7zkumUQ8GDE/kh3KiD4oVq7HAtC6rj6N4z0unUW9x96QR8+jtmQQu18xVMIC4ntyzp+lpXH8LmZhAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751050489; c=relaxed/simple;
	bh=pGx5gVN2n00Hrlk1brQChgoKUNX/CMtQbsbTNbtUokQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X9vb1GOKKT0MMqmldYG3/kLEPJGZeJhcsijtkhnUy2vfWoVT8Q1UsqwQvjqabE09c7k8RuGNZsx7BJfE8YIK63gZ6EhoJTmDkkhbJ2gz+hy1BD0f+TaK0ONGQ3FkQuZjfgMnGK+0MNVYXYdo+61uRtKRbtmx7h701Q/ZmQFlIEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mAHBGuA6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mAHBGuA6"
Received: by smtp.kernel.org (Postfix)
	id 9B722C4CEE3; Fri, 27 Jun 2025 18:54:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 150ACC4CEEB
	for <tools@kernel.org>; Fri, 27 Jun 2025 18:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 150ACC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29869443D2;
	Fri, 27 Jun 2025 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751050478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VX9U87tePf113CDlYRLLOxeLLoekFKurkqqEZlzUxaw=;
	b=mAHBGuA69aGMOMjpOqEf6TWFZgFytWa67nAJLHNmszVSY7/dxU3sMAqJ7+yDbaTsazfwcs
	LLc88zuBeW6o2RuCv5sWSqs7PPdtDfvalgIhYmZQhGKtFc4apW1QfG4VWDu9DgnO+lj1ar
	SjHCCIdwl2LZfhB1Hlg9oiVx0PAbJVdLgOcEMpZa3Tev/3uPqsdVDsJ0lGlQFJmkzYKe03
	HzwbEbJKwKKTJNiRRGc0mnG+k2kRTl0o/OXl45dPulcFesikLFJJ7EerybDDOty4V2XUML
	x/71HZqgD3KRpJgMebJx+z+XqB1VXTQKB/sEEZ2S9DM3Xyo/nDv7ioxZKEaEbQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 27 Jun 2025 20:54:20 +0200
Subject: [PATCH b4] Add support for setting a presubject
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-send-presubject-v1-1-f8e11fda1543@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANvoXmgC/x2MQQ5AMBAAvyJ7tgmbFvEVcaharENJF5GIv2scJ
 5OZB5SjsEKbPRD5EpUtJCjzDPziwswoY2KggmxRUY3KYcQ9sp7Dyv5A11jyhmzpqwlSldQk93/
 sYDDQv+8HM78XIGUAAAA=
X-Change-ID: 20250627-send-presubject-a852c4251c6f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13776;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pGx5gVN2n00Hrlk1brQChgoKUNX/CMtQbsbTNbtUokQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoXujt5RsLF/nIrgEcmqdfEy73xW7FrjX8TGHsF
 RZkodi5VEqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaF7o7QAKCRDRgEFAKaOo
 NuuQD/9VwbvSabUDhOeglC2EWdaZB8XznQpvsBLjVkwu6OkVGcoNTIr5uLlR8TuccZn3OOrzZSd
 vzOHUrotBNLaSkT+KMVib6ERhpi8fjxj/hfxw6gOIFaDyQNmFuB4f1TcNVZkJGs2UUj8Z1ZrLV3
 6nw/7O7HlBqTiwIV/srT6dvi9tYvLqDGcgPrlr9Oj9xwAgQuBGc5gAgkSYSpDH167D6VhEO8jWL
 bhDT4ZItnApoyoo7NYsZsIJuEGSf24palTmAdpqzjXwz2jGvDIbjEQWvYUMKhgvrcR+1nSgm/wZ
 yjJvpoRFun+kaqi2b0GZg4SoayPRBGosKfYXvEMZl+jZlzCuMu9TsaTVec3wAmA0R7mZ5DkTvcQ
 EK6OPn+9USsCjhQ3f+F4t+tBzK9LeDKmUTh3P8kkJq4qlfkpt300P9FJALeuONBT9kzDZomttan
 7VLrOt+uMXAWtPuO9ToWM4jTddlVyvwN7/+wClBE1JBNaaHr5hp4oq1+OpurMXMfRL8miOg45nz
 Z1qre+kGDNQboh5i49gS9EUMwfJj2UJYd9mpU3tFLBHvfmPd+P2OSti/hAy4MOgR88NT34uQCqg
 9gGKAesQJoLwu04Cah5pXJOnoHgE8nHV1MHYbUT2rs+WvrCZrXkhy673Ew0kIuTVgC3KEDkvvb+
 U1PTPGjjcJU/QAg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgeetheelgfehgedvudefveehheevieejvdefuddvfedvkeeuudeuvdejleetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhto
 hepthhoohhlsheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com

Some mailing lists require a prefix to come before the [PATCH] in the
subject of emails, such as OpenEmbedded or libgpiod. The current prefix
mechanism does not allow for that (only after PATCH), and setting the
format.subjectPrefix Git option does not work either.

Add a new configuration option send-presubject as well as a
--set-presubject argument to be able to include anything that should
come before the subject. The logic behind prefixes is not changed and
this new option does not break any existing prefix assignments.

In order not to break the logic in LoreSubject's __init__ function,
which parses the subject line and strips brackets in order to reorganize
the subject line later, the presubject must be enclosed with brackets
too (_check_presubject() is used to ensure that).

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217642
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: I tried modifying the prefix logic to have any prefix ending with
"][PATCH" be included at the beginning of the subject (and so avoid
having a new option) but had no success doing so. The prefix logic is
spread in different places in the code and I was not successful aligning
everything together to make it work and not break the current prefix
logic.

Curious to have comments on this before adding documentation/tests for it.
---
 src/b4/__init__.py | 27 ++++++++++++++++------
 src/b4/command.py  |  2 ++
 src/b4/ez.py       | 68 ++++++++++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 80 insertions(+), 17 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e..281461e 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2489,7 +2489,7 @@ class LoreSubject:
     counters_inferred: bool
     prefixes: List[str]
 
-    def __init__(self, subject: str) -> None:
+    def __init__(self, subject: str, presubject: str = None) -> None:
         # Subject-based info
         self.reply = False
         self.resend = False
@@ -2529,6 +2529,9 @@ class LoreSubject:
             bracketed = re.sub(r'(patch)(v\d+)', r'\1 \2', bracketed, flags=re.I)
 
             for chunk in bracketed.split():
+                if presubject is not None and chunk in presubject:
+                    continue
+
                 # Remove any trailing commas or semicolons
                 chunk = chunk.strip(',;')
                 if re.search(r'^\d{1,4}/\d{1,4}$', chunk):
@@ -2566,7 +2569,9 @@ class LoreSubject:
 
         return ret
 
-    def get_rebuilt_subject(self, eprefixes: Optional[List[str]] = None) -> str:
+    def get_rebuilt_subject(self, eprefixes: Optional[List[str]] = None,
+                            presubject: str = None) -> str:
+
         exclude = None
         if eprefixes and 'PATCH' in eprefixes:
             exclude = ['patch']
@@ -2582,10 +2587,16 @@ class LoreSubject:
         if self.expected > 1:
             _pfx.append('%s/%s' % (str(self.counter).zfill(len(str(self.expected))), self.expected))
 
+        subject = ""
         if len(_pfx):
-            return '[' + ' '.join(_pfx) + '] ' + self.subject
+            subject = '[' + ' '.join(_pfx) + '] ' + self.subject
         else:
-            return f'[PATCH] {self.subject}'
+            subject = f'[PATCH] {self.subject}'
+
+        if presubject:
+            subject = f'{presubject}{subject}'
+
+        return subject
 
     def get_slug(self, sep: str = '_', with_counter: bool = True) -> str:
         unsafe = self.subject
@@ -3570,7 +3581,8 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
                          mailfrom: Optional[Tuple[str, str]] = None,
                          extrahdrs: Optional[List[Tuple[str, str]]] = None,
                          ignore_commits: Optional[Set[str]] = None,
-                         limit_committer: Optional[str] = None) -> List[Tuple[str, EmailMessage]]:
+                         limit_committer: Optional[str] = None,
+                         presubject: Optional[str] = None) -> List[Tuple[str, EmailMessage]]:
     gitargs = ['rev-list', '--no-merges', '--reverse']
     if limit_committer:
         gitargs += ['-F', f'--committer={limit_committer}']
@@ -3623,12 +3635,13 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
         msg.set_charset('utf-8')
         # Clean From to remove any 7bit-safe encoding
         origfrom = LoreMessage.clean_header(msg.get('From'))
-        lsubject = LoreSubject(msg.get('Subject'))
+        lsubject = LoreSubject(msg.get('Subject'), presubject=presubject)
         lsubject.counter = counter + 1
         lsubject.expected = expected
         if revision is not None:
             lsubject.revision = revision
-        subject = lsubject.get_rebuilt_subject(eprefixes=prefixes)
+        subject = lsubject.get_rebuilt_subject(eprefixes=prefixes,
+                                               presubject=presubject)
 
         logger.debug('  %s', subject)
         msg.replace_header('Subject', subject)
diff --git a/src/b4/command.py b/src/b4/command.py
index 455124d..6f950b7 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -313,6 +313,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Prefixes to include after [PATCH] (e.g.: RFC mydrv)')
     sp_prep.add_argument('--add-prefixes', metavar='PREFIX', nargs='+',
                          help='Additional prefixes to add to those already defined')
+    sp_prep.add_argument('--set-presubject', metavar='PRESUBJECT', type=str, default=None,
+                         help='Prefix to include before [PATCH] (e.g.: [mylist])')
     sp_prep.add_argument('-C', '--no-cache', dest='nocache', action='store_true', default=False,
                          help='Do not use local cache')
     sp_prep.add_argument('--range-diff-opts', default=None, type=str,
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 66875d7..ccf9c1d 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -559,19 +559,30 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         if revision is None:
             revision = 1
         prefixes = list()
+
+        config = b4.get_main_config()
+
         if cmdargs.set_prefixes:
             prefixes = list(cmdargs.set_prefixes)
         else:
-            config = b4.get_main_config()
             _sp = config.get('send-prefixes')
             if _sp and isinstance(_sp, str):
                 prefixes = _sp.split()
 
+        presubject = ''
+        if cmdargs.set_presubject:
+            presubject = cmdargs.set_presubject
+        else:
+            presubject = config.get('send-presubject', '')
+            if presubject and isinstance(presubject, str):
+                _check_presubject(presubject)
+
         tracking = {
             'series': {
                 'revision': revision,
                 'change-id': changeid,
                 'prefixes': prefixes,
+                'presubject': presubject,
             },
         }
         if thread_msgid:
@@ -1432,16 +1443,17 @@ def get_cover_dests(cbody: str) -> Tuple[List[Tuple[str, str]], List[Tuple[str,
 
 
 def add_cover(csubject: b4.LoreSubject, msgid_tpt: str, patches: List[Tuple[str, EmailMessage]],
-              cbody: str, datets: int, thread: bool = True) -> None:
+              cbody: str, datets: int, thread: bool = True, presubject: str = None) -> None:
     fp = patches[0][1]
     cmsg = EmailMessage()
     cmsg.add_header('From', fp['From'])
-    fpls = b4.LoreSubject(fp['Subject'])
+    fpls = b4.LoreSubject(fp['Subject'], presubject=presubject)
 
     csubject.expected = fpls.expected
     csubject.counter = 0
     csubject.revision = fpls.revision
-    cmsg.add_header('Subject', csubject.get_rebuilt_subject(eprefixes=fpls.get_extra_prefixes()))
+    cmsg.add_header('Subject', csubject.get_rebuilt_subject(eprefixes=fpls.get_extra_prefixes(),
+                                                            presubject=presubject))
     cmsg.add_header('Date', email.utils.formatdate(datets, localtime=True))
     cmsg.add_header('Message-Id', msgid_tpt % str(0))
 
@@ -1551,13 +1563,16 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     for cprefix in csubject.get_extra_prefixes(exclude=prefixes):
         prefixes.append(cprefix)
 
+    presubject = tracking['series'].get('presubject', list())
+
     patches = b4.git_range_to_patches(None, start_commit, end_commit,
                                       revision=revision,
                                       prefixes=prefixes,
                                       msgid_tpt=msgid_tpt,
                                       seriests=seriests,
                                       mailfrom=mailfrom,
-                                      ignore_commits=ignore_commits)
+                                      ignore_commits=ignore_commits,
+                                      presubject=presubject)
 
     base_commit, _, _, _, shortlog, diffstat = get_series_details(start_commit=start_commit,
                                                                   usebranch=usebranch)
@@ -1623,7 +1638,8 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
                     continue
                 logger.debug('Checking if we have a sent version')
                 try:
-                    _, _, ppatches = get_sent_tag_as_patches(tagname, revision=revision)
+                    _, _, ppatches = get_sent_tag_as_patches(tagname, revision=revision,
+                                                             presubject=presubject)
                     for psha, ppatch in ppatches:
                         spatches.append(ppatch)
                 except RuntimeError:
@@ -1690,7 +1706,7 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     if len(patches) == 1:
         mixin_cover(cbody, patches)
     else:
-        add_cover(csubject, msgid_tpt, patches, cbody, seriests, thread=thread)
+        add_cover(csubject, msgid_tpt, patches, cbody, seriests, thread=thread, presubject=presubject)
 
     if addtracking:
         patches[0][1].add_header('X-B4-Tracking', thdata)
@@ -1719,7 +1735,7 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     return alltos, allccs, tag_msg, patches
 
 
-def get_sent_tag_as_patches(tagname: str, revision: int) \
+def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None) \
         -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], List[Tuple[str, EmailMessage]]]:
     cover, base_commit, change_id = get_base_changeid_from_tag(tagname)
 
@@ -1735,7 +1751,8 @@ def get_sent_tag_as_patches(tagname: str, revision: int) \
                                       prefixes=prefixes,
                                       msgid_tpt=msgid_tpt,
                                       seriests=seriests,
-                                      mailfrom=mailfrom)
+                                      mailfrom=mailfrom,
+                                      presubject=presubject)
 
     alltos, allccs, cbody = get_cover_dests(cbody)
     if len(patches) == 1:
@@ -1889,8 +1906,11 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 logger.critical('Could not figure out revision from %s', revstr)
                 sys.exit(1)
 
+        presubject = tracking['series'].get('presubject', None)
+
         try:
-            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision)
+            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision, 
+                                                                presubject=presubject)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert tag to patches: %s', ex)
             sys.exit(1)
@@ -2913,6 +2933,30 @@ def set_prefixes(prefixes: List[str], additive: bool = False) -> None:
         logger.info('No changes to extra prefixes.')
 
 
+def _check_presubject(presubject: str):
+    if presubject == "":
+        return
+
+    if presubject.startswith("[") and presubject.endswith("]"):
+        return
+
+    raise RuntimeError("The presubject must be enclosed with brackets. E.g: [mylist]")
+
+
+def set_presubject(presubject: str) -> None:
+    cover, tracking = load_cover()
+    old_presubject = tracking['series'].get('presubject', None)
+    tracking['series']['presubject'] = presubject
+    if tracking['series']['presubject'] != old_presubject:
+        store_cover(cover, tracking)
+        if tracking['series']['presubject'] != "":
+            logger.info(f'Updated pre-subject to: {presubject}')
+        else:
+            logger.info('Removed pre-subject.')
+    else:
+        logger.info('No changes to the pre-subject.')
+
+
 def cmd_prep(cmdargs: argparse.Namespace) -> None:
     check_can_gfr()
     status = b4.git_get_repo_status()
@@ -2995,6 +3039,10 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.add_prefixes:
         set_prefixes(cmdargs.add_prefixes, additive=True)
 
+    if cmdargs.set_presubject is not None:
+        _check_presubject(cmdargs.set_presubject)
+        set_presubject(cmdargs.set_presubject)
+
     if cmdargs.auto_to_cc:
         auto_to_cc()
 

---
base-commit: a9b2aba54be85ea2933c43b8a6d71c1611230b59
change-id: 20250627-send-presubject-a852c4251c6f

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95916A397
	for <tools@linux.kernel.org>; Fri, 14 Jun 2024 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377522; cv=none; b=VRjzRrBPwikk3FX1Fag8hGHhKcJsnHykNb0Q6xhzt7AyJkFdC/YZxWiZD8bvogVXlMEmyNukvYS93aBmxbRr85Whh5Hq3oANvic1t3Jjv3nu5xXoOxXig8g4GpCbtbeydaw1vsevZwSr0AiifmfEjqW9r06AtzjcTr/iPt9CZlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377522; c=relaxed/simple;
	bh=AHk9LpAHil+CeKooa0Wf6X3OA3czlSNlSVSQKO2QBCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uL/DLVcuc7MdQoguoVXoTvEkuGLRs6fpCw85xAyqZIilJOHaLaCShXe+EJF+WaNsyDieuUx7Gf8Zs/7/AZJu3uCZDAodcReCmfLhtVGgzsGMzNkih7o72t9HRs2cC1H8HR+OLFUsj/K4RTRRkPkdhHNv6tkYvT+qZg85RSrh8WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KV2ioBjW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KV2ioBjW"
Received: by smtp.kernel.org (Postfix)
	id 62AF0C4AF1A; Fri, 14 Jun 2024 15:05:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D780AC3277B
	for <tools@kernel.org>; Fri, 14 Jun 2024 15:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D780AC3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA04940008;
	Fri, 14 Jun 2024 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718377512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aM03uerv+xE/q20Qnf6GtvE9mX47uXyvrKmmGlZv4tg=;
	b=KV2ioBjW8unMOxmCoyq7xSifaxJdSJWrRUMuHDZo3/p6yz0G/tiDsvt4+8zktJ5UzYO+1W
	1t1IoZ9bKnTSf4lpJXre8P2wlhDcKXQdjqhnL9BesS9Me/iSGVYA3YbhbO8SdTy4oGsG14
	oSnAnN3A5rov6yzEDjYf122muCU8i3SAvOadIYfRHI9qFKB+YhBxZi21SuaMszl/lrDSBx
	a4KsX0yUBqV5S6Q+7t1mgFBEHpLbJ+5eBHOWt3JAy8ufE0sibXTeS5Yh1+kV98Zenh8rLB
	d1nLgChWwXeVgfujJiEHZKkGI4e9G9+VI0/b+53AIEG7W33wRq84Z6GNDyl9GQ==
From: Kory Maincent <kory.maincent@bootlin.com>
To: tools@kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH b4] ez: Add support for a from field detection mechanism to overwrite authorship
Date: Fri, 14 Jun 2024 17:04:19 +0200
Message-Id: <20240614150419.1124423-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kory.maincent@bootlin.com

Implement management of the From tag in the cover letter. If present,
all patches will have their commit messages prepended with it.

One use case is to include info of a company funding or sponsoring a
development, as requested by Jakub Kicinski:
https://lore.kernel.org/all/20240215105846.6dd48886@kernel.org/

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 src/b4/ez.py | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 53e8f0a..2244045 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1319,6 +1319,7 @@ def get_cover_dests(cbody: str) -> Tuple[List, List, str]:
     htrs, cmsg, mtrs, basement, sig = b4.LoreMessage.get_body_parts(cbody)
     tos = list()
     ccs = list()
+    fromaddr = set()
     for mtr in list(mtrs):
         if mtr.lname == 'to':
             tos.append(mtr.addr)
@@ -1326,8 +1327,14 @@ def get_cover_dests(cbody: str) -> Tuple[List, List, str]:
         elif mtr.lname == 'cc':
             ccs.append(mtr.addr)
             mtrs.remove(mtr)
+        elif mtr.lname == 'from':
+            if fromaddr:
+                logger.critical("CRITICAL: We can't have two authors for this series")
+                sys.exit(1)
+            fromaddr = mtr.value
+            mtrs.remove(mtr)
     cbody = b4.LoreMessage.rebuild_message(htrs, cmsg, mtrs, basement, sig)
-    return tos, ccs, cbody
+    return tos, ccs, fromaddr, cbody
 
 
 def add_cover(csubject: b4.LoreSubject, msgid_tpt: str, patches: List[Tuple[str, email.message.Message]],
@@ -1579,7 +1586,7 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     wrapped = textwrap.wrap('X-B4-Tracking: v=1; b=' + b64tracking, subsequent_indent=' ', width=75)
     thdata = ''.join(wrapped).replace('X-B4-Tracking: ', '')
 
-    alltos, allccs, cbody = get_cover_dests(cover_letter)
+    alltos, allccs, allfrom, cbody = get_cover_dests(cover_letter)
     if len(patches) == 1:
         mixin_cover(cbody, patches)
     else:
@@ -1603,7 +1610,7 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     if prefixes:
         header = '[' + ', '.join(prefixes) + f'] {header}'
     tag_msg = f'{header}\n\n{cover_letter}'
-    return alltos, allccs, tag_msg, patches
+    return alltos, allccs, allfrom, tag_msg, patches
 
 
 def get_sent_tag_as_patches(tagname: str, revision: int) -> Tuple[List, List, List[Tuple[str, email.message.Message]]]:
@@ -1623,18 +1630,18 @@ def get_sent_tag_as_patches(tagname: str, revision: int) -> Tuple[List, List, Li
                                       seriests=seriests,
                                       mailfrom=mailfrom)
 
-    alltos, allccs, cbody = get_cover_dests(cbody)
+    alltos, allccs, allfrom, cbody = get_cover_dests(cbody)
     if len(patches) == 1:
         mixin_cover(cbody, patches)
     else:
         add_cover(csubject, msgid_tpt, patches, cbody, seriests)
 
-    return alltos, allccs, patches
+    return alltos, allccs, allfrom, patches
 
 
 def format_patch(output_dir: str) -> None:
     try:
-        tos, ccs, tstr, patches = get_prep_branch_as_patches(thread=False, movefrom=False, addtracking=False)
+        tos, ccs, fromsrc, tstr, patches = get_prep_branch_as_patches(thread=False, movefrom=False, addtracking=False)
     except RuntimeError as ex:
         logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
         sys.exit(1)
@@ -1764,7 +1771,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             tagname, revision = get_sent_tagname(mybranch, SENT_TAG_PREFIX, revstr)
 
         try:
-            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision)
+            todests, ccdests, fromsrc, patches = get_sent_tag_as_patches(tagname, revision=revision)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert tag to patches: %s', ex)
             sys.exit(1)
@@ -1784,7 +1791,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             prefixes = None
 
         try:
-            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(prefixes=prefixes)
+            todests, ccdests, fromsrc, tag_msg, patches = get_prep_branch_as_patches(prefixes=prefixes)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
             sys.exit(1)
@@ -2067,6 +2074,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 msg.replace_header('Cc', b4.format_addrs(pcc))
             else:
                 msg.add_header('Cc', b4.format_addrs(pcc))
+        if fromsrc:
+            payload = "From: " + fromsrc + "\n\n" + msg.get_payload()
+            msg.set_payload(payload, charset='utf-8')
 
         send_msgs.append(msg)
 
@@ -2631,7 +2641,7 @@ def auto_to_cc() -> None:
             extras.append(ltr)
 
     try:
-        tos, ccs, tag_msg, patches = get_prep_branch_as_patches()
+        tos, ccs, fromsrc, tag_msg, patches = get_prep_branch_as_patches()
     except RuntimeError:
         logger.info('No commits in branch')
         return
-- 
2.34.1


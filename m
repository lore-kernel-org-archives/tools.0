Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BA18E1E
	for <tools@linux.kernel.org>; Thu, 28 Mar 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711618536; cv=none; b=CcMlsDrvR1qaWsHy8kS77O//hd/Rw6eASRheofP+Y+33C35yHiGgxGHFGq/QTpl0185nUzc7ELAno1KFmEuEc2I1324YUIIRD8M1kFnJIaenhfgc+xK/bErVS4QY5C4ORv50jRdF0rnZJZ3l502rip41XGbVGLGSzfFB4dogjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711618536; c=relaxed/simple;
	bh=T84krUeqYanzTm8AWJb336byBlCwRJXIWG26SEX3hiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nRte4qUMgYdVqJr9LY82k8lRQIA9lofwMlg2Xn347tE37dPF7O0zF9jZuQf3bQnDQKRezSeK8q5fjKEPlBqVRewbgmvcWh3cGv1Z7LVZfOtT+54vrBYjeQuFN/Fuk60Xf8KDGgYvoHBAcWq2Imxv50FEUHpHzYTMKJu750VN3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Cn+F+slY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cn+F+slY"
Received: by smtp.kernel.org (Postfix)
	id 55529C43390; Thu, 28 Mar 2024 09:35:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F12EC433F1
	for <tools@kernel.org>; Thu, 28 Mar 2024 09:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F12EC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4862CE000A;
	Thu, 28 Mar 2024 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711618526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jKcpREhZMiOxB97X7Y/OqvQxYBopd0XYAKUT6BsOhOA=;
	b=Cn+F+slYhHxdJqciHlmrnAUqZ9ZbqfcsCryV5VkX4wq/TQgJ6WZXlCYD1rAhoO+eifUnIr
	mpvHazw4D3HxPkg+RKxpy9XX6DJ1S4sVBCwubGoHz6H2SP4ovWWtw01vanWUNrFYoN0AoJ
	N0i+aAmVvpBv+Iia1aM4QCLVozCHaj39tEOlHAcJB6MzjwcyFBpf18b5B7LXes5LLa5IEF
	px1h6fPWBs4rtPBvV4XW3x5cT7B/NWHJ4VpK2f2SGEJh1bIp41G04Bt3Iap26vgzPhokpC
	pL1YcNhQyBlTo/Q7+TmwXgUdI7htFzgCTb7sFspUIePC5rbRl78GNjacq4RrsQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 28 Mar 2024 10:25:43 +0100
Subject: [PATCH b4] ez: Prevent overwriting an unrelated cover letter
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-avoid-overwritting-cover-letter-v1-1-161d30ee533c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJY3BWYC/x3NwQqDMBAE0F+RPXfBxgjaX5EeTLLVBUlkE6Ig/
 nu3PQ0PhpkLMglThldzgVDlzCkqno8G/DrHhZCDGkxrbNuZAeeaOGCqJIdwKRwX9D/hRqVo9L1
 1PpjRaR90ZRf68Pl/mMBZeN/3F2sYtNt1AAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=T84krUeqYanzTm8AWJb336byBlCwRJXIWG26SEX3hiY=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGYFOdbIZu6PdiZBho1SgVoyooiHgKhV4eZB7EZLN0ZhjGi+EIkC
 MwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJmBTnWAAoJECCtLsZbECzitNIP/ibbgkubSg
 SkR6GL2lMQ2mG4UtUYmVxb4PpiIbChyp+NE8+/FuDM4nzuVj4oMe0V9ui/Mnx4iRj8yn/a6ey1qMS9
 jdYHFTAnky2GeFOfWOHamy6BzIexbgk1LdWQo8Dqsz1H4RhduASNiCcDBBMQMC7HJiR6dq1t2tsQSN
 T3U4v//tXwjbo1i7W90vNNiz1I8Z/H94qtCHNX2lAQikNGz83plMDMm2BttPF+6aZlm2yXYSQmmFzY
 B3oUrn0NDYXpbwN/ioSC/XGO8u2P9Yqd+CUA1QFZqJxfz6NlqJhUFfF4O/uAFyJfHRkiPxcfsVZChw
 KrxnkG+2eJJQ19+in2eUBeJLkRkTgpRKCbOHgh9dHC0Q5eERovCnlpNV5TQXqyj/omm9joxui402HK
 riqDU46cmVaWZHAfYRSzSaPp9tzDxfpFuH4s5ju8PL6P73Hf/oohq2+C5JSZBWNiOGTvT43Lf6z/wn
 hwmm+DKf+u4v16QV/je17jmiXXMJmanqizUaZz2g0ks/FKmt5Sy3WpF/y/QCLf+2hAOoMSGJbYu4ei
 CCkjCsdfSOz+VyHo0KzOjX76FMPrt+9O6aMkJpS83rTxL76PhkWx0QxHu6TZeyxr5c34eRUyCx6not
 CqLlxbHNTvcAcCIAtYn0hQRRi/n6EigqWkatKuSeIJiLTciZhr
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

When editing a cover-letter, b4 expectedly selects as base the
cover-letter of the currently checked-out Git branch. When
saving/closing the editor, b4 also saves the changes as the
new cover-letter for the currently checked-out Git branch.

While simplistic and apparently totally fine, it does not play well
when working on multiple branches. Said otherwise, the following
sequence of events will write the wrong file, possibly smashing a
valuable cover-letter:

	$ b4 prep --edit-cover
	<make some changes>
	$ git checkout another-branch
	<oh, I forgot to save and close the cover letter editor!>
	*crunch*

Add a simple check to only overwrite the cover-letter if it corresponds
to the one that was originally opened, otherwise warn the user and save
it in a temporary spot.

Cc: tools@kernel.org
Cc: miquel.raynal@bootlin.com
Cc: thomas.petazzoni@bootlin.com

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 src/b4/ez.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 1d360410d771..c322953564a0 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -8,6 +8,8 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 import email.message
 import os
 import sys
+from tempfile import NamedTemporaryFile
+
 import b4
 import re
 import argparse
@@ -758,6 +760,8 @@ class FRCommitMessageEditor:
 
 
 def edit_cover() -> None:
+    # To avoid losing the cover letter, ensure that we are still on the same branch as when the cover-letter was originally opened.
+    read_branch = b4.git_get_current_branch()
     cover, tracking = load_cover()
     bcover = cover.encode()
     new_bcover = b4.edit_in_editor(bcover, filehint='COMMIT_EDITMSG')
@@ -768,8 +772,15 @@ def edit_cover() -> None:
     if not len(new_cover):
         logger.info('New cover letter blank, leaving current one unchanged.')
         return
-
-    store_cover(new_cover, tracking)
+    write_branch = b4.git_get_current_branch()
+    if write_branch != read_branch:
+        with NamedTemporaryFile(mode="w", prefix=f"cover-{read_branch}".replace("/", "-"), delete=False) as save_file:
+            save_file.write(new_cover)
+            logger.critical(f'The cover letter was read on the branch {read_branch} but the current branch is now {write_branch}.')
+            logger.critical(f'To avoid overwriting an unrelated cover letter, the operation is canceled and your new '
+                            f'cover letter stored at {save_file.name}')
+    else:
+        store_cover(new_cover, tracking)
     logger.info('Cover letter updated.')
 
 

---
base-commit: 23970c613f40356cc88716d07c2d427ca024e489
change-id: 20240328-avoid-overwritting-cover-letter-554bcd29b240

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>


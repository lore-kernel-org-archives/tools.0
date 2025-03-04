Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986478F33
	for <tools@linux.kernel.org>; Tue,  4 Mar 2025 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093245; cv=none; b=tSUQD30bYjVX6ARH0IqtrVdAmgatj4s2nxtcnrwquLbldlV3ujKuxGFrdHlCltJOyLKjeHNcAbU1v/uxTFYIrNRPE8TW4Is0od+QlwaWTMbELEmrPkAlwmZBBJ7x2w0Z0awAQlaGXACq61Ru+nSNM55Wfe0wx0jMzEeHgBPbJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093245; c=relaxed/simple;
	bh=+yzFBHzweKWANsiCjbl2VE6BMOFZDYL4Gpk1JdnJsUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqNkkoUUSqXq6PdUzzQOv7PS8bINExFngmNmvrcciS00Ew+io8ocOg/8pumViQvjY/0ay2SPtP5qQ8aIbV1Ep2qT2/MKUelhUKzbt8+axQ9jdkcdy3sDkvr7fxsQWGbsBIMQM+TwEBfcM6t+qcS6yhm/uh3ArRDTrfL8mHqqA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZmeXahz4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZmeXahz4"
Received: by smtp.kernel.org (Postfix)
	id 31137C4CEE5; Tue,  4 Mar 2025 13:00:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36B41C4CEE7
	for <tools@kernel.org>; Tue,  4 Mar 2025 13:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36B41C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD4B44272;
	Tue,  4 Mar 2025 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741093239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EX4hLo1FFRK2SrVcsovV+LpGYF34zCN5rNMl80Jz1W8=;
	b=ZmeXahz4yJOMjkvGFvEhW3AxBIn68zBa/qZHe0n4/Y4AKNdhh3GHnG7k2TRaEF9/fqsmml
	qiNFV4o2pHcykGq8Zu/JPKoflf5kTTbffbSFfoTvIpJOzol3OO7l/srpGa4uqZFosk+gsL
	HCeD/LcyXdEQKlMUN8xLUES5G9hblBirVrg3mInSDXVKgfe1ly3gwA4qRhA0RMnHiBXVWZ
	aBXU0os+l90RwuMKdqsbbpzfItGg9Aws9ic1gdMPmR0hksAwvF4kM3DOMJAAA3gTn3OM+u
	IfHOPiHSsxorRGKJ3FBUYtx1oGeItM3WbmLp7xpfG40BMF5k7gaBjPruvRk+OA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Mar 2025 14:00:29 +0100
Subject: [PATCH b4 v3 1/2] diff: support passing arguments to git
 range-diff
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-creation-factor-v3-1-d6515180b7e5@bootlin.com>
References: <20250304-creation-factor-v3-0-d6515180b7e5@bootlin.com>
In-Reply-To: <20250304-creation-factor-v3-0-d6515180b7e5@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3588;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+yzFBHzweKWANsiCjbl2VE6BMOFZDYL4Gpk1JdnJsUY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnxvl3hTYOXkDfjLfWFUcwtlNTc2+mWetyZJRjT
 tH4F+xYKqqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ8b5dwAKCRDRgEFAKaOo
 NueYD/wNQRiP/rr3nE+qOmZ2omk0fliumGrS5RWqsG3G61/S7S2qdS0pM2/QA1xGn/aqitmMno+
 Pt9HlDPcRyQ4cW1NMxJfGT21chf8dulu2KhUePjYAzxBrhvy8JLPX2x5pvNX7xy2trulvkMXlhV
 TmqB9NWfARYDt9VSTNfoZ206EvFoZmi8rPsSfxcTMIgL8uStuX2dpfAvB/9X7gNA19Yq/n0HxwX
 UA9q/+uTyRlST4ZKS6i7BtnPFm+cYwoukeElImHOu7GE+B9+kqGPRKOGctSBe9A+jNLaJhdOw87
 W++njaqqlBMltX7KAro/i2qRebGQr4ILj6OxgKxHkAifF3c8xjlye1Rj836ZHJGslF0xUhrJMcc
 N1dk/pnr88LC+bTXXIVvlwtc6vx7gionOyT5YNMvWXXYhx767kgxs3ax7+YNqknUHfHfkTWGQsJ
 ITjQLkhJyatjWMJYjRqhOXMNbRk4VvaKdh8wqTUh/07rx7uh+XaO008SOnPuWxB/3KSLdyeBZvi
 W2NYIe5JPgUzK/zO43q8g5l1UUA1K3rnW3eLLXevVzwGRa0b4cC2mETpyHGIiNroYXaitJ09ar0
 6GdIw4AC56nZUirY3+Yqn+ODY0BT9PoZB+mqMctAA34cUB0d/nOiuBX92PLZbss2ByNUk84J2K1
 TIy2XndLIudEkDA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehtohholhhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com

Add a --range-diff-opts argument to allow passing arguments to git
range-diff when comparing commit ranges. This can be especially useful
to override the creation factor or adjusting options that affect the
behavior of this command.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 docs/maintainer/diff.rst |  5 +++++
 src/b4/command.py        |  2 ++
 src/b4/diff.py           | 12 ++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/docs/maintainer/diff.rst b/docs/maintainer/diff.rst
index e6ba12ef1caf956b60a6022892c26b6af8de5de1..7911cdc054ef58d6f8c92383f23914962a63d659 100644
--- a/docs/maintainer/diff.rst
+++ b/docs/maintainer/diff.rst
@@ -42,6 +42,11 @@ Optional flags
   Compares two mbox files prepared by ``b4 am`` instead of querying
   the public-inbox server directly.
 
+``--range-diff-opts RANGE_DIFF_OPTS``
+  Additional arguments passed to ``git range-diff``. For example::
+
+      b4 diff --range-diff-opts "--creation-factor=80 --no-dual-color" <url>
+
 ``-o OUTDIFF, --output-diff OUTDIFF``
   **(DEPRECATED)** Sends ``range-diff`` output into a file. You should use
   ``-n`` instead and redirect output from the actual ``git range-diff``
diff --git a/src/b4/command.py b/src/b4/command.py
index 617a2d7ded8f673e33a4b1c2a09b08c415135a2b..df2ec55ee9da6440b4176bee14ef011aa717f6f0 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -286,6 +286,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Force color output even when writing to file')
     sp_diff.add_argument('-m', '--compare-am-mboxes', dest='ambox', nargs=2, default=None,
                          help='Compare two mbx files prepared with "b4 am"')
+    sp_diff.add_argument('--range-diff-opts', default=None,
+                         help='Arguments passed to git range-diff')
     sp_diff.set_defaults(func=cmd_diff)
 
     # b4 kr
diff --git a/src/b4/diff.py b/src/b4/diff.py
index 1de3063ea0b3c73e4e3d8bfd4ec91b4c6f90cce6..099ea8ca8a42e5e8261340b3e1d54a923d41b493 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -16,6 +16,7 @@ import email.parser
 import shutil
 import pathlib
 import argparse
+import shlex
 
 from typing import Tuple, Optional, List
 
@@ -156,7 +157,14 @@ def main(cmdargs: argparse.Namespace) -> None:
         logger.critical('---')
         logger.critical('Could not create fake-am range for upper series v%s', user.revision)
         sys.exit(1)
-    grdcmd = 'git range-diff %.12s..%.12s %.12s..%.12s' % (lsc, lec, usc, uec)
+    rd_opts = []
+    if cmdargs.range_diff_opts:
+        sp = shlex.shlex(cmdargs.range_diff_opts, posix=True)
+        sp.whitespace_split = True
+        rd_opts = list(sp)
+    grdcmd = 'git range-diff %s%.12s..%.12s %.12s..%.12s' % (
+        " ".join(rd_opts) + " " if rd_opts else "",
+        lsc, lec, usc, uec)
     if cmdargs.nodiff:
         logger.info('Success, to compare v%s and v%s:', lser.revision, user.revision)
         logger.info(f'    {grdcmd}')
@@ -164,7 +172,7 @@ def main(cmdargs: argparse.Namespace) -> None:
     logger.info('---')
     logger.info('Diffing v%s and v%s', lser.revision, user.revision)
     logger.info('    Running: %s', grdcmd)
-    gitargs = ['range-diff', f'{lsc}..{lec}', f'{usc}..{uec}']
+    gitargs = ['range-diff'] + rd_opts + [f'{lsc}..{lec}', f'{usc}..{uec}']
     if cmdargs.outdiff is None or cmdargs.color:
         gitargs.append('--color')
     ecode, rdiff = b4.git_run_command(cmdargs.gitdir, gitargs)

-- 
2.47.0


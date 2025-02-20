Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828141FAC5F
	for <tools@linux.kernel.org>; Thu, 20 Feb 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061512; cv=none; b=RpwqnWfJG472UiEw15VnCQ6tMeKGsDZgOuHnHtt2NFslB0qwf0U+KMekiJnBKj60faCwpDiG91rxNs7yQDYiB6DKmPb3isoim/WXZ0tPMsfRrlBufQYGHM3BDcMMz+UZPJbj3bSI2OsgMNo3+EmRP5Hk55fzjzoX9Npy6AfkXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061512; c=relaxed/simple;
	bh=6Q1tspBvwecRZLovSkVAAQZ4LeeFg+3iN1JmAldSi0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EE/aQ48jLjzezTyixMU/tM1WqZMzkY64GkdrQLexYf3brEynnBMBs0v0E9yOIF6GcEQeDpvm/raevcEVeZIqkrULz5PAsIbIrEP2Q7sWzP+cpv2SHmqvLzj3MbbvKSuQBBB3NgIrxKxBvHZxVM3ZD9T/OvjePdb5Y5vFVAGd854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VTYtoWNQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VTYtoWNQ"
Received: by smtp.kernel.org (Postfix)
	id 2B920C4CEDD; Thu, 20 Feb 2025 14:25:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43795C4CED1
	for <tools@kernel.org>; Thu, 20 Feb 2025 14:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43795C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48183433F8;
	Thu, 20 Feb 2025 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740061502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reTf09HCXsTnnPsoQy3+csOOvSGop1ndvmnOv+7j/JQ=;
	b=VTYtoWNQ9wvzQJLhpr/wF9QcaFG5cue2QqL7arOVASGV6vhlCvpYgy/XHFVNT0tul2vco2
	ThnNJ24mlqrv3dB6bgBLZJL1u6XS+EhjETdVjUa/+J7ZCeESlJHZrqbzOQL+WdZHNam+0/
	o/WCxjOcz5F5xGHTGuKfk4Wk/PwxKyH9pzxnWpwD7r4MWDv6FaVkOdgb6kXDe3Qziz0/0X
	XdVv6EMDAxOksLvW4DDiMJplLFJOj/uKWK9fZAkYwAwXjd15GrjSW0yn3F16lMU5y0mJos
	cx8y6wc9JP/vyC/anoGMQe/gAewW1PxFH1ddFyppb+Om/Fenmeit6c7PgWQSeg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 20 Feb 2025 15:24:57 +0100
Subject: [PATCH b4 v2 1/3] diff: add a creation factor argument
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-creation-factor-v2-1-7a0949a3a060@bootlin.com>
References: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
In-Reply-To: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2805;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6Q1tspBvwecRZLovSkVAAQZ4LeeFg+3iN1JmAldSi0U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntzs9r8QmaYZqkvA34XD7gUpwvxxg3POQO345V
 CogweOs30CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7c7PQAKCRDRgEFAKaOo
 Nkk5D/4nAYmnBaCODa9mLEt3CB62RTJnmqaxgme+pufeD8gzHqTtxiiGFTtGOoWprWQxfVlAZks
 CdjwQRxQXm1mNTyXcwOawYBmu28FHLFeHgCwneBxalxhHu+DLD+RE3KYnS5JWo0stxoxzEi2mwz
 vnks0wID/ifdGOAmCxlV1aprCJ97OI/PnZDyIftyD/EY4iWH9w0ayyMHzehccpoI02FRPudDYNp
 C7vjrKW9iHLHgT6y2MRkLaslqttNMZ34/dOqn0PbJOiXHBPM9Trh2MDaKfQCxuTNy4Z2psGEX8M
 KrRtL7Wbaa0S1L1pTaNxsavJaQjCkvz7aDzKVN6JQyQHwgY5AtlUOgAPOl9jly9j5mwy4t15MbD
 A16YjZ+iKRg6uCZ7eiAGJ0FiBGUWeNHeCp8BFH8HhEuVk32FWZudXooO+4WVLdqcBL2HK6qWWwi
 WLDZ3Cj4exkYlqUvLa5eZnrHOTHudhPNiVNud1yIEhHEp650lBdFtpNe/m2gHJRni7YociWbNz7
 y3WDp/KfgOP362e/3ciA2aXwx/konuo/HPY2UrkUK5QNlNMZzVI0XhKTW2wn8zK6auK1B1LtLSo
 Gdmre82mYG6cE+KEiSX9o/qer43uy/p9RSRWI0iwcIZyMe0kbOgtZysz4Dq84j/PwED+IrVuGKC
 swMBRq0PGB5TC+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com

When using git range-diff it is possible to override the creation factor
when git considers a large change a total rewrite (and so showing no
diff at all), or a change so small it shouldn't be considered.

This parameter is only possible to set from command-line, it has no
global option associated to it within Git's config, so add a
--creation-factor parameter to b4 to achieve the same behavior.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 src/b4/command.py |  2 ++
 src/b4/diff.py    | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 2bdd785d90004bc0be9c839fe50938dc9cbbe207..1a9bd1c0b02181b432d535eee2fe0c4f510cf39b 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -287,6 +287,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Force color output even when writing to file')
     sp_diff.add_argument('-m', '--compare-am-mboxes', dest='ambox', nargs=2, default=None,
                          help='Compare two mbx files prepared with "b4 am"')
+    sp_diff.add_argument('--range-diff-opts', default=None,
+                         help='Arguments passed to git range-diff')
     sp_diff.set_defaults(func=cmd_diff)
 
     # b4 kr
diff --git a/src/b4/diff.py b/src/b4/diff.py
index 1de3063ea0b3c73e4e3d8bfd4ec91b4c6f90cce6..0fe6e26d4e3a7a0fea4c7e14cabdfd366361968a 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -16,6 +16,7 @@ import email.parser
 import shutil
 import pathlib
 import argparse
+import shlex
 
 from typing import Tuple, Optional, List
 
@@ -156,7 +157,12 @@ def main(cmdargs: argparse.Namespace) -> None:
         logger.critical('---')
         logger.critical('Could not create fake-am range for upper series v%s', user.revision)
         sys.exit(1)
-    grdcmd = 'git range-diff %.12s..%.12s %.12s..%.12s' % (lsc, lec, usc, uec)
+    rd_opts = []
+    if cmdargs.range_diff_opts:
+        sp = shlex.shlex(cmdargs.range_diff_opts, posix=True)
+        sp.whitespace_split = True
+        rd_opts = " ".join(list(sp))
+    grdcmd = 'git range-diff %s %.12s..%.12s %.12s..%.12s' % (rd_opts, lsc, lec, usc, uec)
     if cmdargs.nodiff:
         logger.info('Success, to compare v%s and v%s:', lser.revision, user.revision)
         logger.info(f'    {grdcmd}')
@@ -167,6 +173,8 @@ def main(cmdargs: argparse.Namespace) -> None:
     gitargs = ['range-diff', f'{lsc}..{lec}', f'{usc}..{uec}']
     if cmdargs.outdiff is None or cmdargs.color:
         gitargs.append('--color')
+    if rd_opts:
+        gitargs.append(rd_opts)
     ecode, rdiff = b4.git_run_command(cmdargs.gitdir, gitargs)
     if ecode > 0:
         logger.critical('Unable to generate diff')

-- 
2.47.0


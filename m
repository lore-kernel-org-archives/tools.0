Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095078F33
	for <tools@linux.kernel.org>; Tue,  4 Mar 2025 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093246; cv=none; b=NREjHGosZiL6qzDjzd/EnNrgazjCdbuWzoesTdfjPADOTrQ0BWIcVHmFLca6KSYftgM0n++sFs+l6VXxIkCwKZy+0lcauhWctoq4aG1+Gwuoio0tEAYiG66qyW5EEMjEg3ySwfYfQja6HWCL1HW8cM5e/i0Nm6JseLjBZcw0K9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093246; c=relaxed/simple;
	bh=dEAZfODlI4g6crH6ocAGyqlIylwzXt+ToDKes/kfLk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrP+CAguodi1HqCGrmF96SdgOnPGCGH2lmj1IZPo4KTOERleqGoaIVT++xA2Nc7H3EJ4yNyuuZHtP8Nkcf47Orgzfb2eaibj6AnyBiONwHkRNUbjQcHWUBWi0ekFgk6kC/w1scVs1atlPnMWyrLGFbMmozItCcfyfNhFCs3+1ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZJvEo0ob; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZJvEo0ob"
Received: by smtp.kernel.org (Postfix)
	id 3430AC4CEE5; Tue,  4 Mar 2025 13:00:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 376EAC4AF0B
	for <tools@kernel.org>; Tue,  4 Mar 2025 13:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 376EAC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3653442A7;
	Tue,  4 Mar 2025 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741093240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xuSKybCaRsL15iNNspKFcVE7lXBHq8J9MPVVmicRqi8=;
	b=ZJvEo0ob93WYg+4F8Kw/TE/1vs+0RHGqw7UWvOG5sxxxJcVS30Zs3OtbVMV0yAhMS4KLSX
	cS6tM36aAYUefOsyBcBfjNhVyjKztA3JuNQVfV24sGugQVER53PBArXamd7gO0Lu4YuZVu
	sgRdDFcFTtgln7EpiozTL7eOWQQ6MYPQEAzRGVHifiOJDAaoeZUoTm/gKSg9pOZq36kgkO
	vqNH/0grctlUf9qPZu420gv6DtUBpuM9xkpGrQGozj6URKJVmF3+pO+GRGJ6zGCHrotKl+
	RjbwrMj6JNMH67fbB3q86evOqBc11S1ThMTLUKnIaoiu3X9SnaRPgrJ/y44F0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Mar 2025 14:00:30 +0100
Subject: [PATCH b4 v3 2/2] prep: support passing arguments to git
 range-diff
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-creation-factor-v3-2-d6515180b7e5@bootlin.com>
References: <20250304-creation-factor-v3-0-d6515180b7e5@bootlin.com>
In-Reply-To: <20250304-creation-factor-v3-0-d6515180b7e5@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dEAZfODlI4g6crH6ocAGyqlIylwzXt+ToDKes/kfLk4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnxvl3N+389REb3MCIU+9fKY8vc3nRt01cDT4RP
 jQ7m7KLNKuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ8b5dwAKCRDRgEFAKaOo
 NgceEACrBouaIoYtfbigE3i/KyeIQ32Hmu29QX6EszV7lQTZ85utYCXa4E/B0EqbbRl4KSpHMqD
 vlztbvweWSNCGcYEtNfS1uoYNWoVyhdW08z7E6CZpPqUoiZynUp8pQgqKJDSyAG7yXka6vjlF5w
 bnZoF8y19pj9q6jYeKwy9bcPBLpo+vsqQLrpAMR1//rZLOR7L8SRns/+B+rsk2Kz9D09IZB3wgt
 ZwbGLvdZjRWX2f6RTOVd73gbKNcCgy7E5SvvAw/JP1MtBzEB5a+Kn2AaeTIkkcdoe5KWQtuMsUo
 cmq+Oo9IOEvf45IfvcPOHpM0Vbzs93GqjAUCbIb/JUhVQaWjgypY8cKE18VtaUp9JwjdbvbXpsf
 M5p8sjIPRxH1vo3vuwBdTeHPH1d/ubQjSck21lF4OS+p8fMbtVlZ2or+LovK91NzN/xPe+Hu1xT
 QkXLYlW0rb9nsi5LOcKRxoPOEOQPbJp7P9vgKhu07ZVVHlRGQVy1zkK1W+JbN61sndhE7gxWLKd
 CSmkofTNrBakOR6pklLL7viBzWTofCf43X2grEZ4ftn14tEw8pLFIjOX16weI2BLzL+ltt8QmzK
 XbKtHZpSyLo7gX0GbbSkY3FmlUDFl1KlKtHhuuItlYkyB8YSoEwD/Ztl57cxxyTxwLHvT5HaP48
 NT1vnH+frTXySJQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehtohholhhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com

Like the previous commit ("diff: support passing arguments to git
range-diff"), make it possible to pass additional options to git
range-diff, which can be useful to modify the command's behavior.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 docs/contributor/prep.rst | 6 ++++++
 src/b4/command.py         | 2 ++
 src/b4/ez.py              | 9 +++++++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index df8582426850df88b9e174e6429837e1eb49f792..18c710dd415794f5c1587b3375d86c8761c57602 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -494,3 +494,9 @@ modifying defaults for some of these flags.
 ``-e ENROLL_BASE, --enroll ENROLL_BASE``
   Enrolls your current branch to be b4-prep managed. Requires the name
   of the branch to use as the fork-point tracking base.
+
+``--range-diff-opts RANGE_DIFF_OPTS``
+  Additional arguments passed to ``git range-diff`` when comparing series with
+  ``--compare-to``. For example::
+
+      b4 prep --compare-to v1 --range-diff-opts "--creation-factor=80 --no-dual-color"
diff --git a/src/b4/command.py b/src/b4/command.py
index df2ec55ee9da6440b4176bee14ef011aa717f6f0..4b71d8a81f7e4160632d76a8c993fc396efc8d53 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -309,6 +309,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Additional prefixes to add to those already defined')
     sp_prep.add_argument('-C', '--no-cache', dest='nocache', action='store_true', default=False,
                          help='Do not use local cache when performing remote queries')
+    sp_prep.add_argument('--range-diff-opts', default=None, type=str,
+                         help='Arguments passed to git range-diff when comparing series')
 
     spp_g = sp_prep.add_mutually_exclusive_group()
     spp_g.add_argument('-p', '--format-patch', metavar='OUTPUT_DIR',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 61918f57722e817781b74d7a700fea030bc2145f..156926aae33c84106ba8197e43dba249cf698c8b 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2550,7 +2550,7 @@ def force_revision(forceto: int) -> None:
     store_cover(cover, tracking)
 
 
-def compare(compareto: str, execvp: bool = True) -> Union[str, None]:
+def compare(compareto: str, execvp: bool = True, range_diff_opts: str = None) -> Union[str, None]:
     cover, tracking = load_cover()
     # Try the new format first
     tagname, revision = get_sent_tagname(tracking['series']['change-id'], SENT_TAG_PREFIX, compareto)
@@ -2580,6 +2580,11 @@ def compare(compareto: str, execvp: bool = True) -> Union[str, None]:
     lines = b4.git_get_command_lines(None, gitargs)
     curr_end = lines[0]
     grdcmd = ['git', 'range-diff', '%.12s..%.12s' % (prev_start, prev_end), '%.12s..%.12s' % (curr_start, curr_end)]
+    if range_diff_opts:
+        sp = shlex.shlex(range_diff_opts, posix=True)
+        sp.whitespace_split = True
+        rd_opts = list(sp)
+        grdcmd = grdcmd + rd_opts
     logger.debug('Running %s', ' '.join(grdcmd))
     if execvp:
         # We exec range-diff and let it take over
@@ -2792,7 +2797,7 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
         return format_patch(cmdargs.format_patch)
 
     if cmdargs.compare_to:
-        return compare(cmdargs.compare_to)
+        return compare(cmdargs.compare_to, range_diff_opts=cmdargs.range_diff_opts)
 
     if cmdargs.enroll_base and cmdargs.new_series_name:
         logger.critical('CRITICAL: -n NEW_SERIES_NAME and -e [ENROLL_BASE] can not be used together.')

-- 
2.47.0


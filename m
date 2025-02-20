Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4B1C174A
	for <tools@linux.kernel.org>; Thu, 20 Feb 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061513; cv=none; b=ARFfZnrTVMog1FhbP3O97L8C5S4VuaGY63BroCow+ujpfVrkmjGhPxCphaCmxvODC0mWc9OyoXcxuVscJaDDIp7xBul8hEnVot/q/pQ+OEhenJzv55svARp2Cv7Rq5hdfRrsq4yBykMHmO5oPK6w4sc0jwrxxNOAJrFE9hQiqpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061513; c=relaxed/simple;
	bh=6C4fVJAQgARykHvPD+ihfdzuZvnAK4vrYJFgYwiFjAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCkpCb8+9Eb16jiWG9dcxT0kwRls98B0E5QMwl+zfeka70l7wFXhHnUolQiqN2fLMneVSZM7ldbGTNuZrP1ZHjPZkZmnH3dyEXekwwWgj8CeP0BxGXRMZT6VWw/cF1F/9KJTuHsnsjbGrIIkGFiKG3yQJDOFGkvG7RYdAlbkb1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MoO4MBjW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MoO4MBjW"
Received: by smtp.kernel.org (Postfix)
	id D3158C4CEE9; Thu, 20 Feb 2025 14:25:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 462EDC4CEE2
	for <tools@kernel.org>; Thu, 20 Feb 2025 14:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 462EDC4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E7C0443EF;
	Thu, 20 Feb 2025 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740061502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSlxLgN30Y7fueWp/DdsPNb6pUSCb4DPwyawY5N3v7c=;
	b=MoO4MBjWH5hXE/Y+j+NAeodOobh5O0aV8S6SMyki8ut08Xt8Lj7fUbXPTSsIFFekRiwXp1
	5NUGuGhebemVpV+3sbLoitavqF+xW4nY3CCwMrSNrzSwDCHJ470lL7o1snqirJLUbIebnk
	E9gQBrIfz8cpk3HkK49IzJsQl6L9i5LqITP2nMpITQPuU9kh8RCA56sv5thpake6lH9Hyu
	wWtBBYk8vzSWHgSck1w+bX+XMhjVWvh7zlGhPbXdK/M/mvskcOfUSaMmgGSA4I0g1nkKO/
	609cydRUU048gW5DWZzKC1Gm/w38x5PWwLeJ6j7GLUMXWWqNIEoJZiL+yH0XVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 20 Feb 2025 15:24:58 +0100
Subject: [PATCH b4 v2 2/3] prep: add creation-factor argument
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-creation-factor-v2-2-7a0949a3a060@bootlin.com>
References: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
In-Reply-To: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2858;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6C4fVJAQgARykHvPD+ihfdzuZvnAK4vrYJFgYwiFjAE=;
 b=kA0DAAgB0YBBQCmjqDYByyZiAGe3Oz2if2azfHq+4x1FH1ZpSq0TjZROpCTOQz3s9vnypLr6U
 okCMwQAAQgAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJntzs9AAoJENGAQUApo6g2EcsP/AoC
 UnkwL2NnZaVTIqOI6p6JerlkgrswLR+2WjAXpJJ+RYBWSbsz6LudbKCa7+a9eXWYO53/bM1d0UT
 be6jAriKMtxV+uea8GIPg7GHgkj3NYCycp1KRHH/hvCAxRXC/33u9BX8JUccxkv4LUk9FWDSK+P
 svatc3nzXp0XeOLE4/0R2cApSbVLSBUIPCT+R2mT2yAoyxGls1hQrmQRFb+mflZwqeWrOstLK7c
 Y7fRwa0TXUdyHDtgTVNRQqf2i0WKKlT3oewekY3e6qfM39d85bSFoh5iqfKM5SNaxus0Xak9lda
 NrlghBCdugZyvGXd6PWDWOTVvw9eLnVESwPbjnQAvAqHjPdbfa90xIUFYe4AVWRZfK5Je7bzqjv
 jQZk6aiOuaW5sigyhpjx611i9yKUFOwzWWjOZlJMUuysq3L/Q+M8LupxKCE5+DNXv+LEVj8oaS5
 iti8aYj2QPaRowRmabiWGQ2hcZNnMjKidshvlVMUWYtTZBoOX/IyvrPU6kcnuo0o0swnUL9C/iY
 fJWWEIZvzKGW+LaTrLbEFMOeXelD30YE9JIG7No6egIG44zEt/PZX86dacmryt/7JD/sXxu9iC+
 K0WiSaVDP9ws4FK9p2ihGffAeSeTs6Y5Thfbk6BI4qFnTxdntpYOmpj7Cd+cx7YUh+rzy12Sppn
 Z85oO
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com

Like the previous commit ("diff: add a creation factor argument"), make
it possible to pass a creation factor when using b4 prep --compare-to.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 src/b4/command.py | 2 ++
 src/b4/ez.py      | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 1a9bd1c0b02181b432d535eee2fe0c4f510cf39b..d1624c736195a1a1f023629afe06cf184c727098 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -310,6 +310,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Additional prefixes to add to those already defined')
     sp_prep.add_argument('-C', '--no-cache', dest='nocache', action='store_true', default=False,
                          help='Do not use local cache when performing remote queries')
+    sp_prep.add_argument('--range-diff-opts', default=None, type=str,
+                         help='Arguments passed to git range-diff when comparing series')
 
     spp_g = sp_prep.add_mutually_exclusive_group()
     spp_g.add_argument('-p', '--format-patch', metavar='OUTPUT_DIR',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index f381727d9bc6fe0d29328ef384647e3a6a23e767..d3dfea47a20a5622d2f8a349a731d25769e1a664 100644
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


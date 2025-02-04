Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D41547E3
	for <tools@linux.kernel.org>; Tue,  4 Feb 2025 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687524; cv=none; b=ZLXOs2ZiMaVW9kWx4mJxrIV17myR+G+qpHpMsaeG+v07SAwYR9AvVDjfWD6qKZwiqd5M4cQ/62mgCoXp5BIKhk3Euv0172Dlo9W50ErVbzYpFL7vTrpMMy08F08rlnIswMY44LtbK77+P/6zaKsnj1SXR0oudnniha5gffcZezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687524; c=relaxed/simple;
	bh=60ASQYUs5BSm4zXdZIUVM2TGywURQdvK7PKQO/h5/mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pp7nf9cGNoYoYHG0mA6u0mcFPbmtiLUTAIEYsvvjrnuljkdIKXzRrjT3E3fm381+oQx/P+vQrIJXjffRR+CCZzrRkP5mBPfpSA95iekkUNowCE3+B/eCmbcZovIT+oyqtCJVmvHXj2/+oBAJH2dnzM03CaPPHaQCkG7i0zJY08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Sgxu0uat; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Sgxu0uat"
Received: by smtp.kernel.org (Postfix)
	id 5EA42C4CEE8; Tue,  4 Feb 2025 16:45:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95838C4CEE3
	for <tools@kernel.org>; Tue,  4 Feb 2025 16:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95838C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6266744299;
	Tue,  4 Feb 2025 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738687513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WaB1TYF4NPYL1ia/rl6OwyexVHi+A3IT4+UqO1Oees8=;
	b=Sgxu0uati2oifmjX5ISxCMH+/sfzPn4N8pmhEU0RkQGF/QBuHHf2p0kGRPROMDkPMNCZqb
	GsZYdGB0RSzEhZshzLHORx4aFv7JQkDSHR2E2bNMnv8W2KoGo0WspIzpfu0x7ZTr1xzExC
	4Fczj4LNJ+dyyTTcbrTuwdEs92bCVnxFAvAKqElJo5HDsnkppLsT6uZbFbxuEY6zRjnjTX
	QXq0u/lL/Q79qMSiZD+ULu3fNq71kTD2DSbcD81PM2sT0XoJvUYQseO96EZUFKmFty5D8e
	fcEZzhIbrLFOTfN3hvXvt2tKa3yyguxrs72LFwN6G9YC1D8DUaWqV0pEoZe2Sg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Feb 2025 17:44:17 +0100
Subject: [PATCH b4 2/2] prep: add creation-factor argument
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-creation-factor-v1-2-9988d594a018@bootlin.com>
References: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>
In-Reply-To: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2642;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=60ASQYUs5BSm4zXdZIUVM2TGywURQdvK7PKQO/h5/mI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnokQYJ+O/46j9yB+5kAl02aPoL+TWXsciTPT7q
 NpQmocw6DSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6JEGAAKCRDRgEFAKaOo
 NuGVEACIRw+z0Pw9rdp7iGRp/F80GUeGokg77Sfrj0wkuaZjmyQwrbGOh6chBL1tqvZgZIxeTtL
 9wF7NTP8LUTiXMDZZXvZV9WdPoyXn+9rVTkPobSdEDuIcp+yXh++7fIZ1k3/xjkegK0xMcgMi9m
 F0BFPxxbYxGVTTcRKxb2+V/Tss4yypqIq9sGQOa/eKUtJqPQqMQlFj+39HP7IUdGTDXvkrL7/0a
 dHija+eYKvjBXMsy3adqfYPaKlZb0Ogn3YCW+cdejvaq1ZN+PQ2vfHUi88bfukbi9qNncTgMBvi
 s3poMaZMjqXl2sCViW9amDYTYnIfbv0gZ+QFS+7fQiZMUfrmL97HweXikrRTRbYy3VxgPTiD2Vw
 RRv4tRCyPfzLDR4A7MWRnhQg/lkC2ePhHa5dYbdXElQK+cvrpJPx7lcTihh0eMCa52+d6Z/tq16
 NUffFYVFDHVTTux76yZjJ6RoqENBftXTtr2Hyw4tdc8k+fMY/uEpDMugpYXg8omebZgdrarAaAt
 zB+oxDAcPJYVdnv/iEmA7vOz9o6VJM9+S+RooWpVRg1UWLOei2P6JKOAy0FVwkdTxJVjPRF7OKk
 JZXNFCyQlloQzQk47+6VadhqSxuVKfbtrSYBy4U3fpgbb9jEPPx0wgbwRmPo+AMqNhM5nvHl9gw
 Xa/oIQZ2hKuwXMQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com

Like the previous commit ("diff: add a creation factor argument"), make
it possible to pass a creation factor when using b4 prep --compare-to.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 src/b4/command.py | 2 ++
 src/b4/ez.py      | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 0485196..d4a70fd 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -310,6 +310,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Additional prefixes to add to those already defined')
     sp_prep.add_argument('-C', '--no-cache', dest='nocache', action='store_true', default=False,
                          help='Do not use local cache when performing remote queries')
+    sp_prep.add_argument('--creation-factor', default=None, type=int,
+                         help='Creation factor integer passed to git range-diff')
 
     spp_g = sp_prep.add_mutually_exclusive_group()
     spp_g.add_argument('-p', '--format-patch', metavar='OUTPUT_DIR',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index f381727..d76acae 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2550,7 +2550,7 @@ def force_revision(forceto: int) -> None:
     store_cover(cover, tracking)
 
 
-def compare(compareto: str, execvp: bool = True) -> Union[str, None]:
+def compare(compareto: str, execvp: bool = True, creation_factor: int = None) -> Union[str, None]:
     cover, tracking = load_cover()
     # Try the new format first
     tagname, revision = get_sent_tagname(tracking['series']['change-id'], SENT_TAG_PREFIX, compareto)
@@ -2580,6 +2580,8 @@ def compare(compareto: str, execvp: bool = True) -> Union[str, None]:
     lines = b4.git_get_command_lines(None, gitargs)
     curr_end = lines[0]
     grdcmd = ['git', 'range-diff', '%.12s..%.12s' % (prev_start, prev_end), '%.12s..%.12s' % (curr_start, curr_end)]
+    if creation_factor:
+        grdcmd = grdcmd[:2] + [f"--creation-factor={creation_factor}"] + grdcmd[2:]
     logger.debug('Running %s', ' '.join(grdcmd))
     if execvp:
         # We exec range-diff and let it take over
@@ -2792,7 +2794,7 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
         return format_patch(cmdargs.format_patch)
 
     if cmdargs.compare_to:
-        return compare(cmdargs.compare_to)
+        return compare(cmdargs.compare_to, creation_factor=cmdargs.creation_factor)
 
     if cmdargs.enroll_base and cmdargs.new_series_name:
         logger.critical('CRITICAL: -n NEW_SERIES_NAME and -e [ENROLL_BASE] can not be used together.')

-- 
2.47.0


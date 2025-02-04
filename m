Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB91547E3
	for <tools@linux.kernel.org>; Tue,  4 Feb 2025 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687524; cv=none; b=XiZ/WXyrlvNfmBMk9kyEDwnnXGodXduubjRtdncqeerG7ldbcafKwS+B6dzL1j9WeIild1trCLdvnDmCuH9+HqBJf3W41Z+LlMcypEKipMZMaDQ6KF7isAoSAYh09qWPXJPj5syjbvzbXQTXi2HR4IShh8z0atFsJS1xDOL0drs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687524; c=relaxed/simple;
	bh=178gjYwvx7ZDAQGA+Ago/+96m+2I6rPi8o6iXF2rFms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7MwHkeexnTnMmj8iJwQLVsIruFBSUfcQiEoRtQ4k+k8NpH/MESC5T314y4FmrS6GRUIQ6+YVY8B2oR7A4ruerjhhbIH/rJL5It1Qqw/h76npbw75xY7eMuXOY819U4nKMaW+IE4HoGSpDShYX8QSRcP3PD9v7w6A2ymM+8BStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FOOZIoLU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FOOZIoLU"
Received: by smtp.kernel.org (Postfix)
	id CDC08C4CEE2; Tue,  4 Feb 2025 16:45:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 957F4C4CEDF
	for <tools@kernel.org>; Tue,  4 Feb 2025 16:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 957F4C4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BC5A44296;
	Tue,  4 Feb 2025 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738687513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yyQBHYIS/OwFLqNtoaC98UHDMG8hjIwrWcF63YfAIvI=;
	b=FOOZIoLUAxjEGw4mTOlY3+q3zen5TyfLvoHzbF+/Mr87Hlu258Oi1G8ULtYuUNC52KR7IZ
	HiGYvInxA1dkkv6RJC2oEaphpv32saCvbpE5naw7V0H/xEBqx1bk1/33SBj0UnVGgCxEot
	3S2Fqs6FOjLGpJcaDFC6IdmRdJut9Mu9Fp2rRljSuW8/FMfNTJ6r94kLmymxavc27cy9hP
	PMgqdkTgO0ZaRQpPfeLUoDacf23NFdoLuiS+dEP9zFFno0P92oa8hYyHCno89SFwc4kJ6f
	4Uq6kPRHliiZQ5NB0D0Afk//hc4iNVHrw0Ld2c2OFHqK0iOjr0gLkjUAJ8Xmlg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Feb 2025 17:44:16 +0100
Subject: [PATCH b4 1/2] diff: add a creation factor argument
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-creation-factor-v1-1-9988d594a018@bootlin.com>
References: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>
In-Reply-To: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=178gjYwvx7ZDAQGA+Ago/+96m+2I6rPi8o6iXF2rFms=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnokQYwVRbnd2gZGvJHQxfZFznGAVGOc07VbxXW
 MWOZNfYwa+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6JEGAAKCRDRgEFAKaOo
 NhucD/0St9YAI90mUmXNUccxTynZ+p5lmsfAPcKpHcr/s0/wFLC8/E7NymJ1ZBHHXIqIdaexCd7
 WnT/wwwENqHnWtwiZDjqDKcgY3btGfy0jpwbGMDx9UTmPNv6+MCHj8QradyEzXfuzNUmKN2a1qS
 vdFpK+rzeQNVUIqQyTMFLOmiE9gIOqG1b74fFvHg1wmj4968RlyRe5tonCxbcZ35lN4PWrXUlHT
 9qUMyA7xCP09vyrdho2HtxadPRUrO/D7nuEEr9UudhMOiAMDZam35P0zfvXhLy6cj5XRbjg4gDp
 CVlhJNr1lqQQWw2CjxI/vSOfVMz9fa9HR59iWjNxa4WEVZbjF41HiLdiYyH8OZnuRcJhHoAdgFz
 JMPBTojvDUAcPtUVeWA8G+x9DWfswxL45uTeZeoKex6MBoMQSqNKUmGEMqNceuDi88/k00SSMTn
 wNNoE17RGwvCt1QVTkukT0MiQgCAnAECkOHzsRzzfgstatR/KHLq+SC81i4NsQLUn1WHG+omMFE
 P37C1rJT7uLEBuRYpPiLBJAtH5gkeQYwZjPbb3gEt3OQLFJA98A6/ZEqA72alpbDRtajxREAmxu
 ksnxlUQHi7nZ2jpGeQ4aiwBQZCCp5QFlwN26R7ZDVdgjkkWmnY8YWx2jb1flIdold0o4O+bqXza
 bMhwHeFE4/MvGTQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com

When using git range-diff it is possible to override the creation factor
when git considers a large change a total rewrite (and so showing no
diff at all), or a change so small it shouldn't be considered.

This parameter is only possible to set from command-line, it has no
global option associated to it within Git's config, so add a
--creation-factor parameter to b4 to achieve the same behavior.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 src/b4/command.py | 2 ++
 src/b4/diff.py    | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 2bdd785..0485196 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -287,6 +287,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Force color output even when writing to file')
     sp_diff.add_argument('-m', '--compare-am-mboxes', dest='ambox', nargs=2, default=None,
                          help='Compare two mbx files prepared with "b4 am"')
+    sp_diff.add_argument('--creation-factor', default=None, type=int,
+                         help='Creation factor integer passed to git range-diff')
     sp_diff.set_defaults(func=cmd_diff)
 
     # b4 kr
diff --git a/src/b4/diff.py b/src/b4/diff.py
index 1de3063..83fad67 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -156,7 +156,10 @@ def main(cmdargs: argparse.Namespace) -> None:
         logger.critical('---')
         logger.critical('Could not create fake-am range for upper series v%s', user.revision)
         sys.exit(1)
-    grdcmd = 'git range-diff %.12s..%.12s %.12s..%.12s' % (lsc, lec, usc, uec)
+    cf_str = ""
+    if cmdargs.creation_factor:
+        cf_str = f"--creation-factor={cmdargs.creation_factor} "
+    grdcmd = 'git range-diff %s%.12s..%.12s %.12s..%.12s' % (cf_str, lsc, lec, usc, uec)
     if cmdargs.nodiff:
         logger.info('Success, to compare v%s and v%s:', lser.revision, user.revision)
         logger.info(f'    {grdcmd}')
@@ -167,6 +170,8 @@ def main(cmdargs: argparse.Namespace) -> None:
     gitargs = ['range-diff', f'{lsc}..{lec}', f'{usc}..{uec}']
     if cmdargs.outdiff is None or cmdargs.color:
         gitargs.append('--color')
+    if cmdargs.creation_factor:
+        gitargs.append(cf_str.strip())
     ecode, rdiff = b4.git_run_command(cmdargs.gitdir, gitargs)
     if ecode > 0:
         logger.critical('Unable to generate diff')

-- 
2.47.0


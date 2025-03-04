Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0331C442C
	for <tools@linux.kernel.org>; Tue,  4 Mar 2025 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093245; cv=none; b=ngBbsLTrbuy3yx2OTJRzgbR8Wlr9wYEaQkScmyk/Pb0kVVAL40RYCAedzhf8AT37Q6FwcZWWWUZ8vdo2dmd3IUHHHH7PVe0iJMalfWO5+aGktjoCjt+ASw4EhRlAouayWecYvEh5bxtnJdbbFnH2POc3YRB1o5nkTlQPpHnJD60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093245; c=relaxed/simple;
	bh=G9oBmJ5jm0Ve+qMD4VNinqt/pc80P4AYeZpqUdJ/pIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sSo2dVdHNPaY5u0PReP9g8qoazZnT0+DzIXA/31SqlEg96EUHj2K6hEDodfhQH9YocbfrumZr9dHZtYq0nZCo1fjuVNe4ron22631R1GEeyIgP0Lt2+LdAOJ3wOduIoV0takRt+2QxOaL4+v2Msh1a0y7O5Sned/GYcivCZR8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YV01/X4l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YV01/X4l"
Received: by smtp.kernel.org (Postfix)
	id 84A42C4CEE9; Tue,  4 Mar 2025 13:00:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 318BCC4CEE5
	for <tools@kernel.org>; Tue,  4 Mar 2025 13:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 318BCC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71E884425D;
	Tue,  4 Mar 2025 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741093239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SBH8CEFkCaeZzH3PcbGJ2BkWNiByT4FtczhjIOkdCbM=;
	b=YV01/X4lxXQymwtvDLAzuZcRDx0VMIsMAngiaYfeW6YPvOgYap0UksGfpJM6CPjQ2KLX9h
	inwXCszjERuSMkfJhaG4590WZtrcS3LrwOGVJDE2XtwgshzitJ7OQQ6vb7QbulhiGc58XJ
	NjW1evWp4TgxSw9+dvZ8lFjjKF4QJ0rJ5mKnE+0Qlbji61bUqFTGvyiEl23VTr+lIQTXo6
	Uj5yMSF2nZliJ2ySWiUkzVicsHCQ3SLsDQY7NhMucG4ZC+/CZgILFBZDjgOvyWhnYKLNp2
	5z2OigmND8abYqXB2zABe8aTkAZj0eBr1yQRg/s43IGsERX7HEphMJqEaeEqvA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH b4 v3 0/2] prep, diff: support passing arguments to
 range-diff
Date: Tue, 04 Mar 2025 14:00:28 +0100
Message-Id: <20250304-creation-factor-v3-0-d6515180b7e5@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG35xmcC/2XNwQ7CIAwG4FdZehZTGNvAk+9hPBRkjkSHgYVol
 r27hJNmx7/9+3WF5KJ3CU7NCtFln3yYS2gPDdiJ5rtj/lYyCBQdcjEwGx0tpcRGskuIzDqFvSY
 0prVQrl7Rjf5dxQsYCdcym3wq1U99knndVE+g3HmZM2RaK3XrtCTk6mxCWB5+PtrwrFoWP4LAv
 SCKMBBqqakl7PFf2LbtC7F+jBf2AAAA
X-Change-ID: 20250127-creation-factor-ce8069a0bb3c
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=G9oBmJ5jm0Ve+qMD4VNinqt/pc80P4AYeZpqUdJ/pIg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnxvl3fxYULbTeRwlQWBIkg/LJPOgdIEcnOFkd2
 i9THs0e1HWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ8b5dwAKCRDRgEFAKaOo
 Nu5XD/43VISq2ddbDsj/VvGz4Vv8gsLKCd6ozoBBE2SEosC4x1XJT/7L115K0a/rn2PEZwlguQf
 GI4xYiCSdx82Htxju9LY+icr/Es2ftDYKHNEZMM4lF1igChkdy+1CIromSnR+so6erX8PImFWmc
 89DGdF65M5PW45/lvkgUaIxsc1NPizrxIGA3zhdyRdhLn/H40rgrJRn3VyxS8wOv7Ys82dmx0Ce
 TOVYfNv4HciwbRBG1MSLiLngdEDeDJnIRoqSA7qzk/VEMJpFeXexu9euCHX0DWboeDuxB42qb1K
 0Wh5fyJMaISubyQcXZL4bPN4xY0DVVKzutE46/ldXgmz8R3kqZNuYX0JE2KGt8ZJhogv4Hpav/e
 8MKAF7MC+F88KXSe/Cz5s801W7s4A1YjXgxfvrRmQSH+R844gvvQnaGD0SZEo1NAYn0R3OXLdDR
 HhTCs1doSjUohr3+O9rrRGa39vFwJzxbTaA2++N3//hY4L/7TmiK/28kj+sx0fdYw+vbOL57Fk+
 wcnNNSCmcAClJcmHE6a/+EFTzYXbXRymKwxtM5VtLQm+mkHLH1EFSFjeeDPofcPljiJxvI4X8m9
 gwe3grD1WeSZAK/hrYRNSGZIZkC1b05FA8oYUBHgBg+UvUOej1mdbyWCu/eTiwdwwy2KBdt58s1
 YtfhgCoQW1k50dg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegtdelfeefhfdvledufeejtddthfeliedvgfeuvedvkedtfefhgfdvteejudduhfenucffohhmrghinhepmhhsghhiugdrlhhinhhknecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpt
 hhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com

Add --range-diff-opts to diff and prep to pass additional options to
the git range-diff command. It can be useful when the output of git
range-diff needs adjustments, such as modifying the creation factor.

Examples:
  b4 --debug prep --compare-to v1 --range-diff-opts "--creation-factor=80 --no-dual-color"
  b4 diff --range-diff-opts "--creation-factor=80" 20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Fix erroneous commit titles and descriptions.
- Merge doc commit in corresponding prep/diff commits.
- Fix an issue with diff.py's rd_opts array not handled correctly.
- Link to v2: https://patch.msgid.link/20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com

Changes in v2:
- As suggested by Konstantin, change "--creation-factor" to
  "--range-diff-opts" to be able to add git range-diff arguments more
  generally.
- Add a commit to document the option.
- Link to v1: https://patch.msgid.link/20250204-creation-factor-v1-0-9988d594a018@bootlin.com

---
Antonin Godard (2):
      diff: support passing arguments to git range-diff
      prep: support passing arguments to git range-diff

 docs/contributor/prep.rst |  6 ++++++
 docs/maintainer/diff.rst  |  5 +++++
 src/b4/command.py         |  4 ++++
 src/b4/diff.py            | 12 ++++++++++--
 src/b4/ez.py              |  9 +++++++--
 5 files changed, 32 insertions(+), 4 deletions(-)
---
base-commit: 42535902a457332560d860608b770fca9eea1382
change-id: 20250127-creation-factor-ce8069a0bb3c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


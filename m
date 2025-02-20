Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12D71C174A
	for <tools@linux.kernel.org>; Thu, 20 Feb 2025 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061514; cv=none; b=QAE1uSaxDewmlnV7exWWIi+I3A1VDuFhG5Q3peNhBKvTSQg6dxP73j987YaEjYiszzVktFDedI73LTAODcidDbvWNtP/GjG8khKiTDr2icctpp9vD/fIppuYNdCP0BdKjF3mTYSDj5g/d6ea91C441SLg+RpB6eptPnhsv70EBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061514; c=relaxed/simple;
	bh=5BovhGgZtGTUA7lLH0pHxzJl4zqc0c3gon7W85QhURM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwuqwA/O1uve7y7MMj2zBec/oP45LKJ50g2qE+afopH6m+WD1dQALUN2ZS/H2pLkoZbxcLSz+0ArWqW5oWvkgsr/es1kegM+y6be66hFLziR9ZAp03XDw6LoHHyAlxxaERWCqLIKJyljRZB2oEhrr/z5dMyScLQT16/T2QjqnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JUuywHgJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JUuywHgJ"
Received: by smtp.kernel.org (Postfix)
	id 7DBDEC4CED1; Thu, 20 Feb 2025 14:25:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48375C4CEE6
	for <tools@kernel.org>; Thu, 20 Feb 2025 14:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48375C4CEE6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D03B5443F6;
	Thu, 20 Feb 2025 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740061503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9a1iVZA5tb+IdbzlCSD0ujKT15fFfeZUfSufYLuTkQ=;
	b=JUuywHgJqs62nP0Ca4OCWtVI9cvU49JfwKNNnAYFRrVZBPrYzWT7L1H8USoipuzK+9cZ2k
	Ca4/0FYtDxAmaJc50s6vKyZmqnO/qi7GtHa612t1ntUNOgRvZ2gt2YHBMSWEiG77SnIj6y
	QEL/JfsEJjlpqnKzOpTKB4Lh/xnjItJ2lANnRg4uJ01FM6o2q3Q55VisYmeF7Rm8EI3j8b
	1igRapF0OgNH+MBdjllqqqjJqhhgF8oDeW1a2otGeRc6yzR/Wfiv+CLxqSy4g115aeNFX6
	TD37yMstPPVkgiHH3jG6HBhwJToGaRvtxXLxpPnI4Zj31AF7wbygy/F6Gl5qOw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 20 Feb 2025 15:24:59 +0100
Subject: [PATCH b4 v2 3/3] prep, diff: document the --range-diff-opts
 option
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-creation-factor-v2-3-7a0949a3a060@bootlin.com>
References: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
In-Reply-To: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5BovhGgZtGTUA7lLH0pHxzJl4zqc0c3gon7W85QhURM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntzs90rEsdJkhaVJ5hdPASj73qnwfAY30dGvy1
 vyGb8CreDyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7c7PQAKCRDRgEFAKaOo
 NoldEACLS7ZpwYu3iIP7GcnN0iIDOxsrxSkCbl6WcM+N/ixb0KBkvZWnWB1L24qBeULVujP7jZQ
 HPadsgWi/ZaqHfVoiJBIidAhzh5zs8sfXdchn2iDV4azqf3R0GNYDGcMYMa5+Di9igjc2UcGQxw
 DGfrP4G/IjtsZlHFHLMr3nUqv0etIavUXkJwE/8hnCZw7OlHbBaqxzjekIZJWOBB1nXbivyFdsE
 jzuqrsLhXvMQ/rnQG8j8JhYdGk6KOg2QFbBNj0E06CoRN8BA0IL6t+FbKq+8RWyqrWqnDjP0IQB
 agvCe8wicznBgypBUqFLlKo5ESJsJB7mw5VDXCuUKlgOIQQvrl1gXm2xq6cuclGSfRzVUzv4woe
 zXCZenY3v+CoQC7z6LFRnznzr3rPLzPZxGOuuohF5vzoeX+jytaXeyfyug+7BFYDiJG57HwY5gL
 v8D/UhwN5VXC7Sj97039f+fmm5DDJIzpHh/gCMUuZa1cMpC/50DbMC12BXa91uFP2fD+2mSbFgC
 U3AxujLGjioauy/a9w4YHy7aBP3bLieS41cAhVxNglw7G8OjZDEWittIO/6dadmuRHuqsu17aMo
 70YJ0d7jLYv4Bt5APdLFPTZ7xqOozd2kNJpoG+DaqveXkYctQiBy29HQhfk2nAwv8pk6HmpJV7h
 KuhwLiuoAFEdVWA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com

This argument allows adding options to `git range-diff`.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 docs/contributor/prep.rst | 6 ++++++
 docs/maintainer/diff.rst  | 5 +++++
 2 files changed, 11 insertions(+)

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

-- 
2.47.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ACD33985
	for <tools@linux.kernel.org>; Thu, 20 Feb 2025 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061512; cv=none; b=NUWfgm/2w8ehGQzmVE0X0qOKm5pREZDwXjoKCNnfMBQuVRS8456BM1plovv4Os4J8dQMGRXRwJm4VybiUxKyEQiX8oHWPXP1m6y5kil/Tv5dCfqD8XFEMacNmNpEIfZLRI6PNsf6UtaT9C30bDg+jyh6xO6IPZtyh4L1hmP0WGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061512; c=relaxed/simple;
	bh=pOKPp5BH7+/amUXBohvguXn9klO3x021aeUq3iIBOf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VRgeJ+/HPhlVuv0Vzewi2dUdAyqEU7lITNtywWppRZ6I3z4j2sv9j8nRhwXXXqSWWZBz0IsqaWuyq1zkmHJWYbKvGTp8pskGGKfByfeRaIYQDxkj3S9zg+JHF02o4QvRJdH4IJnoGHn5e50e473wQIq0Y2LwB6K/ExpVLMIHXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XVUHg9G+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XVUHg9G+"
Received: by smtp.kernel.org (Postfix)
	id D92C7C4CEE3; Thu, 20 Feb 2025 14:25:11 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 437C6C4CEDD
	for <tools@kernel.org>; Thu, 20 Feb 2025 14:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 437C6C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F41674439A;
	Thu, 20 Feb 2025 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740061502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TqYQ8RIDz6xw2e617HBi4DAQwJtn5gzbza4p8c9qP6M=;
	b=XVUHg9G+djzLUfQclu4AxdkyfN2m6Vz/1P9xG30+2xQjSLdWqYSxPAGgFMDPVv7CQs/vod
	0DOULNKOLVHi8Gx+zJRBIWPK1P4Dmjn9BkyXBRzey61bT1GEX84sEsM9uE+HLO1PrX2NcG
	sFhTgkSDR1Vuer281dF5BizYf8UyGAwT3Q1I1DSH2OXxUyxJkph5HmbW90zdqoBSyoq4DV
	S4FAY4GhDxAs1kWyoPrBGCw1bMy001Yo2CHvNgRWpMFu5nsHoPb7jKtuXLgXw/psTMNXkH
	MbKon0fOsa2H/i5xM/mpYRZ9Q4eFQwYoP0aZbicLyWcCDVpGrh8cyJ5mlzu6Jg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH b4 v2 0/3] prep, diff: support adding range-diff arguments
Date: Thu, 20 Feb 2025 15:24:56 +0100
Message-Id: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADg7t2cC/2WNTQ7CIBCFr9LMWsyAVMGV9zBdAJ3aSbQYaIim6
 d0lbF2+v+9tkCkxZbh2GyQqnDkuVahDB2F2y4MEj1WDQtWjVBcRErm1lsTkwhqTCGTwbB16fwp
 QV+9EE38a8Q5ew1C9mXOtfttJkS1pPIX6j1ekQGGtMWNvtUNpbj7G9cnLMcQXDPu+/wA7aE/wt
 AAAAA==
X-Change-ID: 20250127-creation-factor-ce8069a0bb3c
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pOKPp5BH7+/amUXBohvguXn9klO3x021aeUq3iIBOf0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntzs9Ou9FlzjXQVLDcYXcFLPPWAsuQOCswEcPl
 dYd8AxW6V2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7c7PQAKCRDRgEFAKaOo
 Nud4D/9yFPkl6Y2f9AT0Xjbjp1pLEoL589LlmcVSIqTZhDE4TP/BbUmw78aIUqf5JfS/RssRTVD
 3gKGSa6XQuwXxZcL+vovUicM3nR9RBuhHsh20bX0vQPKGVbG0IivZlL94IIzYLQWfhLKA9SY0Q0
 uqh1Hy2QHDC1yl7snkAHmZYJHOLYelpTOkgSyyPxF3oAh+0U14ZaW/n/mH1ZqAxVvJ9Mm6rIQIP
 LMjSbwU4gdjwwoD2ewkh4A+gwkvnvLx9GP0j0bc5wC89VGcQy8fZA2sk7868LaPfCTWbOTs1+Zw
 K7htLrcxYw9IQtPn9RNBCQspL2z/HJpgcduDj3wDOIf1QkTLxltoYiyWTPrFq3MTFzRGOlS4LQJ
 RH826sq+RWNJyoBPDuvRASqZAFetVokfJH+sDybwAmNZL9V9coJj7IzPmNeer9uy+GuUy0PuRjl
 Sa+I9GD2Rc91IBG0v4QIGP40ImdAUDK/NKJ5LvfAG1vvEm3j/Ly1IsaCFQI7sXJ8b8rlvLM08Qs
 V4IAm6aH+DWFfu0MxHpwZdReV9tRuvcP5+tv9G0YsQpKjUikeClLi7ih1lHR1nse9pNLwWrxsL0
 PeP6sK33hUtxx9IODRdztUTOQKNZB+h6chM9pdCkgIqTnIbg7R6Du8dBvZ/EvO/y86nnhbiJ3uY
 efQwdw0CSYwAPuQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgedtleeffefhvdeludefjedttdfhleeivdfgueevvdektdefhffgvdetjeduudfhnecuffhomhgrihhnpehmshhgihgurdhlihhnkhenucfkphepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehtohholhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgri
 iiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com

git range-diff allows to override the creation factor, which is
sometimes useful to adjust for seeing different diff outputs. This is
not possible with the current code, and is also not configurable from
git config.

Add an option to diff and prep to override the git range-diff arguments,
such as --creation-factor.

Example:

  b4 --debug prep --compare-to v1 --range-diff-opts "--creation-factor=80 --no-dual-color"

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- As suggested by Konstantin, change "--creation-factor" to
  "--range-diff-opts" to be able to add git range-diff arguments more
  generally.
- Add a commit to document the option.
- Link to v1: https://patch.msgid.link/20250204-creation-factor-v1-0-9988d594a018@bootlin.com

---
Antonin Godard (3):
      diff: add a creation factor argument
      prep: add creation-factor argument
      prep, diff: document the --range-diff-opts option

 docs/contributor/prep.rst |  6 ++++++
 docs/maintainer/diff.rst  |  5 +++++
 src/b4/command.py         |  4 ++++
 src/b4/diff.py            | 10 +++++++++-
 src/b4/ez.py              |  9 +++++++--
 5 files changed, 31 insertions(+), 3 deletions(-)
---
base-commit: d23a9a2d5684369710bd2e416e41159193df3756
change-id: 20250127-creation-factor-ce8069a0bb3c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


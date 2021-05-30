Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F42E173
	for <tools@linux.kernel.org>; Sun, 30 May 2021 16:36:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8BB2C5C009C;
	Sun, 30 May 2021 12:36:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 30 May 2021 12:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=US2fBDYPGB7MC0SfPEk6UG+qA0
	SYV1wNnUSOzIvC6zg=; b=djGypxmxKxnWivUJupDgY5GbXH1OzNLJgfbt5o/97W
	JaandYz43EjyBGkTE6qaAUWY6W4KPvMS4o7/NULMwndqmv02KGvpiGUaCTCilhR7
	2MPCGNpAlyeLHD0vDl3D7LdUVA9snePSYx+9iUnm0XPQj9Yl/CIhcxtClXIlmza7
	KyLhHGarOyADoc7YDDtUVQ9ahAEFVu/EsCJCFgAJAOA9BBZLk61HfCoZVZr5YLdy
	UJCHCj5ISqEjoY5ejx2kJEuLV+l2jn/5CFhRmMG8cEWJg1mW78byy3jZZiLdjKFb
	YBH1aE75w5aLjaFCBC8WRNxsNg9dJR15oRNjLUezPzKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=US2fBDYPGB7MC0SfP
	Ek6UG+qA0SYV1wNnUSOzIvC6zg=; b=mLahX5jKuLm6t1MBVdN6J/AMnnXmWceqW
	E0u1Y+fYX5rkJejKq3XJHiclifeCFHwTSGoKjWtKRIE4QOEOKnk+esv6m5+tHh8a
	TZfFWAP9HWE2ntETVM/kmZ5bEYEaqjea1sibWyfk92Wt1u6MLHQnnooOrCkyVaVU
	mvITDiJFMbH/wfqfjZLvpeMuAITH+JX1+GePBDTOwFhSOx0czd8KFEVTXbvIUjDx
	2tQtAjfmVmmqcCQIhs9mFjikumzSpGixl+y2qLOdv9BZ5IaIRDls1bYC7E03N3ks
	JZcH03j689rouLA49e+pkLxkwhnaFtoLL95tqDeAMbQbavcStHdTg==
X-ME-Sender: <xms:DL-zYFfAvjyWpatihPqCoJ7QfHOlLyYT1nsH3bKQQnzvWmQiWRrlSQ>
    <xme:DL-zYDMrMEgFPPp6yNNbG9gO2-MeHB6ISByUAT6-zRY6BSOE3FLml81TwWxPZWvG-
    vB44jv8MYRAwwMEpCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeluddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epteefleelheeugeejudegiedttddvffdvleefgfdvudegkeduleegudeihfeijedunecu
    kfhppeektddrjedrudeitddrkedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:DL-zYOiOtge6-OaBP9pVoWx99DoRlloP2amdfein_mUwqaQkXbcTeQ>
    <xmx:DL-zYO-04n_yjrkD1jJN46k_dFT3Ub7ChHHD-j4i8vAxK1Q4UgktcA>
    <xmx:DL-zYBuIrWxSLEs8Rs09c-hojA86Fifp7vKof1TtKfgFJAPKB43ARg>
    <xmx:DL-zYP2gH0lSe1HhQZmGygVURLHazv-OWvkAbfdLon0hz0mEbRZnEA>
Received: from dev.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net [80.7.160.81])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Sun, 30 May 2021 12:36:27 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
To: tools@linux.kernel.org,
	Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Cc: Paul Barker <paul@pbarker.dev>
Subject: [patatt][PATCH] Make instructions for automatic signing more reliable
Date: Sun, 30 May 2021 17:36:23 +0100
Message-Id: <20210530163623.926-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; h=from:subject; bh=dQWwQhUhEndiEH/t8Wgdgv0Hq6LDonwfAuE5tPI5ORk=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmb97MwWc+doHBs/4ZLz5vEjstXZWx9/CPKxn+D4fZD8SrX 5dau7ShlYRDjYJAVU2TZPXvX5esPlmztvSEdDDOHlQlkCAMXpwBM5GYmI0NTxcJ/Mm9arOd6NZ5oFm /pEpGv3rn4qnrMVV3hD2URkoUM/8zOreveaKJ7UObWoRvZLtGc9ho1SxqqIvM+V69osin4yQEA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit

We can't assume that the git directory path is '.git' from the root of
the source tree. For example, this is not the correct path if patatt is
checked out as a git submodule. We should use `git rev-parse --git-dir`
to reliably determine the git directory path. We should also surround
the path in quotes in case the user has cloned patatt in a path
containing spaces.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 README.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.rst b/README.rst
index 924b622..70056bd 100644
--- a/README.rst
+++ b/README.rst
@@ -184,8 +184,8 @@ Automatic signing via the sendemail-validate hook
 If everything is working well, you can start automatically signing all
 outgoing patches sent via git-send-email::
 
-    $ echo 'patatt sign --hook "${1}"' > .git/hooks/sendemail-validate
-    $ chmod a+x .git/hooks/sendemail-validate
+    $ echo 'patatt sign --hook "${1}"' > "$(git rev-parse --git-dir)/hooks/sendemail-validate"
+    $ chmod a+x "$(git rev-parse --git-dir)/hooks/sendemail-validate"
 
 PGP vs ed25519 keys considerations
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.31.1


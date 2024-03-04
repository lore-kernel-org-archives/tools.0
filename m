Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFD73F8E6
	for <tools@linux.kernel.org>; Mon,  4 Mar 2024 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559769; cv=none; b=uV+TO83WDQDBxC8wlpA56cp5hQVYfVx5InWbzB1xFsckRhHWzPIqpXkMiE6IhSHjTWHGza/xwmrb/TINvwpnR1uQGOp11Yxu9vIsECjpbSxT1AtKmCEmh1DI8KtpYBPJtkyndJqJsn8gfXrcsH7wTdV7Ri9+AAbr9ksW+twLhS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559769; c=relaxed/simple;
	bh=4QCXz+cNDy9PYf0lReMPG1k9v8GE63Tt1vCVlnWSB8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UZd1AWDP6vrR0Gl4lAbYgOLgm51VXapDvunsjMhXaXmxOJ7GwdooZOhtmD0BJIR3GUNWcNFPYM2ViE5mIDC6moz23q5pENZeSufZ3H5Us+C4u8gCUpAvMYeYHabkcAW1Sv+kxW8xhi8upBYmn/SZMFH2b3UyFxm78qQxqouTZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZ04m6j8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZ04m6j8"
Received: by smtp.kernel.org (Postfix)
	id 9DF6DC43390; Mon,  4 Mar 2024 13:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6924FC433C7;
	Mon,  4 Mar 2024 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709559768;
	bh=4QCXz+cNDy9PYf0lReMPG1k9v8GE63Tt1vCVlnWSB8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZ04m6j81SYpnSdE1pS3BzRea5nIEAgoMBaKUW6rFNVMbsMqnn/fFWl27Qg+VQo9j
	 kgKG7NuuCkSl3+I+k/34dPZukHYwNo5NNiU56RuXTrC9ndxilw7GvIEY6n2Fhodz5N
	 v0vXGC7kg+2p4w6YZepOlMFOwTbNKicBdKLDginQSlpL8/jbSKma2ZaTDp/Z9Sj9WS
	 BHG0SAH6LdZw+FPmGFRsAO+off2yWbRcXBem1Xz6NHZTFmMh8icSA20xGotV4hlD+j
	 lWnL7dflcQdyD1baIh5qosN3LHVzjcy4Yy5uvTI2is2ysikIvgdWZi5Z1SaUAu6V60
	 Tz0354px0gaiw==
From: Will Deacon <will@kernel.org>
To: tools@kernel.org
Cc: Will Deacon <will@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [PATCH v2 1/2] ty: Try subject matching for every commit before using trackers
Date: Mon,  4 Mar 2024 13:42:40 +0000
Message-Id: <20240304134241.20447-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240304134241.20447-1-will@kernel.org>
References: <20240304134241.20447-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nicolin reports that 'b4 ty' produced a "thank you" letter with
incorrect commit IDs:

  https://lore.kernel.org/r/ZeDtfKMUXnOnJOic@Asurada-Nvidia

This appears to be because of the creative use of Message-Ids in the
series at:

  https://lore.kernel.org/r/0-v6-96275f25c39d+2d4-smmuv3_newapi_p1_jgg@nvidia.com

For example, comparing the Message-Id of patches 1 and 11 of that series,
we can see that one is a substring of the other:

  Message-Id: <1-v6-96275f25c39d+2d4-smmuv3_newapi_p1_jgg@nvidia.com>
  Message-Id: <11-v6-96275f25c39d+2d4-smmuv3_newapi_p1_jgg@nvidia.com>

This confuses auto_locate_series(), as it will end up matching the
Message-Id of patch 1 with the Link: tag in patch 11 and therefore get
the wrong patch/commit association.

Fix this problem by trying to match each commit based on the Subject
before falling back to the fuzzier tracker-based matching.

Reported-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 src/b4/ty.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/src/b4/ty.py b/src/b4/ty.py
index a8bdabf5bcbc..950c357a89c5 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -217,7 +217,13 @@ def auto_locate_series(gitdir: Optional[str], jsondata: dict, branch: str,
                     success = True
                     matches += 1
                     break
-                elif len(patch) > 2 and len(patch[2]) and len(commit[2]):
+
+            if success:
+                continue
+
+            # try to locate by tracker
+            for pwhash, commit in commits.items():
+                if len(patch) > 2 and len(patch[2]) and len(commit[2]):
                     for tracker in commit[2]:
                         if tracker.find(patch[2]) >= 0:
                             logger.debug('Matched using recorded message-id')
-- 
2.44.0.rc1.240.g4c46232300-goog


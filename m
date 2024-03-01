Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B536A325
	for <tools@linux.kernel.org>; Fri,  1 Mar 2024 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709288666; cv=none; b=JPB7cUINPj17XmL/zuMyKsvhLU+BYseBJRRtt5dXMK1zBVEb2oxBh86qMHCczowuT+jR79eatPqgyzUaO9yXBR0QTHoVQUxtnBR5cf7fyvGNNK18GWWghMBMohJlH6jsfpuKBcc5ARPEh/r0Mk2i0aMRb4EYgg2UaeU9ugACIWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709288666; c=relaxed/simple;
	bh=MUl67GiziNLxF2rhL2JeYCgwLuz/pDHPf4f9XrlPizc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ct5h02AeP2BGRHmNZ11gUw7AmH4KJcmYe64gkp5jQFmhE6B3oUqNOTTx3FqhONlQjOGm/CBUVY/YH8nFbiPea9iMyBtcE2mjoe6DI0PONehI+7n5LzOx2yYq+plK2sM2Fh5qw/ZVLPi70+LxhnQW+htvrTcF74pYGIV9GgVQ7YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqQgb6q1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqQgb6q1"
Received: by smtp.kernel.org (Postfix)
	id 97B26C43394; Fri,  1 Mar 2024 10:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A37DC433F1;
	Fri,  1 Mar 2024 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709288665;
	bh=MUl67GiziNLxF2rhL2JeYCgwLuz/pDHPf4f9XrlPizc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZqQgb6q1snSukSV7bkx0Bio+rRv0bioXHSEzBuPXg6iWTWMxTTMxSQo2uwGJ9QFFG
	 jtGrew7oRWSwfKHMWSGwZ8uSnWOk5JCbQCdMkkrhxo54JB00EKqK73nEy0/cdf7Qai
	 rMebjDKuNnRaJ7bJKui9WtJPJLiqhJg/xiDXrhgjoMjGpMNb1NmhZzf7wQQrBs0d9N
	 vTxUALIVI2TKt3h28U0b1KsiCfrOGp5sN7TgmM+shDzB7e1guXkP/K9D5BuwCBhAQO
	 6sSe7ffgIl3f4Kza1nnBNVvLh++pv/fKSdHq3o8Ecju1LoF1JGY4FuwCWbCPaHzUHv
	 a6YWUKy9RIEKg==
From: Will Deacon <will@kernel.org>
To: tools@kernel.org
Cc: Will Deacon <willdeacon@google.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 1/2] ty: Try subject matching for every commit before using trackers
Date: Fri,  1 Mar 2024 10:24:17 +0000
Message-Id: <20240301102418.17705-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240301102418.17705-1-will@kernel.org>
References: <20240301102418.17705-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Will Deacon <willdeacon@google.com>

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


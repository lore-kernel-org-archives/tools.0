Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552CB3F9DA
	for <tools@linux.kernel.org>; Mon,  4 Mar 2024 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559770; cv=none; b=ZDe7BFSBlKnB5DaqhC0iRCYeM1htW6lJ40YZWSQFqEw8NG991/M9TPvguH9kM2tqthCUF/cI1AHjM6wxlrDbYMwGe2Pa20QugLSe89NMJT/xujNx8ukBzQkWa3kbo+j9N4owazukf5URX8hbT+K6cxZb+ZlsH9GEXl0voeCDFfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559770; c=relaxed/simple;
	bh=hUlp5nN9VOr8ASxoRKUnHQHOl1cmmKkS70r2syp4vM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OgXGF6d5d58KI/qUWBWVnBWt/awMpmqUX+BMCZ3iMk/zkF7Jr1dOGRhCmidHlp5BKpPhGT9QCPZYXqDb6lIa+JISJKXq+1nDkKAVE7Adhwgk2oVr2W9srAys8V3+YmhF1twl3VJhTs9DgEpFCj1mTgbFhVKKWPFPkfD+humIc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZngVWuFM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZngVWuFM"
Received: by smtp.kernel.org (Postfix)
	id 36AF1C43390; Mon,  4 Mar 2024 13:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BDCC433F1;
	Mon,  4 Mar 2024 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709559770;
	bh=hUlp5nN9VOr8ASxoRKUnHQHOl1cmmKkS70r2syp4vM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZngVWuFMi7t0Rr+2pxbkQFvzxX0IqShqs5FtL4QGvRUA9lypxIGkGcaOyLc0ua4y2
	 iE8Z8+FFkl+Tbyw1H+7qyYpnCw41qWIiybUGNX5wSCecZqi0pcH8QY4rH5106V8iEd
	 H46wmtaAlVroRjPtqHA2sAYTmc8JgwewFVi8gZpfjLg7adhNjdSCGgpDDY+0dkDsmL
	 aUtEnNZxKJvwpw8EpDKcr17Xa71nFzK1Acquv86ph3KGrcHLMbqzbSdMHFbd6MFbs4
	 fUepB7EllJ3OAayFUG0NtTkoI6ScX1Y9EtXq5qVw4cqQ6H5jjDQvw0/BybiDKgE2u6
	 zmZAD7rNVS8mw==
From: Will Deacon <will@kernel.org>
To: tools@kernel.org
Cc: Will Deacon <will@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [PATCH v2 2/2] ty: Remove unused 'matches' variable
Date: Mon,  4 Mar 2024 13:42:41 +0000
Message-Id: <20240304134241.20447-3-will@kernel.org>
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

The 'matches' variable in auto_locate_series() is updated but not used
for anything, so remove it.

Signed-off-by: Will Deacon <will@kernel.org>
---
 src/b4/ty.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/src/b4/ty.py b/src/b4/ty.py
index 950c357a89c5..97f4c44a0832 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -198,7 +198,6 @@ def auto_locate_series(gitdir: Optional[str], jsondata: dict, branch: str,
     patchids = set(commits.keys())
     # We need to find all of them in the commits
     found = list()
-    matches = 0
     at = 0
     for patch in jsondata['patches']:
         at += 1
@@ -206,7 +205,6 @@ def auto_locate_series(gitdir: Optional[str], jsondata: dict, branch: str,
         if patch[1] in patchids:
             logger.debug('Found: %s', patch[0])
             found.append((at, commits[patch[1]][0]))
-            matches += 1
         else:
             # try to locate by subject
             success = False
@@ -215,7 +213,6 @@ def auto_locate_series(gitdir: Optional[str], jsondata: dict, branch: str,
                     logger.debug('Matched using subject')
                     found.append((at, commit[0]))
                     success = True
-                    matches += 1
                     break
 
             if success:
@@ -229,7 +226,6 @@ def auto_locate_series(gitdir: Optional[str], jsondata: dict, branch: str,
                             logger.debug('Matched using recorded message-id')
                             found.append((at, commit[0]))
                             success = True
-                            matches += 1
                             break
                 if success:
                     break
-- 
2.44.0.rc1.240.g4c46232300-goog


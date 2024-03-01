Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA386A325
	for <tools@linux.kernel.org>; Fri,  1 Mar 2024 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709288667; cv=none; b=c3TbSHT5YlEyjBxTgPJtNi3GVK4a9U1VwfV2Ct0DsY6EjcgHkbWY/pXzIakhdeemZp+HfowrT7Ow7ugtF0sZ2MckEWyJLNtt+06SCkb/NXKc6hvRJxjZCmpnvp/Eol975jQisbBGyWMGi4i4+H9QYYdjfQXROZ7wuugdy+QWOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709288667; c=relaxed/simple;
	bh=uUuE5LcFt9QFo89f9ap4FIgpU9upi6KldC3VWA9NnWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zp49Wn403rZf/kjfFZafl3EYMzHHhsV20//SELp1bPaQqSsAu0thsjGzO59zE0TgI1jHH7w+pzcZ//77nuvDSrAqAsLef7is56l3RO7eF+gKHeTfGgtuzIy9iOn+1Lj2gem8PdkNedmEsmMDQ7EewVkr2NYm8YV5fQtoVQVYFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGhjBolk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGhjBolk"
Received: by smtp.kernel.org (Postfix)
	id 59347C43390; Fri,  1 Mar 2024 10:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFA2C433F1;
	Fri,  1 Mar 2024 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709288667;
	bh=uUuE5LcFt9QFo89f9ap4FIgpU9upi6KldC3VWA9NnWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XGhjBolkwAd+UOtG7zzgduER8yqN0U1RXKnHPQz8xeZI53jn1QJ+nFtxEnH3J3W1u
	 +mFe42Dh+Q6INNsx6kwM9hoaTA9RCjeeJdpb0mP8Yq4ypd+8urFI8ro2IH6MTDQYNd
	 TmM6uYOjc1L0luWoxVYih4nTz4Qal5nHEpwYi8eDbCAeS5u2EdUg9O7vp+m6GaOIuG
	 Y3vD/NvMbIJyt6aEdS1xG2UgTv2rx3hY0xfvP3rnV9ZfdYhUPpe+NGNh/pwahc7yTp
	 otNQIR9D9tVTQie1RB+QgonRargmgOZc9fNW9W1IfYzGrafjdjsha++6/IQEsDwtVW
	 zPajnPgv3+JZg==
From: Will Deacon <will@kernel.org>
To: tools@kernel.org
Cc: Will Deacon <willdeacon@google.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 2/2] ty: Remove unused 'matches' variable
Date: Fri,  1 Mar 2024 10:24:18 +0000
Message-Id: <20240301102418.17705-3-will@kernel.org>
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


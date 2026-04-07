Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD7C3BAD9B
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580522; cv=none; b=CTK2vvQ0k3+SM1iRLtzeOY6L4YpPtXF/Y1Pwg53MAMdktuSctjbyWVqXRa3G+kSMx2gTuMZd9LVjoS/j9sqogDcOjI7b2gv/TTmf0TAy/ls3uM7+hsQPQ5PySJjNBtNtL5kJsMMgZv9UR8AEjm3NNKDsuhmMlWodm1+rw7EbHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580522; c=relaxed/simple;
	bh=0GQ1XEwWkDa5PRz2evEtSVgxD/zk3lZG9IKmvi9YLdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rddFclMDOQORq0gRRPnN+xEl/pwXsy+yP2Sy2/pHPfXe5JyP6A9Ns17izBjANkvIxNxaBzekKMQgyC8+NYVr+wOdT9tJIakgW8yY9YkIcq5A0+wkwt3k7mjII7qfecjrS3nJwQxKSuEHneWwhmN58Fx60jc0lYQFkHD9iA1xJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwyhVv3a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwyhVv3a"
Received: by smtp.kernel.org (Postfix)
	id C81E1C2BC9E; Tue,  7 Apr 2026 16:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F0EC19424;
	Tue,  7 Apr 2026 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580522;
	bh=0GQ1XEwWkDa5PRz2evEtSVgxD/zk3lZG9IKmvi9YLdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GwyhVv3a6vT+Cu4RrZXEYMSoPdRhAqj5gryUj/RhkigXOoaNYRckI9KOtFlU9MF7M
	 1Nh9h0xcyQxYo1JRWWL5l7hwVM3SULKlaOFM/nXuDgw/WfbaRl3DCshjuGfb2zKjJt
	 7kOPmPXdOZhrTrHRl0CUvzCESFJF7KqbRkK3y5tsLbZAno6H34o22t7fgIa/UtH3MS
	 6QVfHCCRzGsVb/Wld7DwKvHfUpgp36a/+1MfG1CDUyVkDJn9illfXZqY/4XO2sgTCN
	 CLXVPQ0shbGSDg5V4y0VQZgkWCb4NB/462yuVytV1mS2J1AmGzSWIENd5Ya8rbQIz3
	 eFE2MfQE1a6WA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:31 -0400
Subject: [PATCH b4 02/12] Fix ruff check warnings
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-2-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0GQ1XEwWkDa5PRz2evEtSVgxD/zk3lZG9IKmvi9YLdo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTdOri9/f/u5eoHTyoLRnqtuRtSsnGyT5iL95yG0xM
 /2j6sPOjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFN9aTLDP4Ucr8NXp9rf3BmbVbSMo5r9gubuDf+PzerLy9twcuqDLW2MDNdnByu
 llFkE3oqJNi5NMtuQJdBTwhiu+Fqrr7DI/6cZGwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Mark example-only variables as intentionally unused so ruff can check
the script without changing its illustrative structure.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 misc/review-ci-example.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/misc/review-ci-example.py b/misc/review-ci-example.py
index e5837eb..cbac2ae 100755
--- a/misc/review-ci-example.py
+++ b/misc/review-ci-example.py
@@ -43,7 +43,7 @@ import sys
 
 def main() -> None:
     msg = email.message_from_binary_file(sys.stdin.buffer)
-    subject = msg.get('subject', '(no subject)')
+    subject = msg.get('subject', '(no subject)')  # noqa: F841
     msgid = msg.get('message-id', '').strip('<> ')
 
     # Example: read tracking data for commit-based CI lookups
@@ -53,7 +53,7 @@ def main() -> None:
             tracking = json.load(fp)
         branch_tips = tracking.get('series', {}).get('branch-tips', [])
     else:
-        branch_tips = []
+        branch_tips = []  # noqa: F841
 
     # Seed the RNG with the message-id so results are stable across
     # repeated runs of the same message (simulates cached CI results).

-- 
2.53.0


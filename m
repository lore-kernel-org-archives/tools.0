Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524CEBE
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 06:03:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXwMG69BCz4x90;
	Fri, 10 Mar 2023 16:58:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678427882;
	bh=qd9jnQoZ/RI8kMl0J4UZUhc6jPOyjX6Nqe49ulv/3e4=;
	h=From:To:Subject:Date:From;
	b=hcMdzyFk5CqhN9zbR4cDSnxvkjvBhc8QXzoOzKjVLtn3yW5yIVHKkWtqusNLG/I+a
	 rdd1lzujgxEDHCeXMB/I9dOLK/M9FI5ZzKwh+HjxUXTu8rE3fxtq9nilUSzZ5SzWt8
	 OP7bPWDfDfvwioXvDM+wHbabry1+4eotN08PkPSduW8aUd7pDfXmkdvd+vH9fVKryH
	 2bfkl1CKix7ei51rdmIlfiBQRN/oDNXG4HjR/5nEWlWrHh/6Og1LWI7gd6VZI2lHGP
	 hnjIDlt6LQvS+FO336qgbVSaHbhKP3o4uQiriceqEiuMqKCe1usTC+BFEomcc+xnTg
	 L9Zhmty4Zrmpw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: tools@linux.kernel.org
Subject: [PATCH] ty: Fix git-config regexp in get_branch_info()
Date: Fri, 10 Mar 2023 16:57:53 +1100
Message-Id: <20230310055753.1609529-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regexp used to get the branch configuration in get_branch_info()
is subtly wrong. If there are multiple branches starting with the same
prefix, the configuration for all of them will be returned, which can
lead to the wrong branch info being used.

eg. Running b4 -d ty, with extra logging of every line in
get_config_from_git() shows:

  Running git --no-pager config -z --get-regexp branch\.foo\.*
  branch.foo.remote .
  branch.foo.merge refs/heads/foo-test
  branch.foo-test.remote .
  branch.foo-test.merge refs/heads/foo-base

Although the regexp has two escaped dots, the 2nd one is seemingly
consumed by the '*', leading to the regexp matching "foo" and
"foo-test".

This can be observed on the command line:
  $ git branch -t foo origin/master
  $ git branch -t foo-test origin/master
  $ git --no-pager config --get-regexp "branch\.foo\.*"
  branch.foo.remote .
  branch.foo.merge refs/heads/foo-test
  branch.foo-test.remote .
  branch.foo-test.merge refs/heads/foo-base

The real problem is that we meant to pass a regexp of
"branch\.foo\..*", so change the code to use that, which fixes the
problem:

  $ git --no-pager config --get-regexp "branch\.foo\..*"
  branch.foo.remote origin
  branch.foo.merge refs/heads/master

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 b4/ty.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/ty.py b/b4/ty.py
index 6da1a15..165afd9 100644
--- a/b4/ty.py
+++ b/b4/ty.py
@@ -665,7 +665,7 @@ BRANCH_INFO = None
 
     BRANCH_INFO = dict()
 
-    remotecfg = b4.get_config_from_git('branch\\.%s\\.*' % branch)
+    remotecfg = b4.get_config_from_git('branch\\.%s\\..*' % branch)
     if remotecfg is None or 'remote' not in remotecfg:
         # Did not find a matching branch entry, so look at remotes
         gitargs = ['remote', 'show']
-- 
2.39.2


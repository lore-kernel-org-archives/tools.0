Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654125;
	b=bPRKIUCs4L/p7W0pun1S9x56aCLHPpr1psxgFBlvWPl+Ju+gVbr4FACJUtQcrIgjyu0f
	 LEGPfpH0mGw4lhXocT+6fSVoAd9+yshYdDb7KDm9pr3yh2C7xCtZg8aRBBMvfa+W0i0YR
	 Otc8JKRjtL4a7YwdqZQ3kU3tMzDQgXe6Wn2Bn+eqO9rmCnFl+d7F186fNx94EUmt7gLpF
	 LkFQtiZgA2/GN34Ewy5wz3gVrgtxLlKr7l3oa4lh9rWV8XsGt1jHqT5DtIn4BaYOMADoW
	 CYCSOrzvUCZBxD48s/z0neFw7ZqI+CMJkzrAPJsduu1720PpKBDxUvDA8Ic4T/1cPsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654125;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xKbcLfcqTowvGYcfShlYqFfh0n5vqWAn1cXXiBRQiEs=;
	b=rcWDB/TnZ44mKeJJMNrT1dC9MT1gZugqqx1gANe9W+H/lY9PFulNGVVY5/bItBoV/p2L
	 aj6h9jeSOHocqEmc2w08MTMKGfzhWYgLP4uISQ2Hc6ZYKoKJUt1+kfy4nSdqulTf5qifU
	 /gXCeGVQBdKFbz5seaUT1NUOEJsEpojwcbTEAXtA/8Hql+GHjFvZXg3MevwRPwwqtBiOw
	 /zKDwxx0jfmZZPKhPxzaUvovO0xQTepicfp1tZuu7FcMM+YBNuvH0/vJ9WHXimwosnIqF
	 31iIcBKJgOwcJUYmAnwqG6KgxooLrcQB2TZM6NQPueTWon5Qiuqfi1MP8pW1WzXK1RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVekz09v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B4606A334
	for <tools@linux.kernel.org>; Mon,  2 Nov 2026 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVekz09v
Received: by smtp.kernel.org (Postfix)
	id 075521F00A17; Mon,  2 Nov 2026 21:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97E81F00A16;
	Mon,  2 Nov 2026 21:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793654124;
	bh=xKbcLfcqTowvGYcfShlYqFfh0n5vqWAn1cXXiBRQiEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dVekz09vu3mcpPaRa6ZenrkT0E1Qy3n1UH9CDXfQ/50XjJZzGqmvWQTp+0yOrINDs
	 GuOiG8Fy76HGyqvb927CLjTZ+m7thrjI3uaQ/stc/4o8UpDLDUwB7tvDwQMhy8LAWv
	 hi6Gu4/e2cKV1+D07GHN65MJLRVfqY1xpJH5KQCKGksVd7hlRwzzIfSB67Lsrf8rrq
	 5acULlsvzzQ+u/XZzBcmxWD6SMpvTJnAR1gQjrYtNIcK9uGjP4N61Sm55QGcVf4G4v
	 zUfeFl60FrJ3X0qdf8Br4pkJ2dVx9hQOQfm/WV43w+N/3r7KLqzuJzsN1BNjO2XxlK
	 Jm+XOCwqv52ZA==
From: Brian Masney <masneyb@kernel.org>
Date: Mon, 02 Nov 2026 16:15:16 -0500
Subject: [PATCH b4 1/2] review: look up git directory using
 b4.git_get_common_dir()
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-b4-review-tui-git-worktree-v1-1-35a925d92023@kernel.org>
References: <20261102-b4-review-tui-git-worktree-v1-0-35a925d92023@kernel.org>
In-Reply-To: <20261102-b4-review-tui-git-worktree-v1-0-35a925d92023@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Maxime Ripard <mripard@kernel.org>, 
 Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-7426f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=qVHLdyUUQNMVo7CjUbasoVJCtfjOtaFzhwj6+E5aN3Q=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJe/E1b/nT27z8ML//o2B1Ou1fpduXQg+/2v7wEee9fL
 +/f0eHxqKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJzLNgZHgozPjXb/uhW/x7
 AuXUEh36G8qm7vCKDjq00d576VfviX0M/9RjXcsfhzL47DgccTaLZctTvvu7v1ou5W4TMZKPaXn
 qwgMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The agent review code currently looks for a hardcoded .git directory in
the current tree, however that's not valid when a git worktree is used
since .git is a file. The current behavior will perform the agent
review, however the results of the agent review never make it's way back
to b4.

Let's change this code to use b4.git_get_common_dir() like the other
parts of this codebase.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/b4/review/_review.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f094bc7..8bb537fb291e 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -1396,7 +1396,7 @@ def _integrate_agent_reviews(
     patches: List[Dict[str, Any]],
     branch: Optional[str] = None,
 ) -> bool:
-    """Read review files from .git/b4-review/<tip-sha>/ and merge into tracking.
+    """Read review files from <git-common-dir>/b4-review/<tip-sha>/ and merge into tracking.
 
     The directory-based layout uses:
     - ``identity.txt`` for reviewer attribution (``Name <email>``)
@@ -1417,7 +1417,10 @@ def _integrate_agent_reviews(
         return False
     head_sha = out.strip()
 
-    review_dir = os.path.join(topdir, '.git', 'b4-review', head_sha)
+    gitdir = b4.git_get_common_dir(topdir)
+    if not gitdir:
+        return False
+    review_dir = os.path.join(gitdir, 'b4-review', head_sha)
     if not os.path.isdir(review_dir):
         return False
 

-- 
2.56.0


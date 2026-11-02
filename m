Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654126;
	b=F7xUXUz+kxvwhpA1sMVVJp3D1GGybfGpRY82ZIgno0aAe188VFKwpu5ZFl9gZ4sxv4kI
	 Xm44p3gEQc/e+DdnM+KHMnJDDBcVbAqbl95ABeMsA0LXPzyuYUpZFbibFPXuJ9fkiuDsH
	 LbNbWjH0TIPXTOrvaeSR/EvNu5mM0lN/N0CFi4BACHmouwvLe0tpOCyKjkKdSF22pbr7o
	 pV0ttNvKeUY9VfV41vSQajy7awCHWa6QOlPE6kEouxujb18d9PItgzcczyWXYJDKAIEOF
	 8RQqv0gP8lEYt0knn6+AeKZ8GkCfMJLoG7kYAxfSZ5jQIuiLcBZcSYbtVY0sZLlC9mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654126;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ptQ5RsObC28qkq4Qm26OJItYliBNUxOP6v0j+yKivtk=;
	b=l5lCw3BRr6HSWav/lm58B8pwO3YyaM6/ok+BArJyKyYVP9b97UAkLfpEwRvrdUEMQKdw
	 D/vXjbnnDgeB0w5IJeeWfBFLolRyT6nHPWd2jTRmC7TfnhfyeNUHm83OIisW37QdjEW+w
	 c9vTNf2TdpZkGAyxdxaz2Jzcgii/LILFWJwDIOZ1FV+Kc2YIN8+sHEV5TOMVFyZGZlfr4
	 /OOaR+1COsGdOleVVR0hEBCcp/Ff6jcbRuX8DOsutlxGE8DH3odtlE///bwe0EuFw7UdO
	 FwTmQJOlEUcAdeiAz48/qPvEJ866pW6khD/Q2Y/b0wVshlCaEh2B4B+ozLzQQVxVjhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KZe/KRQ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74166606A33D
	for <tools@linux.kernel.org>; Mon,  2 Nov 2026 21:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZe/KRQ/
Received: by smtp.kernel.org (Postfix)
	id 591E91F00A1E; Mon,  2 Nov 2026 21:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503F21F00A16;
	Mon,  2 Nov 2026 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793654126;
	bh=ptQ5RsObC28qkq4Qm26OJItYliBNUxOP6v0j+yKivtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KZe/KRQ/5ZYrnNfNqJN41m3xkApJIRyP8LA75PlOBnt2ZcP5w/prhXw9Z5GGV+DwM
	 LWdDVqK39AeqG0zkw4ZsE2Abe4OrBoh4/jh5rnbCgLNyMAwbYFLelIv2XZ4jb/GPIm
	 n8vQCzUvglCr6PzPKT2Yo/QG6eDYJp2WgkUl1w1jfndh8fMYHwUhTyB1daJm2nLx8M
	 XboV7v6VZG915NtjUUHDbIf5sS5QqR6zkSVbrudy5Tga25mrD15nQpceRr4hefeGlc
	 4c6sc46rBSFrzy/p6qi853pEdmaq9DEcfpm67MJzaypYpz0wxPQHptF9pgWMPksyeh
	 sLwPfuNH64jKA==
From: Brian Masney <masneyb@kernel.org>
Date: Mon, 02 Nov 2026 16:15:17 -0500
Subject: [PATCH b4 2/2] review: update agent-reviewer.md to take into
 account git worktrees
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
Message-Id: <20261102-b4-review-tui-git-worktree-v1-2-35a925d92023@kernel.org>
References: <20261102-b4-review-tui-git-worktree-v1-0-35a925d92023@kernel.org>
In-Reply-To: <20261102-b4-review-tui-git-worktree-v1-0-35a925d92023@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Maxime Ripard <mripard@kernel.org>, 
 Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-7426f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=CcR2J8DGf3ZqEMJmeparwtnX2NoiFHd/Z6bsqH8W0nM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJe/E1v6rBcetTf8+HNRcIFfbt0nK8+zY90OH7l1/Y9t
 lM3H/nE2lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBErrcyMvy6LuUs+/r4uT1i
 PanGMZuV9N4zuixLzjV9WbC8snHJp82MDFcKebkihFdqRaTm7pmpdErqZLq27d9ViqtXOlhE/65
 vZQUA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Update the text of agent-reviewer.md so that it will work properly with
git worktrees.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 misc/agent-reviewer.md | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/misc/agent-reviewer.md b/misc/agent-reviewer.md
index 2bb0853dda2e..600c6e651a90 100644
--- a/misc/agent-reviewer.md
+++ b/misc/agent-reviewer.md
@@ -2,12 +2,19 @@
 
 You are an AI code-review assistant. A maintainer has created a Git branch
 containing a patch series they want reviewed. Your job is to read the series,
-analyse the code, and write your findings as **review files** in
-`.git/b4-review/` so the maintainer's tooling can process them in the
-expected format.
+analyse the code, and write your findings as **review files** in the
+`b4-review/` directory inside the repository's common git directory so
+the maintainer's tooling can process them in the expected format.
 
 You may read the commits and the entire tree for context, but do not
-modify the repository other than creating files under `.git/b4-review/`.
+modify the repository other than creating files under that `b4-review/`
+directory.
+
+The common git directory is reported by `git rev-parse --git-common-dir`.
+In a regular checkout this is `.git`, but in a linked worktree `.git` is
+a file and the common git directory is somewhere else, so always use the
+command rather than assuming `.git`. In the rest of this document,
+`$GIT_COMMON_DIR` refers to that directory.
 
 Below is everything you need to know about the on-disk layout, data
 structures, and rules for writing well-formed review data.
@@ -210,7 +217,7 @@ any.
 
 ## How to save review data -- review files
 
-Write your review findings into a directory under `.git/b4-review/`
+Write your review findings into a directory under `$GIT_COMMON_DIR/b4-review/`
 named after the **HEAD commit SHA** (the tracking commit at the branch
 tip). The maintainer's tooling reads, merges, and consumes this
 directory automatically.
@@ -222,7 +229,7 @@ matches the new HEAD and is not re-consumed on subsequent runs.
 ### Directory layout
 
 ```
-.git/b4-review/<HEAD-sha>/
+$GIT_COMMON_DIR/b4-review/<HEAD-sha>/
     identity.txt      # required: reviewer attribution
     series.txt        # optional: cover letter review
     0001.txt          # optional: patch 1 review
@@ -318,7 +325,8 @@ Examples:
 
    ```shell
    head_sha=$(git rev-parse HEAD)
-   mkdir -p .git/b4-review/$head_sha
+   review_dir="$(git rev-parse --path-format=absolute --git-common-dir)/b4-review/$head_sha"
+   mkdir -p "$review_dir"
    ```
 
    Write `identity.txt` into that directory, identifying yourself.

-- 
2.56.0


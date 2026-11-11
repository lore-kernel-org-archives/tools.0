Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361280;
	b=LhKiE1wjctTzc1lxnR97Jn5ICXa72V07jTRQEkmkF2fIqb6iFROug9EzSqXwv7ZCruzE
	 TJcaoA+cT0hqh9RDMg9wKeeiav5Vh+CtQ1bYeE4VL2O2yp5P5tfeNWkMigW5UnMBvqJ5h
	 cgUyMuhrgbjXTiBaAsGwAJdQrRbs+WY1B/fQFlbAP1oMwlUhjW5l0Tx+jgFPw8LvFXF57
	 UukZbq01QmapBnS2H/zHm3GLCyv5iI8kF1ClUzSKo7iem1sEAI/1zv7j0JZZi3AhvXk8w
	 ycvTDqJX5zOiAhthQUpmpCvpEEVopzryET54LTQiUhN8vOQ6SOqMtQJlI0jENcQWwqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361280;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QHBs7seQEDQtuql2zOjYAHyQ7crpnfnqw6GbSijMMSU=;
	b=AbPT7d6OhMwGs4GJ/wFUZPQ8ndFVjULpsxh0z8nO4upCTzpAW9NYHA4yr8bUvs7uJhQZ
	 bObRxIjIXVxz6bQUM8wnkYZsUYYDRzPB0/hp6J8cGtGvl5w53idv8pLtdaHcJVudqtLBJ
	 o8kceTxGvYHe4zb9ZRyb6Ncv17Hk80h8k6ZBJHK/tdqhL4RWmeeyTnaePl4Ca1/dgDuPD
	 hNmVcMqrJyWVeOJPfupKewq+M4v9NhxpdWExtsbjTRjZo8XX77Zhz8SGQa+557ipYGleH
	 0nQ4TwDU9ICFhGLaYoqjXDRip7hQBN+qbG6nkGMnCS1XKTC/jl2CVInIT5mO68A4HqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfeIkFsj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C42606A31C
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 01:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfeIkFsj
Received: by smtp.kernel.org (Postfix)
	id 9D48B1F0093C; Wed, 11 Nov 2026 01:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9AA1F0089F;
	Wed, 11 Nov 2026 01:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794361279;
	bh=QHBs7seQEDQtuql2zOjYAHyQ7crpnfnqw6GbSijMMSU=;
	h=From:To:Cc:Subject:Date;
	b=lfeIkFsj5hjgJQumiKllpLr5gk0cnP8rPS5NunlbzPhf9mzFzjVW9G72LwRQfUewO
	 kC8ylSCczCxWhUlrgts1Q5HphWMhCAALhIAesrndxnFJzRERrr2LV8pq+4Cu1HWaqc
	 jdCFNzYTNVdfvsymmtxd1GKUH6XY7L7rPV6+4anGtKZQv9ZU9xMaemSRNq2uzekhY6
	 gAwcYFj/hupEU8Em8emKVYfCPoA6ptwNL4unsiL8/+lV5TyckV/bnKve0tgSbdHWVe
	 4yyo0zWH4uPMBJtXzzdvUXBxtFFbcHWzIsuQpdYF2+xEQLOSOBjqvn4lQghkW8J/4N
	 triOwJLKOwVKQ==
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] review: tui: Fix documentation of key for notes viewer
Date: Wed, 11 Nov 2026 01:41:11 +0000
Message-ID: <20261111014114.929035-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The notes viewer is entered by typing 'N' not 'n', fix the documentation to
reflect this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 docs/maintainer/review.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index d99df11..607185e 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -431,7 +431,7 @@ Key                        Action
 ``Tab``                    Switch focus between panels
 ``t``                      Trailers — quickly add Reviewed-by, Acked-by, etc.
 ``r``                      Reply — open ``$EDITOR`` to reply
-``n``                      Notes — view or edit review notes
+``N``                      Notes — view or edit review notes
 ``f``                      Followups — toggle follow-up messages and external
                            inline comments from lore
 ``a``                      Agent — run review LLM agent (if configured)
-- 
2.47.3


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F923BD1D
	for <tools@linux.kernel.org>; Wed,  1 Jul 2026 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913889; cv=none; b=jzAjZ2lPtXGrlx7Lo8cCKbn8hjzH1LwNls2h7bDa7h0KnN/l6/mABcPOUR9UO110xi8ZtcE2DNx3Qu1f/3iCx4QokLEEXV8wG80zsQtFCgykoi4aOrAa+sZpDmqOwYu67g7NAESf2wsxhL5zkY68WF5wmhR3t3CfaMxBlfX+iqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913889; c=relaxed/simple;
	bh=BVYh3XTeQGD1qRDJ1asRGS9J1+MVDNx7VyD4nvk9sUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUTjS1ex+pF7tTipZAptTDWjMiSpLbmscSLBWIYI/EpVq8tQ95JBGweojWF6zcSbUcUSRViq6gH9uRKp2xJbFUKUlHJKBKDDKOIwkck61X03rtcVt6XvmKnOmZIFZhhugwdk/IjMTRsYqW1+nkGBoUEZIllDAQ5hYvdXQB0gF9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CN96V7Pq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CN96V7Pq"
Received: by smtp.kernel.org (Postfix)
	id 521701F00A3E; Wed,  1 Jul 2026 13:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBF61F00A3D;
	Wed,  1 Jul 2026 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913888;
	bh=zjehOviV7cWzaPHviC88gcx6izu26TW3RA8JLyy3lAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CN96V7Pqzyff3iZVn0Rd1RkQwo3Zw2FEn7TbwATq6Ld4cpLKhsStyuxF+rKE2UChX
	 MBABiXouo2bxk2/ZOuVm5pLSPMnCEaIPpEP/MqjZBhAq00pS26TaLC6d3aC5pQY6NB
	 0yrADP8x0/KvN2QomG/RHh89G3Mn2KLXmfdxG/i4Xz2uqp4W3EKAk8+Hm277iZ8//L
	 4fNGc5pu3peJa1tFECIsDzbVboOVz8AyJX3n1PvaU28Xl1AlZrQTFvkhfJdry88y9y
	 cccX5qkhAqQODNdLpZyH0JBOcMwFq0dTxumwxwEAUL8LfJ72NUNqRnp1AH3W3duFjB
	 Xf0MfN5CptgWA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 01 Jul 2026 15:51:21 +0200
Subject: [PATCH b4 1/2] Detect naked cover letters that lack a 0/N prefix
 and diffstat
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-work-b4-naked-cover-letter-v1-1-f651c2ffb63b@kernel.org>
References: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
In-Reply-To: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646; i=brauner@kernel.org;
 h=from:subject:message-id; bh=BVYh3XTeQGD1qRDJ1asRGS9J1+MVDNx7VyD4nvk9sUk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS5SsfOssxmnp9p9M9cUffV9K1/on7qXNrW1XUmcEqU5
 LozDEd+d5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkBw/Df5cXdfN6exPPrdDh
 f16nnvrzi8NmaUM/4zfLJtelPTn7hYXhn7qfQvGa6+dZLY9Mt5mRdD5q8hrZgv/vj1c+2sI26cH
 09ewA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

LoreMailbox recognized a cover letter only when the message carried an
explicit zero counter ([PATCH 0/N]) or, via the in-reply-to fallback in
get_series(), when the thread root carried a diffstat.  A "naked" cover
-- one with neither a [PATCH 0/N] subject prefix nor a diffstat in the
body -- matched neither test.  It was filed under self.unknowns and
dropped, so LoreSeries.has_cover stayed False.

The user-visible fallout is in shazam -M, which then reports "No cover
letter provided by the author" and links the first patch instead of the
real cover.  This bites postings whose author writes a short prose cover
with no diffstat, e.g. Christoph Hellwig's "don't build bios/contexts
over multiple iomaps" series, whose cover carries no [PATCH 0/N] prefix
and no diffstat:

  https://lore.kernel.org/linux-xfs/20260629121750.3392300-1-hch@lst.de

Extend the in-reply-to fallback to also accept the parent as the cover
when it is a non-patch, same-author thread root (in_reply_to is None and
not itself a reply).  Requiring the same author and the thread root keeps
us from mistaking an unrelated message the series was merely sent
in-reply-to -- a bug report from someone else, say -- for a cover letter.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d7b41ee..ad5f62f 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -393,10 +393,15 @@ class LoreMailbox:
             for member in lser.patches:
                 if member is not None and member.in_reply_to is not None:
                     potential = self.msgid_map.get(member.in_reply_to)
-                    if (
-                        potential is not None
-                        and potential.has_diffstat
-                        and not potential.has_diff
+                    if potential is None or potential.has_diff:
+                        continue
+                    # A diffstat marks the classic cover letter; a naked cover
+                    # (no [PATCH 0/N], no diffstat) is only trusted when it's a
+                    # same-author thread root.
+                    if potential.has_diffstat or (
+                        potential.in_reply_to is None
+                        and not potential.reply
+                        and potential.fromemail == member.fromemail
                     ):
                         # This is *probably* the cover letter
                         lser.patches[0] = potential

-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1E1FF7B3
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125490; cv=none; b=gk6VNOK+9s09EVM/vSvo1pzsqROXWI/Ju54HNFsBQNaq12svVUE5CKeqwiOzFt0PGuUxx2cA/jMJw31jNgYHRrH7AVzhSozhFlCMbX+Iyn49J5Uj67Hj6hYRZm8/uwkJJ+C2wUDTXI6n9nd5C/CKLcZ8cHLVFwe5v5RiD512iwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125490; c=relaxed/simple;
	bh=Ij3uO4LLKmJFIF1gxsVp5+nD9x89avYuyNxPk+rKBi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWDGRKd97yR+q7/AReV68alMWKGMtbCrKdojCxxw6LjZEnYweILIkwnuoGgGNAfj6rCdCy2ebUE3iXSYFuGlj2gTTFGAuWjya2H4rJ6De03sRjpdXWvsLQzGlCX/c6uf6Q6KxvEbe6GCoxXkz2JcTiOA25YW6dIBLxEqq8ORoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 31198C116D0; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E46BC2BC87
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E46BC2BC87
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bb5ZgWzlKy;
	Tue,  3 Feb 2026 14:31:19 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54Bb13YGz8DM;
	Tue,  3 Feb 2026 14:31:19 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:14 +0100
Subject: [PATCH b4 15/21] docs: config: fix double colon typo
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-15-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

This currently renders as "Default::" in the build output, which is
wrong. Let's fix that by using the same style as everywhere else, that
is, one colon.

Fixes: cd43f60e6a49 ("docs: proofread and fixes")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index 3abe80a..9da8e32 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -402,7 +402,7 @@ Contributor-oriented settings
   stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
   it uses the command shown below by default.
 
-  Default:: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
+  Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
 
 ``b4.send-same-thread`` (v0.13+)
   When sending a new version of a series, send it in the same thread as

-- 
2.52.0


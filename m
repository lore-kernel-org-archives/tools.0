Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB11FF7B3
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125489; cv=none; b=IaMQlCnRN7OEedE4L/deA0KFzgGaMjAldZ8RKI02CjQxAOjP6qocKhnMcS1R43HL0MhArvfaBsOBRTnYclJq202nhsOxPZFnegLtMATRZb/1bbH8efDT4XiVWKMvnFZKBK2bs3+2V7S9geVWtYXSjtXdBNfQ4PQtJ6JhyHpidhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125489; c=relaxed/simple;
	bh=ug2UnNcecbBVEvpZEwtJvFLRPV9tE3zu8dFkzPmt6kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fz/qfLxkmvUur5AZtPwva2Xk2d9+VtkCUhV500kgSH4Q86406UJmaiQZn5e4+qxhS3Vr18PJs25zXjjHs1u2CN3vvczpbgF4X+JylNBZs9Kcjr6Rh01jA5b8Wex9fdQCEH2TxWyuEPlX8E2+vADtkebxGWHJSL3WqLUyvp9evFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8FCA8C19422; Tue,  3 Feb 2026 13:31:29 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64758C2BC86
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64758C2BC86
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BZ12l0zlHW;
	Tue,  3 Feb 2026 14:31:18 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BY55mBz8v6;
	Tue,  3 Feb 2026 14:31:17 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:11 +0100
Subject: [PATCH b4 12/21] docs: config: add missing dot at end of sentence
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-12-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The other definition lists always have an end-of-sentence dot, so let's
be consistent here.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index aff0ec3..5b1954d 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -151,7 +151,7 @@ These settings control ``b4 am`` and ``b4 shazam`` behavior.
 
 ``b4.shazam-merge-flags``
   Additional flags to pass to ``git merge`` when performing a merge with
-  ``b4 shazam -M``
+  ``b4 shazam -M``.
 
   Default: ``--signoff``
 

-- 
2.52.0


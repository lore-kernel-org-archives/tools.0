Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E233F8A1
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125489; cv=none; b=QPtXDgIaPOA6Zl422SJjDMmDOpc4m6fsh5bCObf9vCzY/70O8CEUVoVo/GfxhKrvLAiK71KK1S3K0MCquWmeleeGroonWQmEKk4StNY82cMap5Kv5UcY5oYakP9myznuZsTkAfogvZo0X+JSXv0abBMe6khMyjYzUgBSa8gLxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125489; c=relaxed/simple;
	bh=Or4WNor8WivJvP6y9zqWygOT5ckksVS854VM5E44uVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ALjlb15j9HessgCTHXHus69Ol0cDP15bEnKDiDFpmls2ET0HsttTzRv00AJzPtr0MGTxpbZCooBjwTfB4yKV/yI+JtyBDqIkQ2KlveJNdrWe3UWovU5rjzByF7PAwjpeNLEtzKLUJ5Q54LjeTJtvPD0U1GyYjYwPWBSgLZyzKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id A6988C19425; Tue,  3 Feb 2026 13:31:29 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49DC2C116D0
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49DC2C116D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BZ4BwGznKR;
	Tue,  3 Feb 2026 14:31:18 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BZ15xPz8Mj;
	Tue,  3 Feb 2026 14:31:18 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:12 +0100
Subject: [PATCH b4 13/21] docs: config: provide link to patatt
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-13-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

We already provide a link to patatt in b4.attestation-policy so let's do
that for b4.keyringsrc as well.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index 5b1954d..2465ad0 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -220,7 +220,7 @@ Attestation settings
   Default: ``None``
 
 ``b4.keyringsrc``
-  See ``patatt`` for details on how to configure keyrings. For example,
+  See `patatt`_ for details on how to configure keyrings. For example,
   you can clone the kernel.org pgp keys repository and use it for
   attestation::
 

-- 
2.52.0


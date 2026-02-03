Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E9C1FF7B3
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125488; cv=none; b=pM6drgq2ECwNjye8/0Sh7SyKjX10s986CpX+dJwy3PrrO1Z9GCGIATrFXFmJ6QJot4c2eYOL3b0z1TRSGnhFfouspTYvFdelOxT0UfLqmmQug58lZcdnP8ExubyjhQXhG6Uc55wAiEhYrVPnPOHR85fbKbBKjSwKLxbfbWjk60o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125488; c=relaxed/simple;
	bh=gptWbLd/2Fhl+Jp/f3d0usifLZ8B+5sm0FWjLXHjnF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDP5fEntLksGJTY4xoYUSVMYCD8j2p4zAjcE0W+QcUeSG25zv6aZuCm4chfwXOjg0Kyga86peLR2xPdt4RiosjwCMUYMoamgbUZXRKF27bOHgsYXtVepm6lWJHTVDW+8rN/XVZlUUrv5UnP+65M4JPLBidn0d6m9RlZZjHsXILo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 2DAC3C19425; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67A63C2BC87
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67A63C2BC87
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BX701NzmtK;
	Tue,  3 Feb 2026 14:31:16 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BX3nX4z84n;
	Tue,  3 Feb 2026 14:31:16 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:09 +0100
Subject: [PATCH b4 10/21] docs: config: fix discrepancy between example
 strings
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-10-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Commit 707da4b965ea ("am: add the -i/--add-message-id switch") updated
the example code-block but not the string in the sentence that precedes
the code-block, resulting in a mismatch. Let's fix this oversight.

Fixes: 707da4b965ea ("am: add the -i/--add-message-id switch")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index 594a857..6b33c33 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -61,7 +61,7 @@ These options control many of the core features of b4.
 ``b4.linktrailermask`` (v0.13+)
   Overrides the format of the ``Link:`` trailer, in case you want to
   call it something other than "Link." For example, some projects
-  use "Message-Id" trailers instead::
+  use "Message-ID" trailers instead::
 
       linktrailermask = Message-ID: <%s>
 

-- 
2.52.0


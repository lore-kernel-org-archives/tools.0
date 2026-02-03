Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA55733F8A1
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125486; cv=none; b=h7/KXEi44PU2oav3ajsnKrAdMCcsKWYROJv0rhXPbvrS2dBgxppRouy1W88mFf3dSlBk7ySuliuOvOe6sehY5EXxpdI3BBZmkHOAbAKFmNbhLb51gutayKjtn2Ztgl1au9MgP+ihOgk7ztlbtwmglo5O54iq08OpwYpOGzx4scw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125486; c=relaxed/simple;
	bh=ayulIfh4c9S1P+/XGBEsqOoCptdLPGm9y0mYSqPhqKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gwk6A+wpP76pmXyPV8RlkBBlLscgV/UInrZlfToZpFNbGezI8GkJoGj6jWuGvMeu0x3X43dagHK/+NL8Uy4pYTQyWBnH+iatuuEgO3PywER7zBn6mZxH+t1ljsYNtItTldt0mgOdf9w3gSm8bYrbpnRaCojWednt5Rt1LZyd5yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 9B929C2BCB2; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3D2CC116D0
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3D2CC116D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bf64ScznWs;
	Tue,  3 Feb 2026 14:31:22 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54Bf327Vz8nt;
	Tue,  3 Feb 2026 14:31:22 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:20 +0100
Subject: [PATCH b4 21/21] docs: maintainer: am-shazam: cross-reference
 b4.linkmask for --add-link
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-21-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The --add-link boolean option will be using the linkmask b4 setting so
let's make that clear how to specify a different template.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/maintainer/am-shazam.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index 5c3fb75..54b6fc4 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -115,7 +115,7 @@ The following flags are common to both commands:
 
 ``-l, --add-link``
   Adds a ``Link:`` trailer with the URL of the retrieved message using
-  the ``linkmask`` template.
+  the :term:`b4.linkmask` template.
 
 ``-i, --add-message-id``
   Adds a ``Message-ID:`` trailer with the Message-ID of the retrieved

-- 
2.52.0


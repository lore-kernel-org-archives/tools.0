Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5BF1FF7B3
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125487; cv=none; b=RMzdJVJo4cADdcD2mmTog1zaIYUZlZXTWuiFWthsywOmcSlSqWHGn6Mrwehs3YCuGWAxVap+U9OvuKO9oFpCh28qLg9mA+4n0T47bWAHvVX92g41elZdVuROfpsfyu0tQiNrJS3Pl8+Iewwqi2aCM1DQ2TEjo4BMfckq6umeSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125487; c=relaxed/simple;
	bh=6Lpu8OOwVVfrkVOrGVyggiv85O9m0uxrP07uAk/qkG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ot0pxgQTsyy87IOXoxaX1xDRmAYqpNYVTLtFOaRyUXpcE8THQa0A1W/6oHOKXd4Y+eo08oe0XeYLXilUvP6x96Dvssu9S5PpP98X1uSM02XglEBJRz1sAjPnsf/V93mIGw4UbCdtqLWyVdqaoBGEI9/WtdSGLP3cBghVrh3UIeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8CF37C2BC9E; Tue,  3 Feb 2026 13:31:27 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92D9EC19425
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92D9EC19425
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BX3l80zlHV;
	Tue,  3 Feb 2026 14:31:16 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BX0bnZz8ns;
	Tue,  3 Feb 2026 14:31:16 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:08 +0100
Subject: [PATCH b4 09/21] docs: config: provide link to git-config conf
 file documentation
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-9-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

So that it's easier to get access to the appropriate git-config
documentation.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index a9006a5..594a857 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -1,6 +1,7 @@
 Configuration options
 =====================
-B4 doesn't have a separate configuration file but uses ``git-config`` to
+B4 doesn't have a separate configuration file but uses
+`git-config <https://git-scm.com/docs/git-config#_configuration_file>`__ to
 retrieve a set of b4-specific settings. This means that you can have three
 levels of b4 configuration:
 

-- 
2.52.0


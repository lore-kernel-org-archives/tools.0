Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B01FF7B3
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125490; cv=none; b=YelCbCwEZ54GP97mxdZVv9QJhgJY5eE4QOcroSpmdDwT3AVvJXosZzp5r5BmQs31KtbnnhZGYPVVntGbhNOKeOYNL6aEFwLGI7PjTBdIu3yKqCyVyF26ibDONLGl24pzgFZ+DUDe5hwQPD0pywiZ1knsDCdxbNHsvbiDP1bmBQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125490; c=relaxed/simple;
	bh=zC6lG/SiQYWnPtCNCKVDtIrzDUQtBJsMEQb3d8kXTj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aM62h++MGXJD/JVe+ei8ByBtZKRkMWftbkwcuGlX0gaaD+Ll8npMi/y1cKJVkNV30MwexNO5wWW92Z9b1PIcXSxDafPbb6qJFH/UWAZO6G4J8kX//6PicA+E2Ul3MDYZ6NL/ASB+Hn54pGgVw8sSk5A3Yr0cqxJ1vEM9dMFVrSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 5AFD1C19425; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8847EC19421
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8847EC19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bb165czNZP;
	Tue,  3 Feb 2026 14:31:19 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BZ4Xq6z8Yk;
	Tue,  3 Feb 2026 14:31:18 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:13 +0100
Subject: [PATCH b4 14/21] docs: config: provide link to git-send-email
 manpage
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-14-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Makes it easier for users to have access to the manpage from the
browser.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 2465ad0..3abe80a 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -294,8 +294,9 @@ Attestation settings
 
 ``b4.sendemail-identity``
   The ``sendemail`` identity to use when sending mail directly with b4.
-  This setting applies to ``b4 send`` and ``b4 ty``. See ``man
-  git-send-email`` for info about sendemail identities.
+  This setting applies to ``b4 send`` and ``b4 ty``. See `man
+  git-send-email <https://git-scm.com/docs/git-send-email>`__ for info about
+  sendemail identities.
 
   Default: ``None``
 

-- 
2.52.0


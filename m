Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5439B4B9
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125490; cv=none; b=Nu7+HK+Ppiccf0prHmI0GGVS/aHMEidXFDF8BFJB60BCHt/K8LArHu1FJiaMGBdCh83aHCg3uD/lDZ6V8F4w1cwSturiCPYkUxcJO7U/9PhcqrphBIBRu7jT5ks53AhbfQO+o4ZC8BicPX/JjcIVn2uOf+lE2rGM7HmKecZvZ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125490; c=relaxed/simple;
	bh=pCK3/s/Hum2ToXaeSvs+0cr530OTNwBFTwP+bgOX/98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVH9TOZ+6VGE5mO5V61yFoqsvmJJE/+i19PxAAXxaP/R+pozS8WQhKkMhIYPRJ7nq7BtDSFpt22qXbiCg9goPJNvauHO94k8c9f5v37l2JhNl7FW44QrcwGQnm8+eFn2iyvMqtDKRh/d67AOtN7G5sxwdYqZmRVwuxWhwCAr3lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 45791C19422; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C17AC2BCB5
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C17AC2BCB5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bc2WXKzlL0;
	Tue,  3 Feb 2026 14:31:20 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54Bb68H9z8by;
	Tue,  3 Feb 2026 14:31:19 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:15 +0100
Subject: [PATCH b4 16/21] docs: config: provide example content for
 template files
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-16-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Instead of telling user to have a look at example templates stored in
the repo, directly include them in the docs such that they don't have to
look for them.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 9da8e32..edd4678 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -156,8 +156,10 @@ These settings control ``b4 am`` and ``b4 shazam`` behavior.
   Default: ``--signoff``
 
 ``b4.shazam-merge-template``
-  Path to a template to use when creating a merge commit. See
-  ``shazam-merge-template.example`` for an example.
+  Path to a template to use when creating a merge commit. Take the following
+  as example content for this file:
+
+  .. literalinclude:: ../src/b4/templates/shazam-merge-template.example
 
   Default: ``None``
 
@@ -239,13 +241,17 @@ Attestation settings
 ~~~~~~~~~~~~~~~
 ``b4.thanks-pr-template``
   Full paths to the templates to use when generating thank-you messages
-  for contributors. See example templates provided with the project.
+  for contributors. Take the following as example content for this file:
+
+  .. literalinclude:: ../src/b4/templates/thanks-pr-template.example
 
   Default: ``None``
 
 ``b4.thanks-am-template``
   Full paths to the templates to use when generating thank-you messages
-  for contributors. See example templates provided with the project.
+  for contributors. Take the following as example content for this file:
+
+  .. literalinclude:: ../src/b4/templates/thanks-am-template.example
 
   Default: ``None``
 

-- 
2.52.0


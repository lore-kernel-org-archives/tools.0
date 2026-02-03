Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78A39A81A
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125485; cv=none; b=elHKS2CQvvuP6AvipPplQVw9CCG6X6Q/afLNM5ocSOkxRjVnw0nsBP78suQvKyTzkxA27E9DghrnXWMaGk2nbhI4AY/Jnj6W9G7tbO0MiUjU/8RK/ZaIMkBog1jkk/RONs9NPWeWqK+No0KLXrzftkL5ImvWzB6pRjDAyA8IJVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125485; c=relaxed/simple;
	bh=QWfmg3pelQuFXQ7LxUwElEfnXCAkNvA02CLQMxuzLO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7f5bsLpg1PwYMEz7TvtMYwReCPqd261jqyTd+RN6ucq0Zg6zHEhCr64QWzO8KvHwffy11QC8g3ktoIZqDDeijeVWbVkpCe2bbzZ4OUUca5+9BDnlbvpGDwPIT6feVwOXs20DWSVJ1/UQP7AjtFMYkRJ5g8zcj2R9bBA0FvV2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8ACD1C2BCB1; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C1EFC2BC87
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C1EFC2BC87
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BV1xybzmb5;
	Tue,  3 Feb 2026 14:31:14 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BT5nZ0z794;
	Tue,  3 Feb 2026 14:31:13 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:04 +0100
Subject: [PATCH b4 05/21] docs: config: separate b4.thanks-pr-template and
 b4.thanks-am-template
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-5-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

While their definition are identical (so far), they are for different
things and this way of presenting the configs may confuse the user into
thinking those are aliases for the same thing. They aren't, so split
them.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index a1145af..a9006a5 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -236,7 +236,13 @@ Attestation settings
 
 ``ty`` settings
 ~~~~~~~~~~~~~~~
-``b4.thanks-pr-template``, ``b4.thanks-am-template``
+``b4.thanks-pr-template``
+  Full paths to the templates to use when generating thank-you messages
+  for contributors. See example templates provided with the project.
+
+  Default: ``None``
+
+``b4.thanks-am-template``
   Full paths to the templates to use when generating thank-you messages
   for contributors. See example templates provided with the project.
 

-- 
2.52.0


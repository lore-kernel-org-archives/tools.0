Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6A39A81A
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125485; cv=none; b=P4EjgsodwmOYitlf76Tfj0jkzoxWgvm9Im/H7dFyDiPelOdxPiYM8Eu/rPB7owOsu+DPBlDk5hnXm/7mtYxZtVV96aoyFcgs1/3a875jJY5wFSVW9uATIRxt/pq+wQLLzLVe2JnepvvX761u9Kn6oMP96uS9IDpeb5M9fEZrRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125485; c=relaxed/simple;
	bh=JAAJjesH2uBpFsTIWAQAF65NiT5Z8IS2a28KrmEBZWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A5qpLWD6ndK1P3iZTCtOanab3uEMhrK9N0pcIXSkFGK55BwhlbYCssiTeE0dRR3KcAw3imJDMwOuw1yVXBrpNL6eAbqGESZT2XqPZ9O3j/brvjca/280IvGwJp24/+jFq05+K4fwmBhZTNmYokqoNyADDc7Cf+pMuJiSexufNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 51B4EC19425; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B44BC19422
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B44BC19422
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BT1RSyzld7;
	Tue,  3 Feb 2026 14:31:13 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BS4xtJz84l;
	Tue,  3 Feb 2026 14:31:12 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:02 +0100
Subject: [PATCH b4 03/21] docs: diff: add info on when range-diff-opts was
 added
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-3-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

This specifies since which release the range-diff-opts option is
available (which is not yet, hence v0.15).

Fixes: 3c7fbc395fc6 ("diff: support passing arguments to git range-diff")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/maintainer/diff.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/maintainer/diff.rst b/docs/maintainer/diff.rst
index 7911cdc..4e3fac0 100644
--- a/docs/maintainer/diff.rst
+++ b/docs/maintainer/diff.rst
@@ -47,6 +47,8 @@ Optional flags
 
       b4 diff --range-diff-opts "--creation-factor=80 --no-dual-color" <url>
 
+  .. versionadded:: v0.15
+
 ``-o OUTDIFF, --output-diff OUTDIFF``
   **(DEPRECATED)** Sends ``range-diff`` output into a file. You should use
   ``-n`` instead and redirect output from the actual ``git range-diff``

-- 
2.52.0


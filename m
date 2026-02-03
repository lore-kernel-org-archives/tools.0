Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE0F2C08CB
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125486; cv=none; b=KUzdmbaFQObfgbu48lJgJFlcvOqV9z7GeIg0kE8cmVqrWrfaV7ISbsvd6QOROpIA6apOli+Wm0vreKlnHNo4bQEGfUSkRNxGJM6x14ZEM65XB2dA1QjggCHESb2Asz4WQgyJSZ73c0xwl/u2wzmt7i+7H20kuXnDGZhkpFxJh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125486; c=relaxed/simple;
	bh=2IaLOsXnG+y41fpCA/yWpPQfTj7zLEAeIkOyjXiZrmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GN3m8hZ3PNUY5GTwcy2mNHrSVtTmfiXbrznaDuUYd9iC8KOhAsPi7QGYPgg23Phne1OhT3HPHctnPHY6JKOLevrGcnCgQUgAW6Caf7JaTG9fH5uy85B0bw4ZaO4kKNfmXa5E9WxtZgWa/80/hc0Qvyf3B33ECZDyhGSdXTCGvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 08B2DC2BC9E; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50EA2C2BC86
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50EA2C2BC86
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BT5TW7zncP;
	Tue,  3 Feb 2026 14:31:13 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BT2Bryz9Hq;
	Tue,  3 Feb 2026 14:31:13 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:03 +0100
Subject: [PATCH b4 04/21] docs: contributor: send: fix sendmail typo
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-4-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

There's a sendmail binary, but the git configuration settings are
sendemail and not sendmail (and you can use sendmail in sendemail to
make things more confusing), so let's fix that oversight.

Fixes: e8045d135316 ("ez: Add --use-web-endpoint arg to force web endpoint")
Fixes: 890fdc05400e ("docs: document pre-flight checks")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/contributor/send.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 54ed474..0de2aa5 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -141,9 +141,9 @@ with the following setting::
 
 Using your own SMTP server
 --------------------------
-If there is a ``sendmail`` section in your git configuration, B4 tries
+If there is a ``sendemail`` section in your git configuration, B4 tries
 to use that by default instead of going via the web endpoint. At this
-time, b4 only recognizes a subset of ``sendmail`` options supported by
+time, b4 only recognizes a subset of ``sendemail`` options supported by
 git itself. The vast majority of servers should only need the following
 settings::
 
@@ -156,7 +156,7 @@ settings::
 
 You can also set up ``msmtp`` or a similar tool and specify the path to
 the ``sendmail``-compliant binary as the value for ``smtpServer``. To
-force B4 to use the web endpoint even when a ``sendmail`` option is
+force B4 to use the web endpoint even when a ``sendemail`` option is
 present, use the ``--use-web-endpoint`` switch.
 
 Sending your patches

-- 
2.52.0


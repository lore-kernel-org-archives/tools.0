Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1F939A81A
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125484; cv=none; b=Xavk08i7BlDKBSXj7YZg9kD2gDp9GtDT4nvXI+DJaySqvsOLeyK4Qlr2Fo3dnlAOqUgSG/L3QvdyWsIoIHo27Pb8Er7sP9/C9dSeK93jJ+keb33tH4yeCDzb/4Ar/UUULUp5S/OqhGiL4nbjizuD+Ijj/5H6ComvgYyNVDxF7jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125484; c=relaxed/simple;
	bh=r6Ls6aUyEE7DEQr2/dHi8TUG2B9nURhYbxGQEaOgeSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJMgFQeB3iEQSE8HkZXE/B6K4x8Qe76AdAbvw+Z3dI+5vMGCGd9qWeV3YLbE87h1pyXp5tBJXYCnKiO2uKxfj7epprkiZdalEZWNOiP+/WQ26wE3G3c09rl0bT8hSxTk8qsINCySx7XedJdhAM6ME5O+d3nt6b3P1HoF+Jv9nI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 2A2BFC116D0; Tue,  3 Feb 2026 13:31:24 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 956A3C19421
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 956A3C19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BS47wwznQg;
	Tue,  3 Feb 2026 14:31:12 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BS119rz7nD;
	Tue,  3 Feb 2026 14:31:12 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:01 +0100
Subject: [PATCH b4 02/21] docs: prep: add info on when range-diff-opts was
 added
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-2-fddb72511357@cherry.de>
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

Fixes: eb4a66b12bc4 ("prep: support passing arguments to git range-diff")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/contributor/prep.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 18c710d..4c26602 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -500,3 +500,5 @@ modifying defaults for some of these flags.
   ``--compare-to``. For example::
 
       b4 prep --compare-to v1 --range-diff-opts "--creation-factor=80 --no-dual-color"
+
+  .. versionadded:: v0.15

-- 
2.52.0


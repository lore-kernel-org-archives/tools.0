Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4733F8A1
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125488; cv=none; b=CylIAN9LdeJfNAk4tmcFA3Pfz4elGOj5m4Mbio54Be+9oi/L4kf53LkyoB8+IYgVHdZkbJXvPn6wbLIHQ1D/aUovVRKYH1zjz18BQ51qp8DlUL4yaG3KMWFbcRHwNiu6zJlz4+ExMbqJKBB03eTTEREMrVGLI+Tb+0YL38wv8Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125488; c=relaxed/simple;
	bh=1/DWFKxLVEgofSCmSESEwAVjvF7fhmkxWJMcf+OkMq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rP0TUzlpLRsT5ho+z7Nfrw5BmuR+a9wWBYR1WLEYi8pvx3LAMezqszRxfyIkDXTgDt5C86tz0+vc9LsMwB4DT07SLF65/G1DFhDlSY3m3mGg/hu+u1yumg0qlk+0qjZyVGUkuNoa4xlhZyr6Qv95pk4HyoMjCsLgB5NtKluR5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D9BC1C19422; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8221C2BCB7
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8221C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BX0KlRznlt;
	Tue,  3 Feb 2026 14:31:16 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BW40Twz9gt;
	Tue,  3 Feb 2026 14:31:15 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:07 +0100
Subject: [PATCH b4 08/21] docs: maintainer: use deprecated admonition
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-8-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Use the rST deprecated admonition[1] to specify since which release this
has been deprecated.

One can add information as to what to replace the option with, so that's
what's done wherever we have that information.

The version is the first one to have the commits which inserts the
deprecated string for the options, which is commit 2ce1e619ddb4 ("docs:
complete most of the maintainer docs") available in v0.10.

[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-deprecated
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/maintainer/diff.rst | 14 +++++++++-----
 docs/maintainer/pr.rst   | 13 +++++++++----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/docs/maintainer/diff.rst b/docs/maintainer/diff.rst
index 4e3fac0..f546fd6 100644
--- a/docs/maintainer/diff.rst
+++ b/docs/maintainer/diff.rst
@@ -50,10 +50,14 @@ Optional flags
   .. versionadded:: v0.15
 
 ``-o OUTDIFF, --output-diff OUTDIFF``
-  **(DEPRECATED)** Sends ``range-diff`` output into a file. You should use
-  ``-n`` instead and redirect output from the actual ``git range-diff``
-  command.
+  Sends ``range-diff`` output into a file.
+
+  .. deprecated:: v0.10
+     You should use ``-n`` instead and redirect output from the actual
+     ``git range-diff`` command.
 
 ``-c, --color``
-  **(DEPRECATED)** Show colour output even when outputting into a file.
-  You should use ``-n`` instead and modify flags to ``range-diff``.
+  Show colour output even when outputting into a file.
+
+  .. deprecated:: v0.10
+     You should use ``-n`` instead and modify flags to ``range-diff``.
diff --git a/docs/maintainer/pr.rst b/docs/maintainer/pr.rst
index 46db7ee..ca0310d 100644
--- a/docs/maintainer/pr.rst
+++ b/docs/maintainer/pr.rst
@@ -64,14 +64,19 @@ archival public-inbox so they can be analyzed by archivists at a later
 date if necessary.
 
 ``-f MAILFROM, --from-addr MAILFROM``
-  **(DEPRECATED)** When exploding pull requests, use this email address
+  When exploding pull requests, use this email address
   in the From header, instead of reusing the same From as in the pull
   request.
 
+  .. deprecated:: v0.10
+
 ``-s SENDIDENTITY, --send-as-identity SENDIDENTITY``
-  **(DEPRECATED)** When resending pull requests as patch series, use
+  When resending pull requests as patch series, use
   this sendemail identity.
 
-``--dry-run``
-  **(DEPRECATED)** Force a --dry-run on ``git-send-email`` invocation.
+  .. deprecated:: v0.10
 
+``--dry-run``
+  Force a --dry-run on ``git-send-email`` invocation.
+
+  .. deprecated:: v0.10

-- 
2.52.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6439C624
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125493; cv=none; b=fEvkucpO7fNnjM1K6taqyslcPBy2DfTjvzR22eNf5/a5PbvrsYBB7OsdZTtIbPbqkzxO1nV95gkQqc8RoeH9AcFzfwMerkNeyjuWr2woPaPejDqJcDpfnWl1z0n81CjunuKQBfTX3cfRngUKriRKsQjuvK9whSajew5AlLho7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125493; c=relaxed/simple;
	bh=wc4t/FUuP2nKC/DGZ4AF9aVDkUkmZlJmdPAe7bl4qwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZTRXtnfTnJB2nxOigiHwgFzWRCZDqQOOJWSJryCtxmP3T9Dw+/d7dre+OFqtn8frpx/vbjW1gckvH8l3KgsOSU6aejxBBIQL/dENhjwaPFD7uCsfB12gfM28a2kk0ttIPtP1OfrKPwfVgUt1E3SqpJbuvLz05NmFt2FTX9fbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 705A9C2BC87; Tue,  3 Feb 2026 13:31:33 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60073C19421
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60073C19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bf3Knpzmwh;
	Tue,  3 Feb 2026 14:31:22 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54Bd6PVXz82h;
	Tue,  3 Feb 2026 14:31:21 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:19 +0100
Subject: [PATCH b4 20/21] docs: cross-reference config options with :term:
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-20-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

This inserts a link to the definition of the config option such that
it's either to find it.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst               | 2 +-
 docs/contributor/prep.rst     | 4 ++--
 docs/contributor/send.rst     | 6 +++---
 docs/maintainer/am-shazam.rst | 2 +-
 docs/maintainer/ty.rst        | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index f2ed519..d2a80c2 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -28,7 +28,7 @@ file in the repository you're currently using.
 Configuration options
 ---------------------
 All settings are under the ``b4`` section. For example, to set the
-``b4.midmask`` option, add the following section to the relevant git
+:term:`b4.midmask` option, add the following section to the relevant git
 config file::
 
     [b4]
diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 9c27b64..e6b45c7 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -65,7 +65,7 @@ disadvantages in some less-common situations:
 
 For this reason, b4 supports alternative strategies for storing the
 cover letter. You can tell ``b4`` which strategy to use using the
-``b4.prep-cover-strategy`` configuration variable.
+:term:`b4.prep-cover-strategy` configuration variable.
 
 ``commit`` strategy (default)
   This is the default strategy that keeps the cover letter and all
@@ -400,7 +400,7 @@ modifying defaults for some of these flags.
   ``./scripts/checkpatch.pl --terse --no-summary --mailback --showfile``
 
   You can specify your own command by setting the
-  ``b4.prep-perpatch-check-cmd`` configuration parameter. For example
+  :term:`b4.prep-perpatch-check-cmd` configuration parameter. For example
   you can make it more strict::
 
       [b4]
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index f5a1ff1..ba18ef5 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -311,13 +311,13 @@ Command line flags
 ``--to``
   Additional email addresses to include into the To: header. Separate
   multiple entries with a comma. You can also set this in the
-  configuration file using the ``b4.send-series-to`` option (see
+  configuration file using the :term:`b4.send-series-to` option (see
   :ref:`contributor_settings`).
 
 ``--cc``
   Additional email addresses to include into the Cc: header. Separate
   multiple entries with a comma. You can also set this in the
-  configuration file using the ``b4.send-series-cc`` option (see
+  configuration file using the :term:`b4.send-series-cc` option (see
   :ref:`contributor_settings`).
 
 ``--not-me-too``
@@ -328,7 +328,7 @@ Command line flags
   Note, that sending via the web submission endpoint requires
   cryptographic signatures at all times, so this is only a valid option
   to use with ``-o`` or when using your own SMTP server. This can be set
-  in the configuration using the ``b4.send-no-patatt-sign`` (see
+  in the configuration using the :term:`b4.send-no-patatt-sign` (see
   :ref:`contributor_settings`).
 
 ``--resend V``
diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index 1ca9b50..5c3fb75 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -175,7 +175,7 @@ The following flags are common to both commands:
       ./scripts/checkpatch.pl -q --terse --no-summary --mailback
 
   You can specify a different command to run by setting the
-  ``b4.am-perpatch-check-cmd`` configuration setting, e.g.::
+  :term:`b4.am-perpatch-check-cmd` configuration setting, e.g.::
 
       [b4]
       am-perpatch-check-cmd = ./scripts/checkpatch.pl -q --terse --no-summary --mailback --strict
diff --git a/docs/maintainer/ty.rst b/docs/maintainer/ty.rst
index 21c56de..c1b79b5 100644
--- a/docs/maintainer/ty.rst
+++ b/docs/maintainer/ty.rst
@@ -66,7 +66,7 @@ happy with the results, you can omit the ``--dry-run`` switch to
 actually send the mail.
 
 If you want ``b4 ty`` to always send mail, you can make the ``-S``
-switch permanent by setting the ``b4.ty-send-email`` config variable to
+switch permanent by setting the :term:`b4.ty-send-email` config variable to
 ``yes``.
 
 Editing the templates
@@ -74,7 +74,7 @@ Editing the templates
 You can edit the default templates that are provided with b4 to
 customize the thank-you message. Once you have your own versions, you
 can specify the path to the template to use via the
-``b4.thanks-am-template`` and ``b4.thanks-pr-template`` configuration
+:term:`b4.thanks-am-template` and :term:`b4.thanks-pr-template` configuration
 parameters. See :ref:`ty_settings` for details.
 
 Optional flags

-- 
2.52.0


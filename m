Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2551739B4A2
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125492; cv=none; b=ltyX45ABO7XnlnCxIijHpPz9kg7oimD6HvAYJm0ztCMi5u/FCxfJGYsCY9GSUUX8z7Yg1FmoNKksfrto+rUyuovlRV0Y+MG73jEd8/a/Ro6SlA5d0e615Yl6gNyaf0V9co7n1zrysZaI+hBwM3ZL/8LKpdn28YthviXm7WPpL0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125492; c=relaxed/simple;
	bh=oDV6JkaqTH7NSyTZNh6EQU2fIrjlcH66oVBQaF9kMkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuJ/fsJ8jUiaQSCXR0WTbJxk4Vb3m3bUDQmrRQSMQzLndS8HH6OOK/qNSBLKfflZbm96oB/yzvnjHLKlU4BCsofT5Xu0C6loScUwyhzLnBs2c6TYNkFQwZAzz36o4k5oTBRU8s/l481m5HDNwljiS5V88vH8OnrUxqJ1NVm+0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 1CC80C19425; Tue,  3 Feb 2026 13:31:32 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82864C2BCB4
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82864C2BCB4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bc6CGNzlL1;
	Tue,  3 Feb 2026 14:31:20 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54Bc2k7bz7P9;
	Tue,  3 Feb 2026 14:31:20 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:16 +0100
Subject: [PATCH b4 17/21] docs: config: use rST version admonitions
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-17-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

rST provides directives[1] to specify for which version something was
added or modified, so let's use that.

This notably frees the definition list's term of the version string
which will be important in the next commit where the definition lists
are replaced by glossary terms such that they automatically provide an
anchor which makes it easier to share a link to the config setting and
also allows to link at the term definition with :term: across the docs.

[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#describing-changes-between-versions
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 52 +++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index edd4678..735684e 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -58,7 +58,7 @@ These options control many of the core features of b4.
 
   Default: ``https://lore.kernel.org/all/?x=m&t=1&q=%s``
 
-``b4.linktrailermask`` (v0.13+)
+``b4.linktrailermask``
   Overrides the format of the ``Link:`` trailer, in case you want to
   call it something other than "Link". For example, some projects
   use "Message-ID" trailers instead::
@@ -67,12 +67,14 @@ These options control many of the core features of b4.
 
   The ``%s`` is the placeholder for the message-id.
 
-  Note: starting with version 0.14, you can pass the ``-i`` command-line
-  switch instead of ``-l`` to automatically insert the ``Message-ID``
-  trailer.
-
   Default: ``Link: https://lore.kernel.org/%s``
 
+  .. versionadded:: v0.13
+
+  .. versionchanged:: v0.14
+     You can now pass the ``-i`` command-line switch instead of ``-l`` to
+     automatically insert the ``Message-ID`` trailer.
+
 ``b4.listid-preference``
   Sometimes messages with the same message-id can have different
   contents, because some servers modify message bodies to inject list
@@ -163,7 +165,7 @@ These settings control ``b4 am`` and ``b4 shazam`` behavior.
 
   Default: ``None``
 
-``b4.am-perpatch-check-cmd`` (v0.14+)
+``b4.am-perpatch-check-cmd``
   The command to use when running ``--check``. The command is run once for each
   patch to check. The patch file to check is piped through stdin. If this
   config is defined multiple times, all commands will be run. If this config is
@@ -172,6 +174,8 @@ These settings control ``b4 am`` and ``b4 shazam`` behavior.
 
   Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback``
 
+  .. versionadded:: v0.14
+
 .. _attestation_settings:
 
 Attestation settings
@@ -193,7 +197,7 @@ Attestation settings
 
   Default: ``yes``
 
-``b4.attestation-dns-resolvers`` (v0.14+)
+``b4.attestation-dns-resolvers``
   You can specify your own DNS servers if you are on a company network
   and your OS-provided resolvers aren't able to perform domain key
   lookups. For example, to use Google DNS servers::
@@ -202,6 +206,8 @@ Attestation settings
 
   Default: ``None``
 
+  .. versionadded:: v0.14
+
 ``b4.attestation-staleness-days``
   Ignore attestation signatures that are more than this many days
   old. This helps avoid a class of attacks when someone re-sends old
@@ -269,7 +275,7 @@ Attestation settings
 
   Default: ``None``
 
-``b4.thanks-from-name`` (v0.13+)
+``b4.thanks-from-name``
   The name to use in the ``From:`` header when sending thank-you notes.
   By default, b4 uses ``user.name``. For example::
 
@@ -277,7 +283,9 @@ Attestation settings
 
   Default: ``None``
 
-``b4.thanks-from-email`` (v0.13+)
+  .. versionadded:: v0.13
+
+``b4.thanks-from-email``
   The email to use in the ``From:`` header when sending thank-you notes.
   By default, b4 uses ``user.email``. For example::
 
@@ -285,6 +293,8 @@ Attestation settings
 
   Default: ``None``
 
+  .. versionadded:: v0.13
+
 ``b4.thanks-treename``
   Name of the tree to use in the thank-you templates.
 
@@ -306,12 +316,14 @@ Attestation settings
 
   Default: ``None``
 
-``b4.ty-send-email`` (v0.11+)
+``b4.ty-send-email``
   When set, tells ``b4 ty`` to send email directly instead of writing
   out ``.thanks`` files.
 
   Default: ``no``
 
+  .. versionadded:: v0.11
+
 .. _patchwork_settings:
 
 Patchwork integration settings
@@ -410,19 +422,24 @@ Contributor-oriented settings
 
   Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
 
-``b4.send-same-thread`` (v0.13+)
+``b4.send-same-thread``
   When sending a new version of a series, send it in the same thread as
   the previous version. The config supports the following values:
 
   * ``yes``, ``true``, ``y``: B4 sends the first message of the new series as a
     reply to the previous version's cover letter.
   * ``shallow``: B4 sends the first message of the new series as a reply to the
-    first version's cover letter. (v0.15+)
+    first version's cover letter.
   * ``no``: B4 does not send the new version of the series in the same thread
     as any previous version.
 
   Default: ``no``
 
+  .. versionadded:: v0.13
+
+  .. versionchanged:: v0.15
+     Added ``shallow`` config value.
+
 ``b4.prep-cover-strategy``
   Alternative cover letter storage strategy to use, in case you don't
   want to use the default ``commit`` strategy. See
@@ -444,14 +461,16 @@ Contributor-oriented settings
 
   Default: ``None``
 
-``b4.send-prefixes`` (v0.11+)
+``b4.send-prefixes``
   Extra prefixes to add to ``[PATCH]`` (e.g. ``RFC mydrv``).
 
   This setting can be replaced for a series with ``b4 prep --set-prefixes``.
 
   Default: ``None``
 
-``b4.prep-perpatch-check-cmd`` (v0.14+)
+  .. versionadded:: v0.11
+
+``b4.prep-perpatch-check-cmd``
   The command to use when running ``--check``. The command is run once for each
   patch to check. The patch file to check is piped through stdin. If this
   config is defined multiple times, all commands will be run. If this config is
@@ -460,7 +479,9 @@ Contributor-oriented settings
 
   Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile``
 
-``b4.prep-pre-flight-checks`` (v0.14+)
+  .. versionadded:: v0.14
+
+``b4.prep-pre-flight-checks``
   You can use this to turn off some or all pre-flight checks that b4 runs
   prior to sending out patches. To cancel all checks::
 
@@ -473,6 +494,7 @@ Contributor-oriented settings
       [b4]
       prep-pre-flight-checks = disable-needs-auto-to-cc, needs-checking
 
+  .. versionadded:: v0.14
 
 To document
 -----------

-- 
2.52.0


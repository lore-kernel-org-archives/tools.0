Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75639C636
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125494; cv=none; b=BIgY/8n9DDe1J7p0hrpukaSaf2jsQdVKcHoN76XA6TP5p8XG6QeKD/U+bkJYB1IsCz7dgakVo9S0B4LWy8tV9B1ZrD9kfZ5x15wmc6+JhWkpwwvWKWpgJ7u9uz1TP9ADs/99udAHwzrH+jMTjz7b11XZUGvHzlX27tpATYTDDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125494; c=relaxed/simple;
	bh=anAxLck8ZaX7ZOTz37CAveS1ZxIXM6yYARbVbjWJzV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrpEPOfDZ/1c+jVqc9qbsv3esH4QygAJH+ZLKnMyWr+jVQpCNoBsTOSc8esDlF7RaM3rw5xzQzZ+Lh6w3LXFt6ayUc8lYZnF878VjAWFOCj5fPrwmISfz891dnOu2Bq8gJdj46t0ruTd7J519viOnNBiv82igpCqqnrpjB1Iloo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 659C7C116D0; Tue,  3 Feb 2026 13:31:34 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6334BC19422
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6334BC19422
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bd6GyXzmqs;
	Tue,  3 Feb 2026 14:31:21 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54Bd2xk6z7nK;
	Tue,  3 Feb 2026 14:31:21 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:18 +0100
Subject: [PATCH b4 19/21] docs: config: sort glossaries
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-19-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

This sorts the term defined in glossaries such that they appear
alphabetically in the docs.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 324 +++++++++++++++++++++++++++++---------------------------
 1 file changed, 166 insertions(+), 158 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index cd205fd..f2ed519 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -39,12 +39,14 @@ Core options
 These options control many of the core features of b4.
 
 .. glossary::
+   :sorted:
 
-   :term:`b4.midmask`
-     Specifies the server from where to retrieve the messages specified by
-     their message-id.
+   :term:`b4.cache-expire`
+     B4 caches retrieved threads for 10 minutes. This option allows
+     tweaking the time that the cache remains valid. Many commands also
+     allow a ``--no-cache`` flag to force b4 to perform remote lookups.
 
-     Default: ``https://lore.kernel.org/%s``
+     Default: ``10``
 
    :term:`b4.linkmask`
      B4 uses this setting to construct the URL in the ``Link:`` trailers.
@@ -53,13 +55,6 @@ These options control many of the core features of b4.
 
      Default: ``https://lore.kernel.org/%s``
 
-   :term:`b4.searchmask`
-     B4 uses this setting to query and retrieve threads matching specific
-     search terms. For example, it can retrieve trailer updates using the
-     series ``change-id`` identifier.
-
-     Default: ``https://lore.kernel.org/all/?x=m&t=1&q=%s``
-
    :term:`b4.linktrailermask`
      Overrides the format of the ``Link:`` trailer, in case you want to
      call it something other than "Link". For example, some projects
@@ -87,6 +82,12 @@ These options control many of the core features of b4.
 
      Default: ``*.feeds.kernel.org, *.linux.dev,*.kernel.org,*``
 
+   :term:`b4.midmask`
+     Specifies the server from where to retrieve the messages specified by
+     their message-id.
+
+     Default: ``https://lore.kernel.org/%s``
+
    :term:`b4.save-maildirs`
      The "mbox" file format is actually several incompatible standards,
      such as "mboxo" vs. "mboxrd". Setting this option can avoid potential
@@ -94,6 +95,13 @@ These options control many of the core features of b4.
 
      Default: ``no``
 
+   :term:`b4.searchmask`
+     B4 uses this setting to query and retrieve threads matching specific
+     search terms. For example, it can retrieve trailer updates using the
+     series ``change-id`` identifier.
+
+     Default: ``https://lore.kernel.org/all/?x=m&t=1&q=%s``
+
    :term:`b4.trailer-order`
      This lets you control the order of trailers that get added to your own
      custody section of the commit message. By default, b4 applies these
@@ -135,13 +143,6 @@ These options control many of the core features of b4.
 
      Default: ``None``
 
-   :term:`b4.cache-expire`
-     B4 caches retrieved threads for 10 minutes. This option allows
-     tweaking the time that the cache remains valid. Many commands also
-     allow a ``--no-cache`` flag to force b4 to perform remote lookups.
-
-     Default: ``10``
-
 .. _shazam_settings:
 
 ``am`` and ``shazam`` settings
@@ -149,6 +150,18 @@ These options control many of the core features of b4.
 These settings control ``b4 am`` and ``b4 shazam`` behavior.
 
 .. glossary::
+   :sorted:
+
+   :term:`b4.am-perpatch-check-cmd`
+     The command to use when running ``--check``. The command is run once for each
+     patch to check. The patch file to check is piped through stdin. If this
+     config is defined multiple times, all commands will be run. If this config is
+     not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
+     tree, it uses the command shown below by default.
+
+     Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback``
+
+     .. versionadded:: v0.14
 
    :term:`b4.shazam-am-flags`
      Additional flags to pass to ``git am`` when applying patches.
@@ -169,34 +182,13 @@ These settings control ``b4 am`` and ``b4 shazam`` behavior.
 
      Default: ``None``
 
-   :term:`b4.am-perpatch-check-cmd`
-     The command to use when running ``--check``. The command is run once for each
-     patch to check. The patch file to check is piped through stdin. If this
-     config is defined multiple times, all commands will be run. If this config is
-     not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
-     tree, it uses the command shown below by default.
-
-     Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback``
-
-     .. versionadded:: v0.14
-
 .. _attestation_settings:
 
 Attestation settings
 ~~~~~~~~~~~~~~~~~~~~
 
 .. glossary::
-
-   :term:`b4.attestation-policy`
-     B4 supports domain-level and end-to-end attestation of patches using
-     the `patatt`_ library. There are four different operation modes:
-
-     * ``off``: don't bother checking attestation at all
-     * ``softfail``: print green marks when attestation is passing and
-       red marks when it's failing
-     * ``hardfail``: exit with an error when any attestation checks fail
-
-     Default: ``softfail``
+   :sorted:
 
    :term:`b4.attestation-check-dkim`
      Controls whether to perform DKIM attestation checks.
@@ -214,6 +206,23 @@ Attestation settings
 
      .. versionadded:: v0.14
 
+   :term:`b4.attestation-gnupghome`
+     Sets ``GNUPGHOME`` before running PGP attestation checks that rely on
+     GnuPG.
+
+     Default: ``None``
+
+   :term:`b4.attestation-policy`
+     B4 supports domain-level and end-to-end attestation of patches using
+     the `patatt`_ library. There are four different operation modes:
+
+     * ``off``: don't bother checking attestation at all
+     * ``softfail``: print green marks when attestation is passing and
+       red marks when it's failing
+     * ``hardfail``: exit with an error when any attestation checks fail
+
+     Default: ``softfail``
+
    :term:`b4.attestation-staleness-days`
      Ignore attestation signatures that are more than this many days
      old. This helps avoid a class of attacks when someone re-sends old
@@ -221,12 +230,6 @@ Attestation settings
 
      Default: ``30``
 
-   :term:`b4.attestation-gnupghome`
-     Sets ``GNUPGHOME`` before running PGP attestation checks that rely on
-     GnuPG.
-
-     Default: ``None``
-
    :term:`b4.gpgbin`
      Full path to a different binary to use for ``gpg``. B4 also checks the
      ``gpg.program`` setting, and uses that value, if found.
@@ -253,12 +256,21 @@ Attestation settings
 ~~~~~~~~~~~~~~~
 
 .. glossary::
+   :sorted:
 
-   :term:`b4.thanks-pr-template`
-     Full paths to the templates to use when generating thank-you messages
-     for contributors. Take the following as example content for this file:
+   :term:`b4.email-exclude`
+     A list of addresses to always exclude from the message recipients.
+     Expects a comma-separated list with shell-style globbing. E.g.::
 
-     .. literalinclude:: ../src/b4/templates/thanks-pr-template.example
+         email-exclude = *@codeaurora.org, *@obsolete.example.com
+
+     Default: ``None``
+
+   :term:`b4.sendemail-identity`
+     The ``sendemail`` identity to use when sending mail directly with b4.
+     This setting applies to ``b4 send`` and ``b4 ty``. See `man
+     git-send-email <https://git-scm.com/docs/git-send-email>`__ for info about
+     sendemail identities.
 
      Default: ``None``
 
@@ -284,16 +296,6 @@ Attestation settings
 
      Default: ``None``
 
-   :term:`b4.thanks-from-name`
-     The name to use in the ``From:`` header when sending thank-you notes.
-     By default, b4 uses ``user.name``. For example::
-
-         thanks-from-name = Project Foo Thanks Bot
-
-     Default: ``None``
-
-     .. versionadded:: v0.13
-
    :term:`b4.thanks-from-email`
      The email to use in the ``From:`` header when sending thank-you notes.
      By default, b4 uses ``user.email``. For example::
@@ -304,26 +306,29 @@ Attestation settings
 
      .. versionadded:: v0.13
 
+   :term:`b4.thanks-from-name`
+     The name to use in the ``From:`` header when sending thank-you notes.
+     By default, b4 uses ``user.name``. For example::
+
+         thanks-from-name = Project Foo Thanks Bot
+
+     Default: ``None``
+
+     .. versionadded:: v0.13
+
+   :term:`b4.thanks-pr-template`
+     Full paths to the templates to use when generating thank-you messages
+     for contributors. Take the following as example content for this file:
+
+     .. literalinclude:: ../src/b4/templates/thanks-pr-template.example
+
+     Default: ``None``
+
    :term:`b4.thanks-treename`
      Name of the tree to use in the thank-you templates.
 
      Default: ``None``
 
-   :term:`b4.email-exclude`
-     A list of addresses to always exclude from the message recipients.
-     Expects a comma-separated list with shell-style globbing. E.g.::
-
-         email-exclude = *@codeaurora.org, *@obsolete.example.com
-
-     Default: ``None``
-
-   :term:`b4.sendemail-identity`
-     The ``sendemail`` identity to use when sending mail directly with b4.
-     This setting applies to ``b4 send`` and ``b4 ty``. See `man
-     git-send-email <https://git-scm.com/docs/git-send-email>`__ for info about
-
-     Default: ``None``
-
    :term:`b4.ty-send-email`
      When set, tells ``b4 ty`` to send email directly instead of writing
      out ``.thanks`` files.
@@ -340,13 +345,21 @@ If your project uses a patchwork server, setting these allows you to
 integrate your b4 workflow with patchwork.
 
 .. glossary::
+   :sorted:
 
-   :term:`b4.pw-url`
-     The URL of your patchwork server. Note, that this should point at the
-     top-level of your patchwork installation and **not** at the project patch
-     listing. For example::
+   :term:`b4.pw-accept-state`
+     Enabling this option makes ``b4 ty`` set the status of any applied patches
+     to the specified state. For example::
 
-         pw-url = https://patchwork.kernel.org/
+         pw-accept-state = accepted
+
+     Default: ``None``
+
+   :term:`b4.pw-discard-state`
+     Enabling this option makes ``b4 ty -d`` set the status of any matching
+     patches to the specified state. For example::
+
+         pw-discard-state = rejected
 
      Default: ``None``
 
@@ -372,19 +385,12 @@ integrate your b4 workflow with patchwork.
 
      Default: ``None``
 
-   :term:`b4.pw-accept-state`
-     Enabling this option makes ``b4 ty`` set the status of any applied patches
-     to the specified state. For example::
+   :term:`b4.pw-url`
+     The URL of your patchwork server. Note, that this should point at the
+     top-level of your patchwork installation and **not** at the project patch
+     listing. For example::
 
-         pw-accept-state = accepted
-
-     Default: ``None``
-
-   :term:`b4.pw-discard-state`
-     Enabling this option makes ``b4 ty -d`` set the status of any matching
-     patches to the specified state. For example::
-
-         pw-discard-state = rejected
+         pw-url = https://patchwork.kernel.org/
 
      Default: ``None``
 
@@ -394,63 +400,7 @@ Contributor-oriented settings
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 .. glossary::
-
-   :term:`b4.send-endpoint-web`
-     The web submission endpoint to use. See :ref:`web_endpoint`.
-
-     Default: ``None``
-
-   :term:`b4.send-series-to`
-     A comma-separated list of addresses to always add to the "To:" header.
-     See :ref:`prep_recipients`.
-
-     Default: ``None``
-
-   :term:`b4.send-series-cc`
-     A comma-separated list of addresses to always add to the "Cc:" header.
-     See :ref:`prep_recipients`.
-
-     Default: ``None``
-
-   :term:`b4.send-no-patatt-sign`
-     Instructs b4 not to sign patches with patatt before sending them. Note, that
-     using the web submission endpoint requires using signed patches.
-
-     Default: ``no``
-
-   :term:`b4.send-auto-to-cmd`
-     The command to use for obtaining the list of "To:" recipients. The command is
-     run once for each patch in the series. Each patch file is piped through
-     stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
-     it uses the command shown below by default.
-
-     Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol``
-
-   :term:`b4.send-auto-cc-cmd`
-     The command to use for obtaining the list of "Cc:" recipients. The command is
-     run once for each patch in the series. Each patch file is piped through
-     stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
-     it uses the command shown below by default.
-
-     Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
-
-   :term:`b4.send-same-thread`
-     When sending a new version of a series, send it in the same thread as
-     the previous version. The config supports the following values:
-
-     * ``yes``, ``true``, ``y``: B4 sends the first message of the new series as a
-       reply to the previous version's cover letter.
-     * ``shallow``: B4 sends the first message of the new series as a reply to the
-       first version's cover letter.
-     * ``no``: B4 does not send the new version of the series in the same thread
-       as any previous version.
-
-     Default: ``no``
-
-     .. versionadded:: v0.13
-
-     .. versionchanged:: v0.15
-        Added ``shallow`` config value.
+   :sorted:
 
    :term:`b4.prep-cover-strategy`
      Alternative cover letter storage strategy to use, in case you don't
@@ -473,15 +423,6 @@ Contributor-oriented settings
 
      Default: ``None``
 
-   :term:`b4.send-prefixes`
-     Extra prefixes to add to ``[PATCH]`` (e.g. ``RFC mydrv``).
-
-     This setting can be replaced for a series with ``b4 prep --set-prefixes``.
-
-     Default: ``None``
-
-     .. versionadded:: v0.11
-
    :term:`b4.prep-perpatch-check-cmd`
      The command to use when running ``--check``. The command is run once for each
      patch to check. The patch file to check is piped through stdin. If this
@@ -508,10 +449,77 @@ Contributor-oriented settings
 
      .. versionadded:: v0.14
 
+   :term:`b4.send-auto-cc-cmd`
+     The command to use for obtaining the list of "Cc:" recipients. The command is
+     run once for each patch in the series. Each patch file is piped through
+     stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
+     it uses the command shown below by default.
+
+     Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
+
+   :term:`b4.send-auto-to-cmd`
+     The command to use for obtaining the list of "To:" recipients. The command is
+     run once for each patch in the series. Each patch file is piped through
+     stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
+     it uses the command shown below by default.
+
+     Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol``
+
+   :term:`b4.send-endpoint-web`
+     The web submission endpoint to use. See :ref:`web_endpoint`.
+
+     Default: ``None``
+
+   :term:`b4.send-no-patatt-sign`
+     Instructs b4 not to sign patches with patatt before sending them. Note, that
+     using the web submission endpoint requires using signed patches.
+
+     Default: ``no``
+
+   :term:`b4.send-prefixes`
+     Extra prefixes to add to ``[PATCH]`` (e.g. ``RFC mydrv``).
+
+     This setting can be replaced for a series with ``b4 prep --set-prefixes``.
+
+     Default: ``None``
+
+     .. versionadded:: v0.11
+
+   :term:`b4.send-same-thread`
+     When sending a new version of a series, send it in the same thread as
+     the previous version. The config supports the following values:
+
+     * ``yes``, ``true``, ``y``: B4 sends the first message of the new series as a
+       reply to the previous version's cover letter.
+     * ``shallow``: B4 sends the first message of the new series as a reply to the
+       first version's cover letter.
+     * ``no``: B4 does not send the new version of the series in the same thread
+       as any previous version.
+
+     Default: ``no``
+
+     .. versionadded:: v0.13
+
+     .. versionchanged:: v0.15
+        Added ``shallow`` config value.
+
+   :term:`b4.send-series-cc`
+     A comma-separated list of addresses to always add to the "Cc:" header.
+     See :ref:`prep_recipients`.
+
+     Default: ``None``
+
+   :term:`b4.send-series-to`
+     A comma-separated list of addresses to always add to the "To:" header.
+     See :ref:`prep_recipients`.
+
+     Default: ``None``
+
 To document
 -----------
 
 .. glossary::
+   :sorted:
 
    :term:`b4.gh-api-key`
      Deliberately undocumented because the feature is incomplete and poorly

-- 
2.52.0


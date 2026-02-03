Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D939C624
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125494; cv=none; b=ozGjy2b5HVLSGDZqbPtnSZNcdvBwtA/AIwyYJ5Tif03wtCr7sJa4E/y9wjStdsRblNMrf5Yk2DQ/Rd3Qg3sQ2M5xyOvRaISyHqU5nC7cJFInGWw1i7n+l00O8j+iZ+XclxZoHvukU/1F3dvUFEoxcyUfGxGHSfvWiyT4oAmWf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125494; c=relaxed/simple;
	bh=EEFQXvadG3Rnsj0ekCABL2xb9V3oCR8Q+1W3z/WoUvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MuH89Ev30u2KjWyH3FHDehV2NZnSUgpAVCFzyL642itxNIL53P8hOm9XB5UaxyzziCBj0f8fP+sVcsRUUN+qTWcXvDAtaGAKWSFtuowhho5m78fsKPKLMigvwMgBy8bJMvvXMwdgzxy4z8UjmeNiDftAoA9UYin6Fyw0ESPK1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DE3F7C4AF0F; Tue,  3 Feb 2026 13:31:33 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C100C116D0
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C100C116D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54Bd2vbpzn5K;
	Tue,  3 Feb 2026 14:31:21 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54Bc66y3z8KF;
	Tue,  3 Feb 2026 14:31:20 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:17 +0100
Subject: [PATCH b4 18/21] docs: config: migrate definition lists to
 glossaries
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260203-misc-docs-v1-18-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

This allows us to have an anchor per config option which is convenient
when trying to send links to documentation of a specific config option.

The :term: cross-referencing is not necessary but it makes the option
string clickable instead of only having the ¶ character next to it to
click. This is what we use in the Yocto docs.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst | 607 +++++++++++++++++++++++++++++---------------------------
 1 file changed, 311 insertions(+), 296 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 735684e..cd205fd 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -38,107 +38,109 @@ Core options
 ~~~~~~~~~~~~
 These options control many of the core features of b4.
 
-``b4.midmask``
-  Specifies the server from where to retrieve the messages specified by
-  their message-id.
+.. glossary::
 
-  Default: ``https://lore.kernel.org/%s``
+   :term:`b4.midmask`
+     Specifies the server from where to retrieve the messages specified by
+     their message-id.
 
-``b4.linkmask``
-  B4 uses this setting to construct the URL in the ``Link:`` trailers.
-  If you want a shorter option, you can also use
-  ``https://msgid.link/%s``, which is an alias for lore.kernel.org.
+     Default: ``https://lore.kernel.org/%s``
 
-  Default: ``https://lore.kernel.org/%s``
+   :term:`b4.linkmask`
+     B4 uses this setting to construct the URL in the ``Link:`` trailers.
+     If you want a shorter option, you can also use
+     ``https://msgid.link/%s``, which is an alias for lore.kernel.org.
 
-``b4.searchmask``
-  B4 uses this setting to query and retrieve threads matching specific
-  search terms. For example, it can retrieve trailer updates using the
-  series ``change-id`` identifier.
+     Default: ``https://lore.kernel.org/%s``
 
-  Default: ``https://lore.kernel.org/all/?x=m&t=1&q=%s``
+   :term:`b4.searchmask`
+     B4 uses this setting to query and retrieve threads matching specific
+     search terms. For example, it can retrieve trailer updates using the
+     series ``change-id`` identifier.
 
-``b4.linktrailermask``
-  Overrides the format of the ``Link:`` trailer, in case you want to
-  call it something other than "Link". For example, some projects
-  use "Message-ID" trailers instead::
+     Default: ``https://lore.kernel.org/all/?x=m&t=1&q=%s``
 
-      linktrailermask = Message-ID: <%s>
+   :term:`b4.linktrailermask`
+     Overrides the format of the ``Link:`` trailer, in case you want to
+     call it something other than "Link". For example, some projects
+     use "Message-ID" trailers instead::
 
-  The ``%s`` is the placeholder for the message-id.
+         linktrailermask = Message-ID: <%s>
 
-  Default: ``Link: https://lore.kernel.org/%s``
+     The ``%s`` is the placeholder for the message-id.
 
-  .. versionadded:: v0.13
+     Default: ``Link: https://lore.kernel.org/%s``
 
-  .. versionchanged:: v0.14
-     You can now pass the ``-i`` command-line switch instead of ``-l`` to
-     automatically insert the ``Message-ID`` trailer.
+     .. versionadded:: v0.13
 
-``b4.listid-preference``
-  Sometimes messages with the same message-id can have different
-  contents, because some servers modify message bodies to inject list
-  subscription information. B4 attempts to de-duplicate the results
-  using the ``List-Id`` header. You may use this parameter to specify
-  the order of preference, using comma-separated strings with shell-style
-  wildcard globbing.
+     .. versionchanged:: v0.14
+        You can now pass the ``-i`` command-line switch instead of ``-l`` to
+        automatically insert the ``Message-ID`` trailer.
 
-  Default: ``*.feeds.kernel.org, *.linux.dev,*.kernel.org,*``
+   :term:`b4.listid-preference`
+     Sometimes messages with the same message-id can have different
+     contents, because some servers modify message bodies to inject list
+     subscription information. B4 attempts to de-duplicate the results
+     using the ``List-Id`` header. You may use this parameter to specify
+     the order of preference, using comma-separated strings with shell-style
+     wildcard globbing.
 
-``b4.save-maildirs``
-  The "mbox" file format is actually several incompatible standards,
-  such as "mboxo" vs. "mboxrd". Setting this option can avoid potential
-  problems by saving retrieved threads as Maildirs.
+     Default: ``*.feeds.kernel.org, *.linux.dev,*.kernel.org,*``
 
-  Default: ``no``
+   :term:`b4.save-maildirs`
+     The "mbox" file format is actually several incompatible standards,
+     such as "mboxo" vs. "mboxrd". Setting this option can avoid potential
+     problems by saving retrieved threads as Maildirs.
 
-``b4.trailer-order``
-  This lets you control the order of trailers that get added to your own
-  custody section of the commit message. By default, b4 applies these
-  trailers in the order received. However, if you want to list trailers
-  in a specific order, you can try something like::
+     Default: ``no``
 
-      trailer-order = link*,fixes*,acked*,reviewed*,tested*,*
+   :term:`b4.trailer-order`
+     This lets you control the order of trailers that get added to your own
+     custody section of the commit message. By default, b4 applies these
+     trailers in the order received. However, if you want to list trailers
+     in a specific order, you can try something like::
 
-  The "chain of custody" is an important concept in patch-based code
-  review process. Each "Signed-off-by" trailer indicates where the
-  custody section of previous reviewer ends and the new one starts. Your
-  own custody section is always between the previous-to-last
-  "Signed-off-by" trailer, if any, and the bottom of the trailer
-  section. For example::
+         trailer-order = link*,fixes*,acked*,reviewed*,tested*,*
 
-      Fixes: abcde (Commit info)
-      Suggested-by: Alex Reporter <alex.reporter@example.com>
-      Signed-off-by: Betty Developer <betty.developer@example.com>
-      Acked-by: Chandra Acker <chandra.acker@example.com>
-      Reviewed-by: Debby Reviewer <debby.reviewer@example.com>
-      Signed-off-by: Ezri Submaintainer <ezri.submaintainer@example.com>
-      Link: https://msgid.link/some@thing.foo
-      Tested-by: Finn Tester <finn.tester@example.com>
-      Signed-off-by: Your Name <your.name@example.com>
+     The "chain of custody" is an important concept in patch-based code
+     review process. Each "Signed-off-by" trailer indicates where the
+     custody section of previous reviewer ends and the new one starts. Your
+     own custody section is always between the previous-to-last
+     "Signed-off-by" trailer, if any, and the bottom of the trailer
+     section. For example::
 
-  Your custody section is beneath "Ezri Submaintainer," so the only
-  trailers considered for reordering are "Link" and "Tested-by". Your
-  own Signed-off-by trailer is always at the bottom of your own custody
-  section.
+         Fixes: abcde (Commit info)
+         Suggested-by: Alex Reporter <alex.reporter@example.com>
+         Signed-off-by: Betty Developer <betty.developer@example.com>
+         Acked-by: Chandra Acker <chandra.acker@example.com>
+         Reviewed-by: Debby Reviewer <debby.reviewer@example.com>
+         Signed-off-by: Ezri Submaintainer <ezri.submaintainer@example.com>
+         Link: https://msgid.link/some@thing.foo
+         Tested-by: Finn Tester <finn.tester@example.com>
+         Signed-off-by: Your Name <your.name@example.com>
 
-  Default: ``*``
+     Your custody section is beneath "Ezri Submaintainer," so the only
+     trailers considered for reordering are "Link" and "Tested-by". Your
+     own Signed-off-by trailer is always at the bottom of your own custody
+     section.
 
-``b4.trailers-ignore-from``
-  A comma-separated list of addresses that b4 should always ignore
-  when applying follow-up trailers. This is useful when dealing with
-  reports generated by some automated bots. For example::
+     Default: ``*``
 
-      trailers-ignore-from = lkp@intel.com, someotherbot@example.org
+   :term:`b4.trailers-ignore-from`
+     A comma-separated list of addresses that b4 should always ignore
+     when applying follow-up trailers. This is useful when dealing with
+     reports generated by some automated bots. For example::
 
-  Default: ``None``
+         trailers-ignore-from = lkp@intel.com, someotherbot@example.org
 
-``b4.cache-expire``
-  B4 caches retrieved threads for 10 minutes. This option allows
-  tweaking the time that the cache remains valid. Many commands also
-  allow a ``--no-cache`` flag to force b4 to perform remote lookups.
+     Default: ``None``
 
-  Default: ``10``
+   :term:`b4.cache-expire`
+     B4 caches retrieved threads for 10 minutes. This option allows
+     tweaking the time that the cache remains valid. Many commands also
+     allow a ``--no-cache`` flag to force b4 to perform remote lookups.
+
+     Default: ``10``
 
 .. _shazam_settings:
 
@@ -146,183 +148,189 @@ These options control many of the core features of b4.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 These settings control ``b4 am`` and ``b4 shazam`` behavior.
 
-``b4.shazam-am-flags``
-  Additional flags to pass to ``git am`` when applying patches.
+.. glossary::
 
-  Default: ``None``
+   :term:`b4.shazam-am-flags`
+     Additional flags to pass to ``git am`` when applying patches.
 
-``b4.shazam-merge-flags``
-  Additional flags to pass to ``git merge`` when performing a merge with
-  ``b4 shazam -M``.
+     Default: ``None``
 
-  Default: ``--signoff``
+   :term:`b4.shazam-merge-flags`
+     Additional flags to pass to ``git merge`` when performing a merge with
+     ``b4 shazam -M``.
 
-``b4.shazam-merge-template``
-  Path to a template to use when creating a merge commit. Take the following
-  as example content for this file:
+     Default: ``--signoff``
 
-  .. literalinclude:: ../src/b4/templates/shazam-merge-template.example
+   :term:`b4.shazam-merge-template`
+     Path to a template to use when creating a merge commit. Take the following
+     as example content for this file:
 
-  Default: ``None``
+     .. literalinclude:: ../src/b4/templates/shazam-merge-template.example
 
-``b4.am-perpatch-check-cmd``
-  The command to use when running ``--check``. The command is run once for each
-  patch to check. The patch file to check is piped through stdin. If this
-  config is defined multiple times, all commands will be run. If this config is
-  not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
-  tree, it uses the command shown below by default.
+     Default: ``None``
 
-  Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback``
+   :term:`b4.am-perpatch-check-cmd`
+     The command to use when running ``--check``. The command is run once for each
+     patch to check. The patch file to check is piped through stdin. If this
+     config is defined multiple times, all commands will be run. If this config is
+     not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
+     tree, it uses the command shown below by default.
 
-  .. versionadded:: v0.14
+     Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback``
+
+     .. versionadded:: v0.14
 
 .. _attestation_settings:
 
 Attestation settings
 ~~~~~~~~~~~~~~~~~~~~
-``b4.attestation-policy``
 
-  B4 supports domain-level and end-to-end attestation of patches using
-  the `patatt`_ library. There are four different operation modes:
+.. glossary::
 
-  * ``off``: don't bother checking attestation at all
-  * ``softfail``: print green marks when attestation is passing and
-    red marks when it's failing
-  * ``hardfail``: exit with an error when any attestation checks fail
+   :term:`b4.attestation-policy`
+     B4 supports domain-level and end-to-end attestation of patches using
+     the `patatt`_ library. There are four different operation modes:
 
-  Default: ``softfail``
+     * ``off``: don't bother checking attestation at all
+     * ``softfail``: print green marks when attestation is passing and
+       red marks when it's failing
+     * ``hardfail``: exit with an error when any attestation checks fail
 
-``b4.attestation-check-dkim``
-  Controls whether to perform DKIM attestation checks.
+     Default: ``softfail``
 
-  Default: ``yes``
+   :term:`b4.attestation-check-dkim`
+     Controls whether to perform DKIM attestation checks.
 
-``b4.attestation-dns-resolvers``
-  You can specify your own DNS servers if you are on a company network
-  and your OS-provided resolvers aren't able to perform domain key
-  lookups. For example, to use Google DNS servers::
+     Default: ``yes``
 
-      attestation-dns-resolvers = 8.8.8.8, 8.8.4.4
+   :term:`b4.attestation-dns-resolvers`
+     You can specify your own DNS servers if you are on a company network
+     and your OS-provided resolvers aren't able to perform domain key
+     lookups. For example, to use Google DNS servers::
 
-  Default: ``None``
+         attestation-dns-resolvers = 8.8.8.8, 8.8.4.4
 
-  .. versionadded:: v0.14
+     Default: ``None``
 
-``b4.attestation-staleness-days``
-  Ignore attestation signatures that are more than this many days
-  old. This helps avoid a class of attacks when someone re-sends old
-  patches that contain known security bugs.
+     .. versionadded:: v0.14
 
-  Default: ``30``
+   :term:`b4.attestation-staleness-days`
+     Ignore attestation signatures that are more than this many days
+     old. This helps avoid a class of attacks when someone re-sends old
+     patches that contain known security bugs.
 
-``b4.attestation-gnupghome``
-  Sets ``GNUPGHOME`` before running PGP attestation checks that rely on
-  GnuPG.
+     Default: ``30``
 
-  Default: ``None``
+   :term:`b4.attestation-gnupghome`
+     Sets ``GNUPGHOME`` before running PGP attestation checks that rely on
+     GnuPG.
 
-``b4.gpgbin``
-  Full path to a different binary to use for ``gpg``. B4 also checks the
-  ``gpg.program`` setting, and uses that value, if found.
+     Default: ``None``
 
-  Default: ``None``
+   :term:`b4.gpgbin`
+     Full path to a different binary to use for ``gpg``. B4 also checks the
+     ``gpg.program`` setting, and uses that value, if found.
 
-``b4.keyringsrc``
-  See `patatt`_ for details on how to configure keyrings. For example,
-  you can clone the kernel.org pgp keys repository and use it for
-  attestation::
+     Default: ``None``
 
-      git clone https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git
+   :term:`b4.keyringsrc`
+     See `patatt`_ for details on how to configure keyrings. For example,
+     you can clone the kernel.org pgp keys repository and use it for
+     attestation::
 
-  Then set the following in your ``~/.gitconfig``::
+         git clone https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git
 
-      [b4]
-        keyringsrc = ~/path/to/pgpkeys/.keyring
+     Then set the following in your ``~/.gitconfig``::
 
-  Default: ``None``
+         [b4]
+           keyringsrc = ~/path/to/pgpkeys/.keyring
+
+     Default: ``None``
 
 .. _ty_settings:
 
 ``ty`` settings
 ~~~~~~~~~~~~~~~
-``b4.thanks-pr-template``
-  Full paths to the templates to use when generating thank-you messages
-  for contributors. Take the following as example content for this file:
 
-  .. literalinclude:: ../src/b4/templates/thanks-pr-template.example
+.. glossary::
 
-  Default: ``None``
+   :term:`b4.thanks-pr-template`
+     Full paths to the templates to use when generating thank-you messages
+     for contributors. Take the following as example content for this file:
 
-``b4.thanks-am-template``
-  Full paths to the templates to use when generating thank-you messages
-  for contributors. Take the following as example content for this file:
+     .. literalinclude:: ../src/b4/templates/thanks-pr-template.example
 
-  .. literalinclude:: ../src/b4/templates/thanks-am-template.example
+     Default: ``None``
 
-  Default: ``None``
+   :term:`b4.thanks-am-template`
+     Full paths to the templates to use when generating thank-you messages
+     for contributors. Take the following as example content for this file:
 
-``b4.thanks-commit-url-mask``
-  Used when creating summaries for ``b4 ty``, and can be a value like::
+     .. literalinclude:: ../src/b4/templates/thanks-am-template.example
 
-      thanks-commit-url-mask = https://git.kernel.org/username/c/%.12s
+     Default: ``None``
 
-  If not set, b4 falls back to using commit hashes.
+   :term:`b4.thanks-commit-url-mask`
+     Used when creating summaries for ``b4 ty``, and can be a value like::
 
-  .. note::
+         thanks-commit-url-mask = https://git.kernel.org/username/c/%.12s
 
-     See this page for more info on convenient git.kernel.org short URLs:
-     https://korg.docs.kernel.org/git-url-shorteners.html
+     If not set, b4 falls back to using commit hashes.
 
-  Default: ``None``
+     .. note::
 
-``b4.thanks-from-name``
-  The name to use in the ``From:`` header when sending thank-you notes.
-  By default, b4 uses ``user.name``. For example::
+        See this page for more info on convenient git.kernel.org short URLs:
+        https://korg.docs.kernel.org/git-url-shorteners.html
 
-      thanks-from-name = Project Foo Thanks Bot
+     Default: ``None``
 
-  Default: ``None``
+   :term:`b4.thanks-from-name`
+     The name to use in the ``From:`` header when sending thank-you notes.
+     By default, b4 uses ``user.name``. For example::
 
-  .. versionadded:: v0.13
+         thanks-from-name = Project Foo Thanks Bot
 
-``b4.thanks-from-email``
-  The email to use in the ``From:`` header when sending thank-you notes.
-  By default, b4 uses ``user.email``. For example::
+     Default: ``None``
 
-      thanks-from-email = thanks-bot@example.com
+     .. versionadded:: v0.13
 
-  Default: ``None``
+   :term:`b4.thanks-from-email`
+     The email to use in the ``From:`` header when sending thank-you notes.
+     By default, b4 uses ``user.email``. For example::
 
-  .. versionadded:: v0.13
+         thanks-from-email = thanks-bot@example.com
 
-``b4.thanks-treename``
-  Name of the tree to use in the thank-you templates.
+     Default: ``None``
 
-  Default: ``None``
+     .. versionadded:: v0.13
 
-``b4.email-exclude``
-  A list of addresses to always exclude from the message recipients.
-  Expects a comma-separated list with shell-style globbing. E.g.::
+   :term:`b4.thanks-treename`
+     Name of the tree to use in the thank-you templates.
 
-      email-exclude = *@codeaurora.org, *@obsolete.example.com
+     Default: ``None``
 
-  Default: ``None``
+   :term:`b4.email-exclude`
+     A list of addresses to always exclude from the message recipients.
+     Expects a comma-separated list with shell-style globbing. E.g.::
 
-``b4.sendemail-identity``
-  The ``sendemail`` identity to use when sending mail directly with b4.
-  This setting applies to ``b4 send`` and ``b4 ty``. See `man
-  git-send-email <https://git-scm.com/docs/git-send-email>`__ for info about
-  sendemail identities.
+         email-exclude = *@codeaurora.org, *@obsolete.example.com
 
-  Default: ``None``
+     Default: ``None``
 
-``b4.ty-send-email``
-  When set, tells ``b4 ty`` to send email directly instead of writing
-  out ``.thanks`` files.
+   :term:`b4.sendemail-identity`
+     The ``sendemail`` identity to use when sending mail directly with b4.
+     This setting applies to ``b4 send`` and ``b4 ty``. See `man
+     git-send-email <https://git-scm.com/docs/git-send-email>`__ for info about
 
-  Default: ``no``
+     Default: ``None``
 
-  .. versionadded:: v0.11
+   :term:`b4.ty-send-email`
+     When set, tells ``b4 ty`` to send email directly instead of writing
+     out ``.thanks`` files.
+
+     Default: ``no``
+
+     .. versionadded:: v0.11
 
 .. _patchwork_settings:
 
@@ -331,175 +339,182 @@ Patchwork integration settings
 If your project uses a patchwork server, setting these allows you to
 integrate your b4 workflow with patchwork.
 
-``b4.pw-url``
-  The URL of your patchwork server. Note, that this should point at the
-  top-level of your patchwork installation and **not** at the project patch
-  listing. For example::
+.. glossary::
 
-      pw-url = https://patchwork.kernel.org/
+   :term:`b4.pw-url`
+     The URL of your patchwork server. Note, that this should point at the
+     top-level of your patchwork installation and **not** at the project patch
+     listing. For example::
 
-  Default: ``None``
+         pw-url = https://patchwork.kernel.org/
 
-``b4.pw-key``
-  The API key from your user profile to use when authenticating with the
-  patchwork server.
+     Default: ``None``
 
-  Default: ``None``
+   :term:`b4.pw-key`
+     The API key from your user profile to use when authenticating with the
+     patchwork server.
 
-``b4.pw-project``
-  The name of the patchwork project, exactly as seen in the URL
-  sub-path. For example::
+     Default: ``None``
 
-      pw-project = linux-usb
+   :term:`b4.pw-project`
+     The name of the patchwork project, exactly as seen in the URL
+     sub-path. For example::
 
-  Default: ``None``
+         pw-project = linux-usb
 
-``b4.pw-review-state``
-  Enabling this option makes ``b4 am`` or ``b4 shazam`` automatically set
-  the review status of the retrieved patches. For example::
+     Default: ``None``
 
-      pw-review-state = under-review
+   :term:`b4.pw-review-state`
+     Enabling this option makes ``b4 am`` or ``b4 shazam`` automatically set
+     the review status of the retrieved patches. For example::
 
-  Default: ``None``
+         pw-review-state = under-review
 
-``b4.pw-accept-state``
-  Enabling this option makes ``b4 ty`` set the status of any applied patches
-  to the specified state. For example::
+     Default: ``None``
 
-      pw-accept-state = accepted
+   :term:`b4.pw-accept-state`
+     Enabling this option makes ``b4 ty`` set the status of any applied patches
+     to the specified state. For example::
 
-  Default: ``None``
+         pw-accept-state = accepted
 
-``b4.pw-discard-state``
-  Enabling this option makes ``b4 ty -d`` set the status of any matching
-  patches to the specified state. For example::
+     Default: ``None``
 
-      pw-discard-state = rejected
+   :term:`b4.pw-discard-state`
+     Enabling this option makes ``b4 ty -d`` set the status of any matching
+     patches to the specified state. For example::
 
-  Default: ``None``
+         pw-discard-state = rejected
+
+     Default: ``None``
 
 .. _contributor_settings:
 
 Contributor-oriented settings
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-``b4.send-endpoint-web``
-  The web submission endpoint to use. See :ref:`web_endpoint`.
+.. glossary::
 
-  Default: ``None``
+   :term:`b4.send-endpoint-web`
+     The web submission endpoint to use. See :ref:`web_endpoint`.
 
-``b4.send-series-to``
-  A comma-separated list of addresses to always add to the "To:" header.
-  See :ref:`prep_recipients`.
+     Default: ``None``
 
-  Default: ``None``
+   :term:`b4.send-series-to`
+     A comma-separated list of addresses to always add to the "To:" header.
+     See :ref:`prep_recipients`.
 
-``b4.send-series-cc``
-  A comma-separated list of addresses to always add to the "Cc:" header.
-  See :ref:`prep_recipients`.
+     Default: ``None``
 
-  Default: ``None``
+   :term:`b4.send-series-cc`
+     A comma-separated list of addresses to always add to the "Cc:" header.
+     See :ref:`prep_recipients`.
 
-``b4.send-no-patatt-sign``
-  Instructs b4 not to sign patches with patatt before sending them. Note, that
-  using the web submission endpoint requires using signed patches.
+     Default: ``None``
 
-  Default: ``no``
+   :term:`b4.send-no-patatt-sign`
+     Instructs b4 not to sign patches with patatt before sending them. Note, that
+     using the web submission endpoint requires using signed patches.
 
-``b4.send-auto-to-cmd``
-  The command to use for obtaining the list of "To:" recipients. The command is
-  run once for each patch in the series. Each patch file is piped through
-  stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
-  it uses the command shown below by default.
+     Default: ``no``
 
-  Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol``
+   :term:`b4.send-auto-to-cmd`
+     The command to use for obtaining the list of "To:" recipients. The command is
+     run once for each patch in the series. Each patch file is piped through
+     stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
+     it uses the command shown below by default.
 
-``b4.send-auto-cc-cmd``
-  The command to use for obtaining the list of "Cc:" recipients. The command is
-  run once for each patch in the series. Each patch file is piped through
-  stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
-  it uses the command shown below by default.
+     Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol``
 
-  Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
+   :term:`b4.send-auto-cc-cmd`
+     The command to use for obtaining the list of "Cc:" recipients. The command is
+     run once for each patch in the series. Each patch file is piped through
+     stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
+     it uses the command shown below by default.
 
-``b4.send-same-thread``
-  When sending a new version of a series, send it in the same thread as
-  the previous version. The config supports the following values:
+     Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
 
-  * ``yes``, ``true``, ``y``: B4 sends the first message of the new series as a
-    reply to the previous version's cover letter.
-  * ``shallow``: B4 sends the first message of the new series as a reply to the
-    first version's cover letter.
-  * ``no``: B4 does not send the new version of the series in the same thread
-    as any previous version.
+   :term:`b4.send-same-thread`
+     When sending a new version of a series, send it in the same thread as
+     the previous version. The config supports the following values:
 
-  Default: ``no``
+     * ``yes``, ``true``, ``y``: B4 sends the first message of the new series as a
+       reply to the previous version's cover letter.
+     * ``shallow``: B4 sends the first message of the new series as a reply to the
+       first version's cover letter.
+     * ``no``: B4 does not send the new version of the series in the same thread
+       as any previous version.
 
-  .. versionadded:: v0.13
+     Default: ``no``
 
-  .. versionchanged:: v0.15
-     Added ``shallow`` config value.
+     .. versionadded:: v0.13
 
-``b4.prep-cover-strategy``
-  Alternative cover letter storage strategy to use, in case you don't
-  want to use the default ``commit`` strategy. See
-  :ref:`prep_cover_strategies`.
+     .. versionchanged:: v0.15
+        Added ``shallow`` config value.
 
-  Default: ``commit``
+   :term:`b4.prep-cover-strategy`
+     Alternative cover letter storage strategy to use, in case you don't
+     want to use the default ``commit`` strategy. See
+     :ref:`prep_cover_strategies`.
 
-``b4.prep-cover-template``
-  Path to the template to use for the cover letter. The template supports the
-  following tokens:
+     Default: ``commit``
 
-  * ``${cover}``: the content of the cover letter itself
-  * ``${shortlog}``: the ``git shortlog`` output for the series
-  * ``${diffstat}``: the ``git diff --stat`` output for the series
-  * ``${range_diff}``: the ``git range-diff`` output against the previous revision of the series
-  * ``${base_commit}``: the base commit of the series
-  * ``${change_id}``: the change-id of the series
-  * ``${signature}``: your signature, either from ``~/.signature`` if found, or from your Git config
+   :term:`b4.prep-cover-template`
+     Path to the template to use for the cover letter. The template supports the
+     following tokens:
 
-  Default: ``None``
+     * ``${cover}``: the content of the cover letter itself
+     * ``${shortlog}``: the ``git shortlog`` output for the series
+     * ``${diffstat}``: the ``git diff --stat`` output for the series
+     * ``${range_diff}``: the ``git range-diff`` output against the previous revision of the series
+     * ``${base_commit}``: the base commit of the series
+     * ``${change_id}``: the change-id of the series
+     * ``${signature}``: your signature, either from ``~/.signature`` if found, or from your Git config
 
-``b4.send-prefixes``
-  Extra prefixes to add to ``[PATCH]`` (e.g. ``RFC mydrv``).
+     Default: ``None``
 
-  This setting can be replaced for a series with ``b4 prep --set-prefixes``.
+   :term:`b4.send-prefixes`
+     Extra prefixes to add to ``[PATCH]`` (e.g. ``RFC mydrv``).
 
-  Default: ``None``
+     This setting can be replaced for a series with ``b4 prep --set-prefixes``.
 
-  .. versionadded:: v0.11
+     Default: ``None``
 
-``b4.prep-perpatch-check-cmd``
-  The command to use when running ``--check``. The command is run once for each
-  patch to check. The patch file to check is piped through stdin. If this
-  config is defined multiple times, all commands will be run. If this config is
-  not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
-  tree, it uses the command shown below by default.
+     .. versionadded:: v0.11
 
-  Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile``
+   :term:`b4.prep-perpatch-check-cmd`
+     The command to use when running ``--check``. The command is run once for each
+     patch to check. The patch file to check is piped through stdin. If this
+     config is defined multiple times, all commands will be run. If this config is
+     not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
+     tree, it uses the command shown below by default.
 
-  .. versionadded:: v0.14
+     Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile``
 
-``b4.prep-pre-flight-checks``
-  You can use this to turn off some or all pre-flight checks that b4 runs
-  prior to sending out patches. To cancel all checks::
+     .. versionadded:: v0.14
 
-      [b4]
-      prep-pre-flight-checks = disable-all
+   :term:`b4.prep-pre-flight-checks`
+     You can use this to turn off some or all pre-flight checks that b4 runs
+     prior to sending out patches. To cancel all checks::
 
-  To turn off specific checks, list each one of them, separated by
-  comma::
+         [b4]
+         prep-pre-flight-checks = disable-all
 
-      [b4]
-      prep-pre-flight-checks = disable-needs-auto-to-cc, needs-checking
+     To turn off specific checks, list each one of them, separated by
+     comma::
 
-  .. versionadded:: v0.14
+         [b4]
+         prep-pre-flight-checks = disable-needs-auto-to-cc, needs-checking
+
+     .. versionadded:: v0.14
 
 To document
 -----------
-``b4.gh-api-key``
-  Deliberately undocumented because the feature is incomplete and poorly
-  tested.
+
+.. glossary::
+
+   :term:`b4.gh-api-key`
+     Deliberately undocumented because the feature is incomplete and poorly
+     tested.
 
 .. _`patatt`: https://pypi.org/project/patatt/

-- 
2.52.0


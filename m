Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3139A812
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125488; cv=none; b=sm5jIz19KuSYUjDgtCH75A+5X5WnuwsWjCtAuUIDZYNnniLZ5ZiRLVTZ3njE9uMSKuGgQxvgR31wWpJd7p4Spa/rc0Ak7Ol3CCj1GjUolL6Ww1JMJ35zGtztA0peGO6/bOoQhn21PT0LSrwc/toAz6ZyCO/fRGXIvnbFNy28pUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125488; c=relaxed/simple;
	bh=EL3bLnpxR6MDXZkvE5Wk3ITKWeG4DSayHUPAzrbw3C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bO+NvwT2Fu1tsegm0wIvY3APBNyi3qv6YsMWtv28WVjE6BxfTO7kSyZ8ievY0/8w3fpiA+Zzj/lCkr0DFjsmSfiIJH2CI3ZIHLGkx1tuhFtTV5aun/uxCfRewqD4DZWJPE4gYRnMdda0VJTsQQDZLA6DuLE+FM8i5grS4Lqn2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 2DA83C19421; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B600C2BCAF
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B600C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BV64sLzmqn;
	Tue,  3 Feb 2026 14:31:14 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BV2Qpbz7CG;
	Tue,  3 Feb 2026 14:31:14 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:05 +0100
Subject: [PATCH b4 06/21] docs: use rST version admonitions for command
 options
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-6-fddb72511357@cherry.de>
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
anchor which makes it easier to share a link to the option or parameter
and also allows to link at the term definition with :term: across the
docs.

[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#describing-changes-between-versions
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/contributor/prep.rst     | 32 ++++++++++++++++++++++++--------
 docs/contributor/send.rst     |  8 ++++++--
 docs/maintainer/am-shazam.rst |  8 ++++++--
 docs/maintainer/mbox.rst      | 12 +++++++++---
 docs/maintainer/ty.rst        |  4 +++-
 5 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 4c26602..122e3cd 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -372,16 +372,20 @@ modifying defaults for some of these flags.
   don't like vim, you would have already set your ``$EDITOR`` to use
   some other command.
 
-``--edit-deps`` **(v0.14+)**
+``--edit-deps``
   Lets you edit the series dependencies using the editor command defined
   in git-config as ``core.editor``, the ``$EDITOR`` environment var if
   that isn't found, or ``vim``.
 
-``--check-deps`` **(v0.14+)**
+  .. versionadded:: v0.14
+
+``--check-deps``
   Verifies that b4 can resolve all specified dependencies and that
   everything cleanly applies to the base-commit specified.
 
-``--check`` **(v0.14+)**
+  .. versionadded:: v0.14
+
+``--check``
   Runs a set of checks on your series to identify some of the more
   common problems.
 
@@ -402,6 +406,8 @@ modifying defaults for some of these flags.
 
       ./scripts/checkpatch.pl --strict --git $(b4 prep --show-info series-range)
 
+  .. versionadded:: v0.14
+
 ``--show-revision``
   Shows the current series revision.
 
@@ -409,13 +415,15 @@ modifying defaults for some of these flags.
   Forces the revision to a different integer number. This modifies your
   cover letter and tracking information and makes this change permanent.
 
-``--compare-to vN`` **(v0.11+)**
+``--compare-to vN``
   This executes a ``git range-diff`` command that lets you compare the
   previously sent version of the series to what is currently in your
   working branch. This is very useful right before sending off a new
   revision to make sure that you didn't forget to include anything into
   changelogs.
 
+  .. versionadded:: v0.11
+
 ``--manual-reroll MSGID``
   Normally, your patch series should be automatically rerolled to the
   next version after a successful ``b4 send`` operation (see
@@ -425,7 +433,7 @@ modifying defaults for some of these flags.
   from the public-inbox server, so we can properly add the reference to
   the previously sent series to the cover letter changelog.
 
-``--set-prefixes PREFIX [PREFIX ...]`` **(v0.11+)**
+``--set-prefixes PREFIX [PREFIX ...]``
   If you want to mark your patch as ``RFC``, ``WIP``, or add any other
   subsystem identifiers, you can define them via this command. Do
   **not** add ``PATCH`` or ``v1`` here, as these are already
@@ -440,11 +448,15 @@ modifying defaults for some of these flags.
   When b4 sends the message, it should add ``PATCH``, ``vN``, to the
   subject as necessary.
 
-``--add-prefixes PREFIX [PREFIX ...]`` **(v0.14+)**
+  .. versionadded:: v0.11
+
+``--add-prefixes PREFIX [PREFIX ...]``
   Similar to ``--set-prefixes``, but will add prefixes to any ones
   currently defined, as opposed to completely replacing them.
 
-``--show-info [PARAM]`` **(v0.13+)**
+  .. versionadded:: v0.14
+
+``--show-info [PARAM]``
   Dumps information about the current series in a format suitable for
   parsing by other tools. Starting with v0.13, the parameter can be one
   of the following:
@@ -471,7 +483,9 @@ modifying defaults for some of these flags.
 
       b4 prep --show-info
 
-``--cleanup [BRANCHNAME]`` **(v0.13+)**
+  .. versionadded:: v0.13
+
+``--cleanup [BRANCHNAME]``
   Archive and delete obsolete prep-managed branches and all git objects
   related to them, such as sent tags. Run without parameters to list
   all known prep-managed branches in the repository. Rerun with the
@@ -479,6 +493,8 @@ modifying defaults for some of these flags.
   and tracking information, and then delete all git objects related to
   that series from the local repository.
 
+  .. versionadded:: v0.13
+
 ``-n NEW_SERIES_NAME, --new NEW_SERIES_NAME``
   Creates a new branch to start work on a new patch series.
 
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 0de2aa5..f9fd9e4 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -279,19 +279,23 @@ Command line flags
   actually sending things out and lets you verify that all patches are
   looking good and all recipients are correctly set.
 
-``--preview-to`` **(v0.13+)**
+``--preview-to``
   Sometimes it's useful to send your series for a pre-review to a
   colleague, mentor, boss, etc. Using this option sends out the prepared
   patches to the addresses specified on the command line, but doesn't
   reroll your series, allowing you to send the actual submission at some
   later point.
 
-``--reflect`` **(v0.11+)**
+  .. versionadded:: v0.13
+
+``--reflect``
   Prepares everything for sending, but only emails yourself (the address
   in the ``From:`` header). Useful as a last step to make sure that
   everything is looking good, and especially useful when using the web
   endpoint, because it may rewrite your From: header for DMARC reasons.
 
+  .. versionadded:: v0.11
+
 ``--no-trailer-to-cc``
   Tells b4 not to add any addresses found in the cover or patch trailers
   to To: or Cc:. This is usually handy for testing purposes, in case you
diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index b691706..1ca9b50 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -75,12 +75,14 @@ The following flags are common to both commands:
   This lets you force b4 to ignore cache and retrieve the latest
   results.
 
-``--single-message`` **(0.13+)**
+``--single-message``
   By default, b4 retrieves the entire thread, but sometimes you really
   just want a single message. This helps when someone posts a patch in
   the middle of a long thread and you just want that patch and ignore
   the rest of the messages.
 
+  .. versionadded:: v0.13
+
 ``-v WANTVER, --use-version WANTVER``
   If a thread (or threads, when used with ``-c``) contains multiple
   patch series revisions, b4 automatically picks the highest numbered
@@ -162,7 +164,7 @@ The following flags are common to both commands:
   translated into left-to-right languages), you can override the default
   behavior with this switch.
 
-``--check`` **(0.14+)**
+``--check``
   Tells b4 to run a series of local checks on each patch of the series
   and display any problems. When b4 finds a valid patchwork project
   definition in the configuration settings, it also looks up the CI
@@ -178,6 +180,8 @@ The following flags are common to both commands:
       [b4]
       am-perpatch-check-cmd = ./scripts/checkpatch.pl -q --terse --no-summary --mailback --strict
 
+  .. versionadded:: v0.14
+
 Flags only valid for ``b4 am``
 ------------------------------
 The following flags only make sense for ``b4 am``:
diff --git a/docs/maintainer/mbox.rst b/docs/maintainer/mbox.rst
index b4bba22..f3597a9 100644
--- a/docs/maintainer/mbox.rst
+++ b/docs/maintainer/mbox.rst
@@ -33,7 +33,7 @@ Option flags
   and you need to do some work while offline. You can pass ``-`` to read
   messages from stdin.
 
-``--stdin-pipe-sep STDIN_PIPE_SEP`` **(0.11+)**
+``--stdin-pipe-sep STDIN_PIPE_SEP``
   When reading input from stdin, split messages using the string passed
   as parameter. Otherwise, b4 expects stdin to be a single message or a
   valid mbox.
@@ -45,17 +45,21 @@ Option flags
 
   Then invoke b4 with ``-m - --stdin-pipe-sep='\n---randomstr---\n'``
 
+  .. versionadded:: v0.11
+
 ``-C, --no-cache``
   By default, b4 will cache the retrieved threads for about 10 minutes.
   This lets you force b4 to ignore cache and retrieve the latest
   results.
 
-``--single-message`` **(0.13+)**
+``--single-message``
   By default, b4 will retrieve the entire thread, but sometimes you
   really just want a single message. This helps when someone posts a
   patch in the middle of a long thread and you just want that patch and
   ignore the rest of what is going on.
 
+  .. versionadded:: v0.13
+
 ``-o OUTDIR, --outdir OUTDIR``
   Instead of writing the .mbox file to the current directory, write it
   to this location instead. You can also pass a path to an existing
@@ -85,7 +89,7 @@ Option flags
   that aren't already present. Note, that this uses simple message-id
   matching and no other checks for correctness are performed.
 
-``-r MBOX, --refetch MBOX`` **(v0.12+)**
+``-r MBOX, --refetch MBOX``
   This allows you to refetch all messages in the provided mailbox from
   the upstream public-inbox server. For example, this is useful when you
   have a .mbx file prepared by ``b4 am`` and you want to send a
@@ -93,6 +97,8 @@ Option flags
   original message headers that may have been dropped or modified by
   ``b4 am``.
 
+  .. versionadded:: v0.12
+
 Using with mutt
 ---------------
 If you are a mutt or neomutt user and your mail is stored locally, you
diff --git a/docs/maintainer/ty.rst b/docs/maintainer/ty.rst
index b445bb6..21c56de 100644
--- a/docs/maintainer/ty.rst
+++ b/docs/maintainer/ty.rst
@@ -130,6 +130,8 @@ Optional flags
   state instead of the default specified in config settings (use with
   -a, -t or -d). See :ref:`patchwork_settings` for more details.
 
-``--me-too`` **(v0.15+)**
+``--me-too``
   Include yourself in the thank-you message cc's. This is useful if you
   want to keep track of which patches you applied to your tree.
+
+  .. versionadded:: v0.15

-- 
2.52.0


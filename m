Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4822C08CB
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125486; cv=none; b=REu1N0iu/KU5oKyqYwwjpBgN5eLHnbTGTvyfzIhwizmZie3K8Ibmw/kqm5+6P/93/hsPqWvUKBFiSFLJs16izEl6ISuUu+mFJmo0QB989gv53FlhL6zJ79h4L3HpMhyq5Ih/I3PntJKfO+96C+0rHWjXKem42CjXjf+RqqlGbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125486; c=relaxed/simple;
	bh=aZW197viaOXlAt3i/ze4ddaS6iyyCYrvvwhMvDzQiMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxINP6+RzpPVshtcOzL7FI6bDG09j1RiVL5rxhRuqgirt2FZOK8MhofZCiv85oVNuHh1PYWxp+QAxIypGLJavx5oHWVPinGd8N2qC18aoujf5mQbt6vVRiVQcCTfT6f3COlB7tuqxinADxZ4hYgO9/94m3hIzpe0Lb8oegTQGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 9B2B0C2BCB1; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 966D5C19421
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 966D5C19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BW386TzmCP;
	Tue,  3 Feb 2026 14:31:15 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BV6mtGzB75;
	Tue,  3 Feb 2026 14:31:14 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:06 +0100
Subject: [PATCH b4 07/21] docs: use versionadded admonition for sections
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-7-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

So that we use version admonitions consistently across the docs for
things that were added or modified in given releases.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/contributor/prep.rst |  9 +++++++--
 docs/contributor/send.rst | 14 ++++++++++----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 122e3cd..6e90b10 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -187,7 +187,9 @@ additional information about the intent of your entire series.
 Working with series dependencies
 --------------------------------
 
-.. warning:: new in **(v0.14+)**
+.. versionadded:: v0.14
+
+.. warning::
 
    This is an experimental set of features introduced in v0.14. It may
    have rough edges or unexpected bugs.
@@ -314,7 +316,10 @@ This may also be already set by the project, if they have a
 
 Checking your work
 ------------------
-.. warning:: new in **(v0.14+)**
+
+.. versionadded:: v0.14
+
+.. warning::
 
    This is a new feature in version 0.14 and you should consider it
    experimental.
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index f9fd9e4..f5a1ff1 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -170,8 +170,11 @@ sending your work.
   prep``, but future versions may support sending arbitrary patches
   generated with ``git format-patch``.
 
-Passing pre-flight checks **(v0.14+)**
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Passing pre-flight checks
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. versionadded:: v0.14
+
 B4 defines some pre-flight checks that should be passing, or the command
 generates a warning:
 
@@ -230,8 +233,11 @@ When ``--reflect`` is on:
   public-inbox feed
 * your branch is **not** automatically rerolled to the next revision
 
-Checking things over with ``--preview-to`` **(v0.13+)**
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Checking things over with ``--preview-to``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. versionadded:: v0.13
+
 Sometimes you want to ask your friend, colleague, boss, or mentor to
 give your submission a quick review. You can send them your series using
 ``--preview-to boss@example.com`` before you send things out to the

-- 
2.52.0


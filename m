Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8339A812
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125488; cv=none; b=te9tcnPYqfp5/Hp+JTvnai2bC5d8Mrv5FAiM8AxprAFBGLofgnrmVJ6qPHZHdq8vdGO00i10exNIQq/9Da5mmEOTLudnU5/9gg+j7hCCX05Oz7pcEGtGNGm5TumQYPWT/8QGm4Yc5eCL/hlTf+UVs0u6SMerV1JQAFUK3YfOeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125488; c=relaxed/simple;
	bh=KozkUZ//AXqYCwVFXeC8VW2oZEHP/UKAUcrJv2M/Vso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRsmR/p/lKSY4Cucu45vwRERQQd582Y8HLnFgZ7BspEsPaEQF0DGlf2w57948J+jnsYPn3CBi9zdX5vGszduZugh7bAh2YRedFFCl31f1NlCGNOnSvo7MaGmVeLIrrh91LQCm4IcJDFYjeifWvuyYbDktOYADbIkh/ZiWVA44OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 4555AC2BC87; Tue,  3 Feb 2026 13:31:28 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D62FC19422
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D62FC19422
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BY4LTDzmPM;
	Tue,  3 Feb 2026 14:31:17 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BY0k61z87R;
	Tue,  3 Feb 2026 14:31:17 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:10 +0100
Subject: [PATCH b4 11/21] docs: move sentence-ending dots from within the
 last quoted string to outside
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-11-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Your Name <your.name@example.com>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

These dots aren't meant to be part of the quoted string but as
sentence-ending dots so let's fix that.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/config.rst           | 6 +++---
 docs/contributor/prep.rst | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 6b33c33..aff0ec3 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -60,7 +60,7 @@ These options control many of the core features of b4.
 
 ``b4.linktrailermask`` (v0.13+)
   Overrides the format of the ``Link:`` trailer, in case you want to
-  call it something other than "Link." For example, some projects
+  call it something other than "Link". For example, some projects
   use "Message-ID" trailers instead::
 
       linktrailermask = Message-ID: <%s>
@@ -85,7 +85,7 @@ These options control many of the core features of b4.
 
 ``b4.save-maildirs``
   The "mbox" file format is actually several incompatible standards,
-  such as "mboxo" vs. "mboxrd." Setting this option can avoid potential
+  such as "mboxo" vs. "mboxrd". Setting this option can avoid potential
   problems by saving retrieved threads as Maildirs.
 
   Default: ``no``
@@ -116,7 +116,7 @@ These options control many of the core features of b4.
       Signed-off-by: Your Name <your.name@example.com>
 
   Your custody section is beneath "Ezri Submaintainer," so the only
-  trailers considered for reordering are "Link" and "Tested-by." Your
+  trailers considered for reordering are "Link" and "Tested-by". Your
   own Signed-off-by trailer is always at the bottom of your own custody
   section.
 
diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 6e90b10..9c27b64 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -126,7 +126,7 @@ Enrolling an existing branch
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 If you've already started working on a set of commits without first
 running ``b4 prep -n``, you can enroll your existing branch to make it
-"prep-tracked."
+"prep-tracked".
 
 For example, if you have a branch called ``my-topical-branch`` that was
 forked from ``master``, you can enroll it with b4::

-- 
2.52.0


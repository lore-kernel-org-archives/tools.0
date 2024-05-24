Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A051EEE9
	for <tools@linux.kernel.org>; Fri, 24 May 2024 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716557459; cv=none; b=fllPFx6zrmTU0/ZpkPJfHnzDBL4et09Dwfjw+AJyTaJtueWrxwZL6+2G9baGYK7FVcH3dSqMZfGoVq1WqkJvH2kzUNJN1RuYToXpfx8Z5sdb7CAXwJhuVuW2zfcbtOfRA7Wl0L9Da72b6qSSlBdIJr3VcMT3kcRmLMFV6ntcs48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716557459; c=relaxed/simple;
	bh=KW2ovcoZb5gVoKJXouCTvJ3MWu/pSyyZv/T0TQ+Hid4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R71gMFkRwZpjJsfkJy9QeMUqZeB4M9s1NVRzLfU4Q0yNUIX9M+bD6n5E2tYnt7agaTTQwoqHPyllBzp5YLCkBdsOHBsrQxVrRmB5MmyuUtFD9zCOPi8+J+HwfwCougFXlW/fuFzS2aZuiLrlstkudL0e1wZPsMMDvd8gh5VNHeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id E9372C3277B; Fri, 24 May 2024 13:30:58 +0000 (UTC)
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BAAEC2BBFC
	for <tools@kernel.org>; Fri, 24 May 2024 13:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BAAEC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Vm5X64fYjzsXw;
	Fri, 24 May 2024 15:30:46 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Vm5X60q3Szr3;
	Fri, 24 May 2024 15:30:46 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 24 May 2024 15:30:35 +0200
Subject: [PATCH b4] docs: document b4.send-prefixes conf option
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
X-B4-Tracking: v=1; b=H4sIAHqWUGYC/zXLMQqAMAxA0auUzAZsiWC9ijjUNmqWKg2IULy7X
 Rwfn19BuQgrTKZC4VtUztxgOwPxCHlnlNQMrnfUD44wnRGVc8Kr8CYPK3Lw1ruw2pE8tO8PbZt
 hJVje9wP1R8mwZwAAAA==
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

b4.send-prefixes is a way to define a set of default prefixes from a b4
configuration file, so let's document it.

This is available since commit c42dbb0e5040 ("ez: reimplement extra
prefix functionality"), part of v0.11 tag.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
I'm also wondering if we're missing tests for this?

Additionally, should it really be entirely replaced with
`b4 prep --set-prefixes` rather than appended?
I'm trying to add config files for b4 to different Yocto git repos.
Small Yocto git repos do share the same mailing list, but need to use a
prefix. However, in Yocto we have a branch per release, so one would
need to explicitly add the branch(es) to which this patch series apply
to as additional prefixes. This would mean we would have to add the repo
prefix again through `b4 prep --set-prefixes`.
To be clear, I do not know if the conf file for b4 will be merged or if
there's any interest in Yocto git repos, so this isn't really more than
a thought right now.

Also, modifying .b4-config with an already-created series will not
update the prefixes (which made me first believe this was not supported
at all). Not sure how to handle this though (if we even want to)?
---
 docs/config.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/config.rst b/docs/config.rst
index cd3d151..56a1fe4 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -414,6 +414,13 @@ Contributor-oriented settings
 
   Default: ``None``
 
+``b4.send-prefixes`` (v0.11+)
+  Extra prefixes to add to ``[PATCH]`` (e.g. ``RFC mydrv``).
+
+  This setting can be replaced for a series with ``b4 prep --set-prefixes``.
+
+  Default: ``None``
+
 ``b4.prep-perpatch-check-cmd`` (v0.14+)
   The command to use when running ``--check``. If b4 finds
   ``scripts/checkpatch.pl`` at the top of your git tree, it uses the

---
base-commit: 2c6f29168557b64650ad53494a7be282efcfd74b
change-id: 20240524-doc-send-prefixes-ea9192ab1849

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

